package com.ruoyi.campusai.controller;

import java.util.List;

import com.alibaba.fastjson.JSON;
import com.ruoyi.common.core.domain.MessageDto;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
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
import com.ruoyi.campusai.domain.Document;
import com.ruoyi.campusai.service.IDocumentService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 文档Controller
 *
 * @author Shawn
 * @date 2025-09-16
 */
@Controller
@RequestMapping("/campusai/document")
public class DocumentController extends BaseController
{
    private String prefix = "campusai/document";

    @Autowired
    private IDocumentService documentService;
    @Autowired
    private RabbitTemplate rabbitTemplate;

    @RequiresPermissions("campusai:document:view")
    @GetMapping()
    public String document()
    {
        return prefix + "/document";
    }

    /**
     * 查询文档列表
     */
    @RequiresPermissions("campusai:document:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Document document)
    {
        startPage();
        List<Document> list = documentService.selectDocumentList(document);
        return getDataTable(list);
    }

    /**
     * 导出文档列表
     */
    @RequiresPermissions("campusai:document:export")
    @Log(title = "文档", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Document document)
    {
        List<Document> list = documentService.selectDocumentList(document);
        ExcelUtil<Document> util = new ExcelUtil<Document>(Document.class);
        return util.exportExcel(list, "文档数据");
    }

    /**
     * 新增文档
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存文档
     */
    @RequiresPermissions("campusai:document:add")
    @Log(title = "文档", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Document document)
    {
        int result = documentService.insertDocument(document);
        MessageDto dto = MessageDto.builder().type("document").id(document.getId())
                .title(document.getTitle()).operation(1).message(document.getUrl()).build();
        rabbitTemplate.convertAndSend("CAMPUSAI_DOCUMENT", JSON.toJSONString(dto));
        return toAjax(result);
    }

    /**
     * 修改文档
     */
    @RequiresPermissions("campusai:document:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap mmap)
    {
        Document document = documentService.selectDocumentById(id);
        mmap.put("document", document);
        return prefix + "/edit";
    }

    /**
     * 修改保存文档
     */
    @RequiresPermissions("campusai:document:edit")
    @Log(title = "文档", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Document document)
    {
        MessageDto dto = MessageDto.builder().type("document").id(document.getId())
                .title(document.getTitle()).operation(2).message(document.getUrl()).build();
        rabbitTemplate.convertAndSend("CAMPUSAI_DOCUMENT", JSON.toJSONString(dto));
        return toAjax(documentService.updateDocument(document));
    }

    /**
     * 删除文档
     */
    @RequiresPermissions("campusai:document:remove")
    @Log(title = "文档", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        MessageDto dto = MessageDto.builder().type("document").id(ids)
                .operation(3).build();
        rabbitTemplate.convertAndSend("CAMPUSAI_DOCUMENT", JSON.toJSONString(dto));
        return toAjax(documentService.deleteDocumentByIds(ids));
    }
}
