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
            case "CAMPUSAI_MATERIALS":
                return materialsVectorService;
            case "CAMPUSAI_NOTICE":
                return noticeVectorService;
            default:
                return null;
        }
    }
}
