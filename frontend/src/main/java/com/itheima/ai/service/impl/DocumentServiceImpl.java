package com.itheima.ai.service.impl;

import com.itheima.ai.entity.Document;
import com.itheima.ai.mapper.DocumentMapper;
import com.itheima.ai.service.IDocumentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 文档表 服务实现类
 * </p>
 *
 * @author 潜心
 * @since 2025-09-16
 */
@Service
public class DocumentServiceImpl extends ServiceImpl<DocumentMapper, Document> implements IDocumentService {

}
