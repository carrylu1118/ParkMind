package com.itheima.ai.message;

import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ai.document.Document;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
@RabbitListener(queues = {"CAMPUSAI_NOTICE","CAMPUSAI_DOCUMENT"})
public class CampusaiMessageReceiver {
    private final static Logger logger = LoggerFactory.getLogger(CampusaiMessageReceiver.class);
    @Autowired
    private VectorStore store;

    @RabbitHandler
    public void processMessage(String message) {
        logger.info("user hit : message={}", message);

        MessageDto messageDto = JSON.parseObject(message, MessageDto.class);

        switch (messageDto.getType()) {
            case "NOTICE":
                // 通知
                Document doc = new Document(messageDto.getMessage(), Map.of("title",messageDto.getTitle()));
                store.add(List.of(doc));

                break;
            case "DOCUMENT":
                // 文档
                break;
            default:
                break;
        }
    }
}
