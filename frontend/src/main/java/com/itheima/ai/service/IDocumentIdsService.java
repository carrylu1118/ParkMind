package com.itheima.ai.service;

import com.itheima.ai.entity.DocumentIds;
import com.baomidou.mybatisplus.extension.service.IService;

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

    /**
     * 获取文档ID列表
     * @param type 文档类型
     * @param sourceIds 文档源ID列表
     * @return 文档ID列表
     */
    public List<String> getDocumentIds(String type, String sourceIds);
    /**
     * 删除文档ID列表
     * @param type 文档类型
     * @param sourceIds 文档源ID列表
     */
    public void deleteBySourceIds(String type, String sourceIds);

}
