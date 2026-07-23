package com.ruoyi.campusai.service;

import java.util.List;
import com.ruoyi.campusai.domain.Notice;

/**
 * 校园墙Service接口
 * 
 * @author Shawn
 * @date 2026-07-23
 */
public interface INoticeService 
{
    /**
     * 查询校园墙
     * 
     * @param id 校园墙主键
     * @return 校园墙
     */
    public Notice selectNoticeById(String id);

    /**
     * 查询校园墙列表
     * 
     * @param notice 校园墙
     * @return 校园墙集合
     */
    public List<Notice> selectNoticeList(Notice notice);

    /**
     * 新增校园墙
     * 
     * @param notice 校园墙
     * @return 结果
     */
    public int insertNotice(Notice notice);

    /**
     * 修改校园墙
     * 
     * @param notice 校园墙
     * @return 结果
     */
    public int updateNotice(Notice notice);

    /**
     * 批量删除校园墙
     * 
     * @param ids 需要删除的校园墙主键集合
     * @return 结果
     */
    public int deleteNoticeByIds(String ids);

    /**
     * 删除校园墙信息
     * 
     * @param id 校园墙主键
     * @return 结果
     */
    public int deleteNoticeById(String id);
}
