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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

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
) ENGINE=InnoDB AUTO_INCREMENT=1783 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `spring_ai_chat_record`;
CREATE TABLE `spring_ai_chat_record` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会话id',
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `user_id` bigint unsigned NOT NULL COMMENT '用户id',
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

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
) ENGINE=InnoDB AUTO_INCREMENT=2051 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

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
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

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

INSERT INTO `course_reservation` (`id`, `course`, `student_name`, `contact_info`, `school`, `remark`) VALUES
(1, '新媒体运营', '张三丰', '13899762348', '广东校区', '安排一个好点的老师');
INSERT INTO `course_reservation` (`id`, `course`, `student_name`, `contact_info`, `school`, `remark`) VALUES
(2, '鸿蒙应用开发', '李威松', '1358199****', '昌平校区', '希望尽快安排试听');
INSERT INTO `course_reservation` (`id`, `course`, `student_name`, `contact_info`, `school`, `remark`) VALUES
(3, 'AI人工智能', '潜心', '13322223333', '昌平校区', '');
INSERT INTO `course_reservation` (`id`, `course`, `student_name`, `contact_info`, `school`, `remark`) VALUES
(4, 'JavaEE', '李同学', '13812345678', '昌平校区', '希望尽快安排试听'),
(5, 'AI人工智能', '王同学', '13322223333', '昌平校区', '想听AI相关的课程'),
(6, 'AI人工智能', '王小猫', '13322223333', '昌平校区', '想听潜心老师的课'),
(7, 'AI人工智能', '王小猫', '13322223333', '昌平校区', '用户着急听课');

INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(12, 'SPRING_AI_CHAT_MEMORY', '会话历史', '', NULL, 'SpringAiChatMemory', 'crud', 'com.ruoyi.lottery', 'lottery', 'MEMORY', '会话历史', 'Shawn', '0', '/', '{\"parentMenuId\":\"2038\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"智慧校园\",\"treeCode\":\"\"}', 'admin', '2025-09-11 10:23:02', '', '2025-09-11 10:51:11', '');
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(13, 'spring_ai_chat_record', '会话记录', 'SPRING_AI_CHAT_MEMORY', 'conversation_id', 'SpringAiChatRecord', 'sub', 'com.ruoyi.lottery', 'lottery', 'record', '会话记录', 'Shawn', '0', '/', '{\"parentMenuId\":\"2038\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"智慧校园\",\"treeCode\":\"\"}', 'admin', '2025-09-11 10:23:02', '', '2025-09-11 10:41:51', '');


INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(76, 12, 'id', '', 'bigint', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-11 10:51:11');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(77, 12, 'conversation_id', '会话id', 'varchar(36)', 'String', 'conversationId', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-11 10:51:11');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(78, 12, 'content', '聊天内容', 'text', 'String', 'content', '0', '0', '1', NULL, NULL, '1', '1', 'EQ', 'summernote', '', 3, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-11 10:51:11');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(79, 12, 'type', '聊天类型', 'varchar(10)', 'String', 'type', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'select', '', 4, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-11 10:51:11'),
(80, 12, 'timestamp', '发送时间', 'timestamp', 'Date', 'timestamp', '0', '0', '1', NULL, NULL, '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-11 10:51:11'),
(81, 13, 'id', '会话id', 'varchar(50)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-11 10:41:51'),
(82, 13, 'title', '标题', 'varchar(150)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-11 10:41:51'),
(83, 13, 'user_id', '用户id', 'bigint unsigned', 'String', 'userId', '0', '0', '1', NULL, NULL, '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-11 10:41:51'),
(84, 13, 'type', '会话类型', 'varchar(50)', 'String', 'type', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'select', '', 4, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-11 10:41:51'),
(85, 13, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2025-09-11 10:23:02', NULL, '2025-09-11 10:41:51');

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
(1183, '1757485054485', '你好', 'USER', '2025-09-10 14:18:08');
INSERT INTO `SPRING_AI_CHAT_MEMORY` (`id`, `conversation_id`, `content`, `type`, `timestamp`) VALUES
(1184, '1757485054485', '你好呀！我是小智老师，你的校园生活小助手～😊  \n为了更好地为你服务，请先告诉我以下信息哦：  \n1. 你的名字  \n2. 所属院系  \n3. 专业  \n\n期待认识你！✨', 'ASSISTANT', '2025-09-10 14:18:08');
INSERT INTO `SPRING_AI_CHAT_MEMORY` (`id`, `conversation_id`, `content`, `type`, `timestamp`) VALUES
(1185, '1757485054485', '王小猫，计算机系，软件工程', 'USER', '2025-09-10 14:18:08');
INSERT INTO `SPRING_AI_CHAT_MEMORY` (`id`, `conversation_id`, `content`, `type`, `timestamp`) VALUES
(1186, '1757485054485', '你好呀，王小猫同学！我是小智老师，你的校园生活小助手～😊  \n很高兴认识你！有什么问题或需求，尽管告诉我吧，我会尽全力帮助你哦～  \n\n你可以问我关于专业课程的建议、选课相关的问题，或者是校园生活的疑问，让我们一起开启愉快的交流吧！✨', 'ASSISTANT', '2025-09-10 14:18:08'),
(1192, '1757484886906', '你好', 'USER', '2025-09-10 14:20:48'),
(1193, '1757484886906', '你好呀！我是小智老师，你的学习生活小助手～😊\n\n在开始聊天之前，我需要先了解一些你的基本信息哦！请告诉我：\n1. 你的名字\n2. 所属院系\n3. 专业\n\n这样我才能更好地为你服务呢！', 'ASSISTANT', '2025-09-10 14:20:48'),
(1194, '1757484886906', '王小猫，计算机系，软件工程', 'USER', '2025-09-10 14:20:48'),
(1195, '1757484886906', '小智老师发现系统出了一点小故障，暂时无法更新会话标题。不过不用担心，这不影响我们接下来的交流和服务哦！😊\n\n现在，亲爱的王小猫同学，你想了解什么呢？是关于课程咨询、选课预约，还是校园墙的内容呢？告诉我吧～', 'ASSISTANT', '2025-09-10 14:20:48'),
(1196, '1757484886906', '李小狗，计算机系，人工智能', 'USER', '2025-09-10 14:20:48'),
(1197, '1757484886906', '你好呀！李小狗同学，欢迎来到小智老师的智能服务空间～🌟\n\n你现在想了解什么呢？是关于专业课程的咨询、选课预约，还是想看看校园墙的有趣内容呀？告诉我吧，小智老师会用最温暖的方式为你服务！😊', 'ASSISTANT', '2025-09-10 14:20:48'),
(1667, '1757485988721', '你好', 'USER', '2025-09-10 14:54:34'),
(1668, '1757485988721', '你好呀！我是小智老师，你的校园生活小助手～😊  \n为了更好地为你服务，请先告诉我以下信息哦：  \n1. 你的名字  \n2. 所属院系  \n3. 专业  \n\n期待认识你！🌟', 'ASSISTANT', '2025-09-10 14:54:34'),
(1669, '1757485988721', '我是计算机系的', 'USER', '2025-09-10 14:54:34'),
(1670, '1757485988721', '欢迎你呀～计算机系的同学！🌟  \n现在还需要你提供一下自己的名字和专业，这样我们就能开启愉快的对话啦！期待认识你哦！😊', 'ASSISTANT', '2025-09-10 14:54:34'),
(1671, '1757485988721', '我叫王大锤', 'USER', '2025-09-10 14:54:34'),
(1672, '1757485988721', '很高兴认识你，王大锤同学！🌟  \n你所学的专业是哪个呢？这样我就能更好地了解你啦！😊', 'ASSISTANT', '2025-09-10 14:54:34'),
(1673, '1757485988721', '专业是人工智能', 'USER', '2025-09-10 14:54:34'),
(1674, '1757485988721', '很高兴认识你，王大锤同学！🌟  \n你是人工智能专业的对吗？真是一门充满未来感的专业呀！如果你有任何关于学习、选课或者校园生活的问题，都可以问我哦！让我们一起开启精彩的校园生活吧！😊', 'ASSISTANT', '2025-09-10 14:54:34'),
(1675, '1757485988721', '不对，我叫王大力', 'USER', '2025-09-10 14:54:34'),
(1676, '1757485988721', '哎呀，抱歉弄错了～是王大力同学呀！🌟  \n刚刚的信息已经更新好啦，现在你的人工智能专业信息也已经记录好啦！  \n如果还有其它问题，尽管问我哦，让我们一起开启愉快的校园生活之旅吧！😊', 'ASSISTANT', '2025-09-10 14:54:34'),
(1677, '1757485988721', '你知道我的名字吗', 'USER', '2025-09-10 14:54:34'),
(1678, '1757485988721', '你叫王大力同学呀～我们刚刚已经更新过信息啦！😊  \n现在你是人工智能专业的学生，对吗？有什么问题都可以问我哦～  \n让我们一起开启愉快的校园生活吧！🌟', 'ASSISTANT', '2025-09-10 14:54:34'),
(1679, '1757485988721', '不对，我叫李子', 'USER', '2025-09-10 14:54:34'),
(1680, '1757485988721', '哦呀，刚刚的信息需要更新啦～欢迎你，李子同学！🌟  \n你的人工智能专业信息已经记录好啦！现在让我们一起开启愉快的校园生活之旅吧！😊', 'ASSISTANT', '2025-09-10 14:54:34'),
(1681, '1757485988721', '我叫什么名字', 'USER', '2025-09-10 14:54:34'),
(1682, '1757485988721', '你叫李子同学呀～我们刚刚已经更新过信息啦！  \n现在你是人工智能专业的学生，对吗？有什么问题都可以问我哦～  \n让我们一起开启愉快的校园生活吧！🌟', 'ASSISTANT', '2025-09-10 14:54:34'),
(1683, '1757485988721', '不对不对，我叫李大锤', 'USER', '2025-09-10 14:54:34'),
(1684, '1757485988721', '哎呀，最新的信息已经更新好啦～欢迎你，李大锤同学！🌟  \n你是人工智能专业的对吗？让我们一起开启愉快的校园生活之旅吧！😊  \n如果还有其它问题，尽管问我哦～', 'ASSISTANT', '2025-09-10 14:54:34'),
(1769, '1757574112256', '你好', 'USER', '2025-09-11 15:02:19'),
(1770, '1757574112256', '你好呀！我是小智老师，是来帮助你解答问题的智能客服～ \n\n在我们开始聊天之前，请你先告诉我你的名字、院系和专业是什么呢？这是为了更好地提供服务给你哦！\n这三个信息要真实填写，不能捏造呢。等你告诉我后，我就可以更贴心地和你交流啦！\n\n当你说完这些信息后，我们的会话标题也会更新成你的名字和院系哦，这样会更亲切！期待你的回复～', 'ASSISTANT', '2025-09-11 15:02:19'),
(1771, '1757574112256', '我叫核桃，计算机系的，人工智能专业', 'USER', '2025-09-11 15:02:19'),
(1772, '1757574112256', '你好呀！我是小智老师，是来帮助你解答问题的智能客服～\n\n现在我已经知道你是核桃同学，来自计算机系人工智能专业啦！接下来我会用更亲切的方式和你交流哦～\n\n如果你有任何问题，比如课程选择、校园生活或者专业咨询，都可以告诉我呢！让我们一起开启愉快的交流之旅吧～', 'ASSISTANT', '2025-09-11 15:02:19'),
(1779, '1757574378654', '你好', 'USER', '2025-09-11 15:07:12'),
(1780, '1757574378654', '你好呀！我是小智老师，很高兴见到你！😊  \n在我们开始聊天前，可以先告诉我你的名字、院系和专业吗？这些信息可以帮助我更好地为你服务哦~  \n\n期待你的回复！✨', 'ASSISTANT', '2025-09-11 15:07:12'),
(1781, '1757574378654', '我是电子信息科学技术智能计算学院的，名字是王小毛，专业是人工智能科技发展', 'USER', '2025-09-11 15:07:12'),
(1782, '1757574378654', '你好呀，王小毛同学！👋  \n欢迎来到人工智能科技发展的学习天地，我是你的智能小助手小智老师~  \n今天有什么可以帮助你的吗？是想了解专业课程、选课流程，还是校园生活的其他问题呢？😊  \n\n告诉我你的需求吧，我会全力为你解答！✨', 'ASSISTANT', '2025-09-11 15:07:12');

INSERT INTO `spring_ai_chat_record` (`id`, `title`, `user_id`, `type`, `create_time`) VALUES
('1757484886906', '计算机系#李小狗', 1, 'service', '2025-09-10 14:14:46');
INSERT INTO `spring_ai_chat_record` (`id`, `title`, `user_id`, `type`, `create_time`) VALUES
('1757485054485', '计算机系#王小猫', 1, 'service', '2025-09-10 14:17:33');
INSERT INTO `spring_ai_chat_record` (`id`, `title`, `user_id`, `type`, `create_time`) VALUES
('1757485988721', '计算机系#王大锤', 1, 'service', '2025-09-10 14:33:08');
INSERT INTO `spring_ai_chat_record` (`id`, `title`, `user_id`, `type`, `create_time`) VALUES
('1757574112256', '计算机系#核桃', 1, 'service', '2025-09-11 15:01:52'),
('1757574378654', '电子信息科学技术智能计算学院#王小毛', 1, 'service', '2025-09-11 15:06:18');

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
(14, 'user', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-11 15:03:48');

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
(1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2023-12-27 12:02:44', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
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
(2039, '会话记录', 2038, 1, '/lottery/record', '', 'C', '0', '1', 'lottery:record:view', '#', 'admin', '2025-09-11 10:30:22', '', NULL, '会话记录菜单'),
(2040, '会话记录查询', 2039, 1, '#', '', 'F', '0', '1', 'lottery:record:list', '#', 'admin', '2025-09-11 10:30:22', '', NULL, ''),
(2041, '会话记录新增', 2039, 2, '#', '', 'F', '0', '1', 'lottery:record:add', '#', 'admin', '2025-09-11 10:30:22', '', NULL, ''),
(2042, '会话记录修改', 2039, 3, '#', '', 'F', '0', '1', 'lottery:record:edit', '#', 'admin', '2025-09-11 10:30:22', '', NULL, ''),
(2043, '会话记录删除', 2039, 4, '#', '', 'F', '0', '1', 'lottery:record:remove', '#', 'admin', '2025-09-11 10:30:22', '', NULL, ''),
(2044, '会话记录导出', 2039, 5, '#', '', 'F', '0', '1', 'lottery:record:export', '#', 'admin', '2025-09-11 10:30:22', '', NULL, ''),
(2045, '会话历史', 2038, 1, '/lottery/MEMORY', '', 'C', '0', '1', 'lottery:MEMORY:view', '#', 'admin', '2025-09-11 10:30:39', '', NULL, '会话历史菜单'),
(2046, '会话历史查询', 2045, 1, '#', '', 'F', '0', '1', 'lottery:MEMORY:list', '#', 'admin', '2025-09-11 10:30:39', '', NULL, ''),
(2047, '会话历史新增', 2045, 2, '#', '', 'F', '0', '1', 'lottery:MEMORY:add', '#', 'admin', '2025-09-11 10:30:39', '', NULL, ''),
(2048, '会话历史修改', 2045, 3, '#', '', 'F', '0', '1', 'lottery:MEMORY:edit', '#', 'admin', '2025-09-11 10:30:39', '', NULL, ''),
(2049, '会话历史删除', 2045, 4, '#', '', 'F', '0', '1', 'lottery:MEMORY:remove', '#', 'admin', '2025-09-11 10:30:39', '', NULL, ''),
(2050, '会话历史导出', 2045, 5, '#', '', 'F', '0', '1', 'lottery:MEMORY:export', '#', 'admin', '2025-09-11 10:30:39', '', NULL, '');

INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '温馨提醒：618活动即将开始', '2', '新版本内容', '0', 'admin', '2023-12-27 12:02:52', 'user', '2024-01-02 09:51:27', '管理员');
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(2, '维护通知：今天项目上线', '1', '维护内容', '0', 'admin', '2023-12-27 12:02:52', 'user', '2024-01-02 09:51:47', '管理员');


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
(14, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"活动运营\"],\"roleKey\":[\"yunying\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2,111,112,113,1,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2025-09-11 15:03:42', 74);

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
(100, '活动运营', 'yunying', 3, '1', '0', '0', 'admin', '2024-01-02 09:50:08', 'admin', '2025-09-11 15:03:42', '');



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
(100, 2039),
(100, 2040),
(100, 2041),
(100, 2042),
(100, 2043),
(100, 2044),
(100, 2045),
(100, 2046),
(100, 2047),
(100, 2048),
(100, 2049),
(100, 2050);

INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 103, 'admin', '超级管理员', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2023/12/27/blob_20231227121211A002.png', 'cd5c653aad9c947add80dd5b74dec949', '56f88c', '0', '0', '127.0.0.1', '2025-09-11 15:03:02', '2024-01-02 09:47:00', 'admin', '2023-12-27 12:02:41', '', '2025-09-11 15:03:01', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(2, 105, 'ry', '测试用户', '00', 'ry@qq.com', '15666666666', '1', '', '13df7e5e78d714ca0e27b7640981eb4f', '722576', '0', '0', '127.0.0.1', '2023-12-27 12:02:42', '2023-12-27 12:02:42', 'admin', '2023-12-27 12:02:42', '', '2023-12-28 12:02:06', '测试员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(100, 103, 'user', 'user', '00', '', '', '0', '', 'e4c40195f1543bbbd722ef47540ca7c4', 'c548a7', '0', '0', '127.0.0.1', '2025-09-11 15:03:48', NULL, 'admin', '2024-01-02 09:48:04', 'admin', '2025-09-11 15:03:48', '');

INSERT INTO `sys_user_online` (`sessionId`, `login_name`, `dept_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `start_timestamp`, `last_access_time`, `expire_time`) VALUES
('2d66b59f-144b-4ef8-981a-308bbeacf1fc', 'user', '研发部门', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', 'on_line', '2025-09-11 15:03:48', '2025-09-11 15:07:25', 1800000);


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