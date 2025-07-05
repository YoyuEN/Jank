package com.ruoyi.jank.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/7/1
 * @Time: 12:53
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MomentVO {
    private String content;
    private List<MultipartFile> imageUrls;
    private String userId;
    private String category;
}
