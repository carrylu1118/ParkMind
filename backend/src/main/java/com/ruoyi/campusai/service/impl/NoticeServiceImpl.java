package com.ruoyi.campusai.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.campusai.mapper.NoticeMapper;
import com.ruoyi.campusai.domain.Notice;
import com.ruoyi.campusai.service.INoticeService;
import com.ruoyi.common.core.text.Convert;

/**
 * 校园墙Service业务层处理
 * 
 * @author Shawn
 * @date 2026-07-23
 */
@Service
public class NoticeServiceImpl implements INoticeService 
{
    @Autowired
    private NoticeMapper noticeMapper;

    /**
     * 查询校园墙
     * 
     * @param id 校园墙主键
     * @return 校园墙
     */
    @Override
    public Notice selectNoticeById(String id)
    {
        return noticeMapper.selectNoticeById(id);
    }

    /**
     * 查询校园墙列表
     * 
     * @param notice 校园墙
     * @return 校园墙
     */
    @Override
    public List<Notice> selectNoticeList(Notice notice)
    {
        return noticeMapper.selectNoticeList(notice);
    }

    /**
     * 新增校园墙
     * 
     * @param notice 校园墙
     * @return 结果
     */
    @Override
    public int insertNotice(Notice notice)
    {
        notice.setCreateTime(DateUtils.getNowDate());
        return noticeMapper.insertNotice(notice);
    }

    /**
     * 修改校园墙
     * 
     * @param notice 校园墙
     * @return 结果
     */
    @Override
    public int updateNotice(Notice notice)
    {
        return noticeMapper.updateNotice(notice);
    }

    /**
     * 批量删除校园墙
     * 
     * @param ids 需要删除的校园墙主键
     * @return 结果
     */
    @Override
    public int deleteNoticeByIds(String ids)
    {
        return noticeMapper.deleteNoticeByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除校园墙信息
     * 
     * @param id 校园墙主键
     * @return 结果
     */
    @Override
    public int deleteNoticeById(String id)
    {
        return noticeMapper.deleteNoticeById(id);
    }
}
