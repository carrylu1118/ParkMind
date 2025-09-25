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

//TODO: 任务7.2.2 完成pdf文档化，并写入向量库和中间表
@Service
public class PdfMeterialsVectorServiceImpl extends MaterialsVectorServiceImpl{
    @Override
    public void writeToVectorStore(Materials material) {
        // 1.创建PDF的读取器 PagePdfDocumentReader
        //注意！material里获取到的是url的地址字符串，reader里的参数需要UrlResource

        // 2.读取PDF文档，拆分为Document
        //注意！一个pdf有可能会有多个Document对象，也就是对应多条向量化数据
        //具体如何拆分，取决于文档的结构，比如高校数据就可以1页一个

        // 3.写入向量库

        // 4.记录向量库的documentId到中间表 document_ids

    }
}
