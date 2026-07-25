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

    // TODO 任务5.3.2：工厂方法根据messageDto的type返回对应实例
    public IVectorService of(String mesageType) {
        switch (mesageType) {
            case "CAMPUSAI_NOTICE":
                return noticeVectorService;
            case "CAMPUSAI_MATERIALS":
                return materialsVectorService;
            default:
                return null;
        }
    }
}


