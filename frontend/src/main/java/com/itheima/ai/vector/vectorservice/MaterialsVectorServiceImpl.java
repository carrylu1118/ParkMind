package com.itheima.ai.vector.vectorservice;

import cn.hutool.core.util.StrUtil;
import com.itheima.ai.entity.Materials;
import com.itheima.ai.service.IDocumentIdsService;
import com.itheima.ai.service.IMaterialsService;
import com.itheima.ai.vector.dto.MessageDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ai.document.Document;
import org.springframework.ai.reader.ExtractedTextFormatter;
import org.springframework.ai.reader.pdf.PagePdfDocumentReader;
import org.springframework.ai.reader.pdf.config.PdfDocumentReaderConfig;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;

import java.net.MalformedURLException;
import java.util.List;
import java.util.stream.Collectors;

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
        List<String> documentIds = documentIdsService.getDocumentIds(ids);
        store.delete(documentIds);
        documentIdsService.deleteBySourceIds(ids);
    }

    protected abstract void writeToVectorStore(Materials materials);
}
