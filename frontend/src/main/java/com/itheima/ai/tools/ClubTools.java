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

    @Tool(description = "xxxx") //TODO 任务6.2.2 工具描述，要与提示词一致才能触发
    public Integer createClubReservation(
            @ToolParam(description = "学生姓名") String name
            //更多需要采集的参数……与提示词相对应
            ) {
        //TODO 任务6.2.2 创建预约单，并返回预约单号
        return 0;
    }
}


