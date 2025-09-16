package com.itheima.ai.vector.vectorservice;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class VectorServiceFactory {
    private DocumentVectorServiceImpl documentVectorService;

    private NoticeVectorServiceImpl noticeVectorService;

    public IVectorService of(String mesageType) {
        switch(mesageType) {
            case "document":
                return documentVectorService;
            case "notice":
                return noticeVectorService;
            default:
                return null;
        }
    }
}
