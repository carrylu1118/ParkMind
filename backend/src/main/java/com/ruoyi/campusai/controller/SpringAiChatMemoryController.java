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
import com.ruoyi.campusai.domain.SpringAiChatMemory;
import com.ruoyi.campusai.service.ISpringAiChatMemoryService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 会话历史Controller
 * 
 * @author Shawn
 * @date 2026-07-21
 */
@Controller
@RequestMapping("/campusai/MEMORY")
public class SpringAiChatMemoryController extends BaseController
{
    private String prefix = "campusai/MEMORY";

    @Autowired
    private ISpringAiChatMemoryService springAiChatMemoryService;

    @RequiresPermissions("campusai:MEMORY:view")
    @GetMapping()
    public String MEMORY()
    {
        return prefix + "/MEMORY";
    }

    /**
     * 查询会话历史列表
     */
    @RequiresPermissions("campusai:MEMORY:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SpringAiChatMemory springAiChatMemory)
    {
        startPage();
        List<SpringAiChatMemory> list = springAiChatMemoryService.selectSpringAiChatMemoryList(springAiChatMemory);
        return getDataTable(list);
    }

    /**
     * 导出会话历史列表
     */
    @RequiresPermissions("campusai:MEMORY:export")
    @Log(title = "会话历史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SpringAiChatMemory springAiChatMemory)
    {
        List<SpringAiChatMemory> list = springAiChatMemoryService.selectSpringAiChatMemoryList(springAiChatMemory);
        ExcelUtil<SpringAiChatMemory> util = new ExcelUtil<SpringAiChatMemory>(SpringAiChatMemory.class);
        return util.exportExcel(list, "会话历史数据");
    }

    /**
     * 新增会话历史
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存会话历史
     */
    @RequiresPermissions("campusai:MEMORY:add")
    @Log(title = "会话历史", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SpringAiChatMemory springAiChatMemory)
    {
        return toAjax(springAiChatMemoryService.insertSpringAiChatMemory(springAiChatMemory));
    }

    /**
     * 修改会话历史
     */
    @RequiresPermissions("campusai:MEMORY:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        SpringAiChatMemory springAiChatMemory = springAiChatMemoryService.selectSpringAiChatMemoryById(id);
        mmap.put("springAiChatMemory", springAiChatMemory);
        return prefix + "/edit";
    }

    /**
     * 修改保存会话历史
     */
    @RequiresPermissions("campusai:MEMORY:edit")
    @Log(title = "会话历史", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SpringAiChatMemory springAiChatMemory)
    {
        return toAjax(springAiChatMemoryService.updateSpringAiChatMemory(springAiChatMemory));
    }

    /**
     * 删除会话历史
     */
    @RequiresPermissions("campusai:MEMORY:remove")
    @Log(title = "会话历史", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(springAiChatMemoryService.deleteSpringAiChatMemoryByIds(ids));
    }
}
