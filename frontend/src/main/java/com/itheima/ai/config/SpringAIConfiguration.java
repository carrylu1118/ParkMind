package com.itheima.ai.config;

import com.itheima.ai.constants.SystemConstants;
import com.itheima.ai.tools.ClubTools;
import com.itheima.ai.tools.RecordTools;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.client.advisor.MessageChatMemoryAdvisor;
import org.springframework.ai.chat.client.advisor.SimpleLoggerAdvisor;
import org.springframework.ai.chat.client.advisor.vectorstore.QuestionAnswerAdvisor;
import org.springframework.ai.chat.memory.ChatMemory;
import org.springframework.ai.chat.memory.InMemoryChatMemoryRepository;
import org.springframework.ai.chat.memory.MessageWindowChatMemory;
import org.springframework.ai.chat.memory.repository.jdbc.JdbcChatMemoryRepository;
import org.springframework.ai.chat.model.ToolContext;
import org.springframework.ai.chat.prompt.ChatOptions;
import org.springframework.ai.openai.OpenAiChatModel;
import org.springframework.ai.openai.OpenAiEmbeddingModel;
import org.springframework.ai.vectorstore.SearchRequest;
import org.springframework.ai.vectorstore.SimpleVectorStore;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.ai.vectorstore.redis.RedisVectorStore;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPooled;

@Configuration
public class SpringAIConfiguration {

    //TODO 多任务共用：ChatClient配置
    @Bean
    public ChatClient serviceChatClient(OpenAiChatModel model,
                                        ChatMemory chatMemory,//TODO 任务2.2.2：修改此处配置为Mysql的聊天记录组件
                                        VectorStore vectorStore,
                                        ClubTools clubTools, RecordTools recodTools
                                        ){
        return ChatClient.builder(model)
                .defaultAdvisors(
//                        SimpleLoggerAdvisor.builder().build(),
                        MessageChatMemoryAdvisor.builder(chatMemory).build(), //TODO 任务2.2.2：修改此处配置为Mysql的聊天记录组件
                        QuestionAnswerAdvisor.builder(vectorStore)
                                .searchRequest(
                                        SearchRequest.builder() // 向量检索的请求参数
                                                .similarityThreshold(0.5d) // 相似度阈值
                                                .topK(1) // 返回的文档片段数量
                                                .build()
                                ).build()
                )
                .defaultTools(clubTools,recodTools)
                .defaultSystem(SystemConstants.SERVICE_SYSTEM_PROMPT)
                .build();
    }

    // TODO 任务2.2.2：完成此处配置，基于Mysql的聊天记忆组件
    @Bean
    public ChatMemory chatMemory(JdbcChatMemoryRepository chatMemoryRepository) {
        return MessageWindowChatMemory.builder()
                .chatMemoryRepository(chatMemoryRepository)
                .maxMessages(20)
                .build();
    }


    //基于内存的聊天记录，供参考，版本：1.0.0
    @Bean
    public ChatMemory inMemoryChatMemory() {
        return MessageWindowChatMemory.builder()
                .chatMemoryRepository(new InMemoryChatMemoryRepository())
                .maxMessages(20)
                .build();
    }


}
