package com.itheima.ai.controller;

import cn.hutool.core.map.MapUtil;
import com.itheima.ai.service.ISpringAiChatRecordService;
import com.itheima.ai.tools.CourseTools;
import lombok.RequiredArgsConstructor;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.memory.ChatMemory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

@RequiredArgsConstructor
@RestController
@RequestMapping("/ai")
public class CustomerServiceController {

    private final ChatClient serviceChatClient;

    private final ISpringAiChatRecordService recordService;

    @RequestMapping(value = "/service", produces = "text/html;charset=utf-8")
    public Flux<String> service(String prompt, String chatId) {
        // 1.保存会话id
//        recordService.saveRecord("service", chatId);
        // 2.请求模型
        return serviceChatClient.prompt()
                .user(prompt)
                .advisors(a -> a.param(ChatMemory.CONVERSATION_ID, chatId))
                .toolContext(MapUtil.<String, Object>builder().put("chatId",chatId).build())
                .stream()
                .content();
    }
}
