package com.itheima.ai.vector.mq;

import cn.hutool.core.util.NumberUtil;
import com.alibaba.fastjson.JSON;
import com.itheima.ai.entity.Notice;
import com.itheima.ai.vector.dto.MessageDto;
import com.itheima.ai.service.IDocumentService;
import com.itheima.ai.service.INoticeService;
import com.itheima.ai.vector.vectorservice.IVectorService;
import com.itheima.ai.vector.vectorservice.VectorServiceFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ai.document.Document;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Component
@RabbitListener(queues = {"CAMPUSAI_NOTICE","CAMPUSAI_DOCUMENT"})
public class CampusaiMessageReceiver {
    private final static Logger logger = LoggerFactory.getLogger(CampusaiMessageReceiver.class);

    @Autowired
    private VectorServiceFactory vectorServiceFactory;

    @RabbitHandler
    public void processMessage(String message) {
        logger.info("user hit : message={}", message);

        MessageDto messageDto = JSON.parseObject(message, MessageDto.class);

        IVectorService vectorService = vectorServiceFactory.of(messageDto.getType());

        switch(messageDto.getOperation()) {
            case 1:
                // 添加
                vectorService.addDocument(messageDto);
                break;
            case 2:
                // 修改
                vectorService.updateDocument(messageDto);
                break;
            case 3:
                // 删除
                vectorService.deleteDocument(messageDto);
                break;
            default:
                break;
        }

    }

}
