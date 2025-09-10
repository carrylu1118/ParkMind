package com.itheima.ai;

import org.junit.jupiter.api.Test;
import org.springframework.ai.document.Document;// 注意别导错包了
import org.springframework.ai.openai.OpenAiEmbeddingModel;
import org.springframework.ai.reader.ExtractedTextFormatter;
import org.springframework.ai.reader.pdf.PagePdfDocumentReader;
import org.springframework.ai.reader.pdf.config.PdfDocumentReaderConfig;
import org.springframework.ai.vectorstore.SearchRequest;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import java.util.List;


@SpringBootTest
class SpringAiDemoApplicationTests {

    // 自动注入向量模型
    @Autowired
    private OpenAiEmbeddingModel embeddingModel;

    @Autowired
    private VectorStore vectorStore;

    @Test
    public void testEmbedding() {
        // 。。。略
    }

    @Test
    public void testVectorStore(){
        Resource resource = new FileSystemResource("java手册.pdf");
        // 1.创建PDF的读取器
        PagePdfDocumentReader reader = new PagePdfDocumentReader(
                resource, // 文件源
                PdfDocumentReaderConfig.builder()
                        .withPageExtractedTextFormatter(ExtractedTextFormatter.defaults()) // 创建PDF文本格式化器
                        .withPagesPerDocument(1) // 每1页PDF作为一个Document
                        .build()
        );
        // 2.读取PDF文档，拆分为Document
        List<Document> documents = reader.read();
        // 3.写入向量库
        vectorStore.add(documents);
        // 4.搜索
        SearchRequest request = SearchRequest.builder()
                .query("常量定义有哪些强制要求") // 搜索条件
                .topK(2) // 返回结果数量
                .similarityThreshold(0.6) // 相似度阈值
                .filterExpression("file_name == 'java手册.pdf'")// 过滤条件
                .build();
        List<Document> docs = vectorStore.similaritySearch(request);
        if (docs == null) {
            System.out.println("没有搜索到任何内容");
            return;
        }
        for (Document doc : docs) {
            System.out.println(doc.getId());
            System.out.println(doc.getScore());
            System.out.println(doc.getText());  //片段的内容，所有有些不相关的信息。后期需要交给chat模型来组织语言
        }
    }
}
