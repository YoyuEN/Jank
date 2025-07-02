<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户名" prop="username">
        <el-input
          v-model="queryParams.username"
          placeholder="请输入用户名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['commonuser:commonuser:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['commonuser:commonuser:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['commonuser:commonuser:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['commonuser:commonuser:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="commonuserList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键ID" align="center" prop="userId" />
      <el-table-column label="用户昵称" align="center" prop="nickname" />
      <el-table-column label="用户邮箱" align="center" prop="email" />
      <el-table-column label="用户名" align="center" prop="username" />
      <el-table-column label="用户手机号" align="center" prop="phone" />
      <el-table-column label="用户状态" align="center" prop="freeze"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['commonuser:commonuser:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['commonuser:commonuser:remove']"
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

    <!-- 添加或修改用户管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="700px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户昵称" prop="nickname">
          <el-input v-model="form.nickname" placeholder="请输入用户昵称" />
        </el-form-item>
        <el-form-item label="用户邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入用户邮箱" />
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入用户名" />
        </el-form-item>
        <el-form-item label="用户所在地址" prop="address" label-width="100px">
          <el-cascader
            ref="addressCascader"
            v-model="selectedAddress"
            :options="options"
            :props="addressProps"
            @change="handleAddressChange"
            placeholder="请选择所在地区"
            clearable>
          </el-cascader>
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
import { listCommonuser, getCommonuser, delCommonuser, addCommonuser, updateCommonuser } from "@/api/commonuser/commonuser";
import { getProvinces, getChildrenByPId } from "@/api/address/address";

export default {
  name: "Commonuser",
  data() {
    return {
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
      // 用户管理表格数据
      commonuserList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        username: null,
        address: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        email: [
          { required: true, message: '请输入用户邮箱', trigger: 'blur' },
                { pattern: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/, message: '请输入正确的邮箱格式', trigger: 'blur' }
        ],
      },
      options: [], // 省份选项
      addressProps: {
        value: 'addressId',
        label: 'address',
        children: 'children',
        checkStrictly: true,
        lazy: true,
        lazyLoad: this.lazyLoadAddress
      },
      selectedAddress: [] // 选中的地址ID数组
    };
  },
  created() {
    this.getList();
    this.loadProvinces();
  },
  methods: {
    /** 查询用户管理列表 */
    getList() {
      this.loading = true;
      listCommonuser(this.queryParams).then(response => {
        this.commonuserList = response.rows;
        this.total = response.total;
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
        userId: null,
        nickname: null,
        email: null,
        username: null,
        password: null,
        phone: null,
        accessToken: null,
        refreshToken: null,
        freeze: null,
        createTime: null,
        updateTime: null,
        deleted: null,
        address: null
      };
      this.selectedAddress = [];
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
      this.ids = selection.map(item => item.userId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加用户管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const userId = row.userId || this.ids
      getCommonuser(userId).then(response => {
        this.form = response.data;
        // 如果有地址数据，设置selectedAddress
        if (this.form.address) {
          // 将地址字符串拆分为数组
          const addressNames = this.form.address.split('/');
          // 在options中查找对应的地址ID
          this.findAndSetAddressIds(addressNames);
        }
        this.open = true;
        this.title = "修改用户管理";
      });
    },

    /** 根据地址名称查找并设置地址ID */
    async findAndSetAddressIds(addressNames) {
      try {
        let currentOptions = this.options;
        let selectedIds = [];

        for (let i = 0; i < addressNames.length; i++) {
          const name = addressNames[i];
          const found = currentOptions.find(opt => opt.address === name);

          if (found) {
            selectedIds.push(found.addressId);
            if (i < addressNames.length - 1) {
              // 如果不是最后一级，加载下一级
              await new Promise((resolve) => {
                this.lazyLoadAddress({ level: i, data: found }, (children) => {
                  currentOptions = children;
                  resolve();
                });
              });
            }
          } else {
            break;
          }
        }

        if (selectedIds.length > 0) {
          this.selectedAddress = selectedIds;
        }
      } catch (error) {
        console.error('设置地址ID失败:', error);
      }
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.userId != null) {
            updateCommonuser(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCommonuser(this.form).then(response => {
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
      const userIds = row.userId || this.ids;
      this.$modal.confirm('是否确认删除用户管理编号为"' + userIds + '"的数据项？').then(function() {
        return delCommonuser(userIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('commonuser/commonuser/export', {
        ...this.queryParams
      }, `commonuser_${new Date().getTime()}.xlsx`)
    },
    /** 加载省份数据 */
    async loadProvinces() {
      try {
        const response = await getProvinces();
        this.options = response.data.map(province => ({
          addressId: province.addressId,
          address: province.address,
          leaf: false
        }));
      } catch (error) {
        this.$message.error("加载省份数据失败");
        console.error("加载省份数据失败:", error);
      }
    },
    /** 懒加载子级地址 */
    async lazyLoadAddress(node, resolve) {
      const { level, data} = node;
      console.log('lazyLoadAddress', level, data);

      if (level >= 3) {
        resolve([]);
        return;
      }
      try {
        // 打印一下data的数据
        console.log('address:', data.address);
        const response = await getChildrenByPId(data && data.addressId ? data.addressId : -1);
        const children = response.data.map(item => ({
          addressId: item.addressId,
          address: item.address,
          leaf: level >= 2
        }));
        resolve(children);
      } catch (error) {
        this.$message.error("加载地址数据失败");
        console.error("加载地址数据失败:", error);
        resolve([]);
      }
    },
    /** 处理地址选择变化 */
    handleAddressChange(value) {
      if (value && value.length > 0) {
        const selectedNames = this.$refs.addressCascader.getCheckedNodes()[0].pathLabels;
        this.form.address = selectedNames.join('/');
      } else {
        this.form.address = '';
      }
    }
  }
};
</script>
