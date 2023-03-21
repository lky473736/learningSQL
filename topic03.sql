 CREATE TABLE  학생정보 (
   학번   INTEGER   NOT  NULL,
   이름   TEXT,
   연락처  TEXT,
   PRIMARY KEY(학번)
); 

INSERT INTO 학생정보  VALUES (20200001, '김가천',  '010-1234-5678');
INSERT INTO 학생정보  VALUES (20200002, '홍길동',  '010-2345-6789');
INSERT INTO 학생정보  VALUES (20200003, '박나래',  '010-3456-7890');
