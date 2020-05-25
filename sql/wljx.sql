/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.7.24 : Database - classonline
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wljx` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wljx`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`password`) values (1,'青鸟佳城','1234');

/*Table structure for table `banji` */

DROP TABLE IF EXISTS `banji`;

CREATE TABLE `banji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` text,
  `professionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banji_ibfk_1` (`professionId`),
  CONSTRAINT `banji_ibfk_1` FOREIGN KEY (`professionId`) REFERENCES `profession` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `banji` */

insert  into `banji`(`id`,`name`,`description`,`professionId`) values (4,'计算机15-2','计算机15-2班xxxx',2),(5,'自动化14-1','自动化玩啥呢',3);

/*Table structure for table `doc` */

DROP TABLE IF EXISTS `doc`;

CREATE TABLE `doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` varchar(20) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `teacherId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doc_ibfk_1` (`teacherId`),
  CONSTRAINT `doc_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `doc` */

insert  into `doc`(`id`,`createTime`,`name`,`teacherId`) values (5,'2019-04-22 16:16:25','虚拟化技术','1002'),(7,'2019-04-22 16:34:55','agagaga','1002');

/*Table structure for table `doc_detail` */

DROP TABLE IF EXISTS `doc_detail`;

CREATE TABLE `doc_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docId` int(11) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `uploadTime` varchar(20) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `doc_detail_ibfk_1` (`docId`),
  CONSTRAINT `doc_detail_ibfk_1` FOREIGN KEY (`docId`) REFERENCES `doc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `doc_detail` */

insert  into `doc_detail`(`id`,`docId`,`name`,`url`,`uploadTime`,`size`,`description`) values (6,5,'虚拟化技术第二章.pptx','2019/04/22/4067a87643d64e438c952b101954f21b-虚拟化技术第二章.pptx','2019-04-22 16:17:57','406.5KB','扑克牌【死哦反对派【估计撒反扑阿娇破地方'),(7,7,'实体类.txt','2019/04/22/e2c4b79ed9c74dc09db831336c7dfe03-实体类.txt','2019-04-22 16:34:55','1.5KB','agasdfafadfadfadf'),(8,5,'虚拟化技术第二章.pptx','2019/04/22/879370ed842f4bb7b3aa1df41c0a6ec8-虚拟化技术第二章.pptx','2019-04-22 16:35:27','406.5KB','安居房破爱判断付款啦换地方了');

/*Table structure for table `doc_download` */

DROP TABLE IF EXISTS `doc_download`;

CREATE TABLE `doc_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docdetailId` int(11) DEFAULT NULL,
  `stuId` varchar(20) DEFAULT NULL,
  `downTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doc_download_ibfk_1` (`stuId`),
  KEY `doc_download_ibfk_2` (`docdetailId`),
  CONSTRAINT `doc_download_ibfk_1` FOREIGN KEY (`stuId`) REFERENCES `student` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doc_download_ibfk_2` FOREIGN KEY (`docdetailId`) REFERENCES `doc_detail` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `doc_download` */

/*Table structure for table `job` */

DROP TABLE IF EXISTS `job`;

CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `uploadTime` varchar(20) DEFAULT NULL,
  `lastTime` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `teacherId` varchar(20) DEFAULT NULL,
  `banjiId` int(11) DEFAULT NULL,
  `professionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_ibfk_1` (`banjiId`),
  KEY `job_ibfk_2` (`professionId`),
  KEY `job_ibfk_3` (`teacherId`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`banjiId`) REFERENCES `banji` (`id`) ON DELETE CASCADE,
  CONSTRAINT `job_ibfk_2` FOREIGN KEY (`professionId`) REFERENCES `profession` (`id`) ON DELETE CASCADE,
  CONSTRAINT `job_ibfk_3` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `job` */

insert  into `job`(`id`,`name`,`url`,`uploadTime`,`lastTime`,`state`,`teacherId`,`banjiId`,`professionId`) values (1,'人工智能第一次作业','2019/04/22/7c760f3ce485492984592d244eecd18d-c9d52eb5.ini','2019-04-22 10:36:06','2019-04-24',0,'1002',4,2);

/*Table structure for table `link` */

DROP TABLE IF EXISTS `link`;

CREATE TABLE `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `imgUrl` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `link` */

insert  into `link`(`id`,`name`,`imgUrl`,`url`) values (1,'广东石油化工学院','2019/04/19/ee1b8620cfdc4311abfac92dad2a5941-gy.png','http://www.gdupt.edu.cn'),(2,'广州大学','2019/04/19/27397900869c4e91b12ae2ded9865558-gzdx.jpg','http://www.gzhu.edu.cn/');

/*Table structure for table `liuyan` */

DROP TABLE IF EXISTS `liuyan`;

CREATE TABLE `liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  `liuyanTime` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `answer` int(11) DEFAULT '0',
  `stuId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `liuyan_ibfk_1` (`stuId`),
  CONSTRAINT `liuyan_ibfk_1` FOREIGN KEY (`stuId`) REFERENCES `student` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `liuyan` */

insert  into `liuyan`(`id`,`title`,`content`,`liuyanTime`,`state`,`answer`,`stuId`) values (2,'gg','自动发噶阿凡达士大夫','2019-04-22 11:07:03',0,0,'123456');

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `noticeTime` varchar(40) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adminId` (`adminId`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

insert  into `notice`(`id`,`title`,`content`,`noticeTime`,`adminId`) values (1,'6月24日系统停用的通知','因服务器磁盘空间不足，6月24日下午1点—6月15日下午4点系统将停用一天，给师生们带来不便，尽情谅解。','2016-06-24',1),(2,'如何解决网络教学平台访问慢的问题','网络教学平台是华数网络，若访问的网络是电信网络，访问的数度会较慢，附件上传也会很慢，老师们可以先拨上学校的VPN，然后通过http://192.168.150.181来进行访问，谢谢大家的配合。','2013-09-24',1),(3,'教学材料只允许在线浏览的方法说明','为使老师能将WORD、PDF和PPT等文档上传到网络教学平台，而学生只能在线浏览，不能直接下载，老师可以用下面的工具将WORD、PDF和PPT转换成swf格式，然后在编辑里点击按钮，将本地转换好的SWF上传到网络教学平台，这样能实了只能浏览不能下载的功能了。\r\n\r\n\r\nword pdf转换falsh工具\r\n\r\nppt转换flash工具','2017-09-24',1),(4,'关于学生无法浏览教师上传材料的说明','学生无法浏览教师上传的原因是课程里没有学生信息，请老师在“课程管理”—“选课学生管理”里将学生加入即可。','2019-04-14',1),(5,'广东石油化工学院MOOC教学管理平台试运行通知公告','广东石油化工学院MOOC教学管理平台现正试运行，该平台暂时分为三个部分，第一部分是学校现在已经购买的在线通识课程（尔雅通识课）；第二部分是学校老师正在建设的课程，其中包括一些精品课程的转换建设；第三部分是在线慕课共享资源，平台给老师们提供在线使用的备课资源库服务，与网络教学平台无缝对接，教师在使用网络教学平台进行课程建设、备课、授课过程中随时可以搜索、引用、无缝插入这些备课资源库中的资源。\r\n我们学校老师的账号正在导入中，导入完成后，每位老师可以用与教务系统相同的账号登陆，原始密码是123456,请老师们登陆后自行修改密码。由于正在试运行，在此过程中有遇见问题，请联系技术员李海英老师，电话是：2923757-115。平台在登陆过程中要是出现显示故障，请尝试采用搜狗或者火狐浏览器。','2019-04-14',1);

/*Table structure for table `pinglun` */

DROP TABLE IF EXISTS `pinglun`;

CREATE TABLE `pinglun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `liuyanId` int(11) DEFAULT NULL,
  `teacherId` varchar(20) DEFAULT NULL,
  `plTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pinglun_ibfk_1` (`teacherId`),
  KEY `pinglun_ibfk_2` (`liuyanId`),
  CONSTRAINT `pinglun_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pinglun_ibfk_2` FOREIGN KEY (`liuyanId`) REFERENCES `liuyan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pinglun` */

/*Table structure for table `pinglun2` */

DROP TABLE IF EXISTS `pinglun2`;

CREATE TABLE `pinglun2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `liuyanId` int(11) DEFAULT NULL,
  `stuId` varchar(20) DEFAULT NULL,
  `plTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stuId` (`stuId`),
  KEY `liuyanId` (`liuyanId`),
  CONSTRAINT `pinglun2_ibfk_1` FOREIGN KEY (`stuId`) REFERENCES `student` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pinglun2_ibfk_2` FOREIGN KEY (`liuyanId`) REFERENCES `liuyan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pinglun2` */

/*Table structure for table `profession` */

DROP TABLE IF EXISTS `profession`;

CREATE TABLE `profession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `introduction` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `profession` */

insert  into `profession`(`id`,`name`,`introduction`) values (2,'计算机','计算机专门学计算的'),(3,'自动化','发噶啊速度快点放假啊的那份麻辣看'),(6,'发生的','234啊的撒法发大幅度');

/*Table structure for table `stu_job` */

DROP TABLE IF EXISTS `stu_job`;

CREATE TABLE `stu_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) DEFAULT NULL,
  `finishTime` varchar(20) DEFAULT NULL,
  `stuId` varchar(20) DEFAULT NULL,
  `jobId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stu_job_ibfk_1` (`stuId`),
  KEY `stu_job_ibfk_2` (`jobId`),
  CONSTRAINT `stu_job_ibfk_1` FOREIGN KEY (`stuId`) REFERENCES `student` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stu_job_ibfk_2` FOREIGN KEY (`jobId`) REFERENCES `job` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `stu_job` */

insert  into `stu_job`(`id`,`url`,`finishTime`,`stuId`,`jobId`) values (1,'2019/04/22/48e8cb588a474e7683cc6bd27adf9694-config.data','2019-04-22 10:39:52','123123',1),(2,'2019/04/22/b54c14923bbd4cc0ad29b3047b5c8134-5ad09f0e.ini','2019-04-22 10:41:58','123456',1),(3,'2019/04/22/1b1899f8b7874a43b4215789d148db6e-CustomFace.db','2019-04-22 10:45:50','56789',1),(4,'2019/04/22/2a0ea822004849c3b1cee1c665bf8f0c-CustomFace.dbc','2019-04-22 10:46:40','34567',1);

/*Table structure for table `stu_teacher` */

DROP TABLE IF EXISTS `stu_teacher`;

CREATE TABLE `stu_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` varchar(20) DEFAULT NULL,
  `teacherId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stu_teacher_ibfk_1` (`stuId`),
  KEY `stu_teacher_ibfk_2` (`teacherId`),
  CONSTRAINT `stu_teacher_ibfk_1` FOREIGN KEY (`stuId`) REFERENCES `student` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stu_teacher_ibfk_2` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stu_teacher` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `ruxueTime` varchar(20) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `banjiId` int(11) DEFAULT NULL,
  `professionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_ibfk_1` (`banjiId`),
  KEY `student_ibfk_2` (`professionId`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`banjiId`) REFERENCES `banji` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`professionId`) REFERENCES `profession` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`name`,`password`,`sex`,`age`,`ruxueTime`,`url`,`banjiId`,`professionId`) values ('0000000','绿卡交流发','7fa8282ad93047a4d6fe6111c93b308a','女',11,'2013-02-27','2019/04/21/d6a7ec34074d4b599036832821ca5730-slide3.jpg',4,2),('123123','小黑','e10adc3949ba59abbe56e057f20f883e','男',22,'2019-04-10','2019/04/22/0e52c09ef4d34e618bedcab63ca4c7f2-51c90607a7fc6.jpg',4,2),('123456','小白','e10adc3949ba59abbe56e057f20f883e','女',18,'2015-03-26','2019/04/22/61793e60c54f426e98b6762ae7e329a3-1.jpg',4,2),('34567','小猪','e10adc3949ba59abbe56e057f20f883e','女',16,'2019-04-09','2019/04/22/ec02866e6ae746b9bc33d772ac2a817e-t010288146daf30146c.jpg',4,2),('5555555','啊发的发','e10adc3949ba59abbe56e057f20f883e','男',12,'2019-04-03','2019/04/21/c5da55d4042847ccab1173fd8ae04883-9317290-1_w_5.jpg',5,3),('56789','小米','e10adc3949ba59abbe56e057f20f883e','男',14,'2016-03-23','2019/04/22/3768baaac7834ec49377144a4cf4df4d-daxiong.jpg',4,2);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`name`,`password`,`sex`,`age`,`url`) values ('1002','张三','e10adc3949ba59abbe56e057f20f883e','女',40,'2019/04/22/e33d57c7aa55419db884ef7f9b2c7d43-5465a39024560.jpg'),('10086','afaf','e10adc3949ba59abbe56e057f20f883e','男',22,'2019/04/21/3eeea7159e4e40f690bdf733a5a695f3-sadface.jpg');

/*Table structure for table `teacher_job` */

DROP TABLE IF EXISTS `teacher_job`;

CREATE TABLE `teacher_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` varchar(20) DEFAULT NULL,
  `jobId` int(11) DEFAULT NULL,
  `teacherId` varchar(20) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `grade` double DEFAULT NULL,
  `pigaiTime` varchar(20) DEFAULT NULL,
  `banjiId` int(11) DEFAULT NULL,
  `professionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_job_ibfk_1` (`stuId`),
  KEY `FK_teacher_job` (`banjiId`),
  KEY `FK_teacher_job1` (`professionId`),
  KEY `teacher_job_ibfk_2` (`jobId`),
  KEY `teacher_job_ibfk_3` (`teacherId`),
  CONSTRAINT `FK_teacher_job` FOREIGN KEY (`banjiId`) REFERENCES `banji` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_teacher_job1` FOREIGN KEY (`professionId`) REFERENCES `profession` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teacher_job_ibfk_1` FOREIGN KEY (`stuId`) REFERENCES `student` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teacher_job_ibfk_2` FOREIGN KEY (`jobId`) REFERENCES `job` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teacher_job_ibfk_3` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher_job` */

/*Table structure for table `video` */

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `uploadTime` varchar(20) DEFAULT NULL,
  `videoUrl` varchar(100) DEFAULT NULL,
  `imageUrl` varchar(100) DEFAULT NULL,
  `teacherId` varchar(100) DEFAULT NULL,
  `playNum` int(11) DEFAULT '0',
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_ibfk_1` (`teacherId`),
  CONSTRAINT `video_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `video` */

insert  into `video`(`id`,`name`,`uploadTime`,`videoUrl`,`imageUrl`,`teacherId`,`playNum`,`description`) values (1,'人工智能第一课','2019-04-22','2019/04/22/a5059279e2e84f57ae9fb2ba798daf9a-01 开发工具.mp4','2019/04/22/22615c9a11c040559f258be9e68edb7a-5465a39024560.jpg','1002',0,'啊嘎嘎是打发打发 '),(2,'人工智能第二课','2019-04-22','2019/04/22/1c4d1d0b0cdb4e88a092bd1264adfbea-23 总结.mp4','2019/04/22/b998d5cc68c14176967c8e4b0f9d98a1-slide3.jpg','1002',0,'了就哦啊哈佛埃霍夫搭配'),(4,'ag 啊','2019-04-22','2019/04/22/6b014ed2aaed4e8c8417910bf9b0f4be-06 文档类型字符集.avi','2019/04/22/543a8d0cee314fc39cf211239b48affb-slide2.jpg','1002',0,'啊打发手动阀手动阀');

/*Table structure for table `videoplay` */

DROP TABLE IF EXISTS `videoplay`;

CREATE TABLE `videoplay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `videoId` int(11) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `clickTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `videoplay_ibfk_1` (`videoId`),
  CONSTRAINT `videoplay_ibfk_1` FOREIGN KEY (`videoId`) REFERENCES `video` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `videoplay` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
