package com.ruoyi.campusai.service;

import java.util.List;
import com.ruoyi.campusai.domain.Materials;

/**
 * 文档库Service接口
 * 
 * @author Shawn
 * @date 2025-09-17
 */
public interface IMaterialsService 
{
    /**
     * 查询文档库
     * 
     * @param id 文档库主键
     * @return 文档库
     */
    public Materials selectMaterialsById(String id);

    /**
     * 查询文档库列表
     * 
     * @param materials 文档库
     * @return 文档库集合
     */
    public List<Materials> selectMaterialsList(Materials materials);

    /**
     * 新增文档库
     * 
     * @param materials 文档库
     * @return 结果
     */
    public int insertMaterials(Materials materials);

    /**
     * 修改文档库
     * 
     * @param materials 文档库
     * @return 结果
     */
    public int updateMaterials(Materials materials);

    /**
     * 批量删除文档库
     * 
     * @param ids 需要删除的文档库主键集合
     * @return 结果
     */
    public int deleteMaterialsByIds(String ids);

    /**
     * 删除文档库信息
     * 
     * @param id 文档库主键
     * @return 结果
     */
    public int deleteMaterialsById(String id);
}
