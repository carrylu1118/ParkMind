package com.itheima.ai.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 文档表
 * </p>
 *
 * @author 潜心
 * @since 2025-09-17
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("document_ids")
public class DocumentIds implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 类型：CAMPUSAI_NOTICE,CAMPUSAI_MATERIALS
     */
    private String type;

    /**
     * 表数据id
     */
    private String sourceId;

    /**
     * 向量库文档id
     */
    private String documentId;


}
