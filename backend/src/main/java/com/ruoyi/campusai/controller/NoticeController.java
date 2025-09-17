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
import com.ruoyi.campusai.domain.Notice;
import com.ruoyi.campusai.service.INoticeService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 校园墙Controller
 *
 * @author Shawn
 * @date 2025-09-17
 */
@Controller
@RequestMapping("/campusai/notice")
public class NoticeController extends BaseController
{
    private String prefix = "campusai/notice";

    @Autowired
    private INoticeService noticeService;

    @Autowired
    private RabbitSendService rabbitSendService;

    @RequiresPermissions("campusai:notice:view")
    @GetMapping()
    public String notice()
    {
        return prefix + "/notice";
    }

    /**
     * 查询校园墙列表
     */
    @RequiresPermissions("campusai:notice:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Notice notice)
    {
        startPage();
        List<Notice> list = noticeService.selectNoticeList(notice);
        return getDataTable(list);
    }

    /**
     * 导出校园墙列表
     */
    @RequiresPermissions("campusai:notice:export")
    @Log(title = "校园墙", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Notice notice)
    {
        List<Notice> list = noticeService.selectNoticeList(notice);
        ExcelUtil<Notice> util = new ExcelUtil<Notice>(Notice.class);
        return util.exportExcel(list, "校园墙数据");
    }

    /**
     * 新增校园墙
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存校园墙
     */
    @RequiresPermissions("campusai:notice:add")
    @Log(title = "校园墙", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Notice notice)
    {
        int rows = noticeService.insertNotice(notice);
        rabbitSendService.sendAddNotice(notice.getId());
        return toAjax(rows);
    }

    /**
     * 修改校园墙
     */
    @RequiresPermissions("campusai:notice:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap mmap)
    {
        Notice notice = noticeService.selectNoticeById(id);
        mmap.put("notice", notice);
        return prefix + "/edit";
    }

    /**
     * 修改保存校园墙
     */
    @RequiresPermissions("campusai:notice:edit")
    @Log(title = "校园墙", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Notice notice)
    {
        rabbitSendService.sendUpdateNotice(notice.getId());
        return toAjax(noticeService.updateNotice(notice));
    }

    /**
     * 删除校园墙
     */
    @RequiresPermissions("campusai:notice:remove")
    @Log(title = "校园墙", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        rabbitSendService.sendDeleteNotice(ids);
        return toAjax(noticeService.deleteNoticeByIds(ids));
    }
}
