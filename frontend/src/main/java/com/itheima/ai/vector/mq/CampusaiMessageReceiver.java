package com.itheima.ai.vector.mq;

import cn.hutool.core.util.NumberUtil;
import com.alibaba.fastjson.JSON;
import com.itheima.ai.entity.Notice;
import com.itheima.ai.vector.dto.MessageDto;
import com.itheima.ai.service.INoticeService;
import com.itheima.ai.vector.vectorservice.IVectorService;
import com.itheima.ai.vector.vectorservice.VectorServiceFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ai.document.Document;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Component
@RabbitListener(queuesToDeclare = {
        @Queue("CAMPUSAI_NOTICE"),
        @Queue("CAMPUSAI_MATERIALS")})
public class CampusaiMessageReceiver {
    private final static Logger logger = LoggerFactory.getLogger(CampusaiMessageReceiver.class);

    @Autowired
    private VectorServiceFactory vectorServiceFactory;

    @RabbitHandler
    //消息队列消费端，接受管理后台的增删改信息，详细参数参考MessageDto对象
    //TODO 任务5.3.3 处理管理后台传递过来的Rabbitmq消息
    public void processMessage(String message) {
        logger.info("user hit : message={}", message);

        MessageDto messageDto = JSON.parseObject(message, MessageDto.class);
        //根据messageDto.getType()从工厂获取匹配的实现类


        //根据messageDto.getOperation()，获取操作类型：1-新增，2-修改，3-删除

    }

}
