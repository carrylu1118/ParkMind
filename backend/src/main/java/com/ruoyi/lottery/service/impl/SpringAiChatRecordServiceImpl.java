package com.ruoyi.lottery.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.lottery.domain.SpringAiChatMemory;
import com.ruoyi.lottery.mapper.SpringAiChatRecordMapper;
import com.ruoyi.lottery.domain.SpringAiChatRecord;
import com.ruoyi.lottery.service.ISpringAiChatRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 会话记录Service业务层处理
 * 
 * @author Shawn
 * @date 2025-09-11
 */
@Service
public class SpringAiChatRecordServiceImpl implements ISpringAiChatRecordService 
{
    @Autowired
    private SpringAiChatRecordMapper springAiChatRecordMapper;

    /**
     * 查询会话记录
     * 
     * @param id 会话记录主键
     * @return 会话记录
     */
    @Override
    public SpringAiChatRecord selectSpringAiChatRecordById(String id)
    {
        return springAiChatRecordMapper.selectSpringAiChatRecordById(id);
    }

    /**
     * 查询会话记录列表
     * 
     * @param springAiChatRecord 会话记录
     * @return 会话记录
     */
    @Override
    public List<SpringAiChatRecord> selectSpringAiChatRecordList(SpringAiChatRecord springAiChatRecord)
    {
        return springAiChatRecordMapper.selectSpringAiChatRecordList(springAiChatRecord);
    }

    /**
     * 新增会话记录
     * 
     * @param springAiChatRecord 会话记录
     * @return 结果
     */
    @Transactional
    @Override
    public int insertSpringAiChatRecord(SpringAiChatRecord springAiChatRecord)
    {
        springAiChatRecord.setCreateTime(DateUtils.getNowDate());
        int rows = springAiChatRecordMapper.insertSpringAiChatRecord(springAiChatRecord);
        insertSpringAiChatMemory(springAiChatRecord);
        return rows;
    }

    /**
     * 修改会话记录
     * 
     * @param springAiChatRecord 会话记录
     * @return 结果
     */
    @Transactional
    @Override
    public int updateSpringAiChatRecord(SpringAiChatRecord springAiChatRecord)
    {
        springAiChatRecordMapper.deleteSpringAiChatMemoryByConversationId(springAiChatRecord.getId());
        insertSpringAiChatMemory(springAiChatRecord);
        return springAiChatRecordMapper.updateSpringAiChatRecord(springAiChatRecord);
    }

    /**
     * 批量删除会话记录
     * 
     * @param ids 需要删除的会话记录主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteSpringAiChatRecordByIds(String ids)
    {
        springAiChatRecordMapper.deleteSpringAiChatMemoryByConversationIds(Convert.toStrArray(ids));
        return springAiChatRecordMapper.deleteSpringAiChatRecordByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除会话记录信息
     * 
     * @param id 会话记录主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteSpringAiChatRecordById(String id)
    {
        springAiChatRecordMapper.deleteSpringAiChatMemoryByConversationId(id);
        return springAiChatRecordMapper.deleteSpringAiChatRecordById(id);
    }

    /**
     * 新增会话历史信息
     * 
     * @param springAiChatRecord 会话记录对象
     */
    public void insertSpringAiChatMemory(SpringAiChatRecord springAiChatRecord)
    {
        List<SpringAiChatMemory> springAiChatMemoryList = springAiChatRecord.getSpringAiChatMemoryList();
        String id = springAiChatRecord.getId();
        if (StringUtils.isNotNull(springAiChatMemoryList))
        {
            List<SpringAiChatMemory> list = new ArrayList<SpringAiChatMemory>();
            for (SpringAiChatMemory springAiChatMemory : springAiChatMemoryList)
            {
                springAiChatMemory.setConversationId(id);
                list.add(springAiChatMemory);
            }
            if (list.size() > 0)
            {
                springAiChatRecordMapper.batchSpringAiChatMemory(list);
            }
        }
    }
}
