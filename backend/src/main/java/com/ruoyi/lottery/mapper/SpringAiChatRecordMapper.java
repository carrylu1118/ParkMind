package com.ruoyi.lottery.mapper;

import java.util.List;
import com.ruoyi.lottery.domain.SpringAiChatRecord;
import com.ruoyi.lottery.domain.SpringAiChatMemory;

/**
 * 会话记录Mapper接口
 * 
 * @author Shawn
 * @date 2025-09-11
 */
public interface SpringAiChatRecordMapper 
{
    /**
     * 查询会话记录
     * 
     * @param id 会话记录主键
     * @return 会话记录
     */
    public SpringAiChatRecord selectSpringAiChatRecordById(String id);

    /**
     * 查询会话记录列表
     * 
     * @param springAiChatRecord 会话记录
     * @return 会话记录集合
     */
    public List<SpringAiChatRecord> selectSpringAiChatRecordList(SpringAiChatRecord springAiChatRecord);

    /**
     * 新增会话记录
     * 
     * @param springAiChatRecord 会话记录
     * @return 结果
     */
    public int insertSpringAiChatRecord(SpringAiChatRecord springAiChatRecord);

    /**
     * 修改会话记录
     * 
     * @param springAiChatRecord 会话记录
     * @return 结果
     */
    public int updateSpringAiChatRecord(SpringAiChatRecord springAiChatRecord);

    /**
     * 删除会话记录
     * 
     * @param id 会话记录主键
     * @return 结果
     */
    public int deleteSpringAiChatRecordById(String id);

    /**
     * 批量删除会话记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSpringAiChatRecordByIds(String[] ids);

    /**
     * 批量删除会话历史
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSpringAiChatMemoryByConversationIds(String[] ids);
    
    /**
     * 批量新增会话历史
     * 
     * @param springAiChatMemoryList 会话历史列表
     * @return 结果
     */
    public int batchSpringAiChatMemory(List<SpringAiChatMemory> springAiChatMemoryList);
    

    /**
     * 通过会话记录主键删除会话历史信息
     * 
     * @param id 会话记录ID
     * @return 结果
     */
    public int deleteSpringAiChatMemoryByConversationId(String id);
}
