package com.ruoyi.campusai.mapper;

import java.util.List;
import com.ruoyi.campusai.domain.Materials;

/**
 * 资料库Mapper接口
 * 
 * @author Shawn
 * @date 2025-09-17
 */
public interface MaterialsMapper 
{
    /**
     * 查询资料库
     * 
     * @param id 资料库主键
     * @return 资料库
     */
    public Materials selectMaterialsById(String id);

    /**
     * 查询资料库列表
     * 
     * @param materials 资料库
     * @return 资料库集合
     */
    public List<Materials> selectMaterialsList(Materials materials);

    /**
     * 新增资料库
     * 
     * @param materials 资料库
     * @return 结果
     */
    public int insertMaterials(Materials materials);

    /**
     * 修改资料库
     * 
     * @param materials 资料库
     * @return 结果
     */
    public int updateMaterials(Materials materials);

    /**
     * 删除资料库
     * 
     * @param id 资料库主键
     * @return 结果
     */
    public int deleteMaterialsById(String id);

    /**
     * 批量删除资料库
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMaterialsByIds(String[] ids);
}
