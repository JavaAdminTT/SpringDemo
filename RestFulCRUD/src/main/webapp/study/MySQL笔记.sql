-- 给root用户设置密码为123456
mysql> set password for 'root'@'localhost' = password('123456');

-- 用客户端登录到服务器(mysqld.exe)
cmd> mysql -uroot -p123456

-- 查看所有数据库名
mysql> show databases;

-- 创建新数据库
mysql> create database company;

-- 切换当前工作数据库
mysql> use company;

-- 查看当前库的所有表名
mysql> show tables;

-- 导入现成的数据
mysql> source d:/mywork/mysql/company.sql;

-- 查看表中的所有数据
mysql> select * from employees;

-- mysql对于数据管理
服务器
	数据库1(目录)
		表1
			数据1(记录)
			数据2(记录)
		表2
		表3
		...
	数据库2(目录)
	...

-- 创建数据库 world
create database world;
use world;

-- 导入world.sql
source d:/mywork/mysql/world.sql;
 
-- 查看有哪些表, 表中有哪些数据
show tables;
select * from 表名;

cmd> mysql -uroot -p12345 
cmd> mysql -h127.0.0.1 -P3306 -uroot -p123456
cmd> mysql --host=127.0.0.1 --port=3306 --user=root --password=123456 

-- 查看当前工作数据库
mysql> select database();

-- 切换工作数据库
use 数据库名;

表头 == 列名 == 字段 

-- 查看表结构
describe employees;

-- 上面的简写的方式:
desc employees;

-- 创建表
create table customer(
	id int,
	name varchar(20),
	email varchar(30),
	age int,
	birthday date
);

--数据插入
insert into customer(id, name, email, age, birthday) values (1, '张三', 'zhang3@abc.com', 30, '1999-2-5');
insert into customer(id, name, email, age, birthday) values (2, '李四', 'li4@abc.com', 40, '1989-3-6');

-- 修改所有数据
update customer set age = 50, birthday = '1979-8-5';
-- 修改指定的记录
update customer set age = 30, birthday = '1999-2-5' where id = 1;

-- 删除记录, 删除所有记录
delete from customer;
-- 删除指定的记录
delete from customer where id = 1;
-- 查询表中的数据
select * from customer;

CRUD C--Create-insert R retrive select U update update D delete delete 

-- 丢弃表
drop table customer;

// 创建Student表, 列id, name, gender, age, score
// 插入3条记录
// 把第一条的年龄改成25
// 删除最后一条记录
// 丢弃表 

关系型数据库 RDBMS 
表和表之间有依赖关系.

SELECT 
	department_id, 
	location_id
FROM   
	departments;
	
SELECT 
	location_id,
	department_id	
FROM   
	departments;
	
虚表 : 查询结果, 不是真实存在的, 而是把基表拆分成多个列, 临时拼接的.

SELECT 
	location_id as 位置,
	department_id "dep Id"	-- as关键字可以省略
FROM   
	departments;

行过滤, 在基表的所有记录的基础上过滤, 只保留条件为true的,为false的丢弃掉.
select 
	name, 
	continent,
	population
from 
	country
where
	continent = 'asia';
	
-- 查询人口总数大于1亿的国家的名称和大洲和人口和人均寿命.
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Field          | Type                                                                                  | Null | Key | Default | Extra |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Code           | char(3)                                                                               | NO   | PRI |         |       |
| Name           | char(52)                                                                              | NO   |     |         |       |
| Continent      | enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') | NO   |     | Asia    |       |
| Region         | char(26)                                                                              | NO   |     |         |       |
| SurfaceArea    | float(10,2)                                                                           | NO   |     | 0.00    |       |
| IndepYear      | smallint(6)                                                                           | YES  |     | NULL    |       |
| Population     | int(11)                                                                               | NO   |     | 0       |       |
| LifeExpectancy | float(3,1)                                                                            | YES  |     | NULL    |       |
| GNP            | float(10,2)                                                                           | YES  |     | NULL    |       |
| GNPOld         | float(10,2)                                                                           | YES  |     | NULL    |       |
| LocalName      | char(45)                                                                              | NO   |     |         |       |
| GovernmentForm | char(45)                                                                              | NO   |     |         |       |
| HeadOfState    | char(60)                                                                              | YES  |     | NULL    |       |
| Capital        | int(11)                                                                               | YES  |     | NULL    |       |
| Code2          | char(2)                                                                               | NO   |     |         |       |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
select 
	name,
	continent,
	population pop,
	lifeexpectancy life 
from
	country 
where 
	population > 100000000;

-- 查询你的老家有哪些城市.
+-------------+----------+------+-----+---------+----------------+
| Field       | Type     | Null | Key | Default | Extra          |
+-------------+----------+------+-----+---------+----------------+
| ID          | int(11)  | NO   | PRI | NULL    | auto_increment |
| Name        | char(35) | NO   |     |         |                |
| CountryCode | char(3)  | NO   | MUL |         |                |
| District    | char(20) | NO   |     |         |                |
| Population  | int(11)  | NO   |     | 0       |                |
+-------------+----------+------+-----+---------+----------------+
select 
	*
from
	city 
where 
	district = 'peking';

-- 范围过滤
SELECT last_name, salary
FROM   employees
WHERE  salary BETWEEN 2500 AND 3500; -- 包含2500和3500 相当于 salary >= 2500 && salary <= 3500

-- 集合过滤
SELECT employee_id, last_name, salary, manager_id
FROM   employees
WHERE  manager_id IN (100, 101, 201); -- 包含100, 101, 201, 相当于 manager_id == 100 || manager_id == 101 || manager_id == 201


SELECT
	first_name
FROM
	employees
WHERE
	first_name LIKE 'S%';
	
SELECT
	first_name
FROM
	employees
WHERE
	first_name LIKE 'Steven';

SELECT
	first_name
FROM
	employees
WHERE
	first_name LIKE '_t%';

-- 查询城市表中的城市名中包含yk的
select 
	*
from
	city 
where 
	name like '%yk%';
	
-- 查询城市表中的城市名中以don结尾的
select 
	*
from
	city 
where 
	name like '%don';

-- 查询哪些员工没有上司	
select * 
from employees 
where manager_id = null; -- 如果null参与任何的比较运算, 结果总是false

select * 
from employees 
where manager_id is null;

+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Field          | Type                                                                                  | Null | Key | Default | Extra |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Code           | char(3)                                                                               | NO   | PRI |         |       |
| Name           | char(52)                                                                              | NO   |     |         |       |
| Continent      | enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') | NO   |     | Asia    |       |
| Region         | char(26)                                                                              | NO   |     |         |       |
| SurfaceArea    | float(10,2)                                                                           | NO   |     | 0.00    |       |
| IndepYear      | smallint(6)                                                                           | YES  |     | NULL    |       |
| Population     | int(11)                                                                               | NO   |     | 0       |       |
| LifeExpectancy | float(3,1)                                                                            | YES  |     | NULL    |       |
| GNP            | float(10,2)                                                                           | YES  |     | NULL    |       |
| GNPOld         | float(10,2)                                                                           | YES  |     | NULL    |       |
| LocalName      | char(45)                                                                              | NO   |     |         |       |
| GovernmentForm | char(45)                                                                              | NO   |     |         |       |
| HeadOfState    | char(60)                                                                              | YES  |     | NULL    |       |
| Capital        | int(11)                                                                               | YES  |     | NULL    |       |
| Code2          | char(2)                                                                               | NO   |     |         |       |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
-- 查看哪些国家没有首都
select 
	name,
	population,
	continent
from 
	country 
where 
	capital is null;
-- 查看哪些国家尚未独立
select 
	name,
	population,
	continent
from 
	country 
where 
	IndepYear is null;
-- 查看哪些国家有首都
select 
	name,
	population,
	continent
from 
	country 
where 
	capital is not null;
	
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary >=10000
AND    job_id LIKE '%MAN%';

SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary >=10000
OR    job_id LIKE '%MAN%';

select * 
from 
	employees 
where 
	1 + 2;
	
select * 
from 
	employees 
where 
	1 - 1;
	
select * 
from 
	employees 
where 
	0 - 1;

-- 查询亚洲国家哪些人口小于500万
select
	*
from 
	country 
where 
		continent = 'asia'
	and 
		population < 5000000;
	
-- 查询中国的哪些城市人口是大于100万 
select 
	*
from 
	city 
where 
		countrycode = 'chn'
	and 
		population > 1000000;
-- 查询哪些国家的人均寿命是小于50岁
select 
	*
from
	country 
where 
	LifeExpectancy < 50;

-- order by 排序, 对虚表中的数据进行排序
select 
	* 
from 
	employees 
where 
	department_id = 90
order by
	salary;

-- 查看所有员工的工资, 从大到小排序显示
select 
	first_name,
	salary
from
	employees 
order by 
	salary desc; -- descend 降序
	
-- 查看亚洲最富有的国家
select 
	name, gnp, gnpold
from 
	country 
where 
	continent = 'asia'
order by 
	gnpold; -- 如果排序的列中有null值, 总是最小
-- 查看日本城市人口最多的城市
select 
	*
from 
	city 
where 
	countrycode = 'jpn'
order by 
	population;
-- 查看哪个国家人均寿命最低
select 
	*
from 
	country 
where 
	lifeexpectancy is not null
order by 
	LifeExpectancy desc ;

-- 查看全球所有的国家 按照大洲排序
select * from country 
order by continent;

-- 下面的SQL不对, where中使用了虚表的列名, 在执行where时虚表尚未产生, 所以不能使用
select 
	first_name name,
	salary sal 
from 
	employees
where 
	sal > 10000 
order by 
	sal;
	
-- 先按照第一个列排序, 再在相同的第一列的数据内部再按第二列进行微排.
SELECT last_name, department_id, salary
FROM   employees
ORDER BY department_id asc, salary DESC;

-- 查看各大洲的人口顺序
select 
	name,
	continent,
	population pop
from 
	country 
order by 
	continent,
	pop desc;

-- 查看员工的部门ID, 所有员工的部门ID
select 
	department_id
from 
	employees;

-- 查看员工表中的不同的部门ID
select 
	distinct department_id
from 
	employees;	
	
-- 查看全球不同大洲
select 
	distinct continent 
from 
	country;

-- 查看全球不同的政府组织形式
select 
	distinct governmentform
from 
	country;
-- 查看中国有哪些不同的省份
select 
	distinct district 
from 
	city 
where 
	countrycode = 'chn';
	
-- 查看当前工作数据库  select 后面查询函数
select database() -- from 表;
select database() from dual;

select concat('aaa', 'bbb');
select now();

-- 字面量, 常量
select 100;

-- 变量 
int a = 200;

set @a = 200;
select @a;

-- 表达式
select 283*234+3248;

-- 混合查询,以基表的记录为基础.
select 
	now(),
	database(),
	3.14,
	@a,
	23423*238+32823,
	first_name,
	salary
from 
	employees;

解决一个SQL的步骤.
1) 解决基表 from
2) 不是要保留所有数据时 处理where ,过滤行, 虚表产生OK
3) 要查看哪些列	select 
4) 虚表的显示是否有要求 order by, 升序还是降序. 


多张表联接, 表名之间用逗号隔开
select 
	*
from 
	employees,
	departments;
	

多表查询
create table city2 select * from city where name = 'london';
create table country2 select * from country where code in('gbr', 'can');

-- 两张表联接, 产生4条记录, 左表记录*右表记录
select 
	* 
from 
	city2,
	country2;
	
-- 逗号联接, 表之间用,隔开

里面有垃圾数据, 使用where过滤, 
select 
	* 
from 
	city2,
	country2
where 
	countrycode = code;

-- 查询城市名称和国家名称及国家人口和城市人口
select 
	name,
	name,
	population,
	population
from 
	city2,
	country2
where 
	countrycode = code;
	
-- 区分模糊列名
select 
	city2.name cityName,
	country2.name as countryName,
	country2.population countryPop,
	city2.population as cityPop
from 
	city2,
	country2
where 
	countrycode = code;
	
-- 表的别名
select 
	ci.name cityName,
	co.name as countryName,
	co.population countryPop,
	ci.population as cityPop
from 
	city2 as ci,
	country2 co
where 
	ci.countrycode = co.code;

-- 表的别名使用注意 : 一旦使用了别名, 原名就不能再使用了, 原因是from总是最先执行.	
select 
	city2.name cityName,
	country2.name as countryName,
	country2.population countryPop,
	city2.population as cityPop
from 
	city2 as ci,
	country2 co
where 
	ci.countrycode = co.code;
	
-- 又加入了新的条件
select 
	ci.name cityName,
	co.name as countryName,
	co.population countryPop,
	ci.population as cityPop
from 
	city2 as ci,
	country2 co
where 
		ci.countrycode = co.code -- 此条件非常重要, 表的联接条件
	and 
		ci.population > 1000000;
		
select 
	ci.name cityName,
	co.name as countryName,
	co.population countryPop,
	ci.population as cityPop
from 
	city2 as ci,
	country2 co
where 
		ci.population > 1000000 -- 这是普通条件
	and 
		ci.countrycode = co.code; -- 此条件非常重要, 表的联接条件

内联接 inner join 
select 
	ci.name cityName,
	co.name as countryName,
	co.population countryPop,
	ci.population as cityPop
from 
	city2 ci 
inner join -- 内联接
	country2 co 
on -- 特别指定这是联接条件
	ci.countrycode = co.code
where 
	ci.population > 1000000;
	
-- on where 可以互相代替, 虽然可以替代,但是实际中必须on后面跟联接条件, where后面跟普通条件 
select 
	ci.name cityName,
	co.name as countryName,
	co.population countryPop,
	ci.population as cityPop
from 
	city2 ci 
join -- 内联接 inner关键字可以省略
	country2 co 
on -- 特别指定这是联接条件
	ci.countrycode = co.code
where   
	ci.population > 1000000;
	
-- 查询所有国家的名称和首都的名称.
select
	country.name country,
	city.name capital
from 
	country 
join 
	city 
on 
	country.capital = city.id;
	
-- 查询所有国家的官方语言
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| CountryCode | char(3)       | NO   | PRI |         |       |
| Language    | char(30)      | NO   | PRI |         |       |
| IsOfficial  | enum('T','F') | NO   |     | F       |       |
| Percentage  | float(4,1)    | NO   |     | 0.0     |       |
+-------------+---------------+------+-----+---------+-------+
select 
	country.name,
	cl.language
from 
	country 
join 
	countrylanguage cl 
on 
	country.code = cl.countrycode
where 
	cl.isofficial = 'T';

-- 查询国家及首都
select 
	ci.name cityName,
	co.name as countryName,
	co.population countryPop,
	ci.population as cityPop
from 
	city2 ci 
join 
	country2 co 
on 
	co.capital = ci.id;
	
-- 内联接的特点 : 把不符合联接条件的行全部丢弃.

select 
	country2.name,
	city2.name capital 
from 
	country2 
join 
	city2 
on 
	country2.capital = city2.id;
	
-- 外联接的特点 : 会保证某张表的完整性.
-- left outer join 左外联接 , 保证左表的数据完整
-- right outer join 右外联接 , 保证右表的数据完整
-- 如果是外联接,必须有on, 不可以用where代替!!
select 
	country2.name,
	city2.name capital 
from 
	country2 
left outer join 
	city2 
on 
	country2.capital = city2.id;
	
select 
	country2.name,
	city2.name capital 
from 
	country2 
left join -- left outer join  
	city2 
on 
	country2.capital = city2.id;
	
-- 查看所有的国家的首都, 如果没有首都也显示!!
select
	country.name country,
	city.name capital
from 
	country 
left join 
	city 
on 
	country.capital = city.id
order by 
	country.capital desc;
	
复习 : 
连接服务器 
mysql --host=服务器主机地址 --port=服务器端口号 --user=用户名 --password=密码 工作数据库

mysql -h127.0.0.1 -P3306 -uroot -p123456 工作数据库

-- 查看服务器中有哪些数据库
show databases;

-- 切换工作数据库
use 新库名;

-- 查看当前数据库中的表
show tables;

DDL 数据定义语言 目标:数据库对象(数据库, 表, 视图, 列, 存储过程, 函数, 预编译, 触发器....)
DML 数据操纵语言 目标:数据 (select insert update delete)

-- 查看其他库中的表
show tables from 库名;

-- 查看表结构 
desc 表名;

-- 查看表的建表语句
show create table 表名;

InnoDB 数据库引擎 特点 : 支持事务支持外键 : 速度慢 
MyIssam 引擎 特点 : 不支持事务, 不支持外键. 优点 : 速度快

数据库对象名全部应该用``包围

-- 跨库处理表
库名.表名 ;

-- 创建数据库
create database 库名;

-- 查看建库语句
show create database 库名;

-- 丢弃数据库
drop database 库名;

-- 查询 
select 
	表限定.列名1,
	表限定.列名2,
	...
	函数调用,
	常量,
	表达式,
	变量( set @变量名= 初值, 全局变量:@@全局变量名)
	...
from 
	表1
(left,right)join -- 外联的特点保证某张表的数据完整
	表2 
on 
	表1和表2的联接条件
join 
	表3 
on 
	表1和表2的联接虚表和 表3的联接条件
join 
	表4
on
	前面的大虚表和 表4 的联接条件	
where 
	对最终的大虚表进行行过滤.
	常量(如果是0代表假, 如果是非0代表真)
	表达式 
	比较运算(=, >, >=, <, <=, <> !=)
	逻辑运算(and, or, not)
	特殊的 between a and b , in(a, b, c, d), like '_%', is null, is not null 
order by 
	排序依据的列1 升序还是降序,
	排序依据的列2 升序还是降序

-- 全球究竟有哪些不同的语言
select 
	distinct language
from 
	countrylanguage;

-- 所有国家名称和首都及国家的官方语言
select 
	co.name,
	ci.name,
	cl.language
from 
	country co
join 
	city ci
on 
	co.capital = ci.id  
join 
	countrylanguage cl 
on 
	co.code = cl.countrycode 
where 
	cl.isofficial = 't';
	
-- 所有国家名称和首都及国家的官方语言,如果国家没有首都或官方语言,也显示.
select 
	co.name,
	ci.name,
	cl.language
from 
	country co
left join 
	city ci
on 
	co.capital = ci.id  
left join 
	countrylanguage cl 
on 
		co.code = cl.countrycode 
	and 
		cl.isofficial = 't'
order by 
	cl.language desc;
	
-- 单行函数 (针对的是每一条记录)
select 
	upper(first_name),
	lower(email),
	concat(first_name, last_name) name
from 
	employees;
	
-- 把员工姓名拼接起来,姓和名中间用 隔开
select 
	concat(concat(first_name, ' '), last_name) name
from 
	employees;
	
select 
	concat(first_name, ' ', last_name) name
from 
	employees;
	
组函数, 聚集函数
select 
	avg(salary),
	max(salary),
	min(salary)
from 
	employees;

select
	first_name, -- 代表个体的列绝不允许!!!
	min(salary),
	avg(salary)
from 
	employees;
	
-- 计数
select 
	count(first_name)
from 
	employees;
	
-- 如果count中的列的有null值的情况, 不能完成表记录的统计
select 
	count(manager_id)
from 
	employees;
	
主键 : 非空并唯一

-- 正式的统计表中的记录
select 
	count(*)
from 
	employees;
	
-- 查看国家的面积最小是多少
select 
	min(surfacearea)
from 
	country;
-- 查看亚洲国家人口最少是多少 
select 
	min(population)
from 
	country
where 
	continent = 'asia';
	
-- 一旦有分组的列, 最好把分组的列名放在select后面
select
	department_id, 
	avg(salary)
from 
	employees
group by 
	department_id;

-- 查看各大洲的最大国土面积
select 
	continent,
	max(surfaceArea) maxSur
from 
	country 
group by 
	continent
having -- 对分组后的虚表进行过滤
	maxSur > 10000000;

-- 查看各国有多少个不同的省份
select 
	countrycode,
	count(distinct district)
from 
	city 
group by 
	countrycode;
	
-- 查看各政府组织形式各有多少个国家.
select 
	governmentform,
	count(*)
from 
	country 
group by 
	governmentform;

// 一个完整的查询
select 
	分组依据的列,
	组函数
from 
	表1
join
	表2 
on
	联接条件
where 
	普通过滤条件
group by 
	分组依据的列(最好应该有相同值)
having 
	分组后的虚表进行过滤条件(组函数)
order by 
	只能跟在select后面有的列

步骤:
1) from 确定基表
2) 判断一张表够不够 如果不够 join 考虑外联还是内联
3) 一旦有join必须有on 
4) 是否需要进一步再过滤 where 
5) 是否要进行分组, 如果要分组, 依据的列是什么 group by 
6) 一旦有分组, 必须把分组的列放在select 后面查询函数
7) 进一步处理select 要查看哪些列
8) 分组后的虚表进行过滤 having 
9) 是否要依据某列排序显示, order by 

查询每个大洲的各有多少种政府组织形式和各大洲最富有的收入
select 
	continent,
	count(distinct governmentform),
	max(gnp)
from 
	country 
group by 
	continent;

查询每个国家各有多少个城市和每个国家的城市总人口数
select 
	countrycode,
	count(*),
	sum(population)
from 
	city 
group by 
	countrycode;

列出所有在超过10个国家中使用的语言。
select
	language,
	count(countrycode) ct 
from 
	countrylanguage cl 
group by 
	language
having 
	ct > 10;

中国有多少个城市
select
	count(*)
from 
	city 
where 
	countrycode = 'chn';
	
select 
	countrycode,
	count(*)
from 
	city 
group by 
	countrycode 
having 
	countrycode = 'chn';

列出不同的国家(country code)有居民超过7,000,000的城市， 它们有多少？
select 
	countrycode,
	count(*)
from 
	city 
where 
	population > 7000000
group by 
	countrycode;

查询中国的每个省的总城市数量和总人口数,按总人口数降序显示
select 
	district,
	count(*),
	sum(population) sumpop
from 
	city 
where 
	countrycode = 'chn'
group by 
	district
order by 
	sumpop desc;
	
-- 2
select 
	countrycode,
	district,
	count(*),
	sum(population) sumpop
from 
	city 
group by 
	district
having 
	countrycode = 'chn'
order by 
	sumpop desc;	


每个国家各有多少种语言
select 
	countrycode,
	count(language)
from 
	countrylanguage cl 
group by 
	countrycode;

美国有多少种语言
select 
	countrycode,
	count(language)
from 
	countrylanguage cl 
where 
	countrycode = 'usa';

Sweden国家说的是什么语言？
select 
	co.name,
	cl.language
from 
	countrylanguage cl 
join 
	country co 
on 
	cl.countrycode = co.code 
where 
	co.name = 'sweden';

哪些国家没有列出任何使用语言？
select 
	co.name
from 
	country co 
left join 
	countrylanguage cl 
on 
	co.code = cl.countrycode 
where 
	cl.language is null;
	
select 
	co.name,
	count(language) ct
from 
	country co 
left join 
	countrylanguage cl 
on 
	co.code = cl.countrycode 
group by 
	co.name 
having 
	ct = 0;

列出在城市表中80%人口居住在城市的国家
select 
	co.name,
	sum(ci.population) / co.population rate
from 
	city ci 
join 
	country co 
on 
	ci.countrycode = co.code 
group by 
	co.name 
having 
	rate > 0.8;

查询哪些国家的语言超过10种
select 
	countrycode,
	count(language) ct 
from 
	countrylanguage cl 
group by 
	countrycode
having
	ct > 10;
	
-- 子查询
select 
	last_name,
	salary 
from 
	employees
where 
	salary >= (select salary from employees where last_name='abel');
	
-- 谁的工资比平均工资还低
select 
	last_name,
	salary 
from 
	employees 
where 
	salary < (select avg(salary) from employees);
	
-- 查询所有员工姓名和上司姓名
select 
	a.first_name, 
	b.first_name
from 
	employees a
left join 
	(
		select employee_id, first_name from employees 
	) as b 
on 
	a.manager_id = b.employee_id; 
	
-- < ANY 就是要小于集合中的任意值, 其实就是小于最大值即可.	
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ANY
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
AND    job_id <> 'IT_PROG';

-- < ALL 就是要小于集合中的所有值, 其实就是小于最小值
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ALL
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
AND    job_id <> 'IT_PROG';

-- IN表示只要值是等于集合中的任意一个时为真
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary IN
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
AND    job_id <> 'IT_PROG';

-- 查询亚洲国家哪个国家人口最少
select 
	name,
	population
from 
	country 
where 
		population = (select min(population) from country where continent = 'asia')
	and 
		continent = 'asia';
	
-- 查询印度哪个城市的人口最多
select 
	name,
	population 
from 
	city 
where 
		population = (select max(population) from city where countrycode = 'ind')
	and 
		countrycode = 'ind';
		
-- 查询哪些国家的人均寿命高于平均寿命
select 
	name,
	lifeexpectancy
from 
	country 
where 
	lifeexpectancy > (select avg(lifeexpectancy) from country)
order by 
	lifeexpectancy;

-- 丢弃库
drop database if exists atguigu;
-- 建库 
create database if not exists atguigu charset utf8;
-- 修改字符集
alter database atguigu charset gbk;

-- 创建表
create table if not exists teacher (
	id int auto_increment,
	name varchar(20),
	age int,
	salary double,
	hiredate date,
	primary key(id) -- 表级主键
) charset gbk engine innodb;

insert into teacher (
	id,
	name,
	age,
	salary,
	hiredate 
) values (
	null,
	'佟刚',
	30,
	5000,
	'2010-5-2'
);

insert into teacher (
	id,
	name,
	age,
	salary,
	hiredate 
) values (
	null,
	'封捷',
	40,
	6000,
	'2010-6-2'
);

-- 和原表看起来一样, 实际不一样, 没有把表的约束复制
-- 适用于创建临时表使用
create table teacher2 as select * from teacher;

-- 复制表(只能复制表结构)没有数据
create table teacher3 like teacher;

create table if not exists classes (
	id int auto_increment,
	name varchar(10),
	room int,
	begindate date,
	master int,
	primary key(id) -- 表级主键
);

create table if not exists student (
	id int primary key auto_increment, -- 列级主键
	name varchar(30),
	class_id int,
	mobile varchar(15),
	gender enum('男', '女') default '男'
);

-- 表的修改
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | int(11)     | NO   | PRI | NULL    | auto_increment |
| name     | varchar(20) | YES  |     | NULL    |                |
| age      | int(11)     | YES  |     | NULL    |                |
| salary   | double      | YES  |     | NULL    |                |
| hiredate | date        | YES  |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
-- 添加到最后
alter table teacher 
add gender enum('男', '女') default '男';

-- 添加到某列后面
alter table teacher
add mobile varchar(15) after age;

-- 添加到最前面
alter table teacher
add address varchar(15) first;

-- not null 是一个列级约束, 作用是定义此列的数据不能为空
alter table teacher
add pid varchar(20) not null first;

+----------+-----------------+------+-----+---------+----------------+
| Field    | Type            | Null | Key | Default | Extra          |
+----------+-----------------+------+-----+---------+----------------+
| pid      | varchar(20)     | NO   |     | NULL    |                |
| address  | varchar(15)     | YES  |     | NULL    |                |
| id       | int(11)         | NO   | PRI | NULL    | auto_increment |
| name     | varchar(20)     | YES  |     | NULL    |                |
| age      | int(11)         | YES  |     | NULL    |                |
| mobile   | varchar(15)     | YES  |     | NULL    |                |
| salary   | double          | YES  |     | NULL    |                |
| hiredate | date            | YES  |     | NULL    |                |
| gender   | enum('男','女') | YES  |     | 男      |                |
+----------+-----------------+------+-----+---------+----------------+

-- 修改数据长度
alter table teacher 
modify pid varchar(25) not null;

-- 修改数据类型
alter table teacher 
modify mobile int;

-- 如果表中有数据改变数据类型要小心,有可能失败
alter table teacher 
modify name int;

-- 修改列名和数据类型等
alter table teacher 
change name tname varchar(20) not null;

-- 丢弃列, 注意: 一旦列被丢弃, 列对应的数据也被丢弃, 而且是不可恢复
alter table teacher 
drop column pid;

-- 丢弃表, 不会出错. 数据全部丢失,和表相关的所有其他对象也自动被丢弃.
-- 使用子查询创建teacher2表
drop table if exists teacher2;

-- 清空表, 是一个DDL语句, 删除数据效率高
truncate table teacher;

-- 重命名
alter table teacher3 
rename to teacher_copy;

+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| CountryCode | char(3)       | NO   | PRI |         |       |
| Language    | char(30)      | NO   | PRI |         |       |
| IsOfficial  | enum('T','F') | NO   |     | F       |       |
| Percentage  | float(4,1)    | NO   |     | 0.0     |       |
+-------------+---------------+------+-----+---------+-------+
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Field          | Type                                                                                  | Null | Key | Default | Extra |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Code           | char(3)                                                                               | NO   | PRI |         |       |
| Name           | char(52)                                                                              | NO   |     |         |       |
| Continent      | enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') | NO   |     | Asia    |       |
| Region         | char(26)                                                                              | NO   |     |         |       |
| SurfaceArea    | float(10,2)                                                                           | NO   |     | 0.00    |       |
| IndepYear      | smallint(6)                                                                           | YES  |     | NULL    |       |
| Population     | int(11)                                                                               | NO   |     | 0       |       |
| LifeExpectancy | float(3,1)                                                                            | YES  |     | NULL    |       |
| GNP            | float(10,2)                                                                           | YES  |     | NULL    |       |
| GNPOld         | float(10,2)                                                                           | YES  |     | NULL    |       |
| LocalName      | char(45)                                                                              | NO   |     |         |       |
| GovernmentForm | char(45)                                                                              | NO   |     |         |       |
| HeadOfState    | char(60)                                                                              | YES  |     | NULL    |       |
| Capital        | int(11)                                                                               | YES  |     | NULL    |       |
| Code2          | char(2)                                                                               | NO   |     |         |       |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
+-------------+----------+------+-----+---------+----------------+
| Field       | Type     | Null | Key | Default | Extra          |
+-------------+----------+------+-----+---------+----------------+
| ID          | int(11)  | NO   | PRI | NULL    | auto_increment |
| Name        | char(35) | NO   |     |         |                |
| CountryCode | char(3)  | NO   | MUL |         |                |
| District    | char(20) | NO   |     |         |                |
| Population  | int(11)  | NO   |     | 0       |                |
+-------------+----------+------+-----+---------+----------------+
考试
1 哪些国家没有列出任何使用语言？(2种做法)
select 
	co.name 
from 
	country co 
left join 
	countrylanguage cl 
on 
	co.code = cl.countrycode 
where 
	cl.language is null;
	
-- 2
select 
	co.name,
	count(language) ct 
from 
	country co 
left join 
	countrylanguage cl 
on 
	co.code = cl.countrycode 
group by 
	co.name 
having 
	ct = 0;
	
2 列出在城市表中80%人口居住在城市的国家
select 
	co.name,
	sum(ci.population),
	co.population
from 
	country co 
join 
	city ci 
on 
	co.code = ci.countrycode 
group by 
	co.name 
having 
	sum(ci.population) / co.population >= 0.8;

3 查询人均寿命最长和最短的国家的名称及人均寿命
select 
	name,
	lifeexpectancy
from 
	country 
where 
	lifeexpectancy in ( (select max(lifeexpectancy) from country),
						(select min(lifeexpectancy) from country));

4 查询世界上人口密度最小的城市名称(城市人口和国家面积的比值)
select 
	co.name,
	ci.name,
	ci.population,
	co.surfaceArea
from 
	country co 
join 
	city ci
on
	co.code = ci.countrycode 
where 
	ci.population / co.surfaceArea =
		(select
			min(ci.population / co.surfaceArea)
		from
			country co 
		join 
			city ci 
		on 
			co.code = ci.countrycode );


5 查询亚洲国家各省的总城市数量和平均人口数, 哪些平均人口大于50万, 降序显示总城市数量.
select 
	co.name, -- 既然以省份为分组依据,省份所隶属的国家也当然是集体概念
	district,
	count(*),
	avg(ci.population) avgPop
from 
	city ci 
join 
	country co 
on
	ci.countrycode = co.code 
where 
	continent = 'asia'
group by 
	district 
having 
	avgPop > 500000 
order by 
	count(*) desc;
	
	
--- 	
select
	country.name,
	language
from
	country
left join 
	countrylanguage
on 
	country.code= countrylanguage.countrycode
having -- having 在这里可以代替where来使用
	language is null;

	
复习 : 
建库
create database if not exists 库名 charset gbk;
丢弃库
drop database if exists 库名;
建表 
1) 纯手工创建 create table if not exists 表名(列1 数据类型1(长度) 其他选项, 列2 数据类型2(长度) 其他选项....)
2) 使用子查询 create table if not exists 表名 as 子查询
3) 完全复制表结构 create table 表名 like 已有表;

修改 
alter table 表名 
1) 添加新列 add 新列名 数据类型(长度) 其他选项[after 列名, first] 
2) 修改列的数据类型等 modify 列名 新数据类型(新长度) 新其他选项(约束,缺省值)
3) 修改列的名称和数据类型等 change 老列名 新列名 新数据类型(新长度) 新其他选项
4) 丢弃列 drop column 列名
5) 表改名 rename to 新表名 

DDL 数据定义语言, 主要处理数据库对象(数据库, 表, 列, 约束, 视图)(create, alter, drop)
DML 数据操纵语言, 主要处理数据(select , update, insert into delete)

id | tname | age  | mobile | salary | hiredate   | gender
insert into teacher(
	id, 
	tname, 
	age, 
	mobile, 
	salary, 
	hiredate, 
	gender
) values (
	null,
	'张老师',
	20,
	'1342342342',
	5000,
	'2011-02-3',
	null
);

-- 必须依赖表结构给定值, 不推荐
insert into teacher values (
	null,
	'王老师',
	30,
	'234234234',
	9000,
	'1999-02-3',
	'男'
);

insert into teacher(
	tname, 
	age, 
	mobile, 
	salary, 
	hiredate
) values (
	'李老师',
	30,
	'1342342342',
	5000,
	'2011-02-3'
);

insert into teacher(
	tname, 
	age, 
	mobile, 
	salary, 
	hiredate
) value ( -- 适用于只插入一条记录
	'曹老师',
	40,
	'1342342342',
	6000,
	'2011-02-3'
);

insert into teacher(
	tname, 
	age, 
	mobile, 
	salary, 
	hiredate
) values (
	'周老师',
	40,
	'1342342342',
	6000,
	'2011-02-3'
), (
	'陈老师',
	50,
	'2348234',
	7000,
	'2012-3-5'
);

-- 批量插入数据
insert into teacher_copy (
	id,
	name,
	age,
	salary,
	hiredate
) select 
	id,
	tname,
	age,
	salary,
	hiredate
from 
	teacher 
where id <= 5;

完全复制表
create table 复制表 like 已有表;
insert into 复制表 select * from 已有表;

insert into teacher 
set 
	id = null,
	tname = '方老师',
	age = 30;
	
-- 更新
update teacher 
set 
	age = 40,
	salary = 4000 
where 
	tname = '方老师';
	
-- 删除数据 
delete from teacher
where 
	tname = '方老师';
	
delete from teacher 
where 
	id < 3;

-- 更新所有人的年龄+1岁, 工资都涨500
update teacher 
set 
	age = age + 1,
	salary = salary + 500 

-- 支持事务的引擎是InnoDB
-- 事务的开始 
1) set autocommit = false; 结束后 set autocommit = true;
2) start transaction;
3) begin 

-- 事务的结束
commit 全部成功
rollback 全部失败
DDL语句执行 全部成功 
会话正常结束 全部成功
会话异常结束 全部失败


start transaction;
begin;

-- 把employees表中的数据全部清除
-- 查看数据 
-- 回滚
-- 查看数据 

预编译 : 
prepare p1 from 
'
	select * from teacher 
';

执行预编译
execute p1;

-- 释放(丢弃)
drop prepare p1;
deallocate prepare p1;

prepare p2 from 
'
	select * from teacher where id = ?
'; 

set @id = 4;
execute p2 using @id; -- 不可以using 字面量, 只能跟用户变量 

-- ? 只能用于代替值, 不能代替对象名
prepare p3 from 
'
	insert into teacher (
		tname,
		age,
		salary,
		hiredate
	) values (
		?,
		?,
		?,
		now()
	)
';

set @name='安老师', @age = 20, @salary=20000, @hiredate='2016-5-3';
execute p3 using @name, @age, @salary, @hiredate; -- 上面的预编译只有3个?, 如果传4个实参会出错!!


+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int(11)     | NO   | PRI | NULL    | auto_increment |
| name      | varchar(10) | YES  |     | NULL    |                |
| room      | int(11)     | YES  |     | NULL    |                |
| begindate | date        | YES  |     | NULL    |                |
| master    | int(11)     | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
写一个预编译, 给classes表插入数据
prepare insertClasses from 
'
	insert into classes (
		name,
		room,
		begindate,
		master 
	) values (
		?,
		?,
		now(),
		?
	)
';

set @name = 'JavaEE0111', @room = 205, @teacher_id = 3;
execute insertClasses using @name, @room, @teacher_id;

再写一个预编译, 查询classes表的所有数据,再执行查看表中的数据.
prepare selectClasses from 
'
	select * from classes
';

-- 主键约束 : 在一个表中只允许有一个主键.

create table test (
	name varchar(20) primary key, 
	age int not null -- not null 只能是列级约束
);
// 'abc', 20
// 'abc', 30 


create table test2 (
	name varchar(20),
	age int,
	primary key(name, age) -- 联合主键
)
// 'abc', 20
// 'abc', 30 

-- 丢弃主键
alter table test2 
drop primary key; 

alter table test 
drop primary key;

-- 添加主键
alter table test2 
add primary key(name, age);

create table test3 (
	name varchar(20) unique, -- 列级 
	age int unique 
);

create table test4 (
	name varchar(20),
	age int,
	constraint nameUK unique(name), -- 给约束命名
	constraint ageUK unique(age)
);
-- 丢弃唯一键
alter table test4
drop key nameUK;

-- 添加外键
teacher表称为父表
create table classes (
	id int auto_increment,
	name varchar(50),
	room int,
	begindate date,
	master int,
	-- 主键 
	primary key(id),
	constraint nameUK unique(name),
	-- 外键-- foreign key(本表要引用父表的列名) references 父表(父表的主键)
	foreign key (master) references teacher(id)
);

insert into classes(name, room, begindate, master) values('Android1', 307, now(), 3);
insert into classes(name, room, begindate, master) values('Html50111', 107, now(), 3);
insert into classes(name, room, begindate, master) values('JavaME', 102, now(), 4);
insert into classes(name, room, begindate, master) values('PHP0111', 206, now(), 8);
insert into classes(name, room, begindate, master) values('JavaEE0111', 207, now(), 4000);

-- 丢弃外键, 必须提供外键名
alter table classes drop foreign key classes_ibfk_1;

drop table classes;
create table classes (
	id int auto_increment,
	name varchar(50),
	room int,
	begindate date,
	master int,
	-- 主键 
	primary key(id),
	constraint nameUK unique(name),
	constraint myfk foreign key (master) references teacher(id)
);

drop table classes;
create table classes (
	id int auto_increment,
	name varchar(50),
	room int,
	begindate date,
	master int,
	-- 主键 
	primary key(id),
	constraint nameUK unique(name),
	constraint myfk foreign key (master) references teacher(id) on delete set null on update set null -- set null --cascade -- cascade 级联 --donothing
);

-- 丢弃外键
alter table classes 
drop foreign key myfk;

-- 添加外键
alter table classes 
add constraint myfk foreign key (master) references teacher(id) on delete set null on update set null;

-- 给student表添加一个外键约束, 随便起个名字, 当父表记录被删除或更新时,子表被波及.
alter table student 
add constraint stufk foreign key (class_id) references classes(id) on delete cascade on update cascade;
-- 向子表插入一些记录, 测试外键约束
| id       | int(11)         | NO   | PRI | NULL    | auto_increment |
| name     | varchar(30)     | YES  |     | NULL    |                |
| class_id | int(11)         | YES  |     | NULL    |                |
| mobile   | varchar(15)     | YES  |     | NULL    |                |
| gender
insert into student(name, class_id, mobile, gender) values ('小明', 4, '134234234', '男');
insert into student(name, class_id, mobile, gender) values ('小丽', 4, '2342342', '女');
insert into student(name, class_id, mobile, gender) values ('小伟', 4, '2345535', '男');
insert into student(name, class_id, mobile, gender) values ('小刚', 4, '22343434', '男');
insert into student(name, class_id, mobile, gender) values ('小朋', 400, '6666666', '男');
-- 删除父表中被引用的记录, 查看结果
delete from classes where id = 4;
-- 丢弃外键.
alter table student 
drop foreign key stufk;

查看所有学生姓名和班级名称和班主任老师
select 
	st.name student,
	cl.name classname,
	t.tname master
from 
	student st 
join 
	classes cl
on 
	st.class_id = cl.id 
join 
	teacher t 
on
	cl.master = t.id 

-- limit 后面跟一个参数, 作用是限制只显示多少条记录
-- limit 第一个参数是从虚表要忽略掉的记录数, 第二个参数是最终要显示的记录.

