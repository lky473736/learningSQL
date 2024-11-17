-- lab1
SHOW DATABASES;
USE world;
SHOW TABLES;
SHOW TABLE STATUS;

DESC country;
DESC countrylanguage;

------

-- lab2
SELECT * FROM city;
SELECT Name, Population FROM city;
SELECT Name FROM city WHERE Population < 10000;
SELECT * FROM city WHERE Population < 10000 AND Population > 9000;

SELECT * FROM country;
SELECT * FROM city WHERE CountryCode = "KOR";
SELECT * FROM city WHERE CountryCode = "USA";
SELECT * FROM city WHERE CountryCode = "KOR" AND Population >= 1000000;

------

-- lab3
SELECT * FROM city WHERE Population BETWEEN 1000 AND 5000; -- 1000과 5000 사이
SELECT * FROM city WHERE Name IN('Seoul', 'New York', 'Tokyo'); -- 내가 정한 것만 보기
SELECT * FROM city WHERE CountryCode IN('KOR', 'USA', 'JPN');

------

-- lab4
SELECT * FROM city WHERE CountryCode LIKE 'KO_'; -- KO 뒤에 어떤 글자
SELECT * FROM city WHERE Name LIKE 'S%'; -- S 뒤에 아무거나 (길이 제한 x) 
SELECT * FROM city WHERE CountryCode=( SELECT CountryCode 
									   FROM city 
                                       WHERE Name='Seoul');
SELECT * FROM city WHERE Population > ANY ( SELECT Population
											FROM city
											WHERE District = 'New York'); -- ANY == SOME
SELECT * FROM city WHERE Population < SOME ( SELECT Population
											 FROM city
                                             WHERE CountryCode="KOR");
SELECT Name, District FROM city WHERE CountryCode = ANY ( SELECT CountryCode
														  FROM city
														  WHERE Population < 5000);
SELECT Name FROM city WHERE Population <= ALL (SELECT Population
											   FROM city
											   WHERE CountryCode="JPN" AND Name != 'P%');
SELECT * FROM city WHERE CountryCode="JPN" ORDER BY Population DESC;
SELECT * FROM city WHERE CountryCode="JPN" ORDER BY Population ASC, Population DESC;

SELECT * FROM city WHERE CountryCode='KOR' ORDER BY Population DESC;
DESC country;
SELECT * FROM country ORDER BY SurfaceArea DESC;

------

-- lab5
SELECT DISTINCT CountryCode FROM city; -- 중복 제거
SELECT * FROM city ORDER BY Population DESC LIMIT 10; -- 10개만
SELECT CountryCode, MAX(Population) FROM city GROUP BY CountryCode; 
-- city에 여러 CountryCode가 있을 수 있는데, 그룹으로 묶어서 보여
SELECT CountryCode, MIN(Population) AS 'Minima' FROM city GROUP BY CountryCode;

SELECT COUNT(ID) FROM city;
SELECT AVG(Population) FROM city;

------

-- lab6
SELECT CountryCode, MAX(Population) FROM city GROUP BY CountryCode HAVING MAX(Population) > 10000000;
-- HAVING은 반드시 GROUP BY 뒤에
SELECT CountryCode, Name, AVG(Population) FROM city GROUP BY CountryCode, Name WITH ROLLUP; -- 중간합계 (GROUP BY 뒤에 WITH ROLLUP)
SELECT * FROM city JOIN country ON city.CountryCode = country.Code; -- 2개 테이블 조인

SELECT * FROM city JOIN country ON city.CountryCode = country.Code
				   JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode; -- 3개 테이블 조인
				

------

-- lab7
SELECT LENGTH('hello');
SELECT CONCAT('10101010', 'siba');
SELECT LOCATE('lim', 'wowwowwowwowwowwowimwowwowwow'); -- mysql에서 문자열 시작 인덱스는 1임 (0이 아니라)
SELECT LEFT('wowwowwow wow wowwowwow', 5);
SELECT RIGHT('wowwowwow wow wowwowwow!!!!!', 10);
SELECT UPPER('wow wow wowwowwow wow');
SELECT LOWER('shush THE MOUSE');
SELECT REPLACE('gachon univ', 'gachon', 'seoul nat`l');
SELECT UPPER(TRIM('          wowwowwow!!!!!!!!!!!!!!!!!!!!    '));
SELECT FLOOR(10.9), CEIL(3.14), ROUND(9.99);
SELECT SQRT(100), POW(10, 2), EXP(10), LOG(10, 10000);
SELECT SIN(60), COS(60), TAN(60);
SELECT ABS(-1000), RAND(), ROUND(RAND() * 100, 0); 
SELECT NOW(), CURDATE(), CURTIME();
SELECT DATE(NOW()), MONTH(NOW()), DAY(NOW()), HOUR(NOW()), MINUTE(NOW()), SECOND(NOW());

------

-- lab8
CREATE TABLE city2 as SELECT Name FROM city;
SELECT * FROM city2;
CREATE DATABASE lky;
USE lky;
CREATE TABLE test1;
CREATE TABLE test2 (
	id INT NOT NULL PRIMARY KEY,
    col1 INT NULL, 
    col2 FLOAT NULL,
    col3 VARCHAR(30) NULL
);
DESC test2;
ALTER TABLE test2 ADD col4 INT NULL;
DESC test2;
ALTER TABLE test2 MODIFY col4 FLOAT NULL;
DESC test2;
ALTER TABLE test2 DROP col4;
DESC test2;

------

-- lab9
CREATE INDEX col1idx ON test2 (col1);
SHOW INDEX FROM test2;
CREATE UNIQUE INDEX col2idx on test2 (col2);
SHOW INDEX FROM test2;

-------

-- lab10
CREATE VIEW testview as SELECT col1, col2 FROM test2;
SELECT * FROM testview;

-------

-- lab11

DESC test2;
INSERT INTO test2 VALUES(1, 10, 0.4, 'daramji'); -- INSERT INTO test2 SELECT * FROM test1와 같은 꼬라지도 가능함 (복사의 역할)
SELECT * FROM test2;
UPDATE test2 SET col1=4 WHERE id=1;
SELECT * FROM test2;
DELETE FROM test2 WHERE id=2; -- 복구 가능한 삭제
SELECT * FROM test2;
TRUNCATE TABLE test2; -- 복구 불가능한 삭제 (영구삭제)
SELECT * FROM test2;
DROP TABLE test2;
DROP DATABASE lky;