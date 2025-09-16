package com.itheima.ai.message;

import lombok.*;

@Data
@AllArgsConstructor
@Builder
public class MessageDto {
    private String id;
    private int operation;
    private String type;
    private String documentId,title,message;


}
