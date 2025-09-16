package com.ruoyi.common.core.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@Builder
public class MessageDto {
    private String id;
    private int operation;
    private String type;
    private String documentId,title,message;


}
