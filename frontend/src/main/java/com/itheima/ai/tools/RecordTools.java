package com.itheima.ai.tools;

import cn.hutool.core.map.MapUtil;
import com.itheima.ai.entity.po.SpringAiChatRecord;
import com.itheima.ai.service.ISpringAiChatRecordService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ai.chat.model.ToolContext;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.ai.tool.annotation.ToolParam;
import org.springframework.stereotype.Component;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

@Slf4j
@RequiredArgsConstructor
@Component
public class RecordTools {
    private final ISpringAiChatRecordService recordService;

    //当学员输入姓名、学号时，触发Tools调用，更新会话记录表的信息
    public final static ConcurrentMap<String, String> USER_INFO = new ConcurrentHashMap<>();

    @Tool(description = "更新spring_ai_chat_record表中信息")
    public void updateTitle(ToolContext toolContext,
                            @ToolParam(required = false, description = "更新name") String name,
                            @ToolParam(required = false, description = "更新user_id") String userId
    ) {
        //获取信息，toolContext里放置了chatId，可以获取到记录的id，参考CustomerServiceController里的set操作
        //更新数据库
        String chatId = (String) toolContext.getContext().get("chatId");
        if(chatId == null || chatId.isEmpty()){
            log.info("获取会话ID失败");
            return;
        }
        //创建更新对象
        SpringAiChatRecord record = new SpringAiChatRecord();
        record.setId(chatId);

        //更新会话标题，登记到USER_INFO供前端更新显示
        if(name != null && !name.isEmpty()){
            record.setTitle(name);
            USER_INFO.put(chatId, name);
        }
        //更新学号
        if(userId != null && !userId.isEmpty()){
            record.setUserId(userId);
        }

        //更新数据库
        recordService.updateById(record);
    }
}
