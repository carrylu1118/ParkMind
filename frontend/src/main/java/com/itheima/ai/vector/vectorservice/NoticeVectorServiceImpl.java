package com.itheima.ai.vector.vectorservice;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import com.itheima.ai.entity.DocumentIds;
import com.itheima.ai.entity.Notice;
import com.itheima.ai.service.IDocumentIdsService;
import com.itheima.ai.service.INoticeService;
import com.itheima.ai.vector.dto.MessageDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ai.document.Document;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class NoticeVectorServiceImpl implements IVectorService {

    @Autowired
    private VectorStore store;
    @Autowired
    private INoticeService noticeService;
    @Autowired
    private IDocumentIdsService documentIdsService;
    @Override
    public void addDocument(MessageDto messageDto) {
        String ids = messageDto.getIds();
        if (StrUtil.isEmpty(ids)){
            log.warn("ids is null");
            return;
        }
        Notice notice = noticeService.getById(ids);
        Document doc = new Document(notice.getContent(),
                Map.of("id",notice.getId(),"title",notice.getTitle()));
        //保存到向量库
        store.add(List.of(doc));
        //记录向量库的 document id，后续删除要用
        documentIdsService.save(
                new DocumentIds()
                        .setSourceId(messageDto.getIds())
                        .setDocumentId(doc.getId())
                        .setType("CAMPUSAI_NOTICE")
        );

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
        List<String> documentIds = documentIdsService.getDocumentIds("CAMPUSAI_NOTICE",ids);
        store.delete(documentIds);
        documentIdsService.deleteBySourceIds("CAMPUSAI_NOTICE",ids);
    }
}
