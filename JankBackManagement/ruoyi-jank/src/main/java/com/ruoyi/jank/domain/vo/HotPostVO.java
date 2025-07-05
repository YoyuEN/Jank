package com.ruoyi.jank.domain.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
//帖子
public class HotPostVO implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId
    private String postId;
    private String title;
    private Integer visibility;
    private String contentHtml;
    private String categoryName;
    //用户id
    private String createTime;
    private Long good;
}
