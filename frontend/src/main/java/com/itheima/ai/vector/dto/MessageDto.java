package com.itheima.ai.vector.dto;

import cn.hutool.core.util.StrUtil;
import lombok.*;

@Data
@AllArgsConstructor
@Builder
public class MessageDto {
    private String ids;
    private int operation; // 1添加 2修改 3删除
    private String type; // CAMPUSAI_NOTICE ， CAMPUSAI_MATERIALS
}
