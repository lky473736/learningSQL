CREATE TABLE  성적정보 ( 
학번   INTEGER NOT  NULL,
이름   TEXT, 
점수   INTEGER,
평점   TEXT, 
PRIMARY KEY(학번) 
) ; 

INSERT INTO 성적정보 VALUES (20201, '홍길동', 95, 'A') ;  
INSERT INTO 성적정보 VALUES (20202, '박나래', 98, 'A') ;
INSERT INTO 성적정보 VALUES (20203, '김철수', 45, 'F') ;
INSERT INTO 성적정보 VALUES (20204, '강호동', 87, 'B') ;  
INSERT INTO 성적정보 VALUES (20205, '유재석', 78, 'C') ;
INSERT INTO 성적정보 VALUES (20206, '장발장', 79, 'C') ;
INSERT INTO 성적정보 VALUES (20207, '김숙희', 92, 'A') ;  

SELECT COUNT(이름) FROM 성적정보;

SELECT SUM(점수) FROM 성적정보;

SELECT AVG(점수) FROM 성적정보;

SELECT MAX(점수) FROM 성적정보;

SELECT MIN(점수) FROM 성적정보;

SELECT 이름, MIN(점수) FROM 성적정보;

SELECT 평점 FROM 성적정보 GROUP BY 평점;

SELECT COUNT(점수) FROM 성적정보 GROUP BY 평점;

SELECT 평점, COUNT(점수) FROM 성적정보 GROUP BY 평점;

SELECT 평점, COUNT(점수), AVG(점수) FROM 성적정보 GROUP BY 평점;

SELECT * FROM 성적정보 ORDER BY 점수 DESC;

SELECT 평점, COUNT(점수) FROM 성적정보 GROUP BY 평점 ORDER BY COUNT(점수) DESC;
