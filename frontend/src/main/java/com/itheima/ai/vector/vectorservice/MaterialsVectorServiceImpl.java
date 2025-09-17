package com.itheima.ai.vector.vectorservice;

import com.itheima.ai.entity.Materials;
import com.itheima.ai.service.IMaterialsService;
import com.itheima.ai.vector.dto.MessageDto;
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
public abstract class MaterialsVectorServiceImpl implements IVectorService {

    @Autowired
    VectorStore store;
    @Autowired
    IMaterialsService materialsService;
    @Override
    public void addDocument(MessageDto messageDto) {
        writeToVectorStore(messageDto);
    }

    @Override
    public void updateDocument(MessageDto messageDto) {
        Materials material = materialsService.getById(messageDto.getId());
        store.delete(List.of(material.getDocumentId()));
        writeToVectorStore(messageDto);
    }

    @Override
    public void deleteDocument(MessageDto messageDto) {
        Materials material = materialsService.getById(messageDto.getId());
        store.delete(List.of(material.getDocumentId()));
    }

    protected abstract void writeToVectorStore(MessageDto dto);
}
