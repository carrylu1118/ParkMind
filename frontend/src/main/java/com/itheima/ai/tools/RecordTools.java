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

    //TODO: 任务3.2.2：登记每个会话下用户的姓名
    public final static ConcurrentMap<String, String> USER_INFO =  new ConcurrentHashMap<>();
    @Tool(description = "xxxxx")
    //TODO 任务3.2.1：完成会话记录更新工具，SpringAI调用
    public void updateTitle(ToolContext toolContext,
        @ToolParam(required = false, description = "xxxx") String name  //需要AI捕获的参数，其他更多自行添加
        //更多参数……
    ) {
        //获取信息，toolContext里放置了chatId，可以获取到记录的id，参考CustomerServiceController里的set操作
        //更新数据库
    }
}
