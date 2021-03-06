CREATE TABLE `goods` (
	`GOODS_NO` int(11) NOT NULL AUTO_INCREMENT COMMENT '물품관리번호',
	`GOODS_TYPE` varchar(4) NOT NULL COMMENT '물품타입(GOTY)',
	`SITE` varchar(4) NOT NULL COMMENT '물품지정건물(SITE)',
	`GOODS_NO_AREA` int(11) DEFAULT '0' COMMENT '물품관리장소(시설관리번호)',
	`AREA_DETAIL` varchar(500) DEFAULT NULL COMMENT '물품장소상세',
	`NAME` varchar(100) NOT NULL COMMENT '물품명',
	`MANAGE_NO` varchar(100) DEFAULT NULL COMMENT '물품관리번호(일련번호)',
	`MAX_CNT` int(11) NOT NULL DEFAULT '1' COMMENT '최대갯수 (최대수용인원)',
	`START_HOUR` int(2) DEFAULT '0' COMMENT '물품사용시간 (시작)',
	`END_HOUR` int(2) DEFAULT '24' COMMENT '물품사용시간 (종료시간)',
	`TEACHER_ID` varchar(30) NOT NULL COMMENT '관리교사',
	`REQUEST_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '시설사용허용여',
	`PUBLIC_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '공개여부',
	`ORD` int(11) DEFAULT '0' COMMENT '관리순서',
	`STATUS` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '현재상태',
	`REG_USER` varchar(30) NOT NULL COMMENT '등록자',
	`REG_DATE` datetime NOT NULL COMMENT '등록일',
	`UPDATE_USER` varchar(30) DEFAULT NULL COMMENT '수정자',
	`UPDATE_DATE` datetime DEFAULT NULL COMMENT '수정일',
	PRIMARY KEY (`GOODS_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='물품/시설 관리';

컬럼명과 컬럼순서가 중요하고 컬럼순서가 다르면 by name을 누르면 된다.