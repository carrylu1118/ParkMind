package com.itheima.ai.vector.vectorservice;

import cn.hutool.core.util.StrUtil;
import com.itheima.ai.entity.Materials;
import com.itheima.ai.service.IDocumentIdsService;
import com.itheima.ai.service.IMaterialsService;
import com.itheima.ai.vector.dto.MessageDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public abstract class MaterialsVectorServiceImpl implements IVectorService {

    @Autowired
    VectorStore store;
    @Autowired
    IMaterialsService materialsService;
    @Autowired
    protected IDocumentIdsService documentIdsService;
    @Override
    public void addDocument(MessageDto messageDto) {
        Materials materials = materialsService.getById(messageDto.getIds());
        writeToVectorStore(materials);
    }

    @Override
    public void updateDocument(MessageDto messageDto) {
        deleteDocument(messageDto);
        addDocument(messageDto);
    }

    @Override
    public void deleteDocument(MessageDto messageDto) {
        String ids = messageDto.getIds();
        if (StrUtil.isEmpty(ids)){
            log.warn("ids is null");
            return;
        }
        //拿到旧的向量id
        List<String> documentIds = documentIdsService.getDocumentIds("CAMPUSAI_MATERIALS", ids);
        store.delete(documentIds);
        documentIdsService.deleteBySourceIds("CAMPUSAI_MATERIALS",ids);
    }

    protected abstract void writeToVectorStore(Materials materials);
}
