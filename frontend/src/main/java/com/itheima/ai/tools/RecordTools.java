package com.itheima.ai.tools;

import cn.hutool.core.map.MapUtil;
import com.itheima.ai.entity.po.SpringAiChatRecord;
import com.itheima.ai.service.ISpringAiChatRecordService;
import lombok.RequiredArgsConstructor;
import org.springframework.ai.chat.model.ToolContext;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.ai.tool.annotation.ToolParam;
import org.springframework.stereotype.Component;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

@RequiredArgsConstructor
@Component
public class RecordTools {
    private final ISpringAiChatRecordService recordService;
    public final static ConcurrentMap<String, String> USER_INFO =  new ConcurrentHashMap<>();
    @Tool(description = "更新当前会话的标题")
    public void updateTitle(ToolContext toolContext,
//                              @ToolParam(required = false, description = "学生输入的院系") String department,
//                              @ToolParam(required = false, description = "学生输入的专业") String major,
                              @ToolParam(required = false, description = "用户的学号") String studentId,
                              @ToolParam(required = false, description = "用户的姓名") String name
    ) {
        SpringAiChatRecord record = recordService.getById(MapUtil.get(toolContext.getContext(),"chatId", String.class));
        if (record != null){
            record.setTitle(name+"#"+studentId);
            USER_INFO.put(record.getId(),record.getTitle());
            recordService.updateById(record);
        }
    }
}
