package com.ruoyi.campusai.service;

import java.util.List;
import com.ruoyi.campusai.domain.SpringAiChatRecord;

/**
 * 会话记录Service接口
 * 
 * @author Shawn
 * @date 2025-09-15
 */
public interface ISpringAiChatRecordService 
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
     * 批量删除会话记录
     * 
     * @param ids 需要删除的会话记录主键集合
     * @return 结果
     */
    public int deleteSpringAiChatRecordByIds(String ids);

    /**
     * 删除会话记录信息
     * 
     * @param id 会话记录主键
     * @return 结果
     */
    public int deleteSpringAiChatRecordById(String id);
}
