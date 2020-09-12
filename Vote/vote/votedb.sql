SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `users`;
create table `users`(
	`id` int(10) not null AUTO_INCREMENT,
	`ip` varchar(20) not null,
	`lastTime` BIGINT(8) not null,
	primary key (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `vote`;
create table `vote`(
	`id` int(10) auto_increment,
	`title` varchar(50) not null,
	`num` int not null,
	primary key (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS `verify`;
create table `verify`(
	`id` int(10) auto_increment,
	`vCode` varchar(50) not null,
	`active` BIT DEFAULT 1,
	primary key (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `active` BIT DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

SET FOREIGN_KEY_CHECKS = 1;



insert into `vote` (`title`, `num`) values
	("谢啦啦",0),
	("小拳脚",0),
	("穆穆",0);

insert into `verify` (`vCode`, `active`) values 
	("Q09qoM",1),
	("S9Ly3x",1),
	("vpWQek",1),
	("KrS3zi",1),
	("3twiM7",1),
	("58hXwy",1),
	("dpctnB",1),
	("3ESYVH",1),
	("uEGeqZ",1),
	("3nMzqI",1);

