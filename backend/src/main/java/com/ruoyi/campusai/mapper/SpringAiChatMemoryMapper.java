package com.ruoyi.campusai.mapper;

import java.util.List;
import com.ruoyi.campusai.domain.SpringAiChatMemory;

/**
 * 会话历史Mapper接口
 * 
 * @author Shawn
 * @date 2026-07-21
 */
public interface SpringAiChatMemoryMapper 
{
    /**
     * 查询会话历史
     * 
     * @param id 会话历史主键
     * @return 会话历史
     */
    public SpringAiChatMemory selectSpringAiChatMemoryById(Long id);

    /**
     * 查询会话历史列表
     * 
     * @param springAiChatMemory 会话历史
     * @return 会话历史集合
     */
    public List<SpringAiChatMemory> selectSpringAiChatMemoryList(SpringAiChatMemory springAiChatMemory);

    /**
     * 新增会话历史
     * 
     * @param springAiChatMemory 会话历史
     * @return 结果
     */
    public int insertSpringAiChatMemory(SpringAiChatMemory springAiChatMemory);

    /**
     * 修改会话历史
     * 
     * @param springAiChatMemory 会话历史
     * @return 结果
     */
    public int updateSpringAiChatMemory(SpringAiChatMemory springAiChatMemory);

    /**
     * 删除会话历史
     * 
     * @param id 会话历史主键
     * @return 结果
     */
    public int deleteSpringAiChatMemoryById(Long id);

    /**
     * 批量删除会话历史
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSpringAiChatMemoryByIds(String[] ids);
}
