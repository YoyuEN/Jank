package com.team.backend.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class PerMessage {
    @TableId
    private String messId;
    private String message;
    private String userId;
    private String createAt;
    private String updateAt;
    @TableLogic
    private int deleted;
}
