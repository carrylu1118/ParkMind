package com.ruoyi.campusai.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 社团报名对象 club_reservation
 * 
 * @author Shawn
 * @date 2025-09-17
 */
public class ClubReservation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 预约社团 */
    @Excel(name = "预约社团")
    private String club;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String name;

    /** 联系方式 */
    @Excel(name = "联系方式")
    private String phone;

    /** 专业 */
    @Excel(name = "专业")
    private String major;

    /** 学号 */
    @Excel(name = "学号")
    private String userId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setClub(String club) 
    {
        this.club = club;
    }

    public String getClub() 
    {
        return club;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setMajor(String major) 
    {
        this.major = major;
    }

    public String getMajor() 
    {
        return major;
    }
    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("club", getClub())
            .append("name", getName())
            .append("phone", getPhone())
            .append("major", getMajor())
            .append("remark", getRemark())
            .append("userId", getUserId())
            .toString();
    }
}
