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
import com.ruoyi.campusai.domain.ClubReservation;
import com.ruoyi.campusai.service.IClubReservationService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 社团报名Controller
 * 
 * @author Shawn
 * @date 2025-09-18
 */
@Controller
@RequestMapping("/campusai/reservation")
public class ClubReservationController extends BaseController
{
    private String prefix = "campusai/reservation";

    @Autowired
    private IClubReservationService clubReservationService;

    @RequiresPermissions("campusai:reservation:view")
    @GetMapping()
    public String reservation()
    {
        return prefix + "/reservation";
    }

    /**
     * 查询社团报名列表
     */
    @RequiresPermissions("campusai:reservation:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ClubReservation clubReservation)
    {
        startPage();
        List<ClubReservation> list = clubReservationService.selectClubReservationList(clubReservation);
        return getDataTable(list);
    }

    /**
     * 导出社团报名列表
     */
    @RequiresPermissions("campusai:reservation:export")
    @Log(title = "社团报名", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ClubReservation clubReservation)
    {
        List<ClubReservation> list = clubReservationService.selectClubReservationList(clubReservation);
        ExcelUtil<ClubReservation> util = new ExcelUtil<ClubReservation>(ClubReservation.class);
        return util.exportExcel(list, "社团报名数据");
    }

    /**
     * 新增社团报名
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存社团报名
     */
    @RequiresPermissions("campusai:reservation:add")
    @Log(title = "社团报名", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ClubReservation clubReservation)
    {
        return toAjax(clubReservationService.insertClubReservation(clubReservation));
    }

    /**
     * 修改社团报名
     */
    @RequiresPermissions("campusai:reservation:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ClubReservation clubReservation = clubReservationService.selectClubReservationById(id);
        mmap.put("clubReservation", clubReservation);
        return prefix + "/edit";
    }

    /**
     * 修改保存社团报名
     */
    @RequiresPermissions("campusai:reservation:edit")
    @Log(title = "社团报名", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ClubReservation clubReservation)
    {
        return toAjax(clubReservationService.updateClubReservation(clubReservation));
    }

    /**
     * 删除社团报名
     */
    @RequiresPermissions("campusai:reservation:remove")
    @Log(title = "社团报名", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(clubReservationService.deleteClubReservationByIds(ids));
    }
}
