package com.ruoyi.campusai.domain;

import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 会话记录对象 spring_ai_chat_record
 * 
 * @author Shawn
 * @date 2025-09-15
 */
public class SpringAiChatRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 会话id */
    private String id;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 用户id */
    @Excel(name = "用户id")
    private String userId;

    /** 会话类型 */
    @Excel(name = "会话类型")
    private String type;

    /** 会话历史信息 */
    private List<SpringAiChatMemory> springAiChatMemoryList;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }

    public List<SpringAiChatMemory> getSpringAiChatMemoryList()
    {
        return springAiChatMemoryList;
    }

    public void setSpringAiChatMemoryList(List<SpringAiChatMemory> springAiChatMemoryList)
    {
        this.springAiChatMemoryList = springAiChatMemoryList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("userId", getUserId())
            .append("type", getType())
            .append("createTime", getCreateTime())
            .append("springAiChatMemoryList", getSpringAiChatMemoryList())
            .toString();
    }
}
