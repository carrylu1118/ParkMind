package com.ruoyi.campusai.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 文档库对象 materials
 * 
 * @author Shawn
 * @date 2025-09-17
 */
public class Materials extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private String id;

    /** 名称 */
    @Excel(name = "名称")
    private String title;

    /** 文档链接 */
    @Excel(name = "文档链接")
    private String url;

    /** 向量库文档id */
    @Excel(name = "向量库文档id")
    private String documentId;

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
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }
    public void setDocumentId(String documentId) 
    {
        this.documentId = documentId;
    }

    public String getDocumentId() 
    {
        return documentId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("url", getUrl())
            .append("documentId", getDocumentId())
            .toString();
    }
}
