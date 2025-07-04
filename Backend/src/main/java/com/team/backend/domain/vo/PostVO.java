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
    //用户id
    private String userId;
    // 帖子所属分类 ID
    @TableField(exist = false)
    private List<String> categoryNames;
}
