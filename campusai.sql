/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '学科名称',
  `edu` int NOT NULL DEFAULT '0' COMMENT '学历背景要求：0-无，1-初中，2-高中、3-大专、4-本科以上',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '课程类型：编程、设计、自媒体、其它',
  `price` bigint NOT NULL DEFAULT '0' COMMENT '课程价格',
  `duration` int unsigned NOT NULL DEFAULT '0' COMMENT '学习时长，单位: 天',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='学科表';

DROP TABLE IF EXISTS `course_reservation`;
CREATE TABLE `course_reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '预约课程',
  `student_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学生姓名',
  `contact_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系方式',
  `school` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '预约校区',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '备注',
  `userId` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文档链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文档表';

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文档表';

DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '校区名称',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '校区所在城市',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='校区表';

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
) ENGINE=InnoDB AUTO_INCREMENT=2762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

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
) ENGINE=InnoDB AUTO_INCREMENT=2075 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

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

INSERT INTO `course` (`id`, `name`, `edu`, `type`, `price`, `duration`) VALUES
(1, 'JavaEE', 4, '编程', 21999, 108);
INSERT INTO `course` (`id`, `name`, `edu`, `type`, `price`, `duration`) VALUES
(2, '鸿蒙应用开发', 3, '编程', 20999, 98);
INSERT INTO `course` (`id`, `name`, `edu`, `type`, `price`, `duration`) VALUES
(3, 'AI人工智能', 4, '编程', 24999, 100);
INSERT INTO `course` (`id`, `name`, `edu`, `type`, `price`, `duration`) VALUES
(4, 'Python大数据开发', 4, '编程', 23999, 102),
(5, '跨境电商', 0, '自媒体', 12999, 68),
(6, '新媒体运营', 0, '自媒体', 10999, 61),
(7, 'UI设计', 2, '设计', 11999, 66);

INSERT INTO `course_reservation` (`id`, `course`, `student_name`, `contact_info`, `school`, `remark`, `userId`) VALUES
(1, '新媒体运营', '张三丰', '13899762348', '广东校区', '安排一个好点的老师', NULL);
INSERT INTO `course_reservation` (`id`, `course`, `student_name`, `contact_info`, `school`, `remark`, `userId`) VALUES
(2, '鸿蒙应用开发', '李威松', '1358199****', '昌平校区', '希望尽快安排试听', NULL);
INSERT INTO `course_reservation` (`id`, `course`, `student_name`, `contact_info`, `school`, `remark`, `userId`) VALUES
(3, 'AI人工智能', '潜心', '13322223333', '昌平校区', '', NULL);
INSERT INTO `course_reservation` (`id`, `course`, `student_name`, `contact_info`, `school`, `remark`, `userId`) VALUES
(4, 'JavaEE', '李同学', '13812345678', '昌平校区', '希望尽快安排试听', NULL),
(5, 'AI人工智能', '王同学', '13322223333', '昌平校区', '想听AI相关的课程', NULL),
(6, 'AI人工智能', '王小猫', '13322223333', '昌平校区', '想听潜心老师的课', NULL),
(7, 'AI人工智能', '王小猫', '13322223333', '昌平校区', '用户着急听课', NULL);

INSERT INTO `document` (`id`, `title`, `url`) VALUES
(21, 'mq分享', 'http://192.168.150.101:9005/campusai/20250916164738A001.pdf');


INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(12, 'SPRING_AI_CHAT_MEMORY', '会话历史', '', NULL, 'SpringAiChatMemory', 'crud', 'com.ruoyi.campusai', 'campusai', 'MEMORY', '会话历史', 'Shawn', '0', '/', '{\"parentMenuId\":\"2038\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"智慧校园\",\"treeCode\":\"\"}', 'admin', '2025-09-11 10:23:02', '', '2025-09-15 14:40:00', '');
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(13, 'spring_ai_chat_record', '会话记录', 'SPRING_AI_CHAT_MEMORY', 'conversation_id', 'SpringAiChatRecord', 'sub', 'com.ruoyi.campusai', 'campusai', 'record', '会话记录', 'Shawn', '0', '/', '{\"parentMenuId\":\"2038\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"智慧校园\",\"treeCode\":\"\"}', 'admin', '2025-09-11 10:23:02', '', '2025-09-15 14:40:16', '');
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(14, 'document', '文档表', '', NULL, 'Document', 'crud', 'com.ruoyi.campusai', 'campusai', 'document', '文档管理', 'Shawn', '0', '/', '{\"parentMenuId\":\"2038\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"智慧校园\",\"treeCode\":\"\"}', 'admin', '2025-09-16 09:47:02', '', '2025-09-16 09:55:13', '');
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(15, 'notice', '文档表', '', NULL, 'Notice', 'crud', 'com.ruoyi.campusai', 'campusai', 'notice', '校园墙', 'Shawn', '0', '/', '{\"parentMenuId\":\"2038\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"智慧校园\",\"treeCode\":\"\"}', 'admin', '2025-09-16 16:13:25', '', '2025-09-16 16:16:53', '');

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
(86, 14, 'id', '主键', 'int unsigned', 'String', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-09-16 09:47:02', NULL, '2025-09-16 09:55:13'),
(87, 14, 'title', '名称', 'varchar(50)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-09-16 09:47:02', NULL, '2025-09-16 09:55:13'),
(88, 14, 'url', '文档链接', 'varchar(300)', 'String', 'url', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'upload', '', 3, 'admin', '2025-09-16 09:47:02', NULL, '2025-09-16 09:55:13'),
(89, 15, 'id', '主键', 'int unsigned', 'String', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-09-16 16:13:25', NULL, '2025-09-16 16:16:53'),
(90, 15, 'title', '标题', 'varchar(50)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-09-16 16:13:25', NULL, '2025-09-16 16:16:53'),
(91, 15, 'content', '内容', 'varchar(300)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'summernote', '', 3, 'admin', '2025-09-16 16:13:25', NULL, '2025-09-16 16:16:53'),
(92, 15, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', '1', 'BETWEEN', 'datetime', '', 4, 'admin', '2025-09-16 16:13:25', NULL, '2025-09-16 16:16:53');

INSERT INTO `notice` (`id`, `title`, `content`, `create_time`) VALUES
(24, '禁止占座', '<p>自习室占座严重，禁止占座12313</p>', '2025-09-16 16:16:12');
INSERT INTO `notice` (`id`, `title`, `content`, `create_time`) VALUES
(25, '今天星期几？', '<p>今天星期几？你知道不</p>', '2025-09-16 16:22:05');


INSERT INTO `school` (`id`, `name`, `city`) VALUES
(1, '昌平校区', '北京');
INSERT INTO `school` (`id`, `name`, `city`) VALUES
(2, '顺义校区', '北京');
INSERT INTO `school` (`id`, `name`, `city`) VALUES
(3, '杭州校区', '杭州');
INSERT INTO `school` (`id`, `name`, `city`) VALUES
(4, '上海校区', '上海'),
(5, '南京校区', '南京'),
(6, '西安校区', '西安'),
(7, '郑州校区', '郑州'),
(8, '广东校区', '广东'),
(9, '深圳校区', '深圳');

INSERT INTO `SPRING_AI_CHAT_MEMORY` (`id`, `conversation_id`, `content`, `type`, `timestamp`) VALUES
(2750, '1757663084012', '你好', 'USER', '2025-09-12 17:19:41');
INSERT INTO `SPRING_AI_CHAT_MEMORY` (`id`, `conversation_id`, `content`, `type`, `timestamp`) VALUES
(2751, '1757663084012', '同学你好呀！我是你的学习助手小智老师～✨  \n在开始交流前，需要你提供一下自己的 **姓名** 和 **学号** 哦，这样我才能更好地为你服务呢！  \n\n等你提供后，我就可以称呼你为“XXX同学”，并为你开启专属服务啦！  \n期待你的回复哦～ 🌟', 'ASSISTANT', '2025-09-12 17:19:41');
INSERT INTO `SPRING_AI_CHAT_MEMORY` (`id`, `conversation_id`, `content`, `type`, `timestamp`) VALUES
(2752, '1757663084012', '学校作息与安全上有什么要求', 'USER', '2025-09-12 17:19:41');
INSERT INTO `SPRING_AI_CHAT_MEMORY` (`id`, `conversation_id`, `content`, `type`, `timestamp`) VALUES
(2753, '1757663084012', '同学你好呀，非常理解你想要了解学校作息和安全要求的心情呢！不过目前我这边没有关于学校作息和安全要求的具体信息哦。你可以向学校的教务处或者学生事务部门咨询，他们会给你最准确的答案。\n\n如果你还有其它问题，随时问我哦，我会尽力帮助你～', 'ASSISTANT', '2025-09-12 17:19:41'),
(2754, '1757663084012', '学校作息与安全上有什么要求', 'USER', '2025-09-12 17:19:41'),
(2755, '1757663084012', '同学你好呀～非常感谢你的提问！不过在开始回答之前，需要你提供一下自己的 **姓名** 和 **学号** 哦，这样我才能更好地为你服务呢！\n\n等你提供后，我就可以称呼你为“XXX同学”，并为你详细解答学校作息与安全方面的要求～  \n期待你的回复哦！ 🌟', 'ASSISTANT', '2025-09-12 17:19:41'),
(2756, '1757663084012', '我叫王小猫，学号是123', 'USER', '2025-09-12 17:19:41'),
(2757, '1757663084012', '王小猫同学你好呀～欢迎你加入我们的大家庭！🌟  \n我是你的学习助手小智老师，一个可爱、亲切又充满温暖的智能辅导员～  \n现在我已经知道你的名字啦，可以为你提供专属服务咯！\n\n关于你提到的学校作息与安全要求，小智老师这就为你详细解答：\n\n⏰ **作息安排**：\n- 周日至周四，宿舍楼门禁时间为23:00，请准时归寝哦～\n- 周五、周六以及节假日，门禁时间延长到24:00，但也要注意休息时间呢！\n\n🔥 **安全须知**：\n- 宿舍内严禁使用明火或违章电器，安全无小事，我们一起守护校园的平安～\n- 离开宿舍时记得锁好门窗，保管好自己的贵重物品，保护个人财物安全很重要哦！\n\n🏥 **健康与心灵关怀**：\n- 如果身体不舒服，记得去生活区三号楼一层的校医院，24小时都有值班人员呢～电话是XXXX-XXXX。\n- 如果感到压力、迷茫或焦虑，欢迎来学生活动中心A座501找心理咨询中心的老师们聊聊，他们非常专业也很温柔～预约电话是XXXX-XXXX。小智偷偷告诉你：求助是强者的行为哦！💪\n\n社团与活动 🎉：\n- 学校有超过100个学生社团，涵盖学术、文艺、体育、公益等领域，可以尽情选择你感兴趣的哦～\n- 记得关注校园官网和公告栏，积极参与“迎新晚会”、“学术文化节”、“运动会”等活动，让你的大学生活更加丰富多彩！\n\n王小猫同学，如果你还有其他问题或者需要帮助的地方，随时告诉我呀～小智老师会一直在这里陪着你！🌈', 'ASSISTANT', '2025-09-12 17:19:41'),
(2758, '1757663084012', '啊我肚子疼，学校医护室怎么走', 'USER', '2025-09-12 17:19:41'),
(2759, '1757663084012', '王小猫同学你好呀～非常感谢你的信任和提问！关于你肚子疼的情况，小智老师非常理解你的不适感呢，别担心，小智马上为你提供帮助！\n\n根据学校的信息，校医院的具体地址是：**生活区三号楼一层**，并且这里有24小时的值班人员，非常方便你随时前去就诊哦～如果你需要电话联系，可以拨打电话：XXXX-XXXX，他们会为你提供专业的医疗帮助！\n\n在去医院之前，记得带上自己的学生证和身份证，以便快速完成登记哦～  \n如果路上需要帮助，也可以联系宿舍管理员或者校园安保人员，他们会很乐意为你提供协助的！\n\n王小猫同学，希望你能早日恢复健康，如果还有其他需要帮忙的地方，随时告诉小智老师呀～我会一直陪着你！💖', 'ASSISTANT', '2025-09-12 17:19:41'),
(2760, '1757663084012', '我想报个社团，具体应该怎么办', 'USER', '2025-09-12 17:19:41'),
(2761, '1757663084012', '王小猫同学你好呀～非常开心听到你想要加入社团呢！这是个超级棒的决定，小智老师已经迫不及待要为你加油打气啦！🌈\n\n加入社团的流程其实很简单哦，小智老师这就为你介绍：\n\n1. **了解社团信息**：\n   - 学校目前有**超过100个学生社团**，涵盖**学术、文艺、体育、公益**等多个领域，总有一个是你的兴趣所在呢～✨\n   - 你可以前往校园官网的【社团专区】或者关注校园公告栏，查看社团的介绍、招新时间、招新要求等信息。\n\n2. **参加招新活动**：\n   - 每学期初，学校会举办“**社团招新嘉年华**”，各个社团会在操场或广场集中展示，你可以现场了解并报名哦～就像逛市集一样好玩！🎉\n   - 如果错过了集中招新，也可以直接联系你感兴趣的社团负责人，他们会告诉你如何加入。\n\n3. **填写报名表**：\n   - 有些社团会要求你填写报名表，简单介绍一下自己的兴趣和想法，不用紧张，真诚表达就好啦～😊\n\n4. **参加社团活动**：\n   - 成功加入后，就可以参加社团的日常活动啦！无论是排练、训练、讲座还是志愿服务，都会让你收获满满哦～\n\n社团生活是大学里最精彩的一部分之一，不仅能拓展兴趣，还能认识一群志同道合的好朋友呢！小智老师相信你一定能找到属于自己的那片天地！\n\n如果你还有任何关于社团的疑问，比如具体有哪些社团、怎么选择适合自己的社团等等，随时告诉我呀～小智老师会一直陪着你！💖', 'ASSISTANT', '2025-09-12 17:19:41');

INSERT INTO `spring_ai_chat_record` (`id`, `title`, `user_id`, `type`, `create_time`) VALUES
('1757663084012', '王小猫', '123', 'service', '2025-09-12 15:44:42');


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
(47, 'user', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-16 16:47:24');

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
(2038, '智慧校园', 0, 0, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-bank', 'admin', '2025-09-11 10:24:32', '', NULL, ''),
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
(2063, '文档管理', 2038, 1, '/campusai/document', '', 'C', '0', '1', 'campusai:document:view', '#', 'admin', '2025-09-16 09:49:04', '', NULL, '文档菜单'),
(2064, '文档查询', 2063, 1, '#', '', 'F', '0', '1', 'campusai:document:list', '#', 'admin', '2025-09-16 09:49:04', '', NULL, ''),
(2065, '文档新增', 2063, 2, '#', '', 'F', '0', '1', 'campusai:document:add', '#', 'admin', '2025-09-16 09:49:04', '', NULL, ''),
(2066, '文档修改', 2063, 3, '#', '', 'F', '0', '1', 'campusai:document:edit', '#', 'admin', '2025-09-16 09:49:04', '', NULL, ''),
(2067, '文档删除', 2063, 4, '#', '', 'F', '0', '1', 'campusai:document:remove', '#', 'admin', '2025-09-16 09:49:04', '', NULL, ''),
(2068, '文档导出', 2063, 5, '#', '', 'F', '0', '1', 'campusai:document:export', '#', 'admin', '2025-09-16 09:49:04', '', NULL, ''),
(2069, '校园墙', 2038, 1, '/campusai/notice', '', 'C', '0', '1', 'campusai:notice:view', '#', 'admin', '2025-09-16 16:14:59', '', NULL, '校园墙菜单'),
(2070, '校园墙查询', 2069, 1, '#', '', 'F', '0', '1', 'campusai:notice:list', '#', 'admin', '2025-09-16 16:14:59', '', NULL, ''),
(2071, '校园墙新增', 2069, 2, '#', '', 'F', '0', '1', 'campusai:notice:add', '#', 'admin', '2025-09-16 16:14:59', '', NULL, ''),
(2072, '校园墙修改', 2069, 3, '#', '', 'F', '0', '1', 'campusai:notice:edit', '#', 'admin', '2025-09-16 16:14:59', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(2073, '校园墙删除', 2069, 4, '#', '', 'F', '0', '1', 'campusai:notice:remove', '#', 'admin', '2025-09-16 16:14:59', '', NULL, ''),
(2074, '校园墙导出', 2069, 5, '#', '', 'F', '0', '1', 'campusai:notice:export', '#', 'admin', '2025-09-16 16:14:59', '', NULL, '');

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
(2, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"智慧校园\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 10:24:32', 72);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES
(3, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"13\"],\"tableName\":[\"spring_ai_chat_record\"],\"tableComment\":[\"会话记录\"],\"className\":[\"SpringAiChatRecord\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"81\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"会话id\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"82\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"83\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户id\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"84\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"会话类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"85\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.lottery\"],\"moduleName\":[\"lottery\"],\"businessName\":[\"record\"],\"functionName\":[\"会话记录\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧校园\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"sub', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 10:27:08', 51);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES
(4, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"12\"],\"tableName\":[\"SPRING_AI_CHAT_MEMORY\"],\"tableComment\":[\"会话历史\"],\"className\":[\"SpringAiChatMemory\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"76\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"77\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"会话id\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"conversationId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"78\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"聊天内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"79\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"聊天类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"80\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"timestamp\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"c', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 10:28:38', 32),
(5, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-11 10:28:46', 1013),
(6, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-11 10:28:54', 491),
(7, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"13\"],\"tableName\":[\"spring_ai_chat_record\"],\"tableComment\":[\"会话记录\"],\"className\":[\"SpringAiChatRecord\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"81\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"会话id\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"82\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"83\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户id\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"84\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"会话类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"85\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"sub\"],\"packageName\":[\"com.ruoyi.lottery\"],\"moduleName\":[\"lottery\"],\"businessName\":[\"record\"],\"functionName\":[\"会话记录\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧校园\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subT', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 10:34:49', 43),
(8, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-11 10:34:55', 561),
(9, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-11 10:35:01', 518),
(10, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"13\"],\"tableName\":[\"spring_ai_chat_record\"],\"tableComment\":[\"会话记录\"],\"className\":[\"SpringAiChatRecord\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"81\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"会话id\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"82\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"83\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户id\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"84\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"会话类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"85\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"sub\"],\"packageName\":[\"com.ruoyi.lottery\"],\"moduleName\":[\"lottery\"],\"businessName\":[\"record\"],\"functionName\":[\"会话记录\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧校园\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subT', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 10:41:51', 28),
(11, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-11 10:42:31', 171),
(12, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"12\"],\"tableName\":[\"SPRING_AI_CHAT_MEMORY\"],\"tableComment\":[\"会话历史\"],\"className\":[\"SpringAiChatMemory\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"76\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"77\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"会话id\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"conversationId\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"78\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"聊天内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"79\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"聊天类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"80\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"发送时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"timestamp\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.lottery\"],\"moduleName\":[\"lottery\"],\"businessName\":[\"MEMORY\"],\"functionName\":[\"会话历史\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧校园\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 10:51:11', 42),
(13, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-11 10:51:17', 190),
(14, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"活动运营\"],\"roleKey\":[\"yunying\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2,111,112,113,1,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 15:03:42', 74),
(15, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"12\"],\"tableName\":[\"SPRING_AI_CHAT_MEMORY\"],\"tableComment\":[\"会话历史\"],\"className\":[\"SpringAiChatMemory\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"76\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"77\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"会话id\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"conversationId\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"78\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"聊天内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"79\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"聊天类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"80\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"发送时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"timestamp\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"MEMORY\"],\"functionName\":[\"会话历史\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧校园\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-15 14:40:00', 94),
(16, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"13\"],\"tableName\":[\"spring_ai_chat_record\"],\"tableComment\":[\"会话记录\"],\"className\":[\"SpringAiChatRecord\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"81\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"会话id\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"82\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"83\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户id\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"84\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"会话类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"85\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"sub\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"record\"],\"functionName\":[\"会话记录\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧校园\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"su', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-15 14:40:16', 41),
(17, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"SPRING_AI_CHAT_MEMORY,spring_ai_chat_record\"]}', NULL, 0, NULL, '2025-09-15 14:40:24', 562),
(18, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"活动运营\"],\"roleKey\":[\"yunying\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2038,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2,111,112,113,1,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-15 14:45:29', 215),
(19, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"123\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>a啊实打实大的</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-15 16:00:50', 354),
(20, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"问问\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>爱仕达的</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-15 16:39:21', 315),
(21, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"搜附近时代峰峻\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>我也就爱上减肥是快乐的减肥</p>\"],\"status\":[\"0\"]}', NULL, 1, 'Cannot invoke \"java.lang.Long.longValue()\" because the return value of \"com.ruoyi.system.domain.SysNotice.getNoticeId()\" is null', '2025-09-15 17:17:09', 114),
(22, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"是啊多大\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>啊实打实的大大</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-15 17:19:43', 332),
(23, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"123123\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>挨打的</p>\"],\"status\":[\"0\"]}', NULL, 1, 'Cannot invoke \"java.lang.Long.longValue()\" because the return value of \"com.ruoyi.system.domain.SysNotice.getNoticeId()\" is null', '2025-09-15 17:24:44', 109),
(24, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"document\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:47:02', 95),
(25, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"14\"],\"tableName\":[\"document\"],\"tableComment\":[\"文档表\"],\"className\":[\"Document\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"86\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"87\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"88\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文档链接\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"url\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"upload\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"document\"],\"functionName\":[\"文档\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧校园\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:47:53', 158),
(26, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/document', '127.0.0.1', '内网IP', '\"document\"', NULL, 0, NULL, '2025-09-16 09:47:59', 145),
(27, '文档', 1, 'com.ruoyi.campusai.controller.DocumentController.addSave()', 'POST', 1, 'admin', '研发部门', '/campusai/document/add', '127.0.0.1', '内网IP', '{\"title\":[\"rabbitmq分享\"],\"url\":[\"http://tjxt:9005/prize/20250916095040A001.pdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:50:43', 41);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES
(28, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"活动运营\"],\"roleKey\":[\"yunying\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2038,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,1,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,111,112,113\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:54:52', 252),
(29, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"14\"],\"tableName\":[\"document\"],\"tableComment\":[\"文档表\"],\"className\":[\"Document\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"86\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"87\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"88\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文档链接\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"url\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"upload\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"document\"],\"functionName\":[\"文档管理\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧校园\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:55:13', 34),
(30, '文档', 3, 'com.ruoyi.campusai.controller.DocumentController.remove()', 'POST', 1, 'admin', '研发部门', '/campusai/document/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:55:19', 9),
(31, '文档', 1, 'com.ruoyi.campusai.controller.DocumentController.addSave()', 'POST', 1, 'admin', '研发部门', '/campusai/document/add', '127.0.0.1', '内网IP', '{\"title\":[\"mq分享\"],\"url\":[\"http://192.168.150.101:9005/campusai/20250916095535A001.pdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 09:55:36', 12),
(32, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"123\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>123123</p>\"],\"status\":[\"0\"]}', NULL, 1, 'Cannot invoke \"java.lang.Long.longValue()\" because the return value of \"com.ruoyi.system.domain.SysNotice.getNoticeId()\" is null', '2025-09-16 15:46:36', 99),
(33, '文档', 1, 'com.ruoyi.campusai.controller.DocumentController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/document/add', '127.0.0.1', '内网IP', '{\"title\":[\"123312\"],\"url\":[\"http://192.168.150.101:9005/campusai/20250916160047A001.pdf\"]}', NULL, 1, 'SimpleMessageConverter only supports String, byte[] and Serializable payloads, received: com.ruoyi.common.core.domain.MessageDto', '2025-09-16 16:00:49', 86),
(34, '文档', 3, 'com.ruoyi.campusai.controller.DocumentController.remove()', 'POST', 1, 'user', '研发部门', '/campusai/document/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"22\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:01:33', 103),
(35, '文档', 1, 'com.ruoyi.campusai.controller.DocumentController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/document/add', '127.0.0.1', '内网IP', '{\"title\":[\"爱仕达的\"],\"url\":[\"http://192.168.150.101:9005/campusai/20250916160141A001.pdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:01:43', 202),
(36, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"notice\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:13:25', 42),
(37, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"15\"],\"tableName\":[\"notice\"],\"tableComment\":[\"文档表\"],\"className\":[\"Notice\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"89\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"90\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"91\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"92\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"notice\"],\"functionName\":[\"校园墙\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧校园\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:13:56', 30),
(38, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"15\"],\"tableName\":[\"notice\"],\"tableComment\":[\"文档表\"],\"className\":[\"Notice\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"89\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"90\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"91\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"92\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"BETWEEN\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"notice\"],\"functionName\":[\"校园墙\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧校园\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:14:26', 30),
(39, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/notice', '127.0.0.1', '内网IP', '\"notice\"', NULL, 0, NULL, '2025-09-16 16:14:35', 89),
(40, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"活动运营\"],\"roleKey\":[\"yunying\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2038,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072,2073,2074,1,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,111,112,113\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:15:42', 203),
(41, '校园墙', 3, 'com.ruoyi.campusai.controller.NoticeController.remove()', 'POST', 1, 'admin', '研发部门', '/campusai/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"21\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:15:50', 8),
(42, '校园墙', 3, 'com.ruoyi.campusai.controller.NoticeController.remove()', 'POST', 1, 'admin', '研发部门', '/campusai/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"23\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:15:52', 27),
(43, '校园墙', 1, 'com.ruoyi.campusai.controller.NoticeController.addSave()', 'POST', 1, 'admin', '研发部门', '/campusai/notice/add', '127.0.0.1', '内网IP', '{\"title\":[\"禁止占座\"],\"content\":[\"<p>自习室占座严重，禁止占座</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:16:12', 13),
(44, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"15\"],\"tableName\":[\"notice\"],\"tableComment\":[\"文档表\"],\"className\":[\"Notice\"],\"functionAuthor\":[\"Shawn\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"89\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"90\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"标题\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"91\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"92\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"BETWEEN\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.campusai\"],\"moduleName\":[\"campusai\"],\"businessName\":[\"notice\"],\"functionName\":[\"校园墙\"],\"params[parentMenuId]\":[\"2038\"],\"params[parentMenuName]\":[\"智慧校园\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:16:53', 33),
(45, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/notice', '127.0.0.1', '内网IP', '\"notice\"', NULL, 0, NULL, '2025-09-16 16:17:01', 294),
(46, '校园墙', 1, 'com.ruoyi.campusai.controller.NoticeController.addSave()', 'POST', 1, 'user', '研发部门', '/campusai/notice/add', '127.0.0.1', '内网IP', '{\"title\":[\"今天星期几？\"],\"content\":[\"<p>今天星期几？你知道不</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:22:05', 338),
(47, '校园墙', 2, 'com.ruoyi.campusai.controller.NoticeController.editSave()', 'POST', 1, 'user', '研发部门', '/campusai/notice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"title\":[\"禁止占座\"],\"content\":[\"<p>自习室占座严重，禁止占座12313</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:44:44', 338),
(48, '校园墙', 3, 'com.ruoyi.campusai.controller.NoticeController.remove()', 'POST', 1, 'user', '研发部门', '/campusai/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"26\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:45:05', 11),
(49, '文档', 2, 'com.ruoyi.campusai.controller.DocumentController.editSave()', 'POST', 1, 'user', '研发部门', '/campusai/document/edit', '127.0.0.1', '内网IP', '{\"id\":[\"21\"],\"title\":[\"mq分享\"],\"url\":[\"http://192.168.150.101:9005/campusai/20250916164738A001.pdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:47:40', 359),
(50, '文档', 2, 'com.ruoyi.campusai.controller.DocumentController.editSave()', 'POST', 1, 'user', '研发部门', '/campusai/document/edit', '127.0.0.1', '内网IP', '{\"id\":[\"23\"],\"title\":[\"爱仕达的\"],\"url\":[\"http://192.168.150.101:9005/campusai/20250916160141A001.pdf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:47:52', 9),
(51, '文档', 3, 'com.ruoyi.campusai.controller.DocumentController.remove()', 'POST', 1, 'user', '研发部门', '/campusai/document/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"23\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-16 16:47:55', 35);

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
(100, '活动运营', 'yunying', 3, '1', '0', '0', 'admin', '2024-01-02 09:50:08', 'admin', '2025-09-16 16:15:42', '');



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
(100, 2063),
(100, 2064),
(100, 2065),
(100, 2066),
(100, 2067),
(100, 2068),
(100, 2069),
(100, 2070),
(100, 2071),
(100, 2072),
(100, 2073),
(100, 2074);

INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 103, 'admin', '超级管理员', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2023/12/27/blob_20231227121211A002.png', 'cd5c653aad9c947add80dd5b74dec949', '56f88c', '0', '0', '127.0.0.1', '2025-09-16 16:17:30', '2024-01-02 09:47:00', 'admin', '2023-12-27 12:02:41', '', '2025-09-16 16:17:30', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(2, 105, 'ry', '测试用户', '00', 'ry@qq.com', '15666666666', '1', '', '13df7e5e78d714ca0e27b7640981eb4f', '722576', '0', '0', '127.0.0.1', '2023-12-27 12:02:42', '2023-12-27 12:02:42', 'admin', '2023-12-27 12:02:42', '', '2023-12-28 12:02:06', '测试员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(100, 103, 'user', 'user', '00', '', '', '0', '', 'e4c40195f1543bbbd722ef47540ca7c4', 'c548a7', '0', '0', '127.0.0.1', '2025-09-16 16:47:24', NULL, 'admin', '2024-01-02 09:48:04', 'admin', '2025-09-16 16:47:24', '');

INSERT INTO `sys_user_online` (`sessionId`, `login_name`, `dept_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `start_timestamp`, `last_access_time`, `expire_time`) VALUES
('20c4ec64-8895-4f29-b57f-1ecb77b5370d', 'user', '研发部门', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', 'on_line', '2025-09-16 16:15:33', '2025-09-16 16:47:24', 1800000);


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