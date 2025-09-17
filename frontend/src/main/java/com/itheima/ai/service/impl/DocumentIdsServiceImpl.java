package com.itheima.ai.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itheima.ai.entity.DocumentIds;
import com.itheima.ai.mapper.DocumentIdsMapper;
import com.itheima.ai.service.IDocumentIdsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 文档表 服务实现类
 * </p>
 *
 * @author 潜心
 * @since 2025-09-17
 */
@Service
public class DocumentIdsServiceImpl extends ServiceImpl<DocumentIdsMapper, DocumentIds> implements IDocumentIdsService {

    @Override
    public List<String> getDocumentIds(String type, String sourceIds) {
        QueryWrapper<DocumentIds> wrapper = new QueryWrapper<>();
        wrapper.eq("type", type);
        wrapper.in("source_id", sourceIds.split(","));
        List<DocumentIds> documentIds = list(wrapper);
        return documentIds.stream().map(DocumentIds::getDocumentId).toList();
    }

    @Override
    public void deleteBySourceIds(String type,String sourceIds) {
        if (StrUtil.isBlank(sourceIds)){
            return ;
        }
        remove(new QueryWrapper<DocumentIds>().eq("type", type).in("source_id",sourceIds.split(",")));
    }
}
