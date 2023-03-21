CREATE TABLE  환자정보 ( 
이름   TEXT, 
주민번호   TEXT NOT  NULL,
PRIMARY KEY(주민번호) 
) ; 

INSERT INTO 환자정보 VALUES ('홍길동', '970405-1201234') ;  
INSERT INTO 환자정보 VALUES ('박나래', '990101-1245667') ;
INSERT INTO 환자정보 VALUES ('김철수', '981225-2412234') ;

CREATE TABLE 진료정보 ( 
주민번호   TEXT  NOT NULL, 
진단   TEXT,
PRIMARY KEY(주민번호) 
) ; 

INSERT INTO 진료정보 VALUES ('970405-1201234', '식중독') ;  
INSERT INTO 진료정보 VALUES ('981225-2412234', '장염') ;
INSERT INTO 진료정보 VALUES ('990101-1245667', '감기') ;

SELECT * FROM 환자정보, 진료정보 WHERE 환자정보.주민번호 = 진료정보.주민번호;

SELECT 환자정보.이름, 환자정보.주민번호, 진료정보.진단 FROM 환자정보, 진료정보 WHERE 환자정보.주민번호 = 진료정보.주민번호;

SELECT 이름, 환자정보.주민번호, 진단 FROM 환자정보, 진료정보 WHERE 환자정보.주민번호 = 진료정보.주민번호;

SELECT 이름, 진단 FROM 환자정보, 진료정보 WHERE 환자정보.주민번호 = 진료정보.주민번호;

SELECT 이름, 진단 FROM 환자정보, 진료정보 WHERE 환자정보.주민번호=진료정보.주민번호 and 이름='박나래';

SELECT 이름, 진료정보.주민번호, 진단 FROM 환자정보, 진료정보 WHERE 환자정보.환자주민번호=진료정보.주민번호;

SELECT 이름, 주민번호, 진단 FROM 환자정보, 진료정보 WHERE 환자주민번호=주민번호;
