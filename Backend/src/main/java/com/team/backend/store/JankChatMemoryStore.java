package com.team.backend.store;


import com.team.backend.domain.ChatMessages;
import dev.langchain4j.data.message.ChatMessage;
import dev.langchain4j.data.message.ChatMessageDeserializer;
import dev.langchain4j.data.message.ChatMessageSerializer;
import dev.langchain4j.store.memory.chat.ChatMemoryStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Component;

import java.util.LinkedList;
import java.util.List;

@Component//标识该类为 Spring 容器管理的组件。Spring 会自动扫描并将其纳入容器中进行依赖注入和管理。
public class JankChatMemoryStore implements ChatMemoryStore {

    @Autowired
    private MongoTemplate  mongoTemplate;//mongodb的注入
    @Override
    public List<ChatMessage> getMessages(Object memoryId) {
        // TODO: 实现通过内存ID从持久化存储中获取所有消息。
        // 可以使用ChatMessageDeserializer.messageFromJson(String)和
        // ChatMessageDeserializer.messagesFromJson(String)辅助方法
        // 轻松地从JSON反序列化聊天消息。
        Criteria criteria = Criteria.where("memoryId").is(memoryId);
        Query query = new Query(criteria) ;
        ChatMessages chatMessages = mongoTemplate.findOne(query,ChatMessages.class);
        if(chatMessages ==  null) {
            return new LinkedList<>();
        }
        return ChatMessageDeserializer.messagesFromJson(chatMessages.getMessage());
    }

    @Override
    public void updateMessages(Object memoryId, List<ChatMessage> messages) {
        // TODO: 实现通过内存ID更新持久化存储中的所有消息。
        // 可以使用ChatMessageSerializer.messageToJson(ChatMessage)和
        // ChatMessageSerializer.messagesToJson(List<ChatMessage>)辅助方法
        // 轻松地将聊天消息序列化为JSON。

        Criteria criteria = Criteria .where ("memoryId") .is(memoryId) ;
        Query query = new Query(criteria) ;
        Update update = new Update() ; update .set( "message" , ChatMessageSerializer .messagesToJson(messages)) ;
//根据query条件能查询出文档，则修改文档；否则新增文档
        mongoTemplate .upsert(query , update , ChatMessages .class) ;

    }

    @Override
    public void deleteMessages(Object memoryId) {
        // TODO: 实现通过内存ID删除持久化存储中的所有消息。
        Criteria criteria = Criteria.where("memoryId").is(memoryId);
        Query query = new Query(criteria) ;
        mongoTemplate.remove(query, ChatMessage.class);
    }
}
