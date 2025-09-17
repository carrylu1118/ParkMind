package com.itheima.ai.vector.vectorservice;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class VectorServiceFactory {

    @Autowired
    private MaterialsVectorServiceImpl materialsVectorService;

    @Autowired
    private NoticeVectorServiceImpl noticeVectorService;

    public IVectorService of(String mesageType) {
        switch(mesageType) {
            case "document":
                return materialsVectorService;
            case "notice":
                return noticeVectorService;
            default:
                return null;
        }
    }
}
