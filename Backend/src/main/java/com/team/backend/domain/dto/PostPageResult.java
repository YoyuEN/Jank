package com.team.backend.domain.dto;

import com.team.backend.domain.Post;
import lombok.*;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 16:53
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class PostPageResult {
    // getter和setter方法
    private List<Post> posts;
    private int totalPages;
}
