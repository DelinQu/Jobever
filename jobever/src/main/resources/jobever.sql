create table bms_billboard
(
    id          int auto_increment comment '主键'
        primary key,
    content     varchar(255) not null comment '公告',
    create_time datetime     null comment '公告时间',
    `show`      tinyint(1)   null comment '1：展示中，0：过期'
)
    comment '全站公告' charset = utf8mb4;

create table bms_comment
(
    id          varchar(20)              not null comment '主键'
        primary key,
    content     varchar(1000) default '' not null comment '内容',
    user_id     varchar(20)              not null comment '作者ID',
    topic_id    varchar(20)              not null comment 'topic_id',
    create_time datetime                 not null comment '发布时间',
    modify_time datetime                 null comment '修改时间'
)
    comment '评论表';

create table bms_follow
(
    id          int auto_increment comment '主键'
        primary key,
    parent_id   varchar(20) null comment '被关注人ID',
    follower_id varchar(20) null comment '关注人ID'
)
    comment '用户关注' charset = utf8mb4;

create table bms_follow_post
(
    id          int auto_increment comment '主键'
        primary key,
    post_id     varchar(20) null comment '被关注人ID',
    follower_id varchar(20) null comment '关注人ID'
)
    comment '用户关注' charset = utf8mb4;

create table bms_post
(
    id          varchar(20)               not null comment '主键',
    title       varchar(255) default ''   not null comment '标题',
    content     longtext                  null comment 'markdown内容',
    user_id     varchar(20)               not null comment '作者ID',
    comments    int          default 0    not null comment '评论统计',
    collects    int          default 0    not null comment '收藏统计',
    view        int          default 0    not null comment '浏览统计',
    top         bit          default b'0' not null comment '是否置顶，1-是，0-否',
    essence     bit          default b'0' not null comment '是否加精，1-是，0-否',
    section_id  int          default 0    null comment '专栏ID',
    create_time datetime                  not null comment '发布时间',
    modify_time datetime                  null comment '修改时间',
    status      tinyint      default 1    not null,
    money       int          default 0    not null,
    constraint title
        unique (title)
)
    comment '话题表';

create index create_time
    on bms_post (create_time);

create index user_id
    on bms_post (user_id);

create table bms_post_tag
(
    id       int auto_increment comment '主键'
        primary key,
    tag_id   varchar(20) not null comment '标签ID',
    topic_id varchar(20) not null comment '话题ID'
)
    comment '话题-标签 中间表';

create index tag_id
    on bms_post_tag (tag_id);

create index topic_id
    on bms_post_tag (topic_id);

create table bms_promotion
(
    id          int auto_increment comment '主键'
        primary key,
    title       varchar(255) null comment '广告标题',
    link        varchar(255) null comment '广告链接',
    description varchar(255) null comment '说明'
)
    comment '广告推广表' charset = utf8mb4;

create table bms_tag
(
    id          varchar(20)             not null comment '标签ID'
        primary key,
    name        varchar(255) default '' not null comment '标签',
    topic_count int          default 0  not null comment '关联话题',
    constraint name
        unique (name)
)
    comment '标签表';

create table bms_tip
(
    id      int unsigned auto_increment comment '主键'
        primary key,
    content varchar(1000) default '' not null comment '内容',
    author  varchar(50)   default '' null comment '作者',
    type    tinyint                  not null comment '1：使用，0：过期'
)
    comment '每日赠言';

create table confirm_token
(
    id          varchar(20) not null,
    token       varchar(12) not null,
    create_time datetime    not null,
    user_id     varchar(20) not null
);

create table ums_user
(
    id          varchar(20)               not null comment '用户ID',
    username    varchar(15)  default ''   not null comment '用户名',
    alias       varchar(255)              null comment '用户昵称',
    password    varchar(100) default ''   null comment '密码',
    avatar      varchar(1000)             null comment '头像',
    email       varchar(255)              null comment '邮箱',
    mobile      varchar(255)              null comment '手机',
    score       int          default 0    not null comment '积分',
    token       varchar(255) default ''   null comment 'token',
    bio         varchar(255)              null comment '个人简介',
    active      bit          default b'0' not null comment '是否激活，1：是，0：否',
    status      bit          default b'1' null comment '状态，1：使用，0：停用',
    role_id     int                       null comment '用户角色',
    create_time datetime                  not null comment '加入时间',
    modify_time datetime                  null comment '修改时间',
    constraint ums_user_email_uindex
        unique (email),
    constraint ums_user_id_uindex
        unique (id),
    constraint user_name
        unique (username)
)
    comment '用户表';

create index user_create_time
    on ums_user (create_time);

alter table ums_user
    add primary key (id);

