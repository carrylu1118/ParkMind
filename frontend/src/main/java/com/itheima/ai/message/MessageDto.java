package com.itheima.ai.message;

import lombok.*;

@Data
@AllArgsConstructor
@Builder
public class MessageDto {
    private String id;
    private int operation; // 1添加 2修改 3删除
    private String type; // notice ， document
    private String documentId,title,message;


}
