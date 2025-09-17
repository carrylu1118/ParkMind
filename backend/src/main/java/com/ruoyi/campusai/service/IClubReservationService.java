package com.ruoyi.campusai.service;

import java.util.List;
import com.ruoyi.campusai.domain.ClubReservation;

/**
 * 社团报名Service接口
 * 
 * @author Shawn
 * @date 2025-09-17
 */
public interface IClubReservationService 
{
    /**
     * 查询社团报名
     * 
     * @param id 社团报名主键
     * @return 社团报名
     */
    public ClubReservation selectClubReservationById(Long id);

    /**
     * 查询社团报名列表
     * 
     * @param clubReservation 社团报名
     * @return 社团报名集合
     */
    public List<ClubReservation> selectClubReservationList(ClubReservation clubReservation);

    /**
     * 新增社团报名
     * 
     * @param clubReservation 社团报名
     * @return 结果
     */
    public int insertClubReservation(ClubReservation clubReservation);

    /**
     * 修改社团报名
     * 
     * @param clubReservation 社团报名
     * @return 结果
     */
    public int updateClubReservation(ClubReservation clubReservation);

    /**
     * 批量删除社团报名
     * 
     * @param ids 需要删除的社团报名主键集合
     * @return 结果
     */
    public int deleteClubReservationByIds(String ids);

    /**
     * 删除社团报名信息
     * 
     * @param id 社团报名主键
     * @return 结果
     */
    public int deleteClubReservationById(Long id);
}
