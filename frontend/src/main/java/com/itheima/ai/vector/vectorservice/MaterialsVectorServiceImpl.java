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
//TODO 任务7.2.2 定义抽象类，完成模版代码的开发
public abstract class MaterialsVectorServiceImpl implements IVectorService {

    @Autowired
    VectorStore store;
    @Autowired
    IMaterialsService materialsService;
    @Autowired
    protected IDocumentIdsService documentIdsService;
    @Override
    public void addDocument(MessageDto messageDto) {
        //获取dto里的messageId，对应Materials表的id

        //查找Materials表，找到后台录入的资料记录

        //模板模式：调子类writeToVectorStore模板方法，交给子类来处理

    }

    @Override
    public void updateDocument(MessageDto messageDto) {
        //先删除，再新增
    }

    @Override
    public void deleteDocument(MessageDto messageDto) {
        //从dto中获取Materials的id

        //查中间表得到所有旧的向量id

        //调store的delete删除向量库中的数据

    }

    protected abstract void writeToVectorStore(Materials materials);
}
