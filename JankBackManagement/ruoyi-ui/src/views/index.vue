<template>
  <div class="app-container">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>博客数据</span>
        <el-button style="float: right; padding: 3px 0" type="text" @click="refreshHotPosts">刷新</el-button>
      </div>

      <el-row :gutter="20">
        <el-col :span="8" :data="hotPostsList" :xs="24" :sm="12" :md="8" :lg="6">
          <!--          热门帖子-->
          <el-card class="post-card" shadow="hover">
            <div class="post-title">热门帖子</div>
            <!-- 上部分：图片 -->
            <div class="post-image">
              <img :src="hotPostsList.image" alt="帖子图片" class="image">
            </div>

            <!-- 下部分：基本信息 -->
            <div class="post-info">
              <h3 class="post-title">{{ hotPostsList ? hotPostsList.title : '无标题' }}</h3>
              <div class="post-stats">
                <span><i class="el-icon-star-on"></i> 好评数：{{ hotPostsList ? (hotPostsList.good || 0) : 0 }}</span>
                <div><span class="post-time">{{ hotPostsList ? (hotPostsList.createTime || '无创建时间') : '无创建时间' }}</span></div>
              </div>

              <!-- 内容伸缩框 -->
              <el-collapse accordion>
                <el-collapse-item title="查看内容">
                  <div class="post-content">{{ hotPostsList ? (hotPostsList.contentHtml || '暂无内容') : '暂无内容' }}</div>
                </el-collapse-item>
              </el-collapse>
            </div>
          </el-card>
          <!--          用户注册数据-->
          <el-card class="post-card" shadow="hover">
          </el-card>
        </el-col>
      </el-row>
    </el-card>
  </div>
</template>

<script>
import { hotPost } from "@/api/postlist/postlist";
export default {
  name: "HotPosts",
  data() {
    return {
      hotPostsList: [],
      defaultImage: require("@/assets/images/profile.jpg"),
      queryParams: {
        pageNum: 1,
        pageSize: 12,
        orderByColumn: 'viewCount',
        isAsc: 'desc'
      }
    };
  },
  created() {
    this.getHotPosts();
  },
  methods: {
    getHotPosts() {
      hotPost().then(response => {
        this.hotPostsList = response.data;
        console.log(response.data);
      });
    },
    refreshHotPosts() {
      this.getHotPosts();
      this.$message({
        message: '数据已刷新',
        type: 'success'
      });
    }
  }
};
</script>

<style scoped>
.app-container {
  padding: 20px;
}

.post-card {
  margin-bottom: 20px;
  height: 100%;
}

/* 上部分：图片 */
.post-image {
  width: 100%;
  height: 180px;
  overflow: hidden;
}

.image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/* 下部分：基本信息 */
.post-info {
  padding: 10px;
}

.post-title {
  margin: 0 0 10px 0;
  font-size: 16px;
  font-weight: bold;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.post-stats {
  margin-bottom: 10px;
  font-size: 14px;
  color: #409EFF;
}

/* 内容伸缩框 */
.post-content {
  font-size: 14px;
  line-height: 1.5;
  color: #606266;
}
</style>
