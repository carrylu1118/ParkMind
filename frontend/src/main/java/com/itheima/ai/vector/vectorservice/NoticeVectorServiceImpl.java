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
//TODO 任务5.3.2 完成校园墙的实现类，对向量数据进行增删改
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

        //查找Notice表，找到后台录入的校园墙记录

        //构建Document对象，并调研store的add保存到向量库

        //从上步中的Document对象，获取id（向量库的id）记录到document_ids表，后续删除要用


    }

    @Override
    public void updateDocument(MessageDto messageDto) {
        //先删除，再新增
    }

    @Override
    public void deleteDocument(MessageDto messageDto) {
        //从dto中获取Notice的id

        //查中间表得到所有旧的向量id

        //调store的delete删除向量库中的数据

    }
}
