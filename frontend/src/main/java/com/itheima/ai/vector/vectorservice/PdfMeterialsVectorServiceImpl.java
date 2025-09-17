package com.itheima.ai.vector.vectorservice;

import com.itheima.ai.entity.DocumentIds;
import com.itheima.ai.entity.Materials;
import com.itheima.ai.vector.dto.MessageDto;
import org.springframework.ai.document.Document;
import org.springframework.ai.reader.ExtractedTextFormatter;
import org.springframework.ai.reader.pdf.PagePdfDocumentReader;
import org.springframework.ai.reader.pdf.config.PdfDocumentReaderConfig;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;

import java.net.MalformedURLException;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PdfMeterialsVectorServiceImpl extends MaterialsVectorServiceImpl{
    @Override
    public void writeToVectorStore(Materials material) {
        // 1.创建PDF的读取器
        PagePdfDocumentReader reader = null;
        try {
            reader = new PagePdfDocumentReader(
                    new UrlResource(material.getUrl()), // 文件源
                    PdfDocumentReaderConfig.builder()
                            .withPageExtractedTextFormatter(ExtractedTextFormatter.defaults())
                            .withPagesPerDocument(1) // 每1页PDF作为一个Document
                            .build()
            );
            // 2.读取PDF文档，拆分为Document
            List<Document> documents = reader.read();
            documents.forEach(document -> {
                document.getMetadata().put("id", material.getId());
                document.getMetadata().put("title", material.getTitle());
                document.getMetadata().put("url", material.getUrl());
                documentIdsService.save(
                        new DocumentIds()
                                .setSourceId(String.valueOf(material.getId()))
                                .setDocumentId(document.getId())
                                .setType("CAMPUSAI_MATERIALS")
                );
            });
            // 3.写入向量库
            store.add(documents);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }

    }
}
