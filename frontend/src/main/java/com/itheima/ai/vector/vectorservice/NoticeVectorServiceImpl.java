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
import java.util.stream.Collectors;

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
        //获取dto里的messageId，对应Notice表的id
        String id = messageDto.getIds();
        //查找Notice表，找到后台录入的校园墙记录
        if (StrUtil.isBlank(id)) {
            log.warn("id = {}不存在", id);
            return;
        }
        //拿到实际公告信息
        Notice notice = noticeService.getById(id);
        if (notice == null) {
            log.warn("公告不存在");
            return;
        }
        //公告信息向量化存储，并调用store的add保存到向量库
        Document doc = new Document(notice.getContent(),
                Map.of("id", notice.getId(), "title",notice.getTitle()));
        store.add(List.of(doc));
        //从上步中的Document对象，获取id（向量库的id）记录到document_ids表，后续删除要用
        documentIdsService.save(
                new DocumentIds()
                        .setSourceId(messageDto.getIds())
                        .setDocumentId(doc.getId())
                        .setType("CAMPUSAI_NOTICE")
        );
        log.info("公告向量存储成功，noticeId = {},docId = {}",id,doc.getId());
    }

    @Override
    public void updateDocument(MessageDto messageDto) {
        //先删除，再新增
        deleteDocument(messageDto);
        addDocument(messageDto);
        log.info("公告向量更新成功,noticeId = {}",messageDto.getIds());

    }

    @Override
    public void deleteDocument(MessageDto messageDto) {
        //从dto中获取Notice的id
        String id = messageDto.getIds();
        if (StrUtil.isBlank(id)) {
            log.warn("id = {}不存在", id);
            return;
        }

        // 根据源ID和类型查询document_ids表，获取向量库中的文档ID列表
        List<DocumentIds> documentIdsList = documentIdsService.lambdaQuery()
                .eq(DocumentIds::getSourceId, id)
                .eq(DocumentIds::getType, "CAMPUSAI_NOTICE")
                .list();

        if (CollUtil.isEmpty(documentIdsList)) {
            log.warn("未找到对应的向量文档记录，noticeId = {}", id);
            return;
        }

        // 提取所有向量库文档ID
        List<String> docIds = documentIdsList.stream()
                .map(DocumentIds::getDocumentId)
                .collect(Collectors.toList());

        // 调用向量存储的删除方法，删除对应的向量文档
        store.delete(docIds);

        // 删除document_ids表中的记录
        documentIdsService.lambdaUpdate()
                .eq(DocumentIds::getSourceId, id)
                .eq(DocumentIds::getType, "CAMPUSAI_NOTICE")
                .remove();

        log.info("公告向量删除成功，noticeId = {}, 删除了 {} 条向量记录", id, docIds.size());
    }
}
