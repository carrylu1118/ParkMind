package com.itheima.ai.tools;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itheima.ai.entity.ClubReservation;
import com.itheima.ai.service.IClubReservationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.ai.tool.annotation.ToolParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class ClubTools {
    @Autowired
    IClubReservationService clubReservationService;

    @Tool(description = "生成社团预约单，返回预约单号")
    public Integer createClubReservation(
            @ToolParam(description = "预约社团") String club,
            @ToolParam(description = "所在院系与专业") String major,
            @ToolParam(description = "学生姓名") String name,
            @ToolParam(description = "联系方式") String phone,
            @ToolParam(description = "备注", required = false) String remark,
            @ToolParam(description = "学号") String userId
            ) {
        ClubReservation clubReservation = clubReservationService.getOne(new QueryWrapper<ClubReservation>().eq("user_id", userId));
        if (clubReservation == null){
            clubReservation = new ClubReservation();
        }
        clubReservation.setClub(club)
                .setMajor(major)
                .setName(name)
                .setPhone(phone)
                .setRemark(remark)
                .setUserId(userId);

        clubReservationService.saveOrUpdate(clubReservation);
        log.info("学员预约社团登记：{}", clubReservation);
        return clubReservation.getId();
    }
}
