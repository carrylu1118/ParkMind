package com.itheima.ai.service;

import com.itheima.ai.entity.DocumentIds;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 文档表 服务类
 * </p>
 *
 * @author 潜心
 * @since 2025-09-17
 */
public interface IDocumentIdsService extends IService<DocumentIds> {

    public List<String> getDocumentIds(String sourceIds);
    public void deleteBySourceIds(String sourceIds);

}
