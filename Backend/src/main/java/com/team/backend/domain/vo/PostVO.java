package com.team.backend.domain.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.team.backend.handler.CategoryIdsTypeHandler;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostVO {
    // 帖子标题
    private String title;
    // 帖子封面图片 URL
    private MultipartFile image;
    // 帖子 HTML 格式内容
    @TableField("content_html")
    private String contentHtml;
    // 帖子所属分类 ID
    @TableField(value = "category_ids", typeHandler = CategoryIdsTypeHandler.class)
    private List<String> categoryIds;
}
