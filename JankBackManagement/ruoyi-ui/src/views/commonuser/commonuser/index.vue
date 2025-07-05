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

    <el-table v-loading="loading" :data="commonuserList" @selection-change="handleSelectionChange" :row-style="rowStyle">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" width="60">
        <template slot-scope="scope">
          {{ (queryParams.pageNum - 1) * queryParams.pageSize + scope.$index + 1 }}
        </template>
      </el-table-column>
      <el-table-column label="用户邮箱" align="center" prop="email" />
      <el-table-column label="用户名" align="center" prop="username" />
      <el-table-column label="用户头像" align="center" prop="avatar">
        <template slot-scope="scope">
          <img v-if="scope.row.avatar" :src="scope.row.avatar" alt="头像" style="width:40px;height:40px;border-radius:50%;" />
          <span v-else>无</span>
        </template>
      </el-table-column>
      <el-table-column label="用户地址" align="center" prop="address" />
      <!-- 修改后使用开关组件展示用户状态 -->
      <el-table-column label="用户状态" align="center" width="200">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.freeze"
            :active-value="1"
            :inactive-value="0"
            active-text="启用"
            inactive-text="冻结"
            @change="handleStatusChange(scope.row)"
            :disabled="!canModifyStatus"
          />
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <template v-if="scope.row.freeze === 1">
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
          <span v-else style="color:#999">已冻结</span>
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
        <el-form-item label="用户名" prop="username">
          <el-input v-model="form.username" placeholder="请输入用户名" />
        </el-form-item>
        <el-form-item label="用户邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入用户邮箱" />
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入用户名" />
        </el-form-item>
        <el-form-item label="所在地区" prop="address" label-width="100px">
          <el-cascader
            ref="addressCascader"
            v-model="selectedAddress"
            :options="options"
            :props="addressProps"
            @change="handleAddressChange"
            placeholder="请选择省市区"
            clearable>
          </el-cascader>
        </el-form-item>
        <el-form-item label="详细地址" prop="detailAddress">
          <el-input
            v-model="form.detailAddress"
            placeholder="请输入街道、门牌号等详细地址"
            clearable
          />
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
import { checkUsernameExist,updateCommonuserStatus } from "@/api/commonuser/commonuser"; // 根据实际路径调整

export default {
  name: "Commonuser",
  data() {
    return {
      selectedAddress: [], // 确保初始化为数组
      // 控制状态开关是否可修改
      canModifyStatus: true,
      // 批量操作时是否禁用
      isBatchOperation: false,
      value: true,
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
        pageSize: 50,
        username: null,
        address: null
      },
      // 表单参数
      form: {
        address: null,
        detailAddress: null,
        username: null
      },
      // 表单校验
      rules: {
        email: [
          {required: true, message: '请输入用户邮箱', trigger: 'blur' },
          { pattern: /^[a-zA-Z0-9._%+-]+@(163\.com|qq\.com)$/, message: '邮箱格式不正确，只支持@163.com或@qq.com结尾的邮箱', trigger: 'blur' }
        ],
        username: [
          { required: true, message: "请输入用户名,用户名不能为空", trigger: "blur" },
          { validator:this.checkUsernameExists, trigger: 'blur' }
        ],
        phone: [
          {message: '请输入手机号', trigger: 'blur' },
          {
            pattern: /^1[3-9]\d{9}$/, // 中国大陆手机号正则表达式
            message: '请输入正确的手机号格式',
            trigger: 'blur'
          }
        ]
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
    };
  },
  created() {
    this.getList();
    this.loadProvinces();
  },
  methods: {
    // 检查用户名是否存在的验证函数
    checkUsernameExists(rule, value, callback) {
      // 空值校验已在前面的规则中处理
      if (!value) {
        return callback();
      }

      // 发送异步请求检查用户名是否存在
      checkUsernameExist(value).then(response => {
        if (response.data) {
          // 用户名已存在
          callback(new Error("用户名已存在"));
        } else {
          // 用户名可用
          callback();
        }
      }).catch(error => {
        console.error("检查用户名存在失败", error);
        callback(new Error("检查用户名失败，请重试"));
      });
    },
    rowStyle({ row}) {
      // 行样式
      if (row.freeze==0) {
        return {
          color: '#999',backgroundColor: '#f5f7fa'
        };
      }
      return {};
    },
    /** 查询用户管理列表 */
    getList() {
      this.loading = true;
      listCommonuser(this.queryParams).then(response => {
        // 按创建时间从晚到早排序
        const sortedList = response.rows.sort((a, b) => {
          return new Date(b.createTime) - new Date(a.createTime);
        });
        this.commonuserList = sortedList;
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
    /** 处理用户状态变更 */
    handleStatusChange(row) {
      // 发送请求更新用户状态
      const params = {
        userId: row.userId,
        freeze: row.freeze ? 1 : 0  // 将布尔值转换为整数
      };

        return updateCommonuserStatus(params);
        // 刷新列表数据
        this.getList();
    },

    /** 处理表单中的状态变更 */
    handleFormStatusChange(value) {
      if (this.form.userId) {
        const params = {
          userId: this.form.userId,
          freeze: value ? 1 : 0  // 将布尔值转换为整数
        };
        updateCommonuserStatus(params).then(() => {
          this.$message({
            message: value ? "用户已成功启用" : "用户已成功冻结",
            type: "success"
          });
        }).catch(() => {
          // 恢复原状态
          this.form.freeze = !value;
        });
      }
    },
    /** 控制操作按钮是否禁用 */
    isOperationDisabled(row) {
      // 如果用户被冻结，则禁用所有操作按钮
      return !row.freeze;
    },
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
      if (this.isOperationDisabled(row)) {
        this.$message({
          message: "该用户已被冻结，无法进行修改操作",
          type: "warning"
        });
        return;
      }
      this.reset();
      const userId = row.userId || this.ids;

      getCommonuser(userId).then(response => {
        this.form = response.data;
        // 拆分地址数据
        if (this.form.address) {
          const addressParts = this.form.address.split('/');

          // 省市区部分（前三个部分）
          const regionParts = addressParts.slice(0, 3);
          // 详细地址部分（剩余部分）
          const detailAddress = addressParts.slice(3).join('/');

          // 设置详细地址
          this.form.detailAddress = detailAddress;

          // 如果有地址数据，设置selectedAddress
          if (regionParts.length > 0) {
            // 将地址字符串拆分为数组
            // 在options中查找对应的地址ID
            this.findAndSetAddressIds(regionParts);
          }
        }
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
      this.$refs["form"].validate(async valid => {
        if (valid) {
          // // 拼接完整地址：省市区/详细地址
          // if (this.form.address && this.form.detailAddress) {
          //   // 先获取省市区部分
          //   const regionAddress = this.selectedAddress.length > 0
          //     ? this.getAddressPathById(this.selectedAddress).join('/')
          //     : this.form.address.split('/').slice(0, 3).join('/');
          //
          //   // 拼接完整地址
          //   this.form.address = `${regionAddress}/${this.form.detailAddress}`;
          //
          //   //this.form.address = `${this.form.address}/${this.form.detailAddress}`;
          // }
          // 拼接完整地址：省市区/详细地址
          if (this.selectedAddress && this.selectedAddress.length > 0 && this.form.detailAddress) {
            const regionParts = await this.getAddressPathById(this.selectedAddress);
            if (regionParts.length > 0) {
              this.form.address = `${regionParts.join('/')}/${this.form.detailAddress}`;
            }
          }
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
      if (this.isOperationDisabled(row)) {
        this.$message({
          message: "该用户已被冻结，无法进行删除操作",
          type: "warning"
        });
        return;
      }
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
      console.log('handleAddressChange', value);
      if (value && value.length > 0) {
        // 直接通过ID查找对应的地址名称
        this.getAddressPathById(value).then(addressPath => {
          if (addressPath && addressPath.length >= 2) {
            // 拼接省市区三级地址
            this.form.address = addressPath.join('/');
            console.log('设置地址:', this.form.address);
          }
        });
      }
    },

    /** 根据ID获取地址路径 */
    async getAddressPathById(addressIds) {
      try {
        const addressPath = [];
        let currentOptions = this.options;

        for (let i = 0; i < addressIds.length; i++) {
          const id = addressIds[i];
          // 在当前级别的选项中查找匹配的地址
          const found = currentOptions.find(opt => opt.addressId === id);

          if (found) {
            addressPath.push(found.address);

            // 如果不是最后一级，加载下一级选项
            if (i < addressIds.length - 1) {
              await new Promise((resolve) => {
                this.lazyLoadAddress({ level: i, data: found }, (children) => {
                  currentOptions = children;
                  resolve();
                });
              });
            }
          } else {
            console.error('未找到对应的地址ID:', id);
            break;
          }
        }

        return addressPath;
      } catch (error) {
        console.error('获取地址路径失败:', error);
        return [];
      }
    }
  }
};
</script>

<style scoped>
/* 仅在当前组件生效的样式 */
.el-form-item.is-error .el-input__inner {
  border-color: #f56c6c;
}

.el-form-item.is-error .el-input__append,
.el-form-item.is-error .el-input__prepend {
  border-color: #f56c6c;
}

.el-form-item__error {
  position: relative;
  top: 0;
  left: 0;
  margin-top: 4px;
  padding: 0 5px;
  font-size: 12px;
  color: #f56c6c;
}

.el-message--error {
  display: none;
}
</style>
