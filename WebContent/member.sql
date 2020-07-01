CREATE TABLE IF NOT EXISTS member(
   id VARCHAR(20) NOT NULL,
   passwd  VARCHAR(20),
   name VARCHAR(30),    
   PRIMARY KEY (id)
);

select * from member;

drop table board;
CREATE TABLE IF NOT EXISTS board (
  board_id int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id varchar(20) NOT NULL COMMENT "작성자 ID",
  category varchar(20) NOT NULL COMMENT "카테고리",
  user_name varchar(30) NOT NULL COMMENT "작성자 이름",
  subject varchar(50) NOT NULL COMMENT "게시글 제목",
  contents text NOT NULL COMMENT "게시글 내용",
  hits int(10) unsigned DEFAULT 0 COMMENT "조회수",
  reg_date datetime NOT NULL COMMENT "등록일",
  pros int(10) DEFAULT 0 COMMENT "찬성수",
  cons int(10) DEFAULT 0 COMMENT "반대수"
);
drop table comment;
CREATE TABLE IF NOT EXISTS comment (
  comment_id int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  board_id int(10) NOT NULL COMMENT "게시글 ID",
  user_id varchar(20) NOT NULL COMMENT "작성자 ID",
  user_name varchar(30) NOT NULL COMMENT "작성자 이름",
  contents varchar(400) NOT NULL COMMENT "댓글내용 내용",
  reg_date datetime NOT NULL COMMENT "등록일",
  stand char NOT NULL COMMENT "찬성인지 반대인지",
  up int(10) unsigned DEFAULT 0 COMMENT "추천수",
  opposition int(10) COMMENT "반대한 의견"
);