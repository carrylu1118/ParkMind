package com.ruoyi.campusai.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.campusai.mapper.DocumentMapper;
import com.ruoyi.campusai.domain.Document;
import com.ruoyi.campusai.service.IDocumentService;
import com.ruoyi.common.core.text.Convert;

/**
 * 文档Service业务层处理
 * 
 * @author Shawn
 * @date 2025-09-16
 */
@Service
public class DocumentServiceImpl implements IDocumentService 
{
    @Autowired
    private DocumentMapper documentMapper;

    /**
     * 查询文档
     * 
     * @param id 文档主键
     * @return 文档
     */
    @Override
    public Document selectDocumentById(String id)
    {
        return documentMapper.selectDocumentById(id);
    }

    /**
     * 查询文档列表
     * 
     * @param document 文档
     * @return 文档
     */
    @Override
    public List<Document> selectDocumentList(Document document)
    {
        return documentMapper.selectDocumentList(document);
    }

    /**
     * 新增文档
     * 
     * @param document 文档
     * @return 结果
     */
    @Override
    public int insertDocument(Document document)
    {
        return documentMapper.insertDocument(document);
    }

    /**
     * 修改文档
     * 
     * @param document 文档
     * @return 结果
     */
    @Override
    public int updateDocument(Document document)
    {
        return documentMapper.updateDocument(document);
    }

    /**
     * 批量删除文档
     * 
     * @param ids 需要删除的文档主键
     * @return 结果
     */
    @Override
    public int deleteDocumentByIds(String ids)
    {
        return documentMapper.deleteDocumentByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除文档信息
     * 
     * @param id 文档主键
     * @return 结果
     */
    @Override
    public int deleteDocumentById(String id)
    {
        return documentMapper.deleteDocumentById(id);
    }
}
