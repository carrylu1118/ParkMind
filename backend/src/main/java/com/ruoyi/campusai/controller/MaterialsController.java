package com.ruoyi.campusai.controller;

import java.util.List;

import com.ruoyi.campusai.service.RabbitSendService;
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
 * 资料库Controller
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

    @Autowired
    RabbitSendService rabbitSendService;

    @RequiresPermissions("campusai:materials:view")
    @GetMapping()
    public String materials()
    {
        return prefix + "/materials";
    }

    /**
     * 查询资料库列表
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
     * 导出资料库列表
     */
    @RequiresPermissions("campusai:materials:export")
    @Log(title = "资料库", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Materials materials)
    {
        List<Materials> list = materialsService.selectMaterialsList(materials);
        ExcelUtil<Materials> util = new ExcelUtil<Materials>(Materials.class);
        return util.exportExcel(list, "资料库数据");
    }

    /**
     * 新增资料库
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存资料库
     */
    @RequiresPermissions("campusai:materials:add")
    @Log(title = "资料库", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Materials materials)
    {
        int rows = materialsService.insertMaterials(materials);
        rabbitSendService.sendAddMaterials(materials.getId());
        return toAjax(rows);
    }

    /**
     * 修改资料库
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
     * 修改保存资料库
     */
    @RequiresPermissions("campusai:materials:edit")
    @Log(title = "资料库", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Materials materials)
    {
        rabbitSendService.sendUpdateMaterials(materials.getId());
        return toAjax(materialsService.updateMaterials(materials));
    }

    /**
     * 删除资料库
     */
    @RequiresPermissions("campusai:materials:remove")
    @Log(title = "资料库", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        rabbitSendService.sendDeleteMaterials(ids);
        return toAjax(materialsService.deleteMaterialsByIds(ids));
    }
}
