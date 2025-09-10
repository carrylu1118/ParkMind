package com.itheima.ai.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itheima.ai.entity.po.SpringAiChatRecord;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 会话历史记录 Mapper 接口
 * </p>
 */
public interface SpringAiChatRecordMapper extends BaseMapper<SpringAiChatRecord> {


    @Select("SELECT * FROM spring_ai_chat_record WHERE type = #{type} and user_id = #{userId} ORDER BY create_time DESC")
    List<SpringAiChatRecord> findConversations(@Param("type") String type, @Param("userId") Long userId);
}
