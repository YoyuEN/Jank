package com.team.backend.assistant;

import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;
import dev.langchain4j.service.V;
import dev.langchain4j.service.spring.AiService;
import dev.langchain4j.service.spring.AiServiceWiringMode;
import reactor.core.publisher.Flux;

/**
 *     String chatModel() default ""; // 指定模型名称
 *     String streamingChatModel() default ""; //指定使用流失输出，默认使用非流失输出
 *     String chatMemory() default ""; // 配置模型记忆属性，默认在内存中记忆
 *     String chatMemoryProvider() default ""; // 配置模型隔离属性，默认是在内存中隔离
 */
@AiService(wiringMode = AiServiceWiringMode.EXPLICIT
        ,streamingChatModel = "qwenStreamingChatModel"
        ,chatMemoryProvider = "chatMemoryProvider"
        ,tools="assistantTools")
public interface Assistant {
    String chat(@V("message")String userMassage);

    @SystemMessage(fromResource = "Prompt.txt")//系统消息提示词
    Flux<String> chat(@MemoryId String memoryId, @UserMessage String Massage);


}
