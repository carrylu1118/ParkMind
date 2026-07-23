package com.ruoyi.campusai.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.campusai.mapper.SpringAiChatMemoryMapper;
import com.ruoyi.campusai.domain.SpringAiChatMemory;
import com.ruoyi.campusai.service.ISpringAiChatMemoryService;
import com.ruoyi.common.core.text.Convert;

/**
 * 会话历史Service业务层处理
 * 
 * @author Shawn
 * @date 2026-07-21
 */
@Service
public class SpringAiChatMemoryServiceImpl implements ISpringAiChatMemoryService 
{
    @Autowired
    private SpringAiChatMemoryMapper springAiChatMemoryMapper;

    /**
     * 查询会话历史
     * 
     * @param id 会话历史主键
     * @return 会话历史
     */
    @Override
    public SpringAiChatMemory selectSpringAiChatMemoryById(Long id)
    {
        return springAiChatMemoryMapper.selectSpringAiChatMemoryById(id);
    }

    /**
     * 查询会话历史列表
     * 
     * @param springAiChatMemory 会话历史
     * @return 会话历史
     */
    @Override
    public List<SpringAiChatMemory> selectSpringAiChatMemoryList(SpringAiChatMemory springAiChatMemory)
    {
        return springAiChatMemoryMapper.selectSpringAiChatMemoryList(springAiChatMemory);
    }

    /**
     * 新增会话历史
     * 
     * @param springAiChatMemory 会话历史
     * @return 结果
     */
    @Override
    public int insertSpringAiChatMemory(SpringAiChatMemory springAiChatMemory)
    {
        return springAiChatMemoryMapper.insertSpringAiChatMemory(springAiChatMemory);
    }

    /**
     * 修改会话历史
     * 
     * @param springAiChatMemory 会话历史
     * @return 结果
     */
    @Override
    public int updateSpringAiChatMemory(SpringAiChatMemory springAiChatMemory)
    {
        return springAiChatMemoryMapper.updateSpringAiChatMemory(springAiChatMemory);
    }

    /**
     * 批量删除会话历史
     * 
     * @param ids 需要删除的会话历史主键
     * @return 结果
     */
    @Override
    public int deleteSpringAiChatMemoryByIds(String ids)
    {
        return springAiChatMemoryMapper.deleteSpringAiChatMemoryByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除会话历史信息
     * 
     * @param id 会话历史主键
     * @return 结果
     */
    @Override
    public int deleteSpringAiChatMemoryById(Long id)
    {
        return springAiChatMemoryMapper.deleteSpringAiChatMemoryById(id);
    }
}
