package com.itheima.ai.vector.vectorservice;

import cn.hutool.core.util.NumberUtil;
import com.itheima.ai.entity.Notice;
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
    @Override
    public void addDocument(MessageDto messageDto) {
        String id = messageDto.getId();
        if (!NumberUtil.isNumber(id)){
            log.warn("id is null");
            return;
        }
        Document doc = new Document(messageDto.getMessage(),
                Map.of("id",id,"title",messageDto.getTitle()));
        store.add(List.of(doc));
        //填入向量库的 document id，后续删除要用
        Notice notice = new Notice();
        notice.setId(Integer.parseInt(id));
        notice.setDocumentId(doc.getId());
        noticeService.updateById(notice);
    }

    @Override
    public void updateDocument(MessageDto messageDto) {
        String id = messageDto.getId();
        if (!NumberUtil.isNumber(id)){
            log.warn("id is null");
            return;
        }
        Notice notice = noticeService.getById(id);
        store.delete(List.of(notice.getDocumentId()));
        addDocument(messageDto);
    }

    @Override
    public void deleteDocument(MessageDto messageDto) {
        String ids = messageDto.getId();
        Arrays.stream(ids.split(",")).forEach(id -> {
            Notice notice4del = noticeService.getById(id);
            store.delete(List.of(notice4del.getDocumentId()));
        });
    }
}
