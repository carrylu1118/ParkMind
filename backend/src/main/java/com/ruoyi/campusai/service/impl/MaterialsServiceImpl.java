package com.ruoyi.campusai.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.campusai.mapper.MaterialsMapper;
import com.ruoyi.campusai.domain.Materials;
import com.ruoyi.campusai.service.IMaterialsService;
import com.ruoyi.common.core.text.Convert;

/**
 * 资料库Service业务层处理
 * 
 * @author Shawn
 * @date 2025-09-17
 */
@Service
public class MaterialsServiceImpl implements IMaterialsService 
{
    @Autowired
    private MaterialsMapper materialsMapper;

    /**
     * 查询资料库
     * 
     * @param id 资料库主键
     * @return 资料库
     */
    @Override
    public Materials selectMaterialsById(String id)
    {
        return materialsMapper.selectMaterialsById(id);
    }

    /**
     * 查询资料库列表
     * 
     * @param materials 资料库
     * @return 资料库
     */
    @Override
    public List<Materials> selectMaterialsList(Materials materials)
    {
        return materialsMapper.selectMaterialsList(materials);
    }

    /**
     * 新增资料库
     * 
     * @param materials 资料库
     * @return 结果
     */
    @Override
    public int insertMaterials(Materials materials)
    {
        return materialsMapper.insertMaterials(materials);
    }

    /**
     * 修改资料库
     * 
     * @param materials 资料库
     * @return 结果
     */
    @Override
    public int updateMaterials(Materials materials)
    {
        return materialsMapper.updateMaterials(materials);
    }

    /**
     * 批量删除资料库
     * 
     * @param ids 需要删除的资料库主键
     * @return 结果
     */
    @Override
    public int deleteMaterialsByIds(String ids)
    {
        return materialsMapper.deleteMaterialsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除资料库信息
     * 
     * @param id 资料库主键
     * @return 结果
     */
    @Override
    public int deleteMaterialsById(String id)
    {
        return materialsMapper.deleteMaterialsById(id);
    }
}
