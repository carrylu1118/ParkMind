package com.ruoyi.campusai.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.campusai.domain.Materials;
import com.ruoyi.campusai.service.IMaterialsService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 文档库Controller
 * 
 * @author Shawn
 * @date 2025-09-17
 */
@Controller
@RequestMapping("/campusai/materials")
public class MaterialsController extends BaseController
{
    private String prefix = "campusai/materials";

    @Autowired
    private IMaterialsService materialsService;

    @RequiresPermissions("campusai:materials:view")
    @GetMapping()
    public String materials()
    {
        return prefix + "/materials";
    }

    /**
     * 查询文档库列表
     */
    @RequiresPermissions("campusai:materials:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Materials materials)
    {
        startPage();
        List<Materials> list = materialsService.selectMaterialsList(materials);
        return getDataTable(list);
    }

    /**
     * 导出文档库列表
     */
    @RequiresPermissions("campusai:materials:export")
    @Log(title = "文档库", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Materials materials)
    {
        List<Materials> list = materialsService.selectMaterialsList(materials);
        ExcelUtil<Materials> util = new ExcelUtil<Materials>(Materials.class);
        return util.exportExcel(list, "文档库数据");
    }

    /**
     * 新增文档库
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存文档库
     */
    @RequiresPermissions("campusai:materials:add")
    @Log(title = "文档库", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Materials materials)
    {
        return toAjax(materialsService.insertMaterials(materials));
    }

    /**
     * 修改文档库
     */
    @RequiresPermissions("campusai:materials:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap mmap)
    {
        Materials materials = materialsService.selectMaterialsById(id);
        mmap.put("materials", materials);
        return prefix + "/edit";
    }

    /**
     * 修改保存文档库
     */
    @RequiresPermissions("campusai:materials:edit")
    @Log(title = "文档库", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Materials materials)
    {
        return toAjax(materialsService.updateMaterials(materials));
    }

    /**
     * 删除文档库
     */
    @RequiresPermissions("campusai:materials:remove")
    @Log(title = "文档库", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(materialsService.deleteMaterialsByIds(ids));
    }
}
