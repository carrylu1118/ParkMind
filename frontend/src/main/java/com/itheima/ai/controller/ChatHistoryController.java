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
public class ChatHistoryController {

    private final ChatMemoryRepository chatMemoryRepository;
    private final ISpringAiChatRecordService recordService;

    @RequestMapping("/create")
    public void create(@RequestBody SpringAiChatRecord record) {
        recordService.save(record);
    }
    @RequestMapping("/list")
    public List<SpringAiChatRecord> list() {
        LambdaQueryWrapper<SpringAiChatRecord> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(SpringAiChatRecord::getCreateTime);
        return recordService.list(wrapper);
    }

    @GetMapping("/info/{chatId}")
    public List<MessageVO> getChatHistory(@PathVariable("chatId") String chatId) {
        return chatMemoryRepository.findByConversationId(chatId).stream().map(MessageVO::new).toList();
    }

    @GetMapping("/delete/{chatId}")
    public Result deleteChatHistory(@PathVariable("chatId") String chatId) {
        recordService.removeById(chatId);
        chatMemoryRepository.deleteByConversationId(chatId);
        return Result.ok();
    }

}
