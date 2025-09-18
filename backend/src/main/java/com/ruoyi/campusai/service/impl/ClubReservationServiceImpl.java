package com.ruoyi.campusai.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.campusai.mapper.ClubReservationMapper;
import com.ruoyi.campusai.domain.ClubReservation;
import com.ruoyi.campusai.service.IClubReservationService;
import com.ruoyi.common.core.text.Convert;

/**
 * 社团报名Service业务层处理
 * 
 * @author Shawn
 * @date 2025-09-18
 */
@Service
public class ClubReservationServiceImpl implements IClubReservationService 
{
    @Autowired
    private ClubReservationMapper clubReservationMapper;

    /**
     * 查询社团报名
     * 
     * @param id 社团报名主键
     * @return 社团报名
     */
    @Override
    public ClubReservation selectClubReservationById(Long id)
    {
        return clubReservationMapper.selectClubReservationById(id);
    }

    /**
     * 查询社团报名列表
     * 
     * @param clubReservation 社团报名
     * @return 社团报名
     */
    @Override
    public List<ClubReservation> selectClubReservationList(ClubReservation clubReservation)
    {
        return clubReservationMapper.selectClubReservationList(clubReservation);
    }

    /**
     * 新增社团报名
     * 
     * @param clubReservation 社团报名
     * @return 结果
     */
    @Override
    public int insertClubReservation(ClubReservation clubReservation)
    {
        return clubReservationMapper.insertClubReservation(clubReservation);
    }

    /**
     * 修改社团报名
     * 
     * @param clubReservation 社团报名
     * @return 结果
     */
    @Override
    public int updateClubReservation(ClubReservation clubReservation)
    {
        return clubReservationMapper.updateClubReservation(clubReservation);
    }

    /**
     * 批量删除社团报名
     * 
     * @param ids 需要删除的社团报名主键
     * @return 结果
     */
    @Override
    public int deleteClubReservationByIds(String ids)
    {
        return clubReservationMapper.deleteClubReservationByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除社团报名信息
     * 
     * @param id 社团报名主键
     * @return 结果
     */
    @Override
    public int deleteClubReservationById(Long id)
    {
        return clubReservationMapper.deleteClubReservationById(id);
    }
}
