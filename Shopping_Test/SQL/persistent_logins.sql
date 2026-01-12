-- 자동 로그인 테이블
DROP TABLE IF EXISTS `persistent_logins` CASCADE;
CREATE TABLE `persistent_logins` (
  `p_no` int NOT NULL AUTO_INCREMENT COMMENT '자동 로그인 번호',
  `user_id` varchar(255) NOT NULL COMMENT '회원 아이디',
  `token` varchar(255) NOT NULL COMMENT '토큰',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일자',
  PRIMARY KEY (`p_no`),
  UNIQUE KEY `unique_token` (`token`)
) COMMENT '자동 로그인';
