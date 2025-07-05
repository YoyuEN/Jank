package com.ruoyi.jank.domain.vo;

import com.ruoyi.common.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentUserVO implements Serializable {
    private static final long serialVersionUID = 1L;
    @Excel(name = "评论内容")
    private String content;
    private String title;
    @Excel(name = "创建时间")
    private String createTime;
    private Integer goodorbad;
    private String  username;
}
