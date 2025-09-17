package com.ruoyi.campusai.mapper;

import java.util.List;
import com.ruoyi.campusai.domain.Materials;

/**
 * 文档库Mapper接口
 * 
 * @author Shawn
 * @date 2025-09-17
 */
public interface MaterialsMapper 
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
     * 删除文档库
     * 
     * @param id 文档库主键
     * @return 结果
     */
    public int deleteMaterialsById(String id);

    /**
     * 批量删除文档库
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMaterialsByIds(String[] ids);
}
