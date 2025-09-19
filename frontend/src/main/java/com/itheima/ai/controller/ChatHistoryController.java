package com.itheima.ai.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.itheima.ai.entity.po.SpringAiChatRecord;
import com.itheima.ai.entity.vo.MessageVO;
import com.itheima.ai.entity.vo.Result;
import com.itheima.ai.service.ISpringAiChatRecordService;
import lombok.RequiredArgsConstructor;
import org.springframework.ai.chat.memory.ChatMemoryRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/ai/history")
@RequiredArgsConstructor
//TODO 任务2.2：完成聊天记录Api接口开发
public class ChatHistoryController {

    private final ChatMemoryRepository chatMemoryRepository;
    private final ISpringAiChatRecordService recordService;

    //新建会话记录
    @RequestMapping("/create")
    public void create(@RequestBody SpringAiChatRecord record) {
    }
    //获取会话记录列表
    @RequestMapping("/list")
    public List<SpringAiChatRecord> list() {
        return null;
    }

    //获取某个会话的聊天记录
    @GetMapping("/info/{chatId}")
    public List<MessageVO> getChatHistory(@PathVariable("chatId") String chatId) {
        return null;
    }

    //删除某个会话
    @GetMapping("/delete/{chatId}")
    public Result deleteChatHistory(@PathVariable("chatId") String chatId) {
        return Result.ok();
    }

}
