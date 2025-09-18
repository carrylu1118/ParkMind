package com.itheima.ai.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 社团报名
 * </p>
 *
 * @author 潜心
 * @since 2025-09-18
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("club_reservation")
public class ClubReservation implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 预约社团
     */
    private String club;

    /**
     * 学生姓名
     */
    private String name;

    /**
     * 联系方式
     */
    private String phone;

    /**
     * 专业
     */
    private String major;

    /**
     * 备注
     */
    private String remark;

    /**
     * 学号
     */
    private String userId;


}
