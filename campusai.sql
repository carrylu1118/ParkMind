/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `club_reservation`;
CREATE TABLE `club_reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `club` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '预约社团',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学生姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系方式',
  `major` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '专业',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '备注',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='社团报名';

DROP TABLE IF EXISTS `document_ids`;
CREATE TABLE `document_ids` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型：CAMPUSAI_NOTICE,CAMPUSAI_MATERIALS',
  `source_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '表数据id',
  `document_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '向量库文档id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文档表';

DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

DROP TABLE IF EXISTS `materials`;
CREATE TABLE `materials` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文档链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='资料库';

DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='公告栏';

DROP TABLE IF EXISTS `SPRING_AI_CHAT_MEMORY`;
CREATE TABLE `SPRING_AI_CHAT_MEMORY` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `conversation_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `timestamp` timestamp NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `SPRING_AI_CHAT_MEMORY_CONVERSATION_ID_TIMESTAMP_IDX` (`conversation_id`,`timestamp`) USING BTREE,
  CONSTRAINT `TYPE_CHECK` CHECK ((`type` in (_utf8mb4'USER',_utf8mb4'ASSISTANT',_utf8mb4'SYSTEM',_utf8mb4'TOOL')))
) ENGINE=InnoDB AUTO_INCREMENT=3839 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `spring_ai_chat_record`;
CREATE TABLE `spring_ai_chat_record` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会话id',
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户id',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT 'chat:聊天机器人；service：智能客服；pdf：个人知识库',
  `create_time` timestamp NOT NULL DEFAULT (now()) COMMENT '会话创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`),
  UNIQUE KEY `dict_type` (`dict_type`,`dict_value`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `document_id` varchar(64) DEFAULT NULL COMMENT '向量库ID',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='在线用户记录';

DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

INSERT INTO `club_reservation` (`id`, `club`, `name`, `phone`, `major`, `remark`, `user_id`) VALUES
(8, '炫锋篮球社团', '王小猫', '13333332222', '计算机系 人工智能', '身体很壮实，可以打中锋', '321');


INSERT INTO `document_ids` (`id`, `type`, `source_id`, `document_id`) VALUES
(29, 'CAMPUSAI_NOTICE', '30', '00d8902e-3cb5-4886-996b-6d81b60088d0');
INSERT INTO `document_ids` (`id`, `type`, `source_id`, `document_id`) VALUES
(42, 'CAMPUSAI_MATERIALS', '26', '56d39b52-785c-4346-be55-bbe572652a81');
INSERT INTO `document_ids` (`id`, `type`, `source_id`, `document_id`) VALUES
(43, 'CAMPUSAI_MATERIALS', '26', '8a8e20e7-d89c-4785-a18d-10bfdc393dff');
INSERT INTO `document_ids` (`id`, `type`, `source_id`, `document_id`) VALUES
(44, 'CAMPUSAI_MATERIALS', '26', 'e337b873-94df-4402-9f87-0e5c18fbee0b'),
(45, 'CAMPUSAI_MATERIALS', '26', 'a7a49596-4150-4f9a-ab3e-8fab2a8f890b'),
(46, 'CAMPUSAI_MATERIALS', '26', '7f04c6d9-0b62-478f-9a20-f37e92375e79'),
(47, 'CAMPUSAI_MATERIALS', '26', '0226f5df-f27a-441f-81f1-2c16f4f29a79'),
(48, 'CAMPUSAI_MATERIALS', '26', '1fb751a1-e3c1-48a6-9c2c-5e91f3edfadd'),
(49, 'CAMPUSAI_MATERIALS', '26', 'dd8265cd-2f64-4948-9c4f-c5776b3446b6'),
(50, 'CAMPUSAI_MATERIALS', '26', '2ad19e5b-bb2c-4689-8d9b-571030bad65c'),
(51, 'CAMPUSAI_MATERIALS', '26', '9a924810-638b-4555-ae82-fd8adfd7a4d7'),
(52, 'CAMPUSAI_MATERIALS', '26', 'fee5a59c-7d4f-4537-be5a-9f89f7569c7f'),
(53, 'CAMPUSAI_MATERIALS', '26', '5b3b0a30-bec3-47fe-8016-433d8063a155'),
(54, 'CAMPUSAI_MATERIALS', '26', 'c08fafb8-c974-403b-9a91-1bec7e5f27a8'),
(55, 'CAMPUSAI_MATERIALS', '26', 'a8d7e6c0-45be-483b-877a-7985b7fa891b'),
(56, 'CAMPUSAI_MATERIALS', '26', 'd1dce90a-ef47-426b-8b85-a1f0182bc63a'),
(57, 'CAMPUSAI_MATERIALS', '26', 'fbaae769-78dc-467e-9e42-53a811d32957'),
(58, 'CAMPUSAI_MATERIALS', '26', '48540d8e-e2aa-4ce8-8327-23dc15cce4bd'),
(59, 'CAMPUSAI_MATERIALS', '26', '75c112bf-6fcd-44f1-b16b-ce03e6ab8e98'),
(60, 'CAMPUSAI_MATERIALS', '26', '27561402-247d-4334-b8ac-2dff7b50e76c'),
(61, 'CAMPUSAI_MATERIALS', '26', '3185f393-19f3-4179-928a-382cb85fdfc5'),
(62, 'CAMPUSAI_MATERIALS', '26', '4cd84d05-90a4-4aab-8656-ec29318e1303'),
(63, 'CAMPUSAI_MATERIALS', '26', 'fc9d244d-18c0-4826-81bf-16d89b17d2be'),
(64, 'CAMPUSAI_MATERIALS', '26', '7138595d-c751-43a6-9d88-c20bce53d805'),
(65, 'CAMPUSAI_MATERIALS', '26', 'ff319161-8d97-4541-8584-54e48e78ed2b'),
(66, 'CAMPUSAI_MATERIALS', '26', '4cf3affa-a2e3-46fc-b713-c200b9f9aabc'),
(67, 'CAMPUSAI_MATERIALS', '26', '8c7bcee4-bc95-4553-b579-b1be79324ed4'),
(68, 'CAMPUSAI_MATERIALS', '26', '87ceac9e-2286-4aab-8afd-c03e6c63c937'),
(69, 'CAMPUSAI_MATERIALS', '26', '7fdb0e28-eb62-4228-90fb-854102e46e37'),
(70, 'CAMPUSAI_MATERIALS', '26', '8e8fa90d-259c-40b8-92d6-c4b7335285ab'),
(71, 'CAMPUSAI_MATERIALS', '26', '1c4d38ed-bc94-4808-b483-46d6ec3691f7'),
(72, 'CAMPUSAI_MATERIALS', '26', '88bf9ee8-b42b-42e7-b08f-6fff4016a166'),
(73, 'CAMPUSAI_MATERIALS', '26', '8abf3711-90b7-4c97-8658-0b42bbce086e'),
(74, 'CAMPUSAI_MATERIALS', '26', '62909961-26ac-48b8-9886-e1f0cf3a07e8'),
(75, 'CAMPUSAI_MATERIALS', '26', '89224ee8-de51-444d-8891-c70228d9e8db'),
(76, 'CAMPUSAI_MATERIALS', '26', '8d0895d4-b1df-4c68-a21c-674485b3944a'),
(77, 'CAMPUSAI_MATERIALS', '26', 'e7ed6160-3fdd-4dc5-8719-d8d4113fc8d8'),
(78, 'CAMPUSAI_MATERIALS', '26', '3d54fdee-bffb-4329-810e-da283bc5d2b0'),
(79, 'CAMPUSAI_MATERIALS', '26', '2f38472f-5d2c-4bff-91c9-f714a409e428'),
(80, 'CAMPUSAI_MATERIALS', '26', '260c0676-4d3c-4b0a-9e8c-32ec74febb30'),
(81, 'CAMPUSAI_MATERIALS', '26', '0c5063e2-96a6-4a7e-9772-b30fabd5253f'),
(82, 'CAMPUSAI_MATERIALS', '26', '46c1e7a9-3001-414a-af3a-40831edccab2'),
(83, 'CAMPUSAI_MATERIALS', '26', 'ad1a4592-2fcc-4be3-9326-afad59b7bb14'),
(84, 'CAMPUSAI_MATERIALS', '26', '873dd822-bae8-4e07-84c0-39cecf046be9'),
(85, 'CAMPUSAI_MATERIALS', '26', 'b615c5bc-e287-4922-b789-dac37b7eb7a5'),
(86, 'CAMPUSAI_MATERIALS', '26', 'f7d6f805-eec3-49ba-a61a-fe79022dc74e'),
(87, 'CAMPUSAI_MATERIALS', '26', 'a3fb2f17-f356-4ec3-9094-257b482886cc'),
(88, 'CAMPUSAI_MATERIALS', '26', '378bb442-203f-46f1-9dde-1419c4a9e609'),
(89, 'CAMPUSAI_MATERIALS', '26', '96293e1b-b9af-4d35-aec1-1d3f4c43b52c'),
(90, 'CAMPUSAI_MATERIALS', '26', '4d97fb3a-7dfb-4661-a93b-055a2ef246aa'),
(91, 'CAMPUSAI_MATERIALS', '26', '64dc9158-287a-4af0-8fa3-256c28711ca6'),
(92, 'CAMPUSAI_MATERIALS', '26', 'ec8ff1f3-bbeb-49b7-aaef-932ae6561624'),
(93, 'CAMPUSAI_MATERIALS', '26', '11e446f8-48a4-4e7c-953c-b51ec4553a22'),
(94, 'CAMPUSAI_MATERIALS', '26', '7469caf8-a0d4-478c-8d6a-05c413c35e54'),
(95, 'CAMPUSAI_MATERIALS', '26', '0d2b20ce-8b91-4c0e-8d72-ea76c6ecebe5'),
(96, 'CAMPUSAI_MATERIALS', '26', '24717bbb-ba37-4db8-b433-9f8c9fa5e3b3'),
(97, 'CAMPUSAI_MATERIALS', '26', 'a4d5813c-55a9-4f72-bae2-db1710ddead2'),
(98, 'CAMPUSAI_MATERIALS', '26', '466b1b5b-ce43-45fe-b35c-7ffd09f6547b'),
(99, 'CAMPUSAI_MATERIALS', '26', '91e78ea3-72da-42f8-a054-8412077a0f1c'),
(100, 'CAMPUSAI_MATERIALS', '26', '24e04367-6185-4176-a36a-5ac0af3e62ac'),
(101, 'CAMPUSAI_MATERIALS', '26', 'c8fadcbd-4efd-4f7a-ae84-0c80cb7780f4'),
(102, 'CAMPUSAI_MATERIALS', '26', 'b0361307-2362-46fe-90cc-ff3e1af3aa7d'),
(103, 'CAMPUSAI_MATERIALS', '26', 'efddccf4-73a4-4bce-a4a0-c6a3f604a38b'),
(104, 'CAMPUSAI_MATERIALS', '26', 'c24dd3f2-6aaa-4455-8487-ab87e1fa6f4e'),
(105, 'CAMPUSAI_MATERIALS', '26', 'f7a145d8-4e99-423e-946d-e3ce6aeca0ac'),
(106, 'CAMPUSAI_MATERIALS', '26', 'b211ac0a-6165-4b70-8c2a-07e97d9c6a34'),
(107, 'CAMPUSAI_MATERIALS', '26', 'dfb4338e-2da0-4eb7-a2b8-571384c63d0d'),
(108, 'CAMPUSAI_MATERIALS', '26', '6e381414-e139-4d36-a7d2-c795ea7cf433'),
(109, 'CAMPUSAI_MATERIALS', '26', '404881bd-cae1-44ff-a9d1-22e76090df3a'),
(110, 'CAMPUSAI_MATERIALS', '26', 'd032f260-ce2f-40c9-a63f-b4f54d0f84de'),
(111, 'CAMPUSAI_MATERIALS', '26', 'f8b614f2-a01b-4d30-85f8-f14b58e2bad9'),
(112, 'CAMPUSAI_MATERIALS', '26', 'f72507ae-e2fd-4e73-a25f-7b9272f2bbef'),
(113, 'CAMPUSAI_MATERIALS', '26', '463f6f60-a1d2-481f-a65d-7a49df16bbb0'),
(114, 'CAMPUSAI_MATERIALS', '26', '14ea488d-77b7-4d8a-ae2f-e35ef61a3a8b'),
(115, 'CAMPUSAI_MATERIALS', '26', 'ff3c8469-3558-4f74-8e9a-cc6bb98f09d0'),
(116, 'CAMPUSAI_MATERIALS', '26', 'd1430467-25ad-4127-aebe-861c9e30e492'),
(117, 'CAMPUSAI_MATERIALS', '26', '8e814ce5-2868-462c-a2e2-f8d829aea383'),
(118, 'CAMPUSAI_MATERIALS', '26', 'f22c3a58-b7ff-4877-aec2-4b7c3162a2f3'),
(119, 'CAMPUSAI_MATERIALS', '26', 'efe80595-2ceb-481a-b466-bc2cab12dc53'),
(120, 'CAMPUSAI_MATERIALS', '26', '0d64d74b-c3c9-4a73-83cf-a91187ea9898'),
(121, 'CAMPUSAI_MATERIALS', '26', 'be2378bb-60a1-496d-a347-6051ad4ff4cc'),
(122, 'CAMPUSAI_MATERIALS', '26', '1c6ccd53-4152-4a0a-a6bd-51c1e1ab9543'),
(123, 'CAMPUSAI_MATERIALS', '26', '014c40a7-59ca-49ab-bd3e-12d49a03b982'),
(124, 'CAMPUSAI_MATERIALS', '26', '57d61267-f4a3-43ca-966e-1dcf646d1f41'),
(125, 'CAMPUSAI_MATERIALS', '26', '265f4e6b-5d6a-4f43-a353-a52dff53320c'),
(126, 'CAMPUSAI_MATERIALS', '26', 'e0366ec8-2076-4051-99a4-194adca182af'),
(127, 'CAMPUSAI_MATERIALS', '26', '2b48bbd5-47b8-48de-8b49-443d8248e152'),
(128, 'CAMPUSAI_MATERIALS', '26', 'a11937e4-c8dd-46f2-9e59-6aefa15a4079'),
(129, 'CAMPUSAI_MATERIALS', '26', '9873fd85-0a56-4509-b161-b66c2b4bb55d'),
(130, 'CAMPUSAI_MATERIALS', '26', 'b05c57e0-c752-4856-af1d-0aed5b59c3ba'),
(131, 'CAMPUSAI_MATERIALS', '26', '946224b9-b3d2-404a-8eac-ff5989078a11'),
(132, 'CAMPUSAI_MATERIALS', '26', 'c22e29c4-8068-4bfb-825f-942b197d091a'),
(133, 'CAMPUSAI_MATERIALS', '26', 'd81ca306-5418-4c0e-ad06-7115155a4d0c'),
(134, 'CAMPUSAI_MATERIALS', '26', '2d4910f9-87bf-4cdd-b27b-20af32fe079d'),
(135, 'CAMPUSAI_MATERIALS', '26', 'cb89aa53-dd8c-40c4-8685-26d369b630a7'),
(136, 'CAMPUSAI_MATERIALS', '26', '26d40b84-bf78-4f36-9de9-b6eb6612681f'),
(137, 'CAMPUSAI_MATERIALS', '26', '5048e16c-9b8c-486b-96a5-4e99ed804b4c'),
(138, 'CAMPUSAI_NOTICE', '31', 'abd1d38d-e268-438c-8595-91e8b47cf3c9'),
(139, 'CAMPUSAI_NOTICE', '32', 'ee270e36-74ff-4c71-b9d1-3d1eb440b0a2');

INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(12, 'SPRING_AI_CHAT_MEMORY', '会话历史', '', NULL, 'SpringAiChatMemory', 'crud', 'com.ruoyi.campusai', 'campusai', 'MEMORY', '会话历史', 'Shawn', '0', '/', '{\"parentMenuId\":\"2038\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"智慧园区\",\"treeCode\":\"\"}', 'admin', '2025-09-11 10:23:02', '', '2025-09-15 14:40:00', '');
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(13, 'spring_ai_chat_record', '会话记录', 'SPRING_AI_CHAT_MEMORY', 'conversation_id', 'SpringAiChatRecord', 'sub', 'com.ruoyi.campusai', 'campusai', 'record', '会话记录', 'Shawn', '0', '/', '{\"parentMenuId\":\"2038\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"智慧园区\",\"treeCode\":\"\"}', 'admin', '2025-09-11 10:23:02', '', '2025-09-15 14:40:16', '');
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(20, 'document_ids', '文档表', NULL, NULL, 'DocumentIds', 'crud', 'com.ruoyi.campusai', 'campusai', 'ids', '文档', 'Shawn', '0', '/', NULL, 'admin', '2025-09-17 13:45:26', '', NULL, NULL);
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(21, 'materials', '资料库', '', NULL, 'Materials', 'crud', 'com.ruoyi.campusai', 'campusai', 'materials', '资料库', 'Shawn', '0', '/', '{\"parentMenuId\":\"2038\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"智慧园区\",\"treeCode\":\"\"}', 'admin', '2025-09-17 13:45:26', '', '2025-09-17 16:05:22', ''),
(22, 'notice', '公告栏', 'document_ids', '', 'Notice', 'crud', 'com.ruoyi.campusai', 'campusai', 'notice', '公告栏', 'Shawn', '0', '/', '{\"parentMenuId\":\"2038\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"智慧园区\",\"treeCode\":\"\"}', 'admin', '2025-09-17 13:45:26', '', '2025-09-17 13:46:30', ''),
(24, 'club_reservation', '社团报名', '', NULL, 'ClubReservation', 'crud', 'com.ruoyi.campusai', 'campusai', 'reservation', '社团报名', 'Shawn', '0', '/', '{\"parentMenuId\":\"2038\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"智慧园区\",\"treeCode\":\"\"}', 'admin', '2025-09-18 09:27:38', '', '2025-09-18 09:28:28', '');

INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(76, 12, 'id', '', 'bigint', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-15 14:40:00');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(77, 12, 'conversation_id', '会话id', 'varchar(36)', 'String', 'conversationId', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-15 14:40:00');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(78, 12, 'content', '聊天内容', 'text', 'String', 'content', '0', '0', '1', NULL, NULL, '1', '1', 'EQ', 'summernote', '', 3, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-15 14:40:00');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(79, 12, 'type', '聊天类型', 'varchar(10)', 'String', 'type', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'select', '', 4, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-15 14:40:00'),
(80, 12, 'timestamp', '发送时间', 'timestamp', 'Date', 'timestamp', '0', '0', '1', NULL, NULL, '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-15 14:40:00'),
(81, 13, 'id', '会话id', 'varchar(50)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-15 14:40:16'),
(82, 13, 'title', '标题', 'varchar(150)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-15 14:40:16'),
(83, 13, 'user_id', '用户id', 'bigint unsigned', 'String', 'userId', '0', '0', '1', NULL, NULL, '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-15 14:40:16'),
(84, 13, 'type', '会话类型', 'varchar(50)', 'String', 'type', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'select', '', 4, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-15 14:40:16'),
(85, 13, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-15 14:40:16'),
(109, 20, 'id', '主键', 'int unsigned', 'String', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2025-09-17 13:45:26', '', NULL),
(110, 20, 'type', '类型：CAMPUSAI_NOTICE,CAMPUSAI_MATERIALS', 'varchar(50)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2025-09-17 13:45:26', '', NULL),
(111, 20, 'source_id', '表数据id', 'varchar(50)', 'String', 'sourceId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-09-17 13:45:26', '', NULL),
(112, 20, 'document_id', '向量库文档id', 'varchar(50)', 'String', 'documentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-09-17 13:45:26', '', NULL),
(113, 21, 'id', '主键', 'int unsigned', 'String', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-09-17 13:45:26', NULL, '2025-09-17 16:05:22'),
(114, 21, 'title', '名称', 'varchar(50)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-09-17 13:45:26', NULL, '2025-09-17 16:05:22'),
(115, 21, 'url', '文档链接', 'varchar(300)', 'String', 'url', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'upload', '', 3, 'admin', '2025-09-17 13:45:26', NULL, '2025-09-17 16:05:22'),
(116, 22, 'id', '主键', 'int unsigned', 'String', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-09-17 13:45:26', NULL, '2025-09-17 13:46:30'),
(117, 22, 'title', '标题', 'varchar(50)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-09-17 13:45:26', NULL, '2025-09-17 13:46:30'),
(118, 22, 'content', '内容', 'varchar(300)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'textarea', '', 3, 'admin', '2025-09-17 13:45:26', NULL, '2025-09-17 13:46:30'),
(119, 22, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2025-09-17 13:45:26', NULL, '2025-09-17 13:46:30'),
(127, 24, 'id', '', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-09-18 09:27:38', NULL, '2025-09-18 09:28:28'),
(128, 24, 'club', '预约社团', 'varchar(50)', 'String', 'club', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-09-18 09:27:38', NULL, '2025-09-18 09:28:28'),
(129, 24, 'name', '学生姓名', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-09-18 09:27:38', NULL, '2025-09-18 09:28:28'),
(130, 24, 'phone', '联系方式', 'varchar(255)', 'String', 'phone', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2025-09-18 09:27:38', NULL, '2025-09-18 09:28:28'),
(131, 24, 'major', '专业', 'varchar(50)', 'String', 'major', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2025-09-18 09:27:38', NULL, '2025-09-18 09:28:28'),
(132, 24, 'remark', '备注', 'text', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 6, 'admin', '2025-09-18 09:27:38', NULL, '2025-09-18 09:28:28'),
(133, 24, 'user_id', '学号', 'varchar(50)', 'String', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2025-09-18 09:27:38', NULL, '2025-09-18 09:28:28');

INSERT INTO `materials` (`id`, `title`, `url`) VALUES
(26, '高校信息', 'http://192.168.150.101:9005/campusai/20250917164225A003.pdf');


INSERT INTO `notice` (`id`, `title`, `content`, `create_time`) VALUES
(30, '作息与安全', '宿舍楼门禁时间为周日至周四 23:00，周五、周六及节假日 24:00。请合理安排时间，准时归寝，确保人身安全。\r\n严禁在宿舍内使用明火或违章电器，安全无小事，你我共守护。\r\n离开宿舍时，请务必锁好门窗，保管好个人贵重物品。', '2025-09-17 14:59:17');
INSERT INTO `notice` (`id`, `title`, `content`, `create_time`) VALUES
(31, '舞动青春舞蹈社', '舞动青春舞蹈社是校园里最具活力与魅力的社团之一。我们为所有热爱舞蹈的同学提供一个释放激情、学习技能、展示自我的平台。无论你是擅长Jazz、Hip-hop、Breaking、K-pop还是中国舞，这里都有专属于你的舞台。社团定期开设不同舞种的零基础教学班和提升班，并组织参加校内迎新、晚会表演以及校际舞蹈大赛。在这里，你不仅能提升舞技，更能收获一群因热爱而相聚的挚友。聚光灯已经为你点亮，舞台中央等待你的绽放。欢迎每一位心怀舞蹈梦的你加入我们，让我们一起用汗水诠释热爱，舞动青春！\r\n', '2025-09-17 17:24:06');
INSERT INTO `notice` (`id`, `title`, `content`, `create_time`) VALUES
(32, '炫锋篮球社团', '炫锋篮球社团是汇聚了校内最多篮球狂热分子的大家庭。我们的核心是“无篮球，不兄弟”，旨在为每一位成员提供挥洒汗水、享受竞技快乐的家园。社团活动精彩纷呈，包括日常的定点投篮、体能训练、技巧教学，以及激动人心的3v3“斗牛”赛、5v5全场对抗赛和趣味投篮大赛。我们不仅关注个人技术的提升，更注重团队默契的培养。在这里，每一次助攻、每一次防守都充满了激情与呐喊。无论你的水平如何，只要你对篮球有一颗热爱的心，炫锋篮球社都热烈欢迎你的加入，让我们一起创造更多热血的瞬间！\r\n', '2025-09-17 17:28:48');

INSERT INTO `SPRING_AI_CHAT_MEMORY` (`id`, `conversation_id`, `content`, `type`, `timestamp`) VALUES
(3823, '1758159271115', '你好', 'USER', '2025-09-18 09:37:45');
INSERT INTO `SPRING_AI_CHAT_MEMORY` (`id`, `conversation_id`, `content`, `type`, `timestamp`) VALUES
(3824, '1758159271115', '同学你好呀～👋  \n在为你提供帮助之前，小智老师需要先知道你的姓名和学号哦，这样我们才能开启一段温暖的对话呢！✨  \n\n请告诉我：\n- 你的姓名\n- 你的学号\n\n等你提供信息后，我就可以立刻帮你啦～😊', 'ASSISTANT', '2025-09-18 09:37:45');
INSERT INTO `SPRING_AI_CHAT_MEMORY` (`id`, `conversation_id`, `content`, `type`, `timestamp`) VALUES
(3825, '1758159271115', '我叫王小猫，学号123', 'USER', '2025-09-18 09:37:45');
INSERT INTO `SPRING_AI_CHAT_MEMORY` (`id`, `conversation_id`, `content`, `type`, `timestamp`) VALUES
(3826, '1758159271115', '王小猫同学你好呀～👋  \n欢迎来到校园助手小智老师这里！✨  \n你现在有什么想了解的吗？比如社团纳新、校园生活咨询、资料查询，还是想看看公告栏的最新动态呢？  \n随时告诉我哦，我会用最温暖的方式帮你解答～(•̀ᴗ•́)و', 'ASSISTANT', '2025-09-18 09:37:45'),
(3827, '1758159271115', '社团纳新', 'USER', '2025-09-18 09:37:45'),
(3828, '1758159271115', '王小猫同学你好呀～👋  \n欢迎来到校园助手小智老师这里！✨  \n你现在有什么想了解的吗？比如社团纳新、校园生活咨询、资料查询，还是想看看公告栏的最新动态呢？  \n随时告诉我哦，我会用最温暖的方式帮你解答～(•̀ᴗ•́)و', 'ASSISTANT', '2025-09-18 09:37:45'),
(3829, '1758159271115', '我想报个社团，请帮我推荐一下', 'USER', '2025-09-18 09:37:45'),
(3830, '1758159271115', '王小猫同学你好呀～👋  \n很高兴你想加入社团呢！大学的社团生活真的超级丰富多彩，是认识志同道合小伙伴的好机会哦～✨\n\n小智老师想先问问你：你对哪方面的活动比较感兴趣呀？比如：  \n🎨 舞蹈、音乐、绘画等文艺类  \n📚 读书、辩论、学术研究等学术类  \n⚽ 篮球、羽毛球、户外运动等体育类  \n✍️ 书法、摄影、动漫、手工等兴趣类  \n🤝 公益志愿、学生服务等公益类  \n\n告诉我你的兴趣方向吧，小智老师会为你推荐合适的社团哟～(•̀ᴗ•́)و', 'ASSISTANT', '2025-09-18 09:37:45'),
(3831, '1758159271115', '我喜欢篮球，选篮球吧', 'USER', '2025-09-18 09:37:45'),
(3832, '1758159271115', '王小猫同学你好呀～👋  \n听说你喜欢篮球，小智老师太开心啦！🏀✨  \n\n根据你的兴趣，我从校园社团库中为你找到了一个超棒的篮球社团，快来看看是不是你的心动选择吧～\n\n| 社团名称 | 活动内容 | 特色亮点 | 加入我们 |\n|--------|--------|--------|--------|\n| 炫锋篮球社团 | 日常定点投篮、体能训练、技巧教学、3v3“斗牛”赛、5v5全场对抗赛、趣味投篮大赛 | “无篮球，不兄弟”！注重技术提升与团队默契，氛围热血又温暖 | 无论水平高低，只要你热爱篮球，都欢迎加入！ |\n\n哇哦～是不是已经感受到球场上的激情啦？🔥  \n如果你想报名**炫锋篮球社团**，请告诉小智老师以下信息哦：\n\n- 你的姓名（已知：王小猫）\n- 学号（已知：123）\n- 所在院系与专业：______（请补充）\n- 联系方式：______（请补充）\n- 备注（可选）：______\n\n填好后，我会帮你生成预约单，一起开启热血篮球之旅哟！💪😄', 'ASSISTANT', '2025-09-18 09:37:45'),
(3833, '1758159271115', '我的学号是321，请记住，并更新一下', 'USER', '2025-09-18 09:37:45'),
(3834, '1758159271115', '王小猫同学你好呀～👋  \n你的信息已经成功更新啦！学号321已记住，现在我们可以愉快地继续聊天啦～✨\n\n你刚才说想报名社团，而且特别喜欢篮球呢！🏀  \n小智老师这就为你推荐一个超棒的篮球社团，快来看看是不是你的心动选择吧～\n\n| 社团名称 | 活动内容 | 特色亮点 | 加入我们 |\n|--------|--------|--------|--------|\n| 炫锋篮球社团 | 日常定点投篮、体能训练、技巧教学、3v3“斗牛”赛、5v5全场对抗赛、趣味投篮大赛 | “无篮球，不兄弟”！注重技术提升与团队默契，氛围热血又温暖 | 无论水平高低，只要你热爱篮球，都欢迎加入！ |\n\n哇哦～是不是已经感受到球场上的激情啦？🔥  \n接下来，只需要补充以下信息，小智老师就能帮你完成报名咯：\n\n- 所在院系与专业：______（请补充）  \n- 联系方式：______（请补充）  \n- 备注（可选）：______\n\n填好后告诉我哟，我们一起开启热血篮球之旅！💪😄', 'ASSISTANT', '2025-09-18 09:37:45'),
(3835, '1758159271115', '我是计算机系，专业是人工智能', 'USER', '2025-09-18 09:37:45'),
(3836, '1758159271115', '王小猫同学你好呀～👋  \n你的信息已经成功更新啦！学号321已记住，现在我们可以愉快地继续聊天啦～✨\n\n你刚才说想报名社团，而且特别喜欢篮球呢！🏀  \n小智老师这就为你推荐一个超棒的篮球社团，快来看看是不是你的心动选择吧～\n\n| 社团名称 | 活动内容 | 特色亮点 | 加入我们 |\n|--------|--------|--------|--------|\n| 炫锋篮球社团 | 日常定点投篮、体能训练、技巧教学、3v3“斗牛”赛、5v5全场对抗赛、趣味投篮大赛 | “无篮球，不兄弟”！注重技术提升与团队默契，氛围热血又温暖 | 无论水平高低，只要你热爱篮球，都欢迎加入！ |\n\n哇哦～是不是已经感受到球场上的激情啦？🔥  \n接下来，只需要补充以下信息，小智老师就能帮你完成报名咯：\n\n- 所在院系与专业：计算机系 人工智能（已补充）  \n- 联系方式：______（请提供你的手机号或微信等联系方式）  \n- 备注（可选）：______\n\n填好后告诉我哟，我们一起开启热血篮球之旅！💪😄', 'ASSISTANT', '2025-09-18 09:37:45'),
(3837, '1758159271115', '我的手机号是：13333332222，我身体很壮实，可以打中锋', 'USER', '2025-09-18 09:37:45'),
(3838, '1758159271115', '王小猫同学，你好呀～👋\n\n太棒啦！小智老师已经成功为你提交了社团预约申请，现在要给你一个大大的 ✅ 好消息！\n\n🎉 你已成功预约：**炫锋篮球社团**  \n📌 预约单号：`8`  \n📍 所在院系专业：计算机系 人工智能  \n📞 联系方式：13333332222  \n💬 备注：身体很壮实，可以打中锋（哇哦～未来的内线支柱来啦！🔥）\n\n社团负责人会尽快通过电话联系你，确认入社时间和首次活动安排哟～🏀✨\n\n记得保持手机畅通，也别忘了准备一双舒服的球鞋，球场见英姿飒爽的你！💪😄\n\n如果还想了解其他社团、公告栏动态或学习资料，随时告诉小智老师哦～我一直都在～🧡', 'ASSISTANT', '2025-09-18 09:37:45');

INSERT INTO `spring_ai_chat_record` (`id`, `title`, `user_id`, `type`, `create_time`) VALUES
('1758159271115', '王小猫', '321', 'service', '2025-09-18 09:34:27');


INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-12-27 12:02:51', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-12-27 12:02:51', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-12-27 12:02:51', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-12-27 12:02:51', '', NULL, '是否开启注册用户功能（true开启，false关闭）'),
(5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2023-12-27 12:02:51', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）'),
(6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2023-12-27 12:02:51', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框'),
(7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2023-12-27 12:02:51', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框'),
(8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2023-12-27 12:02:51', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）'),
(9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2023-12-27 12:02:51', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）'),
(10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2023-12-27 12:02:51', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）'),
(11, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-12-27 12:02:51', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(100, 0, '0', '传智教育', 0, '超级管理员', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-27 12:02:41', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(101, 100, '0,100', '北京总部', 1, '超级管理员', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-27 12:02:41', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(102, 100, '0,100', '昌平分公司', 2, '超级管理员', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-27 12:02:41', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(103, 101, '0,100,101', '研发部门', 1, '超级管理员', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-27 12:02:41', '', NULL),
(104, 101, '0,100,101', '市场部门', 2, '超级管理员', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-27 12:02:41', '', NULL),
(105, 101, '0,100,101', '测试部门', 3, '超级管理员', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-27 12:02:41', '', NULL),
(106, 101, '0,100,101', '财务部门', 4, '超级管理员', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-27 12:02:41', '', NULL),
(107, 101, '0,100,101', '运维部门', 5, '超级管理员', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-27 12:02:41', '', NULL),
(108, 102, '0,100,102', '市场部门', 1, '超级管理员', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-27 12:02:41', '', NULL),
(109, 102, '0,100,102', '财务部门', 2, '超级管理员', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-27 12:02:41', '', NULL);

INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '性别男');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '性别女');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '显示菜单'),
(5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '隐藏菜单'),
(6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '正常状态'),
(7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '停用状态'),
(8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '正常状态'),
(9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '停用状态'),
(10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '默认分组'),
(11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '系统分组'),
(12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '系统默认是'),
(13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '系统默认否'),
(14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '通知'),
(15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '公告'),
(16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '正常状态'),
(17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '关闭状态'),
(18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '其他操作'),
(19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '新增操作'),
(20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-12-27 12:02:51', '', NULL, '修改操作'),
(21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-12-27 12:02:51', '', NULL, '删除操作'),
(22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-12-27 12:02:51', '', NULL, '授权操作'),
(23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-12-27 12:02:51', '', NULL, '导出操作'),
(24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-12-27 12:02:51', '', NULL, '导入操作'),
(25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-12-27 12:02:51', '', NULL, '强退操作'),
(26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-12-27 12:02:51', '', NULL, '生成操作'),
(27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-12-27 12:02:51', '', NULL, '清空操作'),
(28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-12-27 12:02:51', '', NULL, '正常状态'),
(29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-12-27 12:02:51', '', NULL, '停用状态'),
(100, 1, '随机出现', '1', 'card_game_type', NULL, NULL, 'Y', '0', 'admin', '2023-12-27 16:23:44', '', NULL, NULL),
(101, 2, '瞬间秒杀', '2', 'card_game_type', NULL, NULL, 'N', '0', 'admin', '2023-12-27 16:24:03', '', NULL, NULL),
(102, 3, '幸运转盘', '3', 'card_game_type', NULL, NULL, 'N', '0', 'admin', '2023-12-27 16:24:30', '', NULL, NULL),
(103, 0, '普通会员', '0', 'card_user_level', NULL, NULL, 'Y', '0', 'admin', '2023-12-27 16:41:59', '', NULL, NULL),
(104, 1, '一级会员', '1', 'card_user_level', NULL, NULL, 'N', '0', 'admin', '2023-12-27 16:42:12', '', NULL, NULL),
(105, 2, '二级会员', '2', 'card_user_level', NULL, NULL, 'N', '0', 'admin', '2023-12-27 16:42:28', '', NULL, NULL),
(106, 3, '三级会员', '3', 'card_user_level', '', '', 'N', '0', 'admin', '2023-12-27 16:42:38', 'admin', '2023-12-27 16:42:43', ''),
(107, 0, '新建', '0', 'card_game_status', NULL, NULL, 'Y', '0', 'admin', '2023-12-28 13:42:45', '', NULL, NULL),
(108, 1, '已加载', '1', 'card_game_status', NULL, NULL, 'Y', '0', 'admin', '2023-12-28 13:42:55', '', NULL, NULL),
(122, 4, '金牌会员', '4', 'card_user_level', NULL, NULL, 'N', '0', '', '2024-01-03 11:19:08', '', NULL, NULL);

INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-12-27 12:02:49', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-12-27 12:02:49', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-12-27 12:02:49', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(4, '任务状态', 'sys_job_status', '0', 'admin', '2023-12-27 12:02:49', '', NULL, '任务状态列表'),
(5, '任务分组', 'sys_job_group', '0', 'admin', '2023-12-27 12:02:49', '', NULL, '任务分组列表'),
(6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-12-27 12:02:49', '', NULL, '系统是否列表'),
(7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '通知类型列表'),
(8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '通知状态列表'),
(9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '操作类型列表'),
(10, '系统状态', 'sys_common_status', '0', 'admin', '2023-12-27 12:02:50', '', NULL, '登录状态列表'),
(100, '活动类型', 'card_game_type', '0', 'admin', '2023-12-27 16:23:07', '', NULL, NULL),
(101, '会员等级', 'card_user_level', '0', 'admin', '2023-12-27 16:41:31', '', NULL, NULL),
(102, '活动状态', 'card_game_status', '0', 'admin', '2023-12-28 13:41:53', '', NULL, NULL);

INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-12-27 12:02:52', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-12-27 12:02:52', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-12-27 12:02:52', '', NULL, '');



INSERT INTO `sys_logininfor` (`info_id`, `login_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES
(1, 'user', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-11 10:11:13');
INSERT INTO `sys_logininfor` (`info_id`, `login_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES
(2, 'user', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-11 10:21:24');
INSERT INTO `sys_logininfor` (`info_id`, `login_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES
(3, 'user', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-09-11 10:21:47');
INSERT INTO `sys_logininfor` (`info_id`, `login_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES
(4, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-11 10:21:54'),
(5, 'user', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-11 10:30:46'),
(6, 'user', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-09-11 10:31:08'),
(7, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-11 10:31:12'),
(8, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-11 10:35:59'),
(9, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-11 10:40:21'),
(10, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-11 10:49:29'),
(11, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-11 10:51:57'),
(12, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-11 15:03:02'),
(13, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-09-11 15:03:47'),
(14, 'user', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-11 15:03:48'),
(15, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-15 14:39:27'),
(16, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-15 14:39:33'),
(17, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-15 14:39:36'),
(18, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-15 14:42:30'),
(19, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-15 14:44:17'),
(20, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-15 14:44:19'),
(21, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-15 14:45:32'),
(22, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-15 14:45:33'),
(23, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-15 16:00:39'),
(24, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-15 16:39:07'),
(25, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-15 17:16:52'),
(26, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-15 17:19:35'),
(27, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-15 17:24:34'),
(28, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 09:46:35'),
(29, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-16 09:46:43'),
(30, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 09:46:47'),
(31, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 09:49:42'),
(32, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-16 09:49:46'),
(33, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 09:49:48'),
(34, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 09:53:50'),
(35, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 15:46:28'),
(36, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 16:00:35'),
(37, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 16:01:27'),
(38, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 16:03:16'),
(39, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-16 16:13:11'),
(40, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 16:13:14'),
(41, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 16:15:27'),
(42, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-16 16:15:30'),
(43, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 16:15:33'),
(44, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 16:17:30'),
(45, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 16:21:50'),
(46, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 16:44:36'),
(47, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 16:47:24'),
(48, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 18:31:50'),
(49, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 09:27:03'),
(50, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 10:29:21'),
(51, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 10:33:42'),
(52, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 11:05:19'),
(53, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 11:06:58'),
(54, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 13:40:35'),
(55, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 14:33:34'),
(56, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-17 14:33:44'),
(57, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 14:33:46'),
(58, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-17 14:33:59'),
(59, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 14:34:00'),
(60, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 14:41:35'),
(61, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-17 15:10:23'),
(62, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 15:10:25'),
(63, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 15:47:28'),
(64, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 16:07:13'),
(65, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 16:27:27'),
(66, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-17 17:55:16'),
(67, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 17:55:19'),
(68, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-17 17:58:12'),
(69, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-18 09:23:52'),
(70, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-18 09:40:22'),
(71, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-18 09:40:28'),
(72, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-18 09:40:30'),
(73, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-18 11:01:36');

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '系统管理', 0, 2, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2023-12-27 12:02:42', 'admin', '2023-12-29 18:36:31', '系统管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2023-12-27 12:02:42', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2023-12-27 12:02:42', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2023-12-27 12:02:42', '', NULL, '用户管理菜单'),
(101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2023-12-27 12:02:42', '', NULL, '角色管理菜单'),
(102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2023-12-27 12:02:42', '', NULL, '菜单管理菜单'),
(103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2023-12-27 12:02:42', '', NULL, '部门管理菜单'),
(104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2023-12-27 12:02:42', '', NULL, '岗位管理菜单'),
(105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2023-12-27 12:02:42', '', NULL, '字典管理菜单'),
(106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2023-12-27 12:02:42', '', NULL, '参数设置菜单'),
(107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2023-12-27 12:02:42', '', NULL, '通知公告菜单'),
(108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2023-12-27 12:02:42', '', NULL, '日志管理菜单'),
(109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2023-12-27 12:02:43', '', NULL, '在线用户菜单'),
(110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2023-12-27 12:02:43', '', NULL, '定时任务菜单'),
(111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2023-12-27 12:02:43', '', NULL, '数据监控菜单'),
(112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2023-12-27 12:02:43', '', NULL, '服务监控菜单'),
(113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2023-12-27 12:02:43', '', NULL, '缓存监控菜单'),
(114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2023-12-27 12:02:43', '', NULL, '表单构建菜单'),
(115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2023-12-27 12:02:43', '', NULL, '代码生成菜单'),
(116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2023-12-27 12:02:43', '', NULL, '系统接口菜单'),
(500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2023-12-27 12:02:43', '', NULL, '操作日志菜单'),
(501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2023-12-27 12:02:43', '', NULL, '登录日志菜单'),
(1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2023-12-27 12:02:43', '', NULL, ''),
(1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2023-12-27 12:02:44', '', NULL, ''),
(1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2023-12-27 12:02:45', '', NULL, ''),
(2038, '智慧园区', 0, 0, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-bank', 'admin', '2025-09-11 10:24:32', '', NULL, ''),
(2051, '会话历史', 2038, 1, '/campusai/MEMORY', '', 'C', '0', '1', 'campusai:MEMORY:view', '#', 'admin', '2025-09-15 14:43:38', '', NULL, '会话历史菜单'),
(2052, '会话历史查询', 2051, 1, '#', '', 'F', '0', '1', 'campusai:MEMORY:list', '#', 'admin', '2025-09-15 14:43:38', '', NULL, ''),
(2053, '会话历史新增', 2051, 2, '#', '', 'F', '0', '1', 'campusai:MEMORY:add', '#', 'admin', '2025-09-15 14:43:38', '', NULL, ''),
(2054, '会话历史修改', 2051, 3, '#', '', 'F', '0', '1', 'campusai:MEMORY:edit', '#', 'admin', '2025-09-15 14:43:38', '', NULL, ''),
(2055, '会话历史删除', 2051, 4, '#', '', 'F', '0', '1', 'campusai:MEMORY:remove', '#', 'admin', '2025-09-15 14:43:38', '', NULL, ''),
(2056, '会话历史导出', 2051, 5, '#', '', 'F', '0', '1', 'campusai:MEMORY:export', '#', 'admin', '2025-09-15 14:43:38', '', NULL, ''),
(2057, '会话记录', 2038, 1, '/campusai/record', '', 'C', '0', '1', 'campusai:record:view', '#', 'admin', '2025-09-15 14:43:53', '', NULL, '会话记录菜单'),
(2058, '会话记录查询', 2057, 1, '#', '', 'F', '0', '1', 'campusai:record:list', '#', 'admin', '2025-09-15 14:43:53', '', NULL, ''),
(2059, '会话记录新增', 2057, 2, '#', '', 'F', '0', '1', 'campusai:record:add', '#', 'admin', '2025-09-15 14:43:53', '', NULL, ''),
(2060, '会话记录修改', 2057, 3, '#', '', 'F', '0', '1', 'campusai:record:edit', '#', 'admin', '2025-09-15 14:43:53', '', NULL, ''),
(2061, '会话记录删除', 2057, 4, '#', '', 'F', '0', '1', 'campusai:record:remove', '#', 'admin', '2025-09-15 14:43:53', '', NULL, ''),
(2062, '会话记录导出', 2057, 5, '#', '', 'F', '0', '1', 'campusai:record:export', '#', 'admin', '2025-09-15 14:43:53', '', NULL, ''),
(2069, '公告栏', 2038, 1, '/campusai/notice', '', 'C', '0', '1', 'campusai:notice:view', '#', 'admin', '2025-09-16 16:14:59', '', NULL, '公告栏菜单'),
(2070, '公告栏查询', 2069, 1, '#', '', 'F', '0', '1', 'campusai:notice:list', '#', 'admin', '2025-09-16 16:14:59', '', NULL, ''),
(2071, '公告栏新增', 2069, 2, '#', '', 'F', '0', '1', 'campusai:notice:add', '#', 'admin', '2025-09-16 16:14:59', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(2072, '公告栏修改', 2069, 3, '#', '', 'F', '0', '1', 'campusai:notice:edit', '#', 'admin', '2025-09-16 16:14:59', '', NULL, ''),
(2073, '公告栏删除', 2069, 4, '#', '', 'F', '0', '1', 'campusai:notice:remove', '#', 'admin', '2025-09-16 16:14:59', '', NULL, ''),
(2074, '公告栏导出', 2069, 5, '#', '', 'F', '0', '1', 'campusai:notice:export', '#', 'admin', '2025-09-16 16:14:59', '', NULL, ''),
(2075, '资料库', 2038, 1, '/campusai/materials', '', 'C', '0', '1', 'campusai:materials:view', '#', 'admin', '2025-09-17 09:32:20', '', NULL, '资料库菜单'),
(2076, '资料库查询', 2075, 1, '#', '', 'F', '0', '1', 'campusai:materials:list', '#', 'admin', '2025-09-17 09:32:20', '', NULL, ''),
(2077, '资料库新增', 2075, 2, '#', '', 'F', '0', '1', 'campusai:materials:add', '#', 'admin', '2025-09-17 09:32:20', '', NULL, ''),
(2078, '资料库修改', 2075, 3, '#', '', 'F', '0', '1', 'campusai:materials:edit', '#', 'admin', '2025-09-17 09:32:20', '', NULL, ''),
(2079, '资料库删除', 2075, 4, '#', '', 'F', '0', '1', 'campusai:materials:remove', '#', 'admin', '2025-09-17 09:32:20', '', NULL, ''),
(2080, '资料库导出', 2075, 5, '#', '', 'F', '0', '1', 'campusai:materials:export', '#', 'admin', '2025-09-17 09:32:20', '', NULL, ''),
(2081, '社团报名', 2038, 1, '/campusai/reservation', '', 'C', '0', '1', 'campusai:reservation:view', '#', 'admin', '2025-09-17 18:03:12', '', NULL, '社团报名菜单'),
(2082, '社团报名查询', 2081, 1, '#', '', 'F', '0', '1', 'campusai:reservation:list', '#', 'admin', '2025-09-17 18:03:13', '', NULL, ''),
(2083, '社团报名新增', 2081, 2, '#', '', 'F', '0', '1', 'campusai:reservation:add', '#', 'admin', '2025-09-17 18:03:13', '', NULL, ''),
(2084, '社团报名修改', 2081, 3, '#', '', 'F', '0', '1', 'campusai:reservation:edit', '#', 'admin', '2025-09-17 18:03:13', '', NULL, ''),
(2085, '社团报名删除', 2081, 4, '#', '', 'F', '0', '1', 'campusai:reservation:remove', '#', 'admin', '2025-09-17 18:03:13', '', NULL, ''),
(2086, '社团报名导出', 2081, 5, '#', '', 'F', '0', '1', 'campusai:reservation:export', '#', 'admin', '2025-09-17 18:03:13', '', NULL, '');

INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `document_id`) VALUES
(1, '温馨提醒：618活动即将开始', '2', '新版本内容', '0', 'admin', '2023-12-27 12:02:52', 'user', '2024-01-02 09:51:27', '管理员', NULL);
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `document_id`) VALUES
(2, '维护通知：今天项目上线', '1', '维护内容', '0', 'admin', '2023-12-27 12:02:52', 'user', '2024-01-02 09:51:47', '管理员', NULL);
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `document_id`) VALUES
(3, '1232222', '1', '<p>a啊实打实大的</p>', '0', 'user', '2025-09-15 16:00:50', '', NULL, NULL, NULL);
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `document_id`) VALUES
(4, '问问123', '1', '<p>爱仕达的</p>', '0', 'user', '2025-09-15 16:39:21', '', NULL, NULL, NULL),
(5, '是啊多大1231231111', '1', '<p>啊实打实的大大</p>', '0', 'user', '2025-09-15 17:19:43', '', NULL, NULL, NULL),
(6, '123123111', '1', '<p>挨打的</p>', '0', 'user', '2025-09-15 17:24:44', '', NULL, NULL, NULL),
(7, '123', '1', '<p>123123</p>', '0', 'user', '2025-09-16 15:46:36', '', NULL, NULL, NULL);

INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES
(1, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 10:23:02', 473);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES
(2, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"智慧园区\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 10:24:32', 72);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES
(3, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"13\"],\"tableName\":[\"spring_ai_chat_record\"],\"tableComment\":[\"会话记录\"],\"className\":[\"SpringAiChatRecord\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"81\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"会话id\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"82\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"83\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户id\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"84\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"会话类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"85\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.lottery\"],\"moduleName\":[\"lottery\"],\"businessName\":[\"record\"],\"functionName\":[\"会话记录\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"sub', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 10:27:08', 51);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES
(4, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"12\"],\"tableName\":[\"SPRING_AI_CHAT_MEMORY\"],\"tableComment\":[\"会话历史\"],\"className\":[\"SpringAiChatMemory\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"76\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"77\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"会话id\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"conversationId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"78\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"聊天内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"79\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"聊天类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"80\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"timestamp\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"c', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 10:28:38', 32),
(5, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-11 10:28:46', 1013),
(6, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-11 10:28:54', 491),
(7, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"13\"],\"tableName\":[\"spring_ai_chat_record\"],\"tableComment\":[\"会话记录\"],\"className\":[\"SpringAiChatRecord\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"81\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"会话id\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"82\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"83\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户id\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"84\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"会话类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"85\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"sub\"],\"packageName\":[\"com.ruoyi.lottery\"],\"moduleName\":[\"lottery\"],\"businessName\":[\"record\"],\"functionName\":[\"会话记录\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subT', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 10:34:49', 43),
(8, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-11 10:34:55', 561),
(9, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-11 10:35:01', 518),
(10, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"13\"],\"tableName\":[\"spring_ai_chat_record\"],\"tableComment\":[\"会话记录\"],\"className\":[\"SpringAiChatRecord\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"81\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"会话id\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"82\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"83\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户id\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"84\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"会话类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"85\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"sub\"],\"packageName\":[\"com.ruoyi.lottery\"],\"moduleName\":[\"lottery\"],\"businessName\":[\"record\"],\"functionName\":[\"会话记录\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subT', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 10:41:51', 28),
(11, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-11 10:42:31', 171),
(12, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"12\"],\"tableName\":[\"SPRING_AI_CHAT_MEMORY\"],\"tableComment\":[\"会话历史\"],\"className\":[\"SpringAiChatMemory\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"76\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"77\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"会话id\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"conversationId\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"78\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"聊天内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"79\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"聊天类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"80\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"发送时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"timestamp\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.lottery\"],\"moduleName\":[\"lottery\"],\"businessName\":[\"MEMORY\"],\"functionName\":[\"会话历史\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 10:51:11', 42),
(13, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-11 10:51:17', 190),
(14, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"活动运营\"],\"roleKey\":[\"yunying\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2,111,112,113,1,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 15:03:42', 74),
(15, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"12\"],\"tableName\":[\"SPRING_AI_CHAT_MEMORY\"],\"tableComment\":[\"会话历史\"],\"className\":[\"SpringAiChatMemory\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"76\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"77\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"会话id\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"conversationId\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"78\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"聊天内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"79\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"聊天类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"80\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"发送时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"timestamp\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"MEMORY\"],\"functionName\":[\"会话历史\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-15 14:40:00', 94),
(16, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"13\"],\"tableName\":[\"spring_ai_chat_record\"],\"tableComment\":[\"会话记录\"],\"className\":[\"SpringAiChatRecord\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"81\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"会话id\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"82\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"83\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户id\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"84\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"会话类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"85\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"sub\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"record\"],\"functionName\":[\"会话记录\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"su', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-15 14:40:16', 41),
(17, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-15 14:40:24', 562),
(18, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"活动运营\"],\"roleKey\":[\"yunying\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2038,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2,111,112,113,1,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-15 14:45:29', 215),
(19, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"123\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>a啊实打实大的</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-15 16:00:50', 354),
(20, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"问问\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>爱仕达的</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-15 16:39:21', 315),
(21, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"搜附近时代峰峻\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>我也就爱上减肥是快乐的减肥</p>\"],\"status\":[\"0\"]}', NULL, 1, 'Cannot invoke \"java.lang.Long.longValue()\" because the return value of \"com.ruoyi.system.domain.SysNotice.getNoticeId()\" is null', '2025-09-15 17:17:09', 114),
(22, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"是啊多大\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>啊实打实的大大</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-15 17:19:43', 332),
(23, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"123123\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>挨打的</p>\"],\"status\":[\"0\"]}', NULL, 1, 'Cannot invoke \"java.lang.Long.longValue()\" because the return value of \"com.ruoyi.system.domain.SysNotice.getNoticeId()\" is null', '2025-09-15 17:24:44', 109),
(24, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"document\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:47:02', 95),
(25, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"14\"],\"tableName\":[\"document\"],\"tableComment\":[\"文档表\"],\"className\":[\"Document\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"86\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"87\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"88\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文档链接\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"url\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"upload\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"document\"],\"functionName\":[\"文档\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:47:53', 158),
(26, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/document', '127.0.0.1', '内网IP', '\"document\"', NULL, 0, NULL, '2025-09-16 09:47:59', 145),
(27, '文档', 1, 'com.ruoyi.campusai.controller.DocumentController.addSave()', 'POST', 1, 'admin', '研发部门', '/campusai/document/add', '127.0.0.1', '内网IP', '{\"title\":[\"rabbitmq分享\"],\"url\":[\"http://tjxt:9005/prize/20250916095040A001.pdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:50:43', 41),
(28, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"活动运营\"],\"roleKey\":[\"yunying\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2038,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,1,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,111,112,113\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:54:52', 252),
(29, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"14\"],\"tableName\":[\"document\"],\"tableComment\":[\"文档表\"],\"className\":[\"Document\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"86\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"87\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"88\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文档链接\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"url\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"upload\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"document\"],\"functionName\":[\"文档管理\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:55:13', 34),
(30, '文档', 3, 'com.ruoyi.campusai.controller.DocumentController.remove()', 'POST', 1, 'admin', '研发部门', '/campusai/document/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:55:19', 9),
(31, '文档', 1, 'com.ruoyi.campusai.controller.DocumentController.addSave()', 'POST', 1, 'admin', '研发部门', '/campusai/document/add', '127.0.0.1', '内网IP', '{\"title\":[\"mq分享\"],\"url\":[\"http://192.168.150.101:9005/campusai/20250916095535A001.pdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:55:36', 12),
(32, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"123\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>123123</p>\"],\"status\":[\"0\"]}', NULL, 1, 'Cannot invoke \"java.lang.Long.longValue()\" because the return value of \"com.ruoyi.system.domain.SysNotice.getNoticeId()\" is null', '2025-09-16 15:46:36', 99),
(33, '文档', 1, 'com.ruoyi.campusai.controller.DocumentController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/document/add', '127.0.0.1', '内网IP', '{\"title\":[\"123312\"],\"url\":[\"http://192.168.150.101:9005/campusai/20250916160047A001.pdf\"]}', NULL, 1, 'SimpleMessageConverter only supports String, byte[] and Serializable payloads, received: com.ruoyi.common.core.domain.MessageDto', '2025-09-16 16:00:49', 86),
(34, '文档', 3, 'com.ruoyi.campusai.controller.DocumentController.remove()', 'POST', 1, 'user', '研发部门', '/campusai/document/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"22\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:01:33', 103),
(35, '文档', 1, 'com.ruoyi.campusai.controller.DocumentController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/document/add', '127.0.0.1', '内网IP', '{\"title\":[\"爱仕达的\"],\"url\":[\"http://192.168.150.101:9005/campusai/20250916160141A001.pdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:01:43', 202),
(36, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"notice\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:13:25', 42),
(37, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"15\"],\"tableName\":[\"notice\"],\"tableComment\":[\"文档表\"],\"className\":[\"Notice\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"89\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"90\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"91\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"92\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"notice\"],\"functionName\":[\"公告栏\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:13:56', 30),
(38, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"15\"],\"tableName\":[\"notice\"],\"tableComment\":[\"文档表\"],\"className\":[\"Notice\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"89\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"90\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"91\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"92\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"BETWEEN\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"notice\"],\"functionName\":[\"公告栏\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:14:26', 30);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES
(39, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/notice', '127.0.0.1', '内网IP', '\"notice\"', NULL, 0, NULL, '2025-09-16 16:14:35', 89),
(40, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"活动运营\"],\"roleKey\":[\"yunying\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2038,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072,2073,2074,1,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,111,112,113\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:15:42', 203),
(41, '公告栏', 3, 'com.ruoyi.campusai.controller.NoticeController.remove()', 'POST', 1, 'admin', '研发部门', '/campusai/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"21\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:15:50', 8),
(42, '公告栏', 3, 'com.ruoyi.campusai.controller.NoticeController.remove()', 'POST', 1, 'admin', '研发部门', '/campusai/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"23\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:15:52', 27),
(43, '公告栏', 1, 'com.ruoyi.campusai.controller.NoticeController.addSave()', 'POST', 1, 'admin', '研发部门', '/campusai/notice/add', '127.0.0.1', '内网IP', '{\"title\":[\"禁止占座\"],\"content\":[\"<p>自习室占座严重，禁止占座</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:16:12', 13),
(44, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"15\"],\"tableName\":[\"notice\"],\"tableComment\":[\"文档表\"],\"className\":[\"Notice\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"89\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"90\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"91\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"92\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"BETWEEN\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"notice\"],\"functionName\":[\"公告栏\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:16:53', 33),
(45, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/notice', '127.0.0.1', '内网IP', '\"notice\"', NULL, 0, NULL, '2025-09-16 16:17:01', 294),
(46, '公告栏', 1, 'com.ruoyi.campusai.controller.NoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/notice/add', '127.0.0.1', '内网IP', '{\"title\":[\"今天星期几？\"],\"content\":[\"<p>今天星期几？你知道不</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:22:05', 338),
(47, '公告栏', 2, 'com.ruoyi.campusai.controller.NoticeController.editSave()', 'POST', 1, 'user', '研发部门', '/campusai/notice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"title\":[\"禁止占座\"],\"content\":[\"<p>自习室占座严重，禁止占座12313</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:44:44', 338),
(48, '公告栏', 3, 'com.ruoyi.campusai.controller.NoticeController.remove()', 'POST', 1, 'user', '研发部门', '/campusai/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"26\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:45:05', 11),
(49, '文档', 2, 'com.ruoyi.campusai.controller.DocumentController.editSave()', 'POST', 1, 'user', '研发部门', '/campusai/document/edit', '127.0.0.1', '内网IP', '{\"id\":[\"21\"],\"title\":[\"mq分享\"],\"url\":[\"http://192.168.150.101:9005/campusai/20250916164738A001.pdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:47:40', 359),
(50, '文档', 2, 'com.ruoyi.campusai.controller.DocumentController.editSave()', 'POST', 1, 'user', '研发部门', '/campusai/document/edit', '127.0.0.1', '内网IP', '{\"id\":[\"23\"],\"title\":[\"爱仕达的\"],\"url\":[\"http://192.168.150.101:9005/campusai/20250916160141A001.pdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:47:52', 9),
(51, '文档', 3, 'com.ruoyi.campusai.controller.DocumentController.remove()', 'POST', 1, 'user', '研发部门', '/campusai/document/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"23\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:47:55', 35),
(52, '公告栏', 1, 'com.ruoyi.campusai.controller.NoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/notice/add', '127.0.0.1', '内网IP', '{\"title\":[\"校园守则\"],\"content\":[\"<p>校园内禁止大声喧哗</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 18:32:18', 279),
(53, '公告栏', 2, 'com.ruoyi.campusai.controller.NoticeController.editSave()', 'POST', 1, 'user', '研发部门', '/campusai/notice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"27\"],\"title\":[\"校园守则\"],\"content\":[\"<p>校园内禁止大声喧哗，也不能唱歌</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 18:36:36', 10),
(54, '公告栏', 3, 'com.ruoyi.campusai.controller.NoticeController.remove()', 'POST', 1, 'user', '研发部门', '/campusai/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"27\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 18:37:11', 15),
(55, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"materials\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 09:29:24', 215),
(56, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"16\"],\"tableName\":[\"materials\"],\"tableComment\":[\"文档表\"],\"className\":[\"Materials\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"93\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"94\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"95\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文档链接\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"url\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"upload\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"96\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"向量库文档id\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"documentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"materials\"],\"functionName\":[\"资料库\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 09:31:26', 26),
(57, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/materials', '127.0.0.1', '内网IP', '\"materials\"', NULL, 0, NULL, '2025-09-17 09:31:33', 533),
(58, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"15\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 10:30:25', 39),
(59, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"notice\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 10:30:29', 103),
(60, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"17\"],\"tableName\":[\"notice\"],\"tableComment\":[\"文档表\"],\"className\":[\"Notice\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"97\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"98\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"99\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"100\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"BETWEEN\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"101\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"向量库文档id\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"documentId\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"notice\"],\"functionName\":[\"公告栏\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 10:31:50', 37),
(61, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"16\"],\"tableName\":[\"materials\"],\"tableComment\":[\"文档表\"],\"className\":[\"Materials\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"93\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"94\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"95\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文档链接\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"url\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"upload\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"96\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"向量库文档id\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"documentId\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"materials\"],\"functionName\":[\"资料库\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 10:32:16', 37),
(62, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"17\"],\"tableName\":[\"notice\"],\"tableComment\":[\"文档表\"],\"className\":[\"Notice\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"97\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"98\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"99\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"100\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"BETWEEN\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"101\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"向量库文档id\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"documentId\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"notice\"],\"functionName\":[\"公告栏\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 10:32:34', 67),
(63, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"notice,materials\"]}', NULL, 0, NULL, '2025-09-17 10:32:49', 363),
(64, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"notice,materials\"]}', NULL, 0, NULL, '2025-09-17 11:05:42', 384),
(65, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"17,16,14\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 13:40:43', 127),
(66, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"materials,notice\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 13:43:55', 108),
(67, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"18,19\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 13:45:18', 20),
(68, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"materials,notice,document_ids\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 13:45:26', 108),
(69, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"22\"],\"tableName\":[\"notice\"],\"tableComment\":[\"公告栏\"],\"className\":[\"Notice\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"116\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"117\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"118\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"textarea\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"119\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"notice\"],\"functionName\":[\"公告栏\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"document_ids\"],\"subTableFkName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 13:46:30', 25),
(70, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"21\"],\"tableName\":[\"materials\"],\"tableComment\":[\"资料库\"],\"className\":[\"Materials\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"113\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"114\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"115\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文档链接\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"url\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"materials\"],\"functionName\":[\"资料库\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 13:46:55', 85),
(71, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"materials,notice\"]}', NULL, 0, NULL, '2025-09-17 13:47:04', 416),
(72, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"活动运营\"],\"roleKey\":[\"yunying\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2038,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2069,2070,2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,1,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,111,112,113\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 14:33:57', 227),
(73, '公告栏', 1, 'com.ruoyi.campusai.controller.NoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/notice/add', '127.0.0.1', '内网IP', '{\"title\":[\"作息与安全\"],\"content\":[\"宿舍楼门禁时间为周日至周四 23:00，周五、周六及节假日 24:00。请合理安排时间，准时归寝，确保人身安全。\\r\\n严禁在宿舍内使用明火或违章电器，安全无小事，你我共守护。\\r\\n离开宿舍时，请务必锁好门窗，保管好个人贵重物品。\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 14:34:33', 195),
(74, '公告栏', 3, 'com.ruoyi.campusai.controller.NoticeController.remove()', 'POST', 1, 'user', '研发部门', '/campusai/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"28\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 14:41:45', 353),
(75, '公告栏', 1, 'com.ruoyi.campusai.controller.NoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/notice/add', '127.0.0.1', '内网IP', '{\"title\":[\"作息与安全\"],\"content\":[\"宿舍楼门禁时间为周日至周四 23:00，周五、周六及节假日 24:00。请合理安排时间，准时归寝，确保人身安全。\\r\\n严禁在宿舍内使用明火或违章电器，安全无小事，你我共守护。\\r\\n离开宿舍时，请务必锁好门窗，保管好个人贵重物品。\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 14:44:27', 11),
(76, '公告栏', 2, 'com.ruoyi.campusai.controller.NoticeController.editSave()', 'POST', 1, 'user', '研发部门', '/campusai/notice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"29\"],\"title\":[\"作息与安全\"],\"content\":[\"宿舍楼门禁时间为周日至周四 23:00，周五、周六及节假日 24:00。请合理安排时间，准时归寝，确保人身安全。gogogo\\r\\n严禁在宿舍内使用明火或违章电器，安全无小事，你我共守护。\\r\\n离开宿舍时，请务必锁好门窗，保管好个人贵重物品。\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 14:49:53', 12),
(77, '公告栏', 2, 'com.ruoyi.campusai.controller.NoticeController.editSave()', 'POST', 1, 'user', '研发部门', '/campusai/notice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"29\"],\"title\":[\"作息与安全\"],\"content\":[\"宿舍楼门禁时间为周日至周四 23:00，周五、周六及节假日 24:00。请合理安排时间，准时归寝，确保人身安全。gogogo\\r\\n严禁在宿舍内使用明火或违章电器，安全无小事，你我共守护。\\r\\n离开宿舍时，请务必锁好门窗，保管好个人贵重物品。yesyes\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 14:52:58', 42),
(78, '公告栏', 1, 'com.ruoyi.campusai.controller.NoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/notice/add', '127.0.0.1', '内网IP', '{\"title\":[\"作息与安全\"],\"content\":[\"宿舍楼门禁时间为周日至周四 23:00，周五、周六及节假日 24:00。请合理安排时间，准时归寝，确保人身安全。\\r\\n严禁在宿舍内使用明火或违章电器，安全无小事，你我共守护。\\r\\n离开宿舍时，请务必锁好门窗，保管好个人贵重物品。\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 14:59:14', 13),
(79, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"21\"],\"tableName\":[\"materials\"],\"tableComment\":[\"资料库\"],\"className\":[\"Materials\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"113\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"114\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"115\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文档链接\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"url\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"upload\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"materials\"],\"functionName\":[\"资料库\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 15:10:37', 21),
(80, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/materials', '127.0.0.1', '内网IP', '\"materials\"', NULL, 0, NULL, '2025-09-17 15:10:44', 74),
(81, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"21\"],\"tableName\":[\"materials\"],\"tableComment\":[\"资料库\"],\"className\":[\"Materials\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"113\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"114\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"115\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文档链接\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"url\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"upload\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"materials\"],\"functionName\":[\"资料库\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧园区\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 16:05:22', 126),
(82, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"materials\"]}', NULL, 0, NULL, '2025-09-17 16:05:35', 584),
(83, '资料库', 1, 'com.ruoyi.campusai.controller.MaterialsController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/materials/add', '127.0.0.1', '内网IP', '{\"title\":[\"MQ学习资料\"],\"url\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 16:09:37', 68),
(84, '资料库', 3, 'com.ruoyi.campusai.controller.MaterialsController.remove()', 'POST', 1, 'user', '研发部门', '/campusai/materials/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"22\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 16:10:59', 71),
(85, '资料库', 1, 'com.ruoyi.campusai.controller.MaterialsController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/materials/add', '127.0.0.1', '内网IP', '{\"title\":[\"MQ学习资料\"],\"url\":[\"http://192.168.150.101:9005/campusai/20250917161117A001.pdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 16:11:18', 8),
(86, '资料库', 3, 'com.ruoyi.campusai.controller.MaterialsController.remove()', 'POST', 1, 'user', '研发部门', '/campusai/materials/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"23\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 16:17:11', 13),
(87, '资料库', 1, 'com.ruoyi.campusai.controller.MaterialsController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/materials/add', '127.0.0.1', '内网IP', '{\"title\":[\"MQ学习资料\"],\"url\":[\"http://192.168.150.101:9005/campusai/20250917162749A001.pdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 16:27:50', 316),
(88, '资料库', 3, 'com.ruoyi.campusai.controller.MaterialsController.remove()', 'POST', 1, 'user', '研发部门', '/campusai/materials/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"24\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 16:38:45', 14),
(89, '资料库', 1, 'com.ruoyi.campusai.controller.MaterialsController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/materials/add', '127.0.0.1', '内网IP', '{\"title\":[\"高校信息\"],\"url\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 16:39:51', 9),
(90, '资料库', 3, 'com.ruoyi.campusai.controller.MaterialsController.remove()', 'POST', 1, 'user', '研发部门', '/campusai/materials/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"25\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 16:42:00', 29),
(91, '资料库', 1, 'com.ruoyi.campusai.controller.MaterialsController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/materials/add', '127.0.0.1', '内网IP', '{\"title\":[\"高校信息\"],\"url\":[\"http://192.168.150.101:9005/campusai/20250917164225A003.pdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 16:42:25', 8),
(92, '公告栏', 3, 'com.ruoyi.campusai.controller.NoticeController.remove()', 'POST', 1, 'user', '研发部门', '/campusai/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"29\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 17:23:33', 21),
(93, '公告栏', 1, 'com.ruoyi.campusai.controller.NoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/notice/add', '127.0.0.1', '内网IP', '{\"title\":[\"舞动青春舞蹈社\"],\"content\":[\"舞动青春舞蹈社是校园里最具活力与魅力的社团之一。我们为所有热爱舞蹈的同学提供一个释放激情、学习技能、展示自我的平台。无论你是擅长Jazz、Hip-hop、Breaking、K-pop还是中国舞，这里都有专属于你的舞台。社团定期开设不同舞种的零基础教学班和提升班，并组织参加校内迎新、晚会表演以及校际舞蹈大赛。在这里，你不仅能提升舞技，更能收获一群因热爱而相聚的挚友。聚光灯已经为你点亮，舞台中央等待你的绽放。欢迎每一位心怀舞蹈梦的你加入我们，让我们一起用汗水诠释热爱，舞动青春！\\r\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 17:24:03', 8),
(94, '公告栏', 1, 'com.ruoyi.campusai.controller.NoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/notice/add', '127.0.0.1', '内网IP', '{\"title\":[\"炫锋篮球社团\"],\"content\":[\"炫锋篮球社团是汇聚了校内最多篮球狂热分子的大家庭。我们的核心是“无篮球，不兄弟”，旨在为每一位成员提供挥洒汗水、享受竞技快乐的家园。社团活动精彩纷呈，包括日常的定点投篮、体能训练、技巧教学，以及激动人心的3v3“斗牛”赛、5v5全场对抗赛和趣味投篮大赛。我们不仅关注个人技术的提升，更注重团队默契的培养。在这里，每一次助攻、每一次防守都充满了激情与呐喊。无论你的水平如何，只要你对篮球有一颗热爱的心，炫锋篮球社都热烈欢迎你的加入，让我们一起创造更多热血的瞬间！\\r\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 17:28:46', 10),
(95, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"club_reservation\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 17:58:23', 115),
(96, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"23\"],\"tableName\":[\"club_reservation\"],\"tableComment\":[\"社团报名\"],\"className\":[\"ClubReservation\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"120\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"121\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"预约社团\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"club\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"122\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"学生姓名\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"name\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"123\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"联系方式\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"phone\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"124\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"专业\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"major\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"125\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"备注\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-17 17:59:05', 31),
(97, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/club_reservation', '127.0.0.1', '内网IP', '\"club_reservation\"', NULL, 0, NULL, '2025-09-17 17:59:18', 33),
(98, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"23\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-18 09:27:32', 99),
(99, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"club_reservation\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-18 09:27:39', 1521),
(100, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"24\"],\"tableName\":[\"club_reservation\"],\"tableComment\":[\"社团报名\"],\"className\":[\"ClubReservation\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"127\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"128\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"预约社团\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"club\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"129\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"学生姓名\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"name\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"130\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"联系方式\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"phone\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"131\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"专业\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"major\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"132\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"备注\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-18 09:28:28', 61);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES
(101, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/club_reservation', '127.0.0.1', '内网IP', '\"club_reservation\"', NULL, 0, NULL, '2025-09-18 09:28:35', 530),
(102, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"活动运营\"],\"roleKey\":[\"yunying\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2038,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2069,2070,2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,1,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,111,112,113\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-18 09:40:43', 150);

INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'ceo', 'CEO', 1, '0', 'admin', '2023-12-27 12:02:42', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(2, 'se', '项目经理', 2, '0', 'admin', '2023-12-27 12:02:42', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(3, 'hr', '人力资源', 3, '0', 'admin', '2023-12-27 12:02:42', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(4, 'user', '普通员工', 4, '0', 'admin', '2023-12-27 12:02:42', '', NULL, '');

INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2023-12-27 12:02:42', '', NULL, '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(2, '普通角色', 'common', 2, '5', '0', '0', 'admin', '2023-12-27 12:02:42', 'admin', '2023-12-28 12:05:22', '普通角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(100, '活动运营', 'yunying', 3, '1', '0', '0', 'admin', '2024-01-02 09:50:08', 'admin', '2025-09-18 09:40:43', '');



INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
(2, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
(2, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
(2, 3);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
(2, 4),
(2, 100),
(2, 101),
(2, 102),
(2, 103),
(2, 104),
(2, 105),
(2, 106),
(2, 107),
(2, 108),
(2, 109),
(2, 110),
(2, 111),
(2, 112),
(2, 113),
(2, 114),
(2, 115),
(2, 116),
(2, 500),
(2, 501),
(2, 1000),
(2, 1001),
(2, 1002),
(2, 1003),
(2, 1004),
(2, 1005),
(2, 1006),
(2, 1007),
(2, 1008),
(2, 1009),
(2, 1010),
(2, 1011),
(2, 1012),
(2, 1013),
(2, 1014),
(2, 1015),
(2, 1016),
(2, 1017),
(2, 1018),
(2, 1019),
(2, 1020),
(2, 1021),
(2, 1022),
(2, 1023),
(2, 1024),
(2, 1025),
(2, 1026),
(2, 1027),
(2, 1028),
(2, 1029),
(2, 1030),
(2, 1031),
(2, 1032),
(2, 1033),
(2, 1034),
(2, 1035),
(2, 1036),
(2, 1037),
(2, 1038),
(2, 1039),
(2, 1040),
(2, 1041),
(2, 1042),
(2, 1043),
(2, 1044),
(2, 1045),
(2, 1046),
(2, 1047),
(2, 1048),
(2, 1049),
(2, 1050),
(2, 1051),
(2, 1052),
(2, 1053),
(2, 1054),
(2, 1055),
(2, 1056),
(2, 1057),
(2, 1058),
(2, 1059),
(2, 1060),
(2, 1061),
(100, 1),
(100, 2),
(100, 107),
(100, 108),
(100, 111),
(100, 112),
(100, 113),
(100, 500),
(100, 501),
(100, 1035),
(100, 1036),
(100, 1037),
(100, 1038),
(100, 1039),
(100, 1040),
(100, 1041),
(100, 1042),
(100, 1043),
(100, 1044),
(100, 1045),
(100, 1046),
(100, 2038),
(100, 2051),
(100, 2052),
(100, 2053),
(100, 2054),
(100, 2055),
(100, 2056),
(100, 2057),
(100, 2058),
(100, 2059),
(100, 2060),
(100, 2061),
(100, 2062),
(100, 2069),
(100, 2070),
(100, 2071),
(100, 2072),
(100, 2073),
(100, 2074),
(100, 2075),
(100, 2076),
(100, 2077),
(100, 2078),
(100, 2079),
(100, 2080),
(100, 2081),
(100, 2082),
(100, 2083),
(100, 2084),
(100, 2085),
(100, 2086);

INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 103, 'admin', '超级管理员', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2023/12/27/blob_20231227121211A002.png', 'cd5c653aad9c947add80dd5b74dec949', '56f88c', '0', '0', '127.0.0.1', '2025-09-18 09:40:35', '2024-01-02 09:47:00', 'admin', '2023-12-27 12:02:41', '', '2025-09-18 09:40:30', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(2, 105, 'ry', '测试用户', '00', 'ry@qq.com', '15666666666', '1', '', '13df7e5e78d714ca0e27b7640981eb4f', '722576', '0', '0', '127.0.0.1', '2023-12-27 12:02:42', '2023-12-27 12:02:42', 'admin', '2023-12-27 12:02:42', '', '2023-12-28 12:02:06', '测试员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(100, 103, 'user', 'user', '00', '', '', '0', '', 'e4c40195f1543bbbd722ef47540ca7c4', 'c548a7', '0', '0', '127.0.0.1', '2025-09-18 11:01:40', NULL, 'admin', '2024-01-02 09:48:04', 'admin', '2025-09-18 11:01:36', '');



INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES
(1, 1);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES
(2, 2);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES
(100, 2);

INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
(1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
(2, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
(100, 100);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
