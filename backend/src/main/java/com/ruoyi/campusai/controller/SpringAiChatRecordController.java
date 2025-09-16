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
import com.ruoyi.campusai.domain.SpringAiChatRecord;
import com.ruoyi.campusai.service.ISpringAiChatRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 会话记录Controller
 * 
 * @author Shawn
 * @date 2025-09-15
 */
@Controller
@RequestMapping("/campusai/record")
public class SpringAiChatRecordController extends BaseController
{
    private String prefix = "campusai/record";

    @Autowired
    private ISpringAiChatRecordService springAiChatRecordService;

    @RequiresPermissions("campusai:record:view")
    @GetMapping()
    public String record()
    {
        return prefix + "/record";
    }

    /**
     * 查询会话记录列表
     */
    @RequiresPermissions("campusai:record:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SpringAiChatRecord springAiChatRecord)
    {
        startPage();
        List<SpringAiChatRecord> list = springAiChatRecordService.selectSpringAiChatRecordList(springAiChatRecord);
        return getDataTable(list);
    }

    /**
     * 导出会话记录列表
     */
    @RequiresPermissions("campusai:record:export")
    @Log(title = "会话记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SpringAiChatRecord springAiChatRecord)
    {
        List<SpringAiChatRecord> list = springAiChatRecordService.selectSpringAiChatRecordList(springAiChatRecord);
        ExcelUtil<SpringAiChatRecord> util = new ExcelUtil<SpringAiChatRecord>(SpringAiChatRecord.class);
        return util.exportExcel(list, "会话记录数据");
    }

    /**
     * 新增会话记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存会话记录
     */
    @RequiresPermissions("campusai:record:add")
    @Log(title = "会话记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SpringAiChatRecord springAiChatRecord)
    {
        return toAjax(springAiChatRecordService.insertSpringAiChatRecord(springAiChatRecord));
    }

    /**
     * 修改会话记录
     */
    @RequiresPermissions("campusai:record:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap mmap)
    {
        SpringAiChatRecord springAiChatRecord = springAiChatRecordService.selectSpringAiChatRecordById(id);
        mmap.put("springAiChatRecord", springAiChatRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存会话记录
     */
    @RequiresPermissions("campusai:record:edit")
    @Log(title = "会话记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SpringAiChatRecord springAiChatRecord)
    {
        return toAjax(springAiChatRecordService.updateSpringAiChatRecord(springAiChatRecord));
    }

    /**
     * 删除会话记录
     */
    @RequiresPermissions("campusai:record:remove")
    @Log(title = "会话记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(springAiChatRecordService.deleteSpringAiChatRecordByIds(ids));
    }
}
