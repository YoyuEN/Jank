package com.team.backend.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import nonapi.io.github.classgraph.json.Id;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Document("hospital_angent")
public class ChatMessages {
    //唯一标识，映射到MongDB文档的_id字段
    @Id
    private ObjectId messageId ;
//    private int messageId ;
    private String message ; //存储当前聊天记录列表的json字符串

}
