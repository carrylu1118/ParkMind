package com.itheima.ai.vector.vectorservice;

import com.itheima.ai.vector.dto.MessageDto;

public interface IVectorService {
    public void addDocument(MessageDto messageDto);

    public void updateDocument(MessageDto messageDto);

    public void deleteDocument(MessageDto messageDto);
}
