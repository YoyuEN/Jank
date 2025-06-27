package com.team.backend.config;

import com.team.backend.store.JankChatMemoryStore;
import dev.langchain4j.memory.ChatMemory;
import dev.langchain4j.memory.chat.ChatMemoryProvider;
import dev.langchain4j.memory.chat.MessageWindowChatMemory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AssistantConfig {
    @Autowired//注解表示该方法由 Spring 容器自动注入依赖。在此配置类中，它确保 chatMemoryProvider Bean 被 Spring 管理，并能自动装配到其他需要的地方。
    private JankChatMemoryStore mongoChatMemoryStore;
    @Bean
    public ChatMemory chatMemory() {
        return MessageWindowChatMemory.withMaxMessages(10);
    }
    @Bean
    public ChatMemoryProvider chatMemoryProvider() {
        return memoryId -> MessageWindowChatMemory.builder()
                .id(memoryId)
                .maxMessages(10)
                .chatMemoryStore(mongoChatMemoryStore) //使用mongodb存储
                .build();
    }
}
