CREATE DATABASE IF NOT EXISTS `campusai`;

CREATE TABLE IF NOT EXISTS SPRING_AI_CHAT_MEMORY (
    `id` BIGINT(19) NOT NULL AUTO_INCREMENT,
    `conversation_id` VARCHAR(36) NOT NULL COLLATE 'utf8mb4_general_ci',
    `content` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
    `type` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
    `timestamp` TIMESTAMP NOT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `SPRING_AI_CHAT_MEMORY_CONVERSATION_ID_TIMESTAMP_IDX` (`conversation_id`, `timestamp`) USING BTREE,
    CONSTRAINT TYPE_CHECK CHECK (type IN ('USER', 'ASSISTANT', 'SYSTEM', 'TOOL'))
);


CREATE TABLE IF NOT EXISTS `spring_ai_chat_record` (
     `id` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '会话id' COLLATE 'utf8mb4_general_ci',
     `title` VARCHAR(150) NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
     `user_id` BIGINT UNSIGNED NOT NULL COMMENT '用户id',
     `type` VARCHAR(50) NOT NULL DEFAULT '0' COMMENT 'chat:聊天机器人；service：智能客服；pdf：个人知识库' COLLATE 'utf8mb4_general_ci',
     `create_time` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP) COMMENT '会话创建时间',
     PRIMARY KEY (`id`) USING BTREE,
     INDEX `create_time` (`create_time`) USING BTREE
)
COMMENT='会话历史记录'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
