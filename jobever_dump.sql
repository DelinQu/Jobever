-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bms_billboard`
--

DROP TABLE IF EXISTS `bms_billboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_billboard` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告',
  `create_time` datetime DEFAULT NULL COMMENT '公告时间',
  `show` tinyint(1) DEFAULT NULL COMMENT '1：展示中，0：过期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='全站公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_billboard`
--

LOCK TABLES `bms_billboard` WRITE;
/*!40000 ALTER TABLE `bms_billboard` DISABLE KEYS */;
INSERT INTO `bms_billboard` VALUES (2,'学生求职工作，就在Easy JOB！！','2020-11-19 17:16:19',1),(6,'开放的Job社区，尽请关注Jobever！','2021-02-20 08:44:20',1);
/*!40000 ALTER TABLE `bms_billboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_comment`
--

DROP TABLE IF EXISTS `bms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_comment` (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者ID',
  `topic_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'topic_id',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_comment`
--

LOCK TABLES `bms_comment` WRITE;
/*!40000 ALTER TABLE `bms_comment` DISABLE KEYS */;
INSERT INTO `bms_comment` VALUES ('1368379608987459585','神经网络实验','1368203634308071426','1368205958694879233','2021-03-07 01:54:57',NULL),('1368559389573959681','的','1368540058907627521','1368558789448749057','2021-03-07 13:49:20',NULL),('1368559434281046018','当初','1368540058907627521','1368558789448749057','2021-03-07 13:49:30',NULL),('1368560196922953730','留言成功','1368540058907627521','1368478851886534657','2021-03-07 13:52:32',NULL),('1368881922668064769','作者联系方式：qdl.cs@qq.com','1368203634308071426','1368204652836077570','2021-03-08 11:10:58',NULL),('1368881974153146370','我们一起讨论吧','1368203634308071426','1368204652836077570','2021-03-08 11:11:10',NULL);
/*!40000 ALTER TABLE `bms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_follow`
--

DROP TABLE IF EXISTS `bms_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_follow` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '被关注人ID',
  `follower_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关注人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户关注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_follow`
--

LOCK TABLES `bms_follow` WRITE;
/*!40000 ALTER TABLE `bms_follow` DISABLE KEYS */;
INSERT INTO `bms_follow` VALUES (160,'1368203634308071426','1368540058907627521');
/*!40000 ALTER TABLE `bms_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_follow_post`
--

DROP TABLE IF EXISTS `bms_follow_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_follow_post` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `post_id` varchar(20) DEFAULT NULL COMMENT '被关注人ID',
  `follower_id` varchar(20) DEFAULT NULL COMMENT '关注人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户关注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_follow_post`
--

LOCK TABLES `bms_follow_post` WRITE;
/*!40000 ALTER TABLE `bms_follow_post` DISABLE KEYS */;
INSERT INTO `bms_follow_post` VALUES (31,'1368205958694879233','1368203634308071426'),(32,'1368204652836077570','1368540058907627521'),(33,'1368478851886534657','1368540058907627521'),(34,'1368205958694879233','1368540058907627521'),(35,'1368478851886534657','1368203634308071426');
/*!40000 ALTER TABLE `bms_follow_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_post`
--

DROP TABLE IF EXISTS `bms_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_post` (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'markdown内容',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者ID',
  `comments` int NOT NULL DEFAULT '0' COMMENT '评论统计',
  `collects` int NOT NULL DEFAULT '0' COMMENT '收藏统计',
  `view` int NOT NULL DEFAULT '0' COMMENT '浏览统计',
  `top` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否置顶，1-是，0-否',
  `essence` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否加精，1-是，0-否',
  `section_id` int DEFAULT '0' COMMENT '专栏ID',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` tinyint NOT NULL DEFAULT '1',
  `money` int NOT NULL DEFAULT '0',
  UNIQUE KEY `title` (`title`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='话题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_post`
--

LOCK TABLES `bms_post` WRITE;
/*!40000 ALTER TABLE `bms_post` DISABLE KEYS */;
INSERT INTO `bms_post` VALUES ('1368478851886534657','HealthCheck','# ![hnu](https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=69948112,3892466283&fm=26&gp=0.jpg) HNU 自动打卡 HealthCheck\n\n* **2021/3/3 更新 :star_and_crescent:️ **\n\n> 由于系统更换了打卡表单，新增了体温值统计，程序做了相应调整。\n> \n> **1.如果表单不需要收集测量体温值，请使用master分支**\n> \n> **2.如果表单需要测量体温值，请使用campus分支**\n\n* 简介 :bulb:\n\n> HealthCheck基于**python**搭建，它每天尝试三次打卡，成功后会**邮箱提醒**你打卡成功; 如果3次尝试仍未成功，HealthCheck会邮件提醒您手动打卡，并将**错误日志**发送给开发者（yourself）.\n> \n> HealthCheck分离代码和配置文件，你可以很方便地通过修改配置文件来达到**切换运行**环境的目的。同时你也可以通过向用户列表文件中添加新的打卡用户信息来进行**批量打卡**。mapper文件夹下的接口与主程序分离，可以随时**测试接口**。\n> \n> HealthCheck通过ASP定时框架来实现定点打卡，一旦你将HealthCheck部署到服务器，即可解放双手，高效生活。\n\n* **声明** :triangular_flag_on_post:\n\n> **使用此项目完成打卡的同学有义务保证信息的准确性！如若出现身体异常，请务必配合疫情防控工作，完成异常信息上报！**\n\n* **目录结构 :trident:**\n\n> 目录结构\n\n```\n.\n├── config                      \n│   └── appConfig.py            # 配置文件\n├── data                        \n│   ├── .img                    # 验证码图片缓存\n│   └── user.csv                # 打卡用户信息 \n├── main.py                     # 程序入口\n├── mapper                      # 方法接口\n│   ├── commit.py               # 提交打卡信息表单\n│   ├── getImage.py             # 下载保存验证码图片\n│   ├── ksdemo.py               # 验证码图像识别\n│   ├── login.py                # 登陆\n│   ├── readData.py             # 数据读取\n│   └── sendEmail.py            # 邮件发送\n└── README.md                   # README\n```\n\n## Quick Start\n\n> 使用此程序需要简单三步，在开始之前你应该使用**git clone** 或下载 **zip** 包以获取程序\n\n### （1）环境搭建\n\n* 解释器\n\n```\npython 3.x\n```\n\n* 第三方包：你可以使用pip install `packageName`下载它们\n\n```\npip install numpy               # 这里用于处理numpy数组 \npip install apscheduler         # APS定时框架\npip install requests            # HTTP for Humans.\npip install pandas              # 这里用作数据读取\n```\n\n* 代发邮箱开启`POP3/SMTP`服务：\n\n此程序包含邮箱提醒功能，如果你想要使用此功能，请将代发邮箱开启`POP3/SMTP`服务。参考教程：[https://jingyan.baidu.com/article/6079ad0eb14aaa28fe86db5a.html](https://jingyan.baidu.com/article/6079ad0eb14aaa28fe86db5a.html) ，注意开启服务后将会获取一段**授权码**，请保留。\n\n* 注册**快识别**帐号：\n\n由于采用了验证码的验证方式，所以我们要识别验证码图片，最简单的方法是用第三方API。**快识别** 免费提供了这样的服务。我们需要注册快识别的帐号来支持验证码图片识别功能，快识别官网：[http://fast.95man.com/](http://fast.95man.com/) （建议不要滥用）\n\n### （2）填写配置文件\n\n配置文件包含程序运行所需要的所有信息，路径为`HealthCheck/config/appConfig.py`，下面是`appConfig`的一个配置样例，你需要根据自己的使用请情况修改以下`×××`的部分：\n\n```\n# URL\ntokenURL = \"https://fangkong.hnu.edu.cn/api/v1/account/getimgvcode\"\nimageURL = \"https://fangkong.hnu.edu.cn/imagevcode\"\nloginUrl = \'https://fangkong.hnu.edu.cn/api/v1/account/login\'\ncommitUrl= \'https://fangkong.hnu.edu.cn/api/v1/clockinlog/add\' \n​\n# path\ndirPath  = \'./data/.img/\'\ndataPath = \'./data/user.csv\'\n​\n# 邮箱配置\nsenderEmail = \'×××\'     # 代发邮箱（使用此邮箱给打卡用户发送邮件）\nsender = \"×××\"          # 代发邮箱昵称，任意\ndevEmail = \'×××\'        # 开发者邮箱（如出现打卡失败的情况，代发邮箱给此邮箱发送打卡失败用户列表）\nAuthCode = \'×××\'        # 开启`POP3/SMTP`服务时的授权码\nport = 587              # stmp使用端口\n​\nsucessMsg = \'   今日打卡成功，打卡时间：\'\nfailMsg = \'     我们对您的账户进行了3次打卡尝试，由于某些原因导致打卡失败，请于今日手动完成打卡。\\\n您可以尝试联系此邮箱以解决打卡失败的问题。祝您生活愉快！\\n发件人： \'+senderEmail\n​\n# http://fast.95man.com/注册使用\nk95Username = \'×××\'     # 快识别帐号\nk95Passwd = \"×××\"       # 快识别密码\n​\n# 打卡时间设置 0:20\ncheckHour = \'0\'         # 时间设置 任意\ncheckMin  = \'20\'\n```\n\n### （3）填写打卡用户信息\n\n程序已配置完毕，接下来填写打卡用户信息。你需要修改路径`HealthCheck/data/user.csv` 文件，参考以下实例：\n\n```\nusername,passwd,email,RealAddress,RealCity,RealCounty,RealProvince,IsInCampus\n802180010599,mima123456,3214566@qq.com,密西西比村,岳阳市,岳阳县,湖南省,0\n802180010598,mima654321,1245678@qq.com,八里屯小区,武威市,凉州区,甘肃省,0\n.....继续添加\n```\n\n> 注意：username,passwd分别代表Grmh的帐号和密码。\n\n## 运行实例\n\n* 最后，你可以简单的使用命令执行`main.py`\n\n```\n$ python main.py\n```\n\n* 终端日志\n\n![image-20210214080717753](https://i.loli.net/2021/02/14/UOB7DYiwfc2JTFs.png)\n\n* 邮箱提醒\n\n![image-20210212142621554](https://i.loli.net/2021/02/12/ClmSj6RqrnO9JeB.png) ![image-20210212142659234](https://i.loli.net/2021/02/12/mzMoVOyfSdWlH48.png)\n\n![image-20210213131631644](https://i.loli.net/2021/02/13/6xBdGVJEKqUeR1g.png) （开发者dev）\n\n## 部署服务器（非必须）\n\n如果将HealthCheck部署到服务器，你就能完全解放双手了，部署方法如下：\n\n```\n# 在服务器上克隆项目\ngit clone git@github.com:LinXiaoDe/HealthCheck.git\n# 修改配置文件和用户列表\n见quickSatart\n# 开启一个screen会话\nscreen -S HealthCheck\n# 进入根目录\ncd HealthCheck\n# 执行\npython main.py\n```\n\n* 注意：\n\n阿里云或者腾讯云一般未开放stmp功能的默认端口，这意味着你在本地电脑上可以通过邮箱测试，部署到云端则会出现错误。因此在部署时，安全组一定要放行stmp端口。本教程中使用阿里云，qq邮箱，端口为587.\n\n','1368203634308071426',0,0,12,_binary '\0',_binary '\0',0,'2021-03-07 08:29:18','2021-06-03 04:50:59',1,100),('1368895732082634754','Jobever 社区规则与介绍','## 社区介绍 :star:️\n\n> **Jobever** 是一个开放开源的社区，它基于**SpringBoot + Vue** 搭建，参考了项目[豆宝社区](https://github.com/songboriceman/doubao_community_backend)，我们对其表示衷心的感谢。在 **Jobever**社区里你可以随时发布自己的话题进行求助，提供悬赏金额和联系方式，社区里的小伙伴看到你的求助话题会和你联系并且解决问题，问题解决后请及时关闭该话题。如果你觉得我们的网站不错，可以支持我们，感激不尽！\n> \n> ### 主要功能:icecream:\n> \n> 1. 提供简单快捷的兼职途径:aerial_tramway:\n> \n> 很多大学生苦于难以寻找兼职，感叹求职质量不高，浪费大把的时间，我们针对这个问题，提供解决方案。在在**Jobever**社区里，有很多人发表求助帖，并且提供悬赏。大家可以在社区中快速找到自己能解决的求助帖，并且解决，从而获取兼职薪酬。系统会自动推荐最新主题，热门主题，已结束的主题，从而帮助大家快速筛选目标。\n> \n> 2. 提供解决问题的快速通道:apple:\n> \n> **Jobever**社区不仅仅是单项的兼职，大家可以随时发布自己的话题进行求助，提供悬赏金额和联系方式，社区里的小伙伴看到你的求助话题会和你联系并且解决问题！\n\n![image-20210308190613087](https://i.loli.net/2021/03/08/vCUgcsFHfVpWT8J.png)\n\n## 1.寻找兼职:moneybag:\n\n> 在在**Jobever**社区里，有很多人发表求助帖，并且提供悬赏。我们可以在社区中快速找到自己能解决的求助帖，并且解决，从而获取兼职薪酬。系统会自动推荐最新主题，热门主题，已结束的主题，从而帮助大家快速筛选目标。\n\n### （1）筛选文章:page_facing_up:\n\n> 主页上你可以通过 热门主题，最新主题，侧面标签栏，或者直接搜索主题从而获取文章列表。在列表中标识了文章的状态（是否结帖），悬赏金额数目。\n> \n> 点击文章，可以查看文章的内容，包括了求助的问题，悬赏金额，联系方式等等。我们根据自身需求，找到自己能做的文章，联系文章的作者。\n\n![image-20210308190813039](https://i.loli.net/2021/03/08/dKSVyWg4JFaDfBZ.png)\n\n### （3）开始工作:construction_worker:\n\n> 在文章中，作者描述了自己遇到的问题并且在评论区 / 文章中留下了联系方式，你可以通过作者的联系方式私下和他沟通，请注意隐私，防止上当受骗！\n\n![image-20210308191207360](https://i.loli.net/2021/03/08/oltVZWQS2i7dODE.png)\n\n### （4）获取薪酬:euro:\n\n> 薪酬的支付和获取和本平台无关！所有的交易在私下进行，请注意防止上当受骗！\n\n## 2.求助社区:fencer:\n\n### （1）发布文章:page_with_curl:\n\n> 发布文章包含你向社区求助的问题，请简洁有效地描述问题，标明以下7点\n> \n> * 标题\n> * 悬赏\n> * 主题\n> * 问题描述\n> * 联系方式\n> * 标签\n> * (截止日期)等等\n\n![image-20210308192136686](https://i.loli.net/2021/03/08/CGZpSgRlzLNB96I.png)\n\n### （2）线下联系:phone:️\n\n> 请在文章中留下你的联系方式，可以是邮箱，电话，QQ，WX等等，注意隐私。如果文章忘记留联系方式了，你可以在评论区留言。线下向别人提供问题的详细描述和需求，协商好截止日期，完成交付。\n\n### （3）支付薪水&结束帖子:sunrise_over_mountains:\n\n> 工作完成后，如果你还满意请如发帖中悬赏金额向兼职者提供薪水，并且关闭帖子。\n\n![image-20210308193211229](https://i.loli.net/2021/03/08/3Bepuo2W9ClAv8y.png)\n\n','1368895424816312321',0,0,30,_binary '\0',_binary '\0',0,'2021-03-08 12:05:50',NULL,1,1),('1368204652836077570','LaTeX 快速入门','# LaTeX 快速入门  :star2:\n\n![](https://www.latex-project.org/img/latex-project-logo.svg)\n\n* 参考自一份其实很短的 LaTeX 入门文档：[https://liam.page/2014/09/08/latex-introduction/](https://liam.page/2014/09/08/latex-introduction/)\n* 我的LaTeX仓库：[https://github.com/LinXiaoDe/LaTeX](https://github.com/LinXiaoDe/LaTeX)\n\n## Install![VS Code + LaTeX](https://i.loli.net/2021/02/14/uOl4JX8sBNw9a3V.png)\n\n* archLinux\n\n```\nyay -S texlive-full\n```\n\n* 添加环境变量\n\n![image-20210213230531038](https://i.loli.net/2021/02/13/T4IuDldRy5wAK6a.png)\n\n* 添加环境变量\n\n```\n# 方法\nexport TexMan=\"/opt/texlive/2021/texmf-dist/doc/man\"\nexport TexInfo=\"/opt/texlive/2021/texmf-dist/doc/info\"\nexport TexLive=\"/opt/texlive/2021/bin/x86_64-linux\"\n​\nexport MANPATH=\"$MANPATH:$TexMan\"\nexport INFOPATH=\"$INFOPATH:$TexInfo\"\nexport PATH=\"$PATH:$TexLive\"\n```\n\n# Quick Start :high_brightness:\n\n## Hello World！\n\n```\n\\documentclass{article}\n% 这里是导言区\n\\begin{document}\nHello, world!\n\\end{document}\n```\n\n* 第一行 `\\documentclass{article}` 中包含了一个**控制序列**（或称命令/标记）。所谓控制序列，是以反斜杠 `\\` 开头，以第一个***空格或非字母*** 的字符结束的一串文字。它们不被输出，但是他们会影响输出文档的效果。这里的控制序列是 `documentclass`，它后面紧跟着的 `{article}` 代表这个控制序列有一个必要的参数，该参数的值为 `article`。这个控制序列的作用，是调用名为 `article` 的文档类。\n* 部分控制序列还有被方括号 `[]` 包括的可选参数。所谓文档类，即是 TeX 系统预设的（或是用户自定的）一些格式的集合。不同的文档类在输出效果上会有差别。\n* 控制序列 `begin`。这个控制序列总是与 `end` 成对出现。这两个控制序列以及他们中间的内容被称为**「环境」**；它们之后的第一个必要参数总是**一致的**，被称为环境名。只有在 `document` 环境中的内容，才会被正常输出到文档中去或是作为控制序列对文档产生影响。也就是说，在 `\\end{document}` 之后插入任何内容都是无效的。\n* **导言区**：从 `\\documentclass{article}` 开始到 `\\begin{document}` 之前的部分被称为导言区。你可以将导言区理解为是对整篇文档进行设置的区域——在导言区出现的控制序列，往往会影响整篇文档的格式。\n\n## 宏的概念\n\n* **宏包**：就是一系列控制序列的合集。这些控制序列太常用，以至于人们会觉得每次将他们写在导言区太过繁琐，于是将他们打包放在同一个文件中，成为所谓的宏包（台湾方面称之为「巨集套件」）。`\\usepackage{}` 可以用来调用宏包。\n\n## 中英混排\n\n* 中文支持：XeTeX 原生支持 Unicode，并且可以方便地调用系统字体，我们只需要使用几个简单的宏包，就能完成中文支持。\n* 中文的版式处理和标点禁则： `CTeX` 宏集一次性解决了这些问题。`CTeX` 宏集的优势在于，它能适配于多种编译方式；在内部处理好了中文和中文版式的支持，隐藏了这些细节；并且，提供了不少中文用户需要的功能接口。\n\n> 注意：`CTeX` 宏集和 `CTeX` 套装是两个不同的东西。`CTeX` 宏集本质是 LaTeX 宏的集合，包含若干文档类（`.cls` 文件）和宏包（`.sty` 文件）。`CTeX` 套装是一个**过时的** TeX 系统。新版 `CTeX` 宏集的默认能够自动检测用户的操作系统，并为之配置合适的字库。对于 Windows 用户、Mac OS X 用户和 Linux 用户，都无需做任何配置，就能使用 `CTeX` 宏集来排版中文。\n\n* 使用 `CTeX` 宏集来处理中英文混排的文档：\n\n```\n\\documentclass[UTF8]{ctexart}\n\\begin{document}\n你好，世界!\n\\end{document}\n```\n\n* 文档类从 `article` 变为 `ctexart`\n* 增加了文档类选项 `UTF8`\n\n## 组织文章\n\n### (1) 定义 标题 作者 日期\n\n```\n\\documentclass[UTF8]{ctexart}\n​\n\\title{如何组织文章}\n\\author{LinXiaoDe}\n\\date{\\today}\n​\n\\begin{document}\n\\maketitle\n你好，世界！\n\\end{document}\n```\n\n* 在 `document` 环境中，多了一个控制序列 `maketitle`：将在导言区中定义的标题、作者、日期按照预定的格式展现出来。\n* 使用`titling`宏包可以修改上述默认格式。参考[TeXdoc](http://texdoc.net/texmf-dist/doc/latex/titling/titling.pdf)。\n\n### (2) 章节和段落\n\n在文档类 `article`/`ctexart` 中，定义了五个控制序列来调整行文组织结构。他们分别是：\n\n* `\\section{·}`\n* `\\subsection{·}`\n* `\\subsubsection{·}`\n* `\\paragraph{·}`\n* `\\subparagraph{·}`\n\n> 在`report`/`ctexrep`中，还有`\\chapter{·}`；\n> \n> 在文档类`book`/`ctexbook`中，还定义了`\\part{·}`。\n\n```\n\\documentclass[UTF8]{ctexart}\n​\n\\title{如何组织文章}\n\\author{LinXiaoDe}\n\\date{\\today}\n​\n\\begin{document}\n\\maketitle\n​\n\\section{章节section}\n章节内容\n\\subsection{子章节subsection}\n子章节内容\n\\subsubsection{子子章节}\n\\paragraph{段落1}\n段落内容\n\\subparagraph{子段落}\n子段落内容\n\\subsection{子章节2}\n\\paragraph{段落2} \n段落2内容\n\\end{document}\n```\n\n### (3) 目录\n\n* 在`\\maketitle`下面插入控制序列 `\\tableofcontents`\n* 保存并用 XeLaTeX 编译**两次**\n\n```\n\\documentclass[UTF8]{ctexart}\n​\n\\title{如何组织文章}\n\\author{LinXiaoDe}\n\\date{\\today}\n​\n\\begin{document}\n\\maketitle\n\\tableofcontents\n\\section{章节section}\n章节内容\n\\subsection{子章节subsection}\n子章节内容\n\\subsubsection{子子章节}\n\\paragraph{段落1}\n段落内容\n\\subparagraph{子段落}\n子段落内容\n\\subsection{子章节2}\n\\paragraph{段落2} \n段落2内容\n\\end{document}\n```\n\n## 数学公式\n\n* 推荐一个在线公式编辑器： [https://www.latexlive.com/](https://www.latexlive.com/)\n* 在VsCode的symbols中也有相应的符号\n\n### (1) 基本方法：\n\n**在导言区加载 `amsmath` 宏包。**在行文中，使用 `$ ... $` 可以插入行内公式，使用 `\\[ ... \\]` 可以插入行间公式，如果需要对行间公式进行编号，则可以使用 `equation` 环境（还有很多其他的环境在下面介绍）：\n\n```\n\\documentclass{article}\n\\usepackage{amsmath}\n​\n\\begin{document}\n    % 行内\n    $ \\beta = \\alpha * \\kappa  $\n    % 行间\n    \\[ \\delta = \\lambda * \\xi  \\]\n    % 标号\n    \\begin{equation}\n    c = a^2 + b^2\n    \\end{equation}\n\\end{document}\n```\n\n### (2) 上下标\n\n* **公式标点使用的规范：**行内公式和行间公式对标点的要求是不同的：行内公式的标点，应该放在数学模式的限定符之外，而行间公式则应该放在数学模式限定符之内。\n\n```\n\\documentclass{article}\n\\usepackage{amsmath}\n\\begin{document}\nEinstein \'s $E=mc^2$.\n\n\\[ E=mc^2. \\]\n\n\\begin{equation}\nE=mc^2.\n\\end{equation}\n\\end{document}\n```\n\n* 在数学模式中，需要表示上标，可以使用 `^` 来实现（下标则是 `_`）\n* **它默认只作用于之后的一个字符**，如果想对连续的几个字符起作用，请将这些字符用花括号 `{}` 括起来，例如：\n\n```\n\\begin{equation}\n    z = r\\cdot e^{2\\pi i}\n\\end{equation}\n```\n\n### (3) 根式与分式\n\n* 根式用 `\\sqrt{·}` 来表示\n* 分式用 `\\frac{·}{·}` 来表示（第一个参数为分子，第二个为分母）\n\n```\n\\begin{equation}\n    \\sqrt{x}\n\\end{equation}\n\n\\begin{equation}\n    \\frac{a}{b}\n\\end{equation}\n```\n\n* 在行间公式和行内公式中，分式的输出大小是有差异的。如果要强制行内模式的分式显示为行间模式的大小，可以使用 `\\dfrac`, 反之可以使用 `\\tfrac`。\n* 在**行内写分式**，`xfrac` 宏包提供的 `\\sfrac` 命令的效果更佳。\n* 排版繁分式，你应该使用 `\\cfrac` 命令。\n\n### (3) 运算符\n\n> **基础运算符**\n\n```\n\\[ \\pm\\; \\times \\; \\div\\; \\cdot\\; \\cap\\; \\cup\\;\\geq\\; \\leq\\; \\neq\\; \\approx \\; \\equiv \\]\n```\n\n![image-20210215184147370](https://i.loli.net/2021/02/15/abm7v1dfKUYoVCS.png)\n\n> **大型运算符**\n\n* 连加、连乘、极限、积分等大型运算符分别用 `\\sum`, `\\prod`, `\\lim`, `\\int` 生成\n* 他们的上下标在行内公式中被压缩，以适应行高。我们可以用 `\\limits` 和 `\\nolimits` 来强制显式地指定是否压缩这些上下标。\n\n```\n\\begin{equation}\n    \\sum_{i=1}^n i\n    \\prod_{i=1}^n \n    \\sum\\limits _{i=1}^n i\n    \\prod\\limits _{i=1}^n \n    \\lim_{x\\to0}x^2\n    \\int_a^b x^2 dx \n    \\lim\\nolimits _{x\\to0}x^2\n    \\int\\nolimits_a^b x^2 dx\n\\end{equation}\n```\n\n![image-20210215191333051](https://i.loli.net/2021/02/15/SmL7zVyt9srbxPA.png)\n\n> 多重积分\n\n* 多重积分可以使用 `\\iint`, `\\iiint`, `\\iiiint`, `\\idotsint` 等命令输入\n\n```\n\\begin{equation}\n    \\int_a^b x^2 dx\n    \\iint_a^b x^2 dx dy\n    \\iiint_a^b x^2 dx dy dz\n\\end{equation}\n```\n\n![image-20210215192854443](https://i.loli.net/2021/02/15/ISjZbz6vVeafMWE.png)\n\n### (4) 界符\n\n* 各种括号用 `()`, `[]`, `\\{\\}`, `\\langle\\rangle` 等命令表示；因为 LaTeX 中 `|` 和 `\\|` 的应用过于随意，amsmath 宏包推荐用 `\\lvert\\rvert` 和 `\\lVert\\rVert` 取而代之。\n* 调整这些定界符的大小，amsmath 宏包推荐使用 `\\big`, `\\Big`, `\\bigg`, `\\Bigg` 等一系列命令放在上述括号前面调整大小。\n\n```\n\\begin{equation}\n    () [] \\{\\} \\langle\\rangle \\lvert\\rvert \\lVert\\rVert\\Big \n    \\{ \\Big\\}\n\\end{equation}\n```\n\n![image-20210215193812715](https://i.loli.net/2021/02/15/uabWTKwmFVkSdE2.png)\n\n### (5) 省略号\n\n省略号用 `\\dots`, `\\cdots`, `\\vdots`, `\\ddots` 等命令表示。`\\dots` 和 `\\cdots` 的纵向位置不同，前者一般用于有下标的序列。\n\n```\n\\begin{equation}\n    x_1,x_2,\\dots ,x_n\\quad 1,2,\\cdots ,n\\quad \\vdots\\quad \\ddots   \n\\end{equation}\n```\n\n![image-20210215194347265](https://i.loli.net/2021/02/15/eWRUqtYjbLAaBKF.png)\n\n### (6) 矩阵\n\n* `amsmath` 的 `pmatrix`, `bmatrix`, `Bmatrix`, `vmatrix`, `Vmatrix` 等**子环境**可以在矩阵两边加上各种分隔符。\n\n```\n\\begin{equation}\n    \\begin{pmatrix} a&b\\\\c&d \\end{pmatrix} \\quad\n    \\begin{bmatrix} a&b\\\\c&d \\end{bmatrix} \\quad\n    \\begin{Bmatrix} a&b\\\\c&d \\end{Bmatrix} \\quad\n    \\begin{vmatrix} a&b\\\\c&d \\end{vmatrix} \\quad\n    \\begin{Vmatrix} a&b\\\\c&d \\end{Vmatrix} \\quad\n\\end{equation}\n```\n\n![image-20210215195057106](https://i.loli.net/2021/02/15/Sif7xbIhMuN8zUQ.png)\n\n* 使用 `smallmatrix` 环境，可以生成行内公式的小矩阵。\n\n```\nMarry has a little matrix $ ( \\begin{smallmatrix} a&b\\\\c&d \\end{smallmatrix} ) $.\n```\n\n![image-20210215195652668](https://i.loli.net/2021/02/15/s3lNpH948kgSTC2.png)\n\n### (7) 多行公式\n\n有的公式特别长，我们需要手动为他们换行；有几个公式是一组，我们需要将他们放在一起；还有些类似分段函数，我们需要给它加上一个左边的花括号。\n\n#### 长公式\n\n* 不对齐：无须对齐的长公式可以使用 `multline` 环境，默认自带标号，如果不想用标号，则使用`multline*`环境\n\n```\n\\begin{multline}\n    z = x_1+x_2+x_3+x_4+{} \\\\\n    x_5 + x_6 + x_7\n\\end{multline}\n```\n\n![image-20210215202201533](https://i.loli.net/2021/02/15/Q2SC8lINhZ5qOjt.png)\n\n* 对齐：需要对齐的公式，可以使用 `aligned` ***次环境***来实现，它必须包含在数学环境之内。\n\n```\n\\begin{equation}\n    \\begin{aligned}\n        z = &x_1+x_2+x_3+x_4+{} \\\\\n            &x_5 + x_6 + x_7\n    \\end{aligned}\n\\end{equation}\n```\n\n![image-20210215202519568](https://i.loli.net/2021/02/15/9XUB7empROG6u12.png)\n\n#### 公式组\n\n* 无需对齐的公式组可以使用 `gather` 环境 / `gather*` 环境\n* 需要对齐的公式组可以使用 `align` 环境 /  `align*` 环境\n\n```\n\\begin{gather}\n    X = \\alpha x_1 + \\beta x_2 +\\gamma x_3 \\\\\n    Y = \\mu  y_1 + \\nu y_2\n\\end{gather}\n\n\\begin{align}\n    X &= \\alpha x_1 + \\beta x_2 +\\gamma x_3\\\\\n    Y &= \\mu  y_1 + \\nu y_2   \n\\end{align}\n```\n\n![image-20210215203448056](https://i.loli.net/2021/02/15/CgFucPwd9SJNeX8.png)\n\n* 用花括号包络的公式组可以在equation环境中嵌套`aligned`，并且在公式内部加上`\\left\\{ \\right`\n\n```\n\\begin{equation}\n	\\left\\{\n	\\begin{aligned}\n		m & = x + y + z + 1 \\\\\n		n & = 2x - y + 3z \\\\\n		r & = 5x + z\n	\\end{aligned}\n	\\right.\n\\end{equation}\n```\n\n![image-20210215204616717](https://i.loli.net/2021/02/15/dNtB6Avkwo9sIKL.png)\n\n#### 分段函数\n\n* 分段函数可以用`cases`**次环境**来实现，它必须包含在数学环境之内。\n\n```\n\\[\n    F(x) = \n    \\begin{cases}\n        -x,x\\leq 0 \\\\\n        x ,x>0    \n    \\end{cases}\n\\]\n```\n\n![image-20210215203838955](https://i.loli.net/2021/02/15/LfMp7sePEWuwG4i.png)\n\n## 插入图片和表格\n\n### 图片\n\n* `graphicx` 宏包提供的 `\\includegraphics` 命令。比如你在你的 TeX 源文件同目录下，有名为 `a.jpg` 的图片，你可以用这样的方式将它插入到输出文档中：\n\n```\n\\documentclass{article}\n\\usepackage{graphicx}\n\\begin{document}\n    \\includegraphics[width = .5\\textwidth]{a.jpg}\n\\end{document}\n```\n\n* 一个比较全面的模板\n\n```\n\\begin{figure}[htbp]	% 浮动\n    \\centering\n    \\includegraphics[width=1\\linewidth]{a}\n    \\caption{\\LaTeX 蜘蛛侠示意图}\n    \\label{fig:figure1latexintro}\n\\end{figure}\n```\n\n![image-20210215220611397](https://i.loli.net/2021/02/15/tdozFxr9ALe7wEn.png)\n\n* 子图模板\n\n```\n\\begin{figure}[htbp]\n	\\centering\n	\\subfigure[子图\\#1]\n	{\n		\\label{fig:sub1}		\n		\\includegraphics[width=0.45\\textwidth]{Figures/Subfigure_1.eps}\n	}\n	\\subfigure[子图\\#2]\n	{\n		\\label{fig:sub2}		\n		\\includegraphics[width=0.45\\textwidth]{Figures/Subfigure_2.eps}\n	}\n	\\subfigure[子图\\#3]\n	{\n		\\label{fig:sub3}		\n		\\includegraphics[width=0.45\\textwidth]{Figures/Subfigure_3.eps}\n	}\n	\\subfigure[子图\\#4]\n	{\n		\\label{fig:sub4}		\n		\\includegraphics[width=0.45\\textwidth]{Figures/Subfigure_4.eps}\n	}\n	\\caption{这里是子图(subfigure)的示例。}\n	\\label{fig:subfigure}\n\\end{figure}\n```\n\n### 表格\n\n* 一个在线表格网站：[https://www.tablesgenerator.com/](https://www.tablesgenerator.com/)\n\n```\n\\begin{tabular}{|l|c|r|}\n \\hline\n操作系统& 发行版& 编辑器\\\\\n \\hline\nWindows & MikTeX & TexMakerX \\\\\n \\hline\nUnix/Linux & teTeX & Kile \\\\\n \\hline\nMac OS & MacTeX & TeXShop \\\\\n \\hline\n通用& TeX Live & TeXworks \\\\\n \\hline![image-20210215222331352](/home/qdl/.config/Typora/typora-user-images/image-20210215222331352.png)\n \n\\end{tabular}\n```\n\n![image-20210215222331352](https://i.loli.net/2021/02/16/MhtjDdkZyI6XzOU.png)\n\n### 浮动体\n\n* 插图和表格通常需要占据大块空间，所以在文字处理软件中我们经常需要调整他们的位置。`figure` 和 `table` 环境可以自动完成这样的任务；这种自动调整位置的环境称作浮动体(float)。我们以 `figure` 为例。\n\n```\n\\begin{figure}[htbp]\n    \\centering\n    \\includegraphics{a.jpg}\n    \\caption{有图有真相}\n    \\label{fig:myphoto}\n\\end{figure}\n```\n\n`htbp` 选项用来指定插图的理想位置，这几个字母分别代表 here, top, bottom, float page，也就是就这里、页顶、页尾、浮动页（专门放浮动体的单独页面或分栏）。`\\centering` 用来使插图居中；`\\caption` 命令设置插图标题，LaTeX 会自动给浮动体的标题加上编号。注意 `\\label` 应该放在标题命令之后。\n\n## 版面设置\n\n### 页边距\n\n设置页边距，推荐使用 `geometry` 宏包。可以在[这里](http://texdoc.net/texmf-dist/doc/latex/geometry/geometry.pdf)查看它的说明文档。使用举例：将纸张的长度设置为 20cm、宽度设置为 15cm、左边距 1cm、右边距 2cm、上边距 3cm、下边距 4cm，可以在导言区加上这样几行：\n\n```\n\\usepackage{geometry}\n\\geometry{papersize={20cm,15cm}}\n\\geometry{left=1cm,right=2cm,top=3cm,bottom=4cm}\n```\n\n### 页眉页脚\n\n设置页眉页脚，推荐使用 `fancyhdr` 宏包。可以在[这里](http://texdoc.net/texmf-dist/doc/latex/fancyhdr/fancyhdr.pdf)查看它的说明文档。比如我希望，在页眉左边写上我的名字，中间写上今天的日期，右边写上我的电话；页脚的正中写上页码；页眉和正文之间有一道宽为 0.4pt 的横线分割，可以在导言区加上如下几行：\n\n```\n\\usepackage{fancyhdr}\n\\pagestyle{fancy}\n\\lhead{\\author}\n\\chead{\\date}\n\\rhead{152xxxxxxxx}\n\\lfoot{}\n\\cfoot{\\thepage}\n\\rfoot{}\n\\renewcommand{\\headrulewidth}{0.4pt}\n\\renewcommand{\\headwidth}{\\textwidth}\n\\renewcommand{\\footrulewidth}{0pt}\n```\n\n### 首行缩进\n\nCTeX 宏集已经处理好了首行缩进的问题（自然段前空两格汉字宽度）。因此，使用 CTeX 宏集进行中西文混合排版时，我们不需要关注首行缩进的问题。\n\n> 如果你因为某些原因选择不适用 CTeX 宏集（不推荐）进行中文支持和版式设置，则你需要做额外的一些工作。\n> \n> * 调用 `indentfirst` 宏包。具体来说，中文习惯于每个自然段的段首都空出两个中文汉字的长度作为首行缩进，但西文行文习惯于不在逻辑节（`\\section` 等）之后缩进。使用改宏包可使 LaTeX 在每个自然段都首行缩进。\n> * 设置首行缩进长度 `\\setlength{\\parindent}{2\\ccwd}`。其中 `\\ccwd` 是 `xeCJK` 定义的宏，它表示当前字号中一个中文汉字的宽度。\n\n### 行间距\n\n我们可以通过 `setspace` 宏包提供的命令来调整行间距。比如在导言区添加如下内容，可以将行距设置为字号的 1.5 倍：\n\n```\n\\usepackage{setspace}\n\\onehalfspacing\n```\n\n具体可以查看该宏包的[文档](http://texdoc.net/texmf-dist/doc/latex/setspace/README)。\n\n> 注意:\n> \n> * 行距是字号的 1.5 倍；\n> * 1.5 倍行距。\n> \n> 事实上，这不是设置 1.5 倍行距的正确方法，请参考[这篇博文](https://liam.page/2013/10/17/LaTeX-Linespace/)。另外，[RuixiZhang](https://github.com/RuixiZhang42) 开发了 [zhlineskip](https://github.com/CTeX-org/ctex-kit/tree/master/zhlineskip) 宏包，提供了对中西文混排更细致的行距控制能力。\n\n### 段间距\n\n我们可以通过修改长度 `\\parskip` 的值来调整段间距。例如在导言区添加以下内容\n\n```\n\\addtolength{\\parskip}{.4em}\n```\n\n## 网站汇总\n\n* 入门教程：[https://liam.page/2014/09/08/latex-introduction/](https://liam.page/2014/09/08/latex-introduction/)\n* 截屏识别：[https://mathpix.com/ ](https://mathpix.com/)\n* 绘图识别：[http://detexify.kirelabs.org/classify.html ](http://detexify.kirelabs.org/classify.html)\n* 在线LaTeX公式编辑器：[https://www.latexlive.com/](https://www.latexlive.com/)\n* 一个在线表格网站：[https://www.tablesgenerator.com/](https://www.tablesgenerator.com/)\n* 我的LaTeX仓库：[https://github.com/LinXiaoDe/LaTeX](https://github.com/LinXiaoDe/LaTeX)\n\n','1368203634308071426',0,0,27,_binary '\0',_binary '\0',0,'2021-03-06 14:19:44','2021-03-07 08:28:38',1,10),('1368558789448749057','发帖样例','## 标题\n\n:heart:️ :rocket:️ :smile:\n\n点击按钮发表想法可以进入markdown编辑界面，这里你可以按照markdown格式编辑帖子，上传图片，设置悬赏，最终发布帖子。\n\n- 代码块\n\n```\n# include <iostream>\nint main()\n{\n	cout << \"Hello world\"<<endl;\n	return 0;\n}\n```\n\n','1368540058907627521',0,0,12,_binary '\0',_binary '\0',0,'2021-03-07 13:46:57','2021-03-07 13:49:08',2,100),('1368542143220862978','我的命令行？','```\n目录：\n```\n\n[镜像]()[repository]()[压缩/解压]()[Xclip剪切板]()[摄像头]()[屏幕录制]()[放大]()[hollywood]()[终端全屏]()[设置alias别名]()[查询当前进程]()[控制流]()[管道]()[后台进程]()[apt 更新]()[ufw端口操作]()[IP地址]()[服务器ssh start]()[VNCserver]()[文件批量重命名]()[脚本传参]()[装比]()[neofetch]()\n\n## 镜像\n\nreflector的python脚本，可以帮你生成mirrorlist。\n\n```\nsudo reflector --sort rate --threads 100 -c China --save /etc/pacman.d/mirrorlist\n```\n\nreflector的man写得相当简单，这几个参数的解释可以通过执行`reflector --help`查看：\n\n1. `--sort`：`按照某个指标对镜像列表排序， --sort rate`表示用下载速度排序\n2. `-c`：限制镜像服务器所在国家或者地区，`-c China`表示只选择国内镜像\n3. `--save`：把 结果写在某文件中\n\n## repository\n\n* 安装deb\n\n```\n1. dpkg -i packageName\n2. 直接点击图形化安装\n```\n\n* 如何获取当前目录路径\n\n```\nctrl+L\n```\n\n* unzip解压乱码：\n\n```\nunzip -O GBK filename.zip\n```\n\n* 安装opencv：\n\n```\npip install opencv-python   （如果只用主模块，使用这个命令安装）\npip install opencv-contrib-python （如果需要用主模块和contrib模块，使用这个命令安装）\n```\n\n* 查看Nvidia显卡信息及使用情况\n\n```\nnvidia-smi\n```\n\n* NVIDIA显卡的信息\n\n```\nlspci | grep -i nvidia\n```\n\n## 压缩/解压\n\n* .tar 文件\n\n功能： 对文件目录进行打包备份（仅打包并非压缩）\n\n```\ntar -xvf filename.tar         # 解包\ntar -cvf filename.tar dirname # 将dirname和其下所有文件（夹）打包\n```\n\n* .gz 文件\n\n```\ngunzip filename.gz            # 解压1\ngzip -d filename.gz           # 解压2\ngzip filename                 # 压缩，只能压缩文件\n```\n\n* .tar.gz文件、 .tgz文件\n\n```\ntar -zxvf filename.tar.gz               # 解压\ntar -zcvf filename.tar.gz dirname       # 将dirname和其下所有文件（夹）压缩\ntar -C dirname -zxvf filename.tar.gz    # 解压到目标路径dirname\n```\n\n* .bz2文件\n\n```\nbzip2 -zk filename                      #将filename文件进行压缩\nbunzip2 filename.bz2                    #解压\nbzip2 -d filename.bz2                   #解压\n```\n\n* .tar.bz2文件\n\n```\ntar -jxvf filename.tar.bz               #解压\n```\n\n* .Z文件\n\n```\nuncompress filename.Z                   #解压\ncompress filename                       #压缩\n```\n\n* .tar.Z 文件\n\n```\ntar -Zxvf filename.tar.Z                #解压\ntar -Zcvf fflename.tar.Z dirname        #压缩\n```\n\n* .rar 文件\n\n```\nrar x filename.rar                      #解压\nrar a filename.rar dirname              #压缩\n```\n\n* .zip文件\n\n```\nunzip -O GBK filename.zip            # 解压（不乱码）\nzip filename.zip dirname               # 将dirname本身压缩\nzip -r filename.zip dirname            # 压缩，递归处理，将指定目录下的所有文件和子目录一并压缩\n```\n\n* `tar.xz`\n\n```\n$ tar xvJf qemu-4.2.1.tar.xz \n$ sudo ./configure --target-list=i386-softmmu\n```\n\n## Xclip剪切板\n\n```\nxclip命令 – 跨窗口复制文字\n\n$ xclip -h\nUsage: xclip [OPTION] [FILE]...\nAccess an X server selection for reading or writing.\n\n  -i, -in          read text into X selection from standard input or files\n                   (default)\n  -o, -out         prints the selection to standard out (generally for\n                   piping to a file or program)\n  -l, -loops       number of selection requests to wait for before exiting\n  -d, -display     X display to connect to (eg localhost:0\")\n  -h, -help        usage information\n      -selection   selection to access (\"primary\", \"secondary\", \"clipboard\" or \"buffer-cut\")\n      -noutf8      don\'t treat text as utf-8, use old unicode\n      -target      use the given target atom\n      -rmlastnl    remove the last newline character if present\n      -version     version information\n      -silent      errors only, run in background (default)\n      -quiet       run in foreground, show what\'s happening\n      -verbose     running commentary\n\nReport bugs to <astrand@lysator.liu.se>\n```\n\n* 将内容拷贝到剪切板（管道）\n\n```\n$ pwd | xclip -selection clipbord\n```\n\n## 摄像头\n\n* cheese\n\n```\n$ cheese\n```\n\n## 屏幕录制\n\n```\nCtr + shift + alt + r\n```\n\n## 放大\n\n```\n\'win\' + \'+\'\n```\n\n## hollywood\n\n* 安装\n\n```\nsudo apt-add-repository ppa:hollywood/ppa\nsudo apt update\nsudo apt hollywood\nsudo apt install byobu\n```\n\n* 运行\n\n```\n$ hollywood\n```\n\n## 终端全屏\n\n* 进入终端全屏：\n\n```\nctrl+alt+f1\nctrl+alt+f2\nctrl+alt+f3\nctrl+alt+f4\nctrl+alt+f5\nctrl+alt+f6\n```\n\n* 退出终端全屏：\n\n```\nctrl+alt+f7\n```\n\n* 进入退出终端全屏：\n\n```\nf11\n```\n\n* 打开一个终端：\n\n```\nctrl+alt+t\n```\n\n* 关闭一个终端：\n\n```\nexit\n```\n\n## 设置alias别名\n\n* alias\n\n```\n$ sudo vim /etc/bash.bashrc \n$ sudo vim ~/.zshrc\n\nalias rm=\'rm -i\'\nalias pwds=\'pwd | xclip -selection clipboard\'\n\n$ source /etc/bash.bashrc\n```\n\n## 查询当前进程\n\n* ps\n\n```\nps -a      	#可以例出系统当前运行的所有进程，包括由其他用户启动的进程； \nps auxww   	#是一条相当人性化的命令，它会例出除一些很特殊进程以外的所有进程，并会以一个高可读的形式显示结果，每一个进程都会有较为详细的解释；\n```\n\n## 控制流\n\n* 重定向 >，>> ，<\n\n```\n$ ls >file4.txt			# 覆盖\n$ cat file4.txt\n$ command >> filename 	# 追加\n$ sort < test.txt\n```\n\n## 管道\n\n```\n$ pwd | xclip -selection clipboard\n```\n\n* grep是“global search regular expression and print out the line”的简称，意思是全面搜索正则表达式，并将其打印出来。这个命令可以结合正则表达式使用，它也是linux使用最为广泛的命令。\n\n```\n$ grep 1 test.txt \n1\n123esdf\n1\n123esdf\n1\n123esdf\n```\n\n## 后台进程\n\n* CLI 不是系统的串行接口。您可以在执行其他命令时给出系统命令。要启动一个进程到后台，追加一个“&”到命令后面。\n\n```\nsleep 60 &\nps\n```\n\n* 如果您有一个命令将占用很多时间，您想把它放入后台运行，也很简单。只要在命令运行时按下ctrl-z，它就会停止。然后键入 bg使其转入后台。fg 命令可使其转回前台。\n\n```\nsleep 60\n<ctrl-z> # 这表示敲入Ctrl+Z键\nbg\nfg\n```\n\n* 使用 ctrl-c 来杀死一个前台进程。\n\n## apt 更新\n\n```\nsudo apt install <package>					#下载 <package> 以及所依赖的软件包，同时进行软件包的安装或者升级。\nsudo apt remove <package>					#移除 <package> 以及所有依赖的软件包。\nsudo apt-cache search <pattern>				#搜索满足 <pattern> 的软件包。\nsudo sapt-cache show/showpkg <package>		#显示软件包 <package> 的完整描述。\nsudo apt-add-repository ppa:hollywood/ppa\nsudo apt update\n```\n\n## ufw端口操作\n\n```\nsudo ufw status\nsudo ufw disable          									#关闭防火墙\nsudo ufw enable												#开启防火墙\nsudo ufw reload           									#重启防火墙，添加规则以后需要使用该命令进行重启防火墙\n\nsudo ufw allow 21               							#开放21端口\nsudo ufw delete allow 21           							#关闭21端口\nsudo ufw allow 8001/tcp            							#指定开放8001的tcp协议\nsudo ufw delete allow 8001/tcp     							#关闭21端口\nsudo ufw allow from 192.168.121.1  							#指定ip为192.168.121.1的计算机操作所有端口\nsudo ufw delete allow from 192.168.121.1					#关闭指定ip为192.168.121.1的计算机操作所有端口\nsudo ufw delete allow from 192.168.121.2 to any port 3306	#关闭指定ip为192.168.121.2的计算机对本机的3306端口的操作\nsudo ufw default deny        								#拒接所有外来访问，本机能正常访问外部\n\nsudo ufw reload           									#重启防火墙，配置生效\n```\n\n## IP地址\n\n* ifconfig\n\n```\n$ ifconfig -a\nwlp3s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500\n        inet 10.63.232.195  netmask 255.255.0.0  broadcast 10.63.255.255\n\n我的热点IP：\n192.168.43.2\n```\n\n## 服务器ssh start\n\n```\nservice ssh start\nservice ssh stop\n\nservice ssh restart\n/etc/init.d/ssh start\n```\n\n## VNCserver\n\n* [https://www.cnblogs.com/lvdongjie/p/9804438.html](https://www.cnblogs.com/lvdongjie/p/9804438.html)\n\n```\nsudo apt install tightvncserver\n```\n\n* 启动和删除\n\n```\nvncserver :1\nvncserver :2\n\nvncserver -kill :1\nvncserver -kill :2\n```\n\n## 文件批量重命名\n\n```\n#!/bin/bash\nfor name in `ls *.pptx`\ndo\nmv $name $1第${name%.pptx}小组.pptx\ndone\n```\n\n* 执行:\n\n```\n$ ./name.sh name\n```\n\n* 循环命名:\n\n```\n#!/bin/bash\n#\n# Author: Gihan De Silva @  gihansblog.com\n# rename script\n# rename.sh\n\nx=0\n\nfor i in `ls *.$1`\ndo\nmv $i $2$x.$1\nx=`expr $x + 1`\ndone\n\necho “rename done!”\n```\n\n## 脚本传参\n\n```\n$# 是传给脚本的参数个数\n\n$0 是脚本本身的名字\n$1 是传递给该shell脚本的第一个参数\n$2 是传递给该shell脚本的第二个参数\n$@ 是传给脚本的所有参数的列表\n$* 是以一个单字符串显示所有向脚本传递的参数，与位置变量不同，参数可超过9个\n$$ 是脚本运行的当前进程ID号\n$? 是显示最后命令的退出状态，0表示没有错误，其他表示有错误\n```\n\n## 装比\n\n* 奶牛说\n\n```\n$ cowsay -l # 查看其它动物的名字，然后 -f 跟上动物名，如\n$ cowsay \"I am not a cow, hahaha\"\n$ cowsay -f tux \"坑爹啊\"\n```\n\n## neofetch\n\n* 打印logo\n\n```\nneofetch --ascii_distro kali\n```\n\n','1368540058907627521',0,0,16,_binary '\0',_binary '\0',0,'2021-03-07 12:40:48',NULL,1,5),('1368205958694879233','机器学习实验5——神经网络 ','## 机器学习实验5——神经网络\n\n```\n——created by 屈德林 in 2021/01/14\n```\n\n目录：\n\n[机器学习实验5——神经网络 ]()[简介]()[运行环境]()[文件目录]()[如何运行？]()\n\n## 简介\n\n* 本文件是对lab5目录下的神经网络 代码的介绍，你将会了解lab5目录结构，以及程序运行的方法。\n\n## 运行环境\n\n* 操作系统：`Ubuntu20.04 LST`\n* 操作软件：`Pycharm`\n* 解释器：`python3.8.2`\n\n## 文件目录\n\n```\n├── BP.py\n├── data\n│   ├── 1.xls\n│   ├── 2.xls\n│   └── train.csv\n├── fig\n│   ├── BP3.png\n│   ├── BP4.png\n│   ├── BP5.png\n│   ├── BP6.png\n│   ├── BP7.png\n│   ├── BP8.png\n│   └── MLR.png\n├── MLR.py\n├── README.md\n└── SVM.py\n```\n\n* `BP.py`：BP算法\n* `data`：数据集\n* `fig`：可视化图片\n* `MLR.py`：线性回归算法\n* `SVM.py`：支持向量积\n\n## 如何运行？\n\n* 使用pythn解释器对程序进行测试\n\n```\n$ python BP.py\n```\n\n![image-20210114101546478](https://i.loli.net/2021/01/14/poz2PCruHxEOQD6.png)\n\n','1368203634308071426',0,0,49,_binary '\0',_binary '\0',0,'2021-03-06 14:24:55',NULL,1,100),('1368887145037918209','编写一个C++程序','## 主题:rocket:️ \n\n帮忙编写一个C++程序\n\n## 问题描述\n\n```\n问题描述的具体内容.......问题描述的具体内容.......\n问题描述的具体内容.......问题描述的具体内容.......\n```\n\n\n## 联系方式\n\nqdl.cs@qq.com\n\n','1368203634308071426',0,0,7,_binary '\0',_binary '\0',0,'2021-03-08 11:31:43',NULL,1,5);
/*!40000 ALTER TABLE `bms_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_post_tag`
--

DROP TABLE IF EXISTS `bms_post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_post_tag` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签ID',
  `topic_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '话题ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tag_id` (`tag_id`) USING BTREE,
  KEY `topic_id` (`topic_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='话题-标签 中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_post_tag`
--

LOCK TABLES `bms_post_tag` WRITE;
/*!40000 ALTER TABLE `bms_post_tag` DISABLE KEYS */;
INSERT INTO `bms_post_tag` VALUES (89,'1368204652940935169','1368204652836077570'),(90,'1368205958774571009','1368205958694879233'),(91,'1368478852062695426','1368478851886534657'),(92,'1368542143317331969','1368542143220862978'),(93,'1368542143363469314','1368542143220862978'),(94,'1368558789536829441','1368558789448749057'),(95,'1368887145113415681','1368887145037918209'),(96,'1368895732149743617','1368895732082634754');
/*!40000 ALTER TABLE `bms_post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_promotion`
--

DROP TABLE IF EXISTS `bms_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_promotion` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '广告标题',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '广告链接',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='广告推广表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_promotion`
--

LOCK TABLES `bms_promotion` WRITE;
/*!40000 ALTER TABLE `bms_promotion` DISABLE KEYS */;
INSERT INTO `bms_promotion` VALUES (4,'LinXiaoDe','https://github.com/LinXiaoDe','LinXiaoDe的Github'),(5,'Nexus','https://github.com/Nexus-HH','Nexus的Github');
/*!40000 ALTER TABLE `bms_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_tag`
--

DROP TABLE IF EXISTS `bms_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_tag` (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标签',
  `topic_count` int NOT NULL DEFAULT '0' COMMENT '关联话题',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_tag`
--

LOCK TABLES `bms_tag` WRITE;
/*!40000 ALTER TABLE `bms_tag` DISABLE KEYS */;
INSERT INTO `bms_tag` VALUES ('1368204652940935169','LaTeX',1),('1368205958774571009','机器学习',1),('1368478852062695426','健康打卡',1),('1368542143317331969','Linux',1),('1368542143363469314','bash',1),('1368558789536829441','测试',1),('1368887145113415681','C++',1),('1368895732149743617','社区',1);
/*!40000 ALTER TABLE `bms_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_tip`
--

DROP TABLE IF EXISTS `bms_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bms_tip` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '作者',
  `type` tinyint NOT NULL COMMENT '1：使用，0：过期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24897 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='每日赠言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_tip`
--

LOCK TABLES `bms_tip` WRITE;
/*!40000 ALTER TABLE `bms_tip` DISABLE KEYS */;
INSERT INTO `bms_tip` VALUES (24864,'总之岁月漫长，然而值得等待。','村上春树',1),(24867,'凡是过去，皆为序章。','莎士比亚',1),(24868,'少年与爱永不老去，即便披荆斩棘，丢失怒马鲜衣。','莫峻',1),(24869,'没有一个冬天不可逾越，没有一个春天不会来临。','南方周末',1),(24870,'浅水是喧哗的，深水是沉默的。','雪莱',1),(24871,'四方食事，不过一碗人间烟火。','小灯泡儿',1),(24872,'天可补，海可填，南山可移。日月既往，不可复追。','曾国藩',1),(24873,'我走得很慢，但我从不后退。','林肯',1),(24874,'花看半开，酒饮微醺。','菜根谭',1),(24875,'花开如火，也如寂寞。','顾城',1),(24876,'愿你一生努力，一生被爱。想要的都拥有，得不到的都释怀。','八月长安',1),(24878,'纵使黑夜吞噬了一切，太阳还可以重新回来。','汪国真',1),(24879,'一星陨落，黯淡不了星空灿烂；一花凋零，荒芜不了整个春天。','巴尔扎克',1),(24880,'我有一瓢酒，可以慰风尘。','韦应物',1),(24881,'鲸落海底，哺暗界众生十五年。','加里·斯奈德',1),(24882,'我荒废了时间，时间便把我荒废了。','莎士比亚',1),(24883,'只有流过血的手指，才能弹出世间的绝唱。','泰戈尔',1),(24884,'夜暗方显万颗星，灯明始见一缕尘。','七堇年',1),(24885,'月缺不改光，剑折不改刚。','梅尧臣',1),(24886,'活着不一定要鲜艳，但一定要有自己的颜色。','张曙光',1),(24887,'掉头一去是风吹黑发，回首再来已雪满白头。','余光中',1),(24888,'万物皆有裂痕，那是光照进来的地方。','莱昂纳德·科恩',1),(24889,'每个人都在愤世疾俗，每个人又都在同流合污。','自由在高处',1),(24890,'你生而有翼，为何竟愿一生匍匐前进，形如虫蚁。','贾拉尔·阿德丁·鲁米',1),(24891,'浮名浮利，虚苦劳神。叹隙中驹，石中火，梦中身。','苏轼',1),(24892,'少年安得长少年，海波尚变为桑田。','李贺',1),(24893,'谁终将声震人间，必长久深自缄默；谁终将点燃闪电，必长久如云漂泊。','尼采',1),(24894,'容颜会老去，四季不会停。那些散碎在笔尖的光阴，寂静欢喜。','陆苏',1),(24895,'当华美的叶片落尽，生命的脉络才历历可见。','聂鲁达',1),(24896,'日出之美便在于它脱胎于最深的黑暗。','辛夷坞',1);
/*!40000 ALTER TABLE `bms_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirm_token`
--

DROP TABLE IF EXISTS `confirm_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confirm_token` (
  `id` varchar(20) NOT NULL,
  `token` varchar(12) NOT NULL,
  `create_time` datetime NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirm_token`
--

LOCK TABLES `confirm_token` WRITE;
/*!40000 ALTER TABLE `confirm_token` DISABLE KEYS */;
INSERT INTO `confirm_token` VALUES ('1368597754302263298','JOI5PP','2021-03-07 16:21:47','1368597754251931649');
/*!40000 ALTER TABLE `confirm_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'小龙虾',100);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_user`
--

DROP TABLE IF EXISTS `ums_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_user` (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户昵称',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '密码',
  `avatar` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机',
  `score` int NOT NULL DEFAULT '0' COMMENT '积分',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'token',
  `bio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个人简介',
  `active` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否激活，1：是，0：否',
  `status` bit(1) DEFAULT b'1' COMMENT '状态，1：使用，0：停用',
  `role_id` int DEFAULT NULL COMMENT '用户角色',
  `create_time` datetime NOT NULL COMMENT '加入时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_name` (`username`) USING BTREE,
  UNIQUE KEY `ums_user_id_uindex` (`id`),
  UNIQUE KEY `ums_user_email_uindex` (`email`),
  KEY `user_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_user`
--

LOCK TABLES `ums_user` WRITE;
/*!40000 ALTER TABLE `ums_user` DISABLE KEYS */;
INSERT INTO `ums_user` VALUES ('1368203634308071426','qdl','qdl','5b5e5ad6b1123e5f90ba997b100fd2f1','http://jobever.cn/images/811376b1-8dc3-4699-8864-e79feb60ec83.jpg','qdl.cs@qq.com',NULL,4,'','爱运动，爱编程，爱分享！',_binary '',_binary '',NULL,'2021-03-06 14:15:41',NULL),('1368540058907627521','LinXiaoDe','LinXiaoDe','5b5e5ad6b1123e5f90ba997b100fd2f1','http://jobever.cn/images/8344e34d-5676-450b-91eb-a902146a197e.jpeg','1468114337@qq.com',NULL,2,'','自由职业者',_binary '',_binary '',NULL,'2021-03-07 12:32:31',NULL),('1368597754251931649','45456','45456','f638f4354ff089323d1a5f78fd8f63ca','https://s3.ax1x.com/2020/12/01/DfHNo4.jpg','1945552610@qq.com',NULL,0,'','自由职业者',_binary '\0',_binary '',NULL,'2021-03-07 16:21:47',NULL),('1368895424816312321','admin','admin','5b5e5ad6b1123e5f90ba997b100fd2f1','https://s3.ax1x.com/2020/12/01/DfHNo4.jpg','qdl.cs@foxmail.com',NULL,1,'','自由职业者',_binary '',_binary '',NULL,'2021-03-08 12:04:37',NULL);
/*!40000 ALTER TABLE `ums_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-19 16:36:57
