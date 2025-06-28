package com.team.backend.tools;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.team.backend.domain.Post;
import com.team.backend.service.IPostService;
import dev.langchain4j.agent.tool.P;
import dev.langchain4j.agent.tool.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * 助手工具
 * 外挂工具类
 */
@Component
public class AssistantTools {

    @Autowired
    private IPostService postService;
    /**
     * 查询帖子
     */
    @Tool(name = "查询帖子", value = "调用该方法进行数据库查询数据")
    public String queryPost(@P("查询Post表中对应数据") String title) {
        LambdaQueryWrapper<Post> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Post::getTitle, title);
        List<Post> posts = postService.list(wrapper);
        // 使用Stream API将每个Post对象的title字段拼接成一个新的List<String>
        List<String> titles = posts.stream()
                .map(Post::getTitle)
                .toList();
        return titles.get(0);
    }

}
