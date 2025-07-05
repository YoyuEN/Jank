<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="帖子标题" prop="title">-->
<!--        <el-input-->
<!--          v-model="queryParams.title"-->
<!--          placeholder="请输入帖子标题"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="所属分类" prop="categoryName">
        <el-select v-model="queryParams.categoryName" placeholder="请选择分类" clearable>
          <el-option
            v-for="(item, index) in categoryOptions"
            :key="index"
            :label="item"
            :value="item"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="postList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" width="60">
        <template slot-scope="scope">
          {{ (queryParams.pageNum - 1) * queryParams.pageSize + scope.$index + 1 }}
        </template>
      </el-table-column>
      <el-table-column type="expand" align="center" prop="contentHtml" label="">
        <template v-slot="scope">
          <el-card>
            <vue-markdown-it :source="scope.row.contentHtml" />
          </el-card>
        </template>
      </el-table-column>
      <el-table-column label="帖子标题" align="center" prop="title" width="200"/>
      <el-table-column label="帖子封面图片URL" align="center" prop="image" width="200">
        <template slot-scope="scope">
          <image-preview :src="scope.row.image" :width="100" :height="100"/>
        </template>
      </el-table-column>
      <el-table-column label="帖子所属分类" align="center" prop="categoryName" />
      <el-table-column label="用户" align="center" prop="username" />
<!--      <el-table-column label="创建时间" align="center" prop="createTime" width="100">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="更新时间" align="center" prop="updateTime" width="100">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['post:post:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['post:post:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改帖子对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="帖子标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入帖子标题" />
        </el-form-item>
        <el-form-item label="类目名称" prop="categoryName">
          <el-select
            v-model="form.categoryName"
            placeholder="请选择类目名称"
            clearable
            filterable
            allow-create
            style="width: 100%"
          >
            <el-option
              v-for="item in categoryNames"
              :key="item"
              :label="item"
              :value="item"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="帖子HTML格式内容">
          <editor v-model="form.contentHtml" :min-height="192"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listPost, getPost, delPost, addPost, updatePost } from "@/api/postlist/postlist";
import { listAllCategoryNames } from "@/api/jank/category";
import VueMarkdownIt from 'vue-markdown-it';

export default {
  name: "Post",
  components: {
    VueMarkdownIt
  },
  data() {
    return {
      categoryNames: [],
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 帖子表格数据
      postList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 分类选项
      categoryOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 50,
        title: null,
        visibility: null,
        categoryIds: null,
        categoryName: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        title: [
          { required: true, message: "帖子标题不能为空", trigger: "blur" }
        ],
        image: [
          { required: true, message: "帖子封面图片URL不能为空", trigger: "blur" }
        ],
        contentHtml: [
          { required: true, message: "帖子HTML格式内容不能为空", trigger: "blur" }
        ],
        categoryIds: [
          { required: true, message: "帖子所属分类不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getCategoryOptions();
  },
  methods: {
    /** 查询分类下拉选项 */
    getCategoryOptions() {
      listAllCategoryNames().then(response => {
        console.log('分类数据:', response.data);
        this.categoryOptions = response.data;
        this.categoryNames = response.data; // 同时设置categoryNames，确保两个下拉列表使用相同的数据
      }).catch(error => {
        console.error('获取分类数据失败:', error);
        this.$modal.msgError("获取分类数据失败");
      });
    },
    /** 查询帖子列表 */
    getList() {
      this.loading = true;
      console.log('发送查询参数:', JSON.stringify(this.queryParams));
      listPost(this.queryParams).then(response => {
        // console.log('收到完整响应:', response);

        // 处理不同的响应数据结构
        // let data = response.data || response;
        // if (!data) {
        //   console.error('无效的响应数据');
        //   this.loading = false;
        //   return;
        // }

        // 兼容不同的数据结构
        // const items = data.rows || data.list || data.data || [];
        // const total = data.total || data.pageInfo?.total || items.length;

        // 按照创建时间降序排列（从晚到早）
        // const sortedList = items.sort((a, b) => {
        //   return new Date(b.createTime) - new Date(a.createTime);
        // });

        this.postList = response.rows;
        this.total = response.total;
        this.loading = false;
      }).catch(error => {
        console.error('查询失败:', error);
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        postId: null,
        title: null,
        image: null,
        visibility: null,
        contentHtml: null,
        categoryName: null,
        userId: null,
        createTime: null,
        updateTime: null,
        deleted: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.postId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加帖子";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const postId = row.postId || this.ids
      getPost(postId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改帖子";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.postId != null) {
            updatePost(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPost(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const postIds = row.postId || this.ids;
      this.$modal.confirm('是否确认删除帖子编号为"' + postIds + '"的数据项？').then(function() {
        return delPost(postIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('post/post/export', {
        ...this.queryParams
      }, `post_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
<style>
.v-markdown-body h1 {
  font-size: 1.5em;
}

.v-markdown-body pre {
  background-color: #f4f4f4;
  padding: 10px;
  border-radius: 4px;
}
</style>
