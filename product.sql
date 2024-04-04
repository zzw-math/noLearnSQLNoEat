CREATE DATABASE shop;
use shop;

DROP TABLE Product;
       CREATE TABLE Product
       (product_id CHAR(4) NOT NULL,
       product_name VARCHAR(100) NOT NULL,
       product_type VARCHAR(32) NOT NULL,
       sale_price INTEGER ,
       purchase_price INTEGER ,
       regist_date DATE ,
       PRIMARY KEY(product_id));

ALTER TABLE Product ADD COLUMN product_name_pinyin VARCHAR(100);
ALTER TABLE Product DROP COLUMN product_name_pinyin;

select * from Product;

START TRANSACTION;
INSERT INTO Product VALUES ('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20');
INSERT INTO Product VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');
INSERT INTO Product VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);
INSERT INTO Product VALUES ('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');
INSERT INTO Product VALUES ('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15');
INSERT INTO Product VALUES ('0006', '叉子', '厨房用具', 500, NULL, '2009-09-20');
INSERT INTO Product VALUES ('0007', '擦菜板', '厨房用具', 880, 790, '2008-04-28');
INSERT INTO Product VALUES ('0008', '圆珠笔', '办公用品', 100, NULL, '2009-11-11');
COMMIT;

CREATE TABLE Addressbook
(regist_no INTEGER NOT NULL,
name VARCHAR(128) NOT NULL,
address VARCHAR(256) NOT NULL,
tel_no CHAR(10) ,
mail_address CHAR(20) ,
PRIMARY KEY(regist_no));

select * from Addressbook;

ALTER TABLE Addressbook ADD COLUMN postal_code CHAR(8) NOT NULL;
ALTER TABLE Addressbook DROP COLUMN postal_code;

rename table Poduct to Product;

select product_id, product_name, purchase_price
from Product;

select *
from Product;

select product_id as id,
       product_name as name,
       purchase_price as price
from Product;

select  product_id as "商品编号",
        product_name as "商品名称",
        purchase_price as "进货单价"
from Product;

select '商品' as string, 38 as number, '2009-02-24' as date, product_id, product_name
from Product;

select distinct product_type
from Product;

select distinct purchase_price
from Product;

select distinct product_type, regist_date
from Product;

select product_name, product_type
from Product
where product_type = '衣服';

select product_name, sale_price,
       sale_price * 2 as "sale_price_x2"
from Product;

select (100+200) * 3 as calculation;

select product_name, product_type
from Product
where sale_price = 500;

select product_name, product_type
from Product
where sale_price <> 500;

select product_name, product_type, sale_price
from Product
where sale_price >= 1000;

select product_name, product_type, regist_date
from Product
where regist_date < '2009-09-27';

select product_name, sale_price, purchase_price
from Product
where sale_price - purchase_price >= 500;

create table Chars
(chr char(3) not null,
primary key(chr));

select chr
from Chars
where chr > '2';

select chr
from Chars
where chr > 2;

select product_name, purchase_price
from Product
where purchase_price = 2800;

select product_name, purchase_price
from Product
where purchase_price <> 2800;

select product_name, purchase_price
from Product
where purchase_price = Null;

select product_name, purchase_price
from Product
where purchase_price is null;

select product_name, purchase_price
from Product
where purchase_price is not null;

select product_name, product_type, sale_price
from Product
where not sale_price >= 1000;

select product_name, product_type, sale_price
from Product
where not sale_price < 1000;

select product_name, purchase_price
from Product
where product_type = '厨房用具'
and sale_price >= 3000;

select product_name, purchase_price
from Product
where product_type = '厨房用具'
or sale_price >= 3000;

select product_name, product_type, regist_date
from Product
where product_type = '办公用品'
and (regist_date = '2009-09-11'
    or regist_date = '2009-09-20');

select product_name, regist_date
from Product
where regist_date > '2009-04-28';

select product_name, sale_price, purchase_price
from Product
where sale_price - purchase_price >= 500;

select product_name, sale_price, purchase_price
from Product
where sale_price >= purchase_price + 500;

select product_name, product_type, sale_price,
       sale_price * 0.9 - purchase_price as profit
from Product
where sale_price * 0.9 - purchase_price > 100
and (product_type = '办公用品'
    or product_type = '厨房用具');

select count(*)
from Product;

select count(purchase_price)
from Product;

drop table NullTbl;

create table NullTbl
    (col_1  char(4) null);

select *
    from NullTbl;

start transaction;
insert into NullTbl values(null);
insert into NullTbl values(null);
insert into NullTbl values(null);
commit;

select count(*), count(col_1)
from NullTbl;

select sum(sale_price)
from Product;

select sum(sale_price), sum(purchase_price)
from Product;

select avg(sale_price)
from Product;

select avg(sale_price), avg(purchase_price)
from Product;

select max(sale_price), min(purchase_price)
from Product;

select max(regist_date), min(regist_date)
from Product;

select count(distinct product_type)
from Product;

select distinct count(product_type)
from Product;

select sum(sale_price), sum(distinct sale_price)
from Product;

select product_type, count(*)
from Product
group by product_type;

select count(product_type)
from Product;

select purchase_price, count(*)
from Product
group by purchase_price;

select purchase_price, count(*)
from Product
where product_type = '衣服'
group by purchase_price;

select purchase_price
from Product
where product_type = '衣服';

select product_type, count(*)
from Product
group by product_type
having count(*) = 2;

select product_type, count(*)
from Product
group by product_type;

select product_type, avg(sale_price)
from Product
group by product_type;

select product_type, avg(sale_price)
from Product
group by product_type
having avg(sale_price) >= 2500;

select product_id, product_name, sale_price, purchase_price
from Product
order by sale_price;

select product_id, product_name, sale_price, purchase_price
from Product
order by sale_price desc;

select product_id, product_name, sale_price, purchase_price
from Product
order by sale_price, product_id;

create table ProductIns
(product_id char(4) not null,
product_name varchar(100) not null,
product_type varchar(32) not null,
sale_price integer default 0,
purchase_price integer ,
regist_date date ,
primary key(product_id));

insert into ProductIns (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
values ('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20');

select * from ProductIns;

-- 通常的insert
insert into ProductIns values ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');
insert into ProductIns values ('0003', '运动T恤', '衣服', 4000, 2800, null);
insert into ProductIns values ('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');

-- 多行insert（Oracle以外）
insert into ProductIns values ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11'),
('0003', '运动T恤', '衣服', 4000, 2800, null),
('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');

-- 包含列清单
insert into ProductIns (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
values ('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15');

-- 省略列清单
insert into ProductIns values ('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15');

insert into ProductIns values ('0006', '叉子', '厨房用具', 500, null, '2009-09-20');

insert into ProductIns (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
values ('0007', '擦菜板', '厨房用具', default, 790, '2009-04-28');

select * from ProductIns where product_id = '0007';

-- 用来插入数据的商品复制表
create table ProductCopy
(product_id char(4) not null,
product_name varchar(100) not null,
product_type varchar(32) not null,
sale_price integer ,
purchase_price integer ,
regist_date date ,
primary key(product_id));

-- 将商品表中的数据复制到商品复制表中
insert into ProductCopy (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
select product_id, product_name, product_type, sale_price, purchase_price, regist_date from Product;


-- 根据商品种类进行汇总的表
create table ProductType
(product_type varchar(32) not null,
sum_sale_price integer ,
sun_purchase_price integer ,
primary key (product_type));

insert into ProductType (product_type, sum_sale_price, sun_purchase_price)
select product_type, sum(sale_price), sum(purchase_price) from Product
group by product_type;

-- 确认插入的数据行
select * from ProductType;

delete from Product
where sale_price >= 4000;

select * from Product;

update Product
set sale_price = sale_price * 10
where product_type = '厨房用具';

update Product
set regist_date = NULL
where product_id = '0008';

select * from Product order by product_id;

update Product
set sale_price = sale_price * 10
where product_type = '厨房用具';

update Product
set purchase_price = purchase_price / 2
where product_type = '厨房用具';

update Product
set sale_price = sale_price * 10,
purchase_price = purchase_price / 2
where product_type = '厨房用具';

update Product
set (sale_price, purchase_price) = (sale_price * 10, purchase_price / 2)
where product_type = '厨房用具';

 select * from Product order by product_id;

delete from Product;
drop table Product;
CREATE TABLE Product     
(product_id CHAR(4) NOT NULL,
product_name VARCHAR(100) NOT NULL,
product_type VARCHAR(32) NOT NULL,
sale_price INTEGER ,     
purchase_price INTEGER , 
regist_date DATE ,       
PRIMARY KEY(product_id));

select * from Product;

START TRANSACTION;
INSERT INTO Product VALUES ('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20');
INSERT INTO Product VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');
INSERT INTO Product VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);
INSERT INTO Product VALUES ('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');
INSERT INTO Product VALUES ('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15');
INSERT INTO Product VALUES ('0006', '叉子', '厨房用具', 500, NULL, '2009-09-20');
INSERT INTO Product VALUES ('0007', '擦菜板', '厨房用具', 880, 790, '2008-04-28');
INSERT INTO Product VALUES ('0008', '圆珠笔', '办公用品', 100, NULL, '2009-11-11');
COMMIT;

select * from Product;

create view ProductSum (product_type, cnt_product)
as
select product_type, count(*)
from Product
group by product_type;

select product_type, cnt_product from ProductSum;

create view ProductSumJim (product_type, cnt_product)
as
select product_type, cnt_product
from ProductSum
where product_type = '办公用品';

select product_type, cnt_product
from ProductSumJim;

create view ProductJim (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
as
select *
from Product
where product_type = '办公用品';

insert into ProductJim values ('0009', '印章', '办公用品', 95, 10, '2009-11-30');

select * from ProductJim;

select * from Product;

drop view ProductSum;

delete from Product where product_id = '0009';

create view ProductSum (product_type, cnt_product)
as
select product_type, count(*)
from Product
group by product_type;

select product_type, cnt_product
from ProductSum;

select product_type, cnt_product
from (select product_type, count(*) as cnt_product
      from Product
      group by product_type) as ProductSum;

select product_type, cnt_product
from (select *
      from (select product_type, count(*) as cnt_product
            from Product
            group by product_type) as ProductSum
      where cnt_product = 4) as ProductSum2;

SELECT product_id, product_name, sale_price
FROM Product
WHERE sale_price > (SELECT AVG(sale_price) FROM Product);

SELECT AVG(sale_price)
FROM Product;

SELECT product_id, product_name, sale_price
FROM Product
WHERE sale_price > 2097.5

SELECT product_id, product_name, sale_price,
       (SELECT AVG(sale_price)
        FROM Product) AS avg_price
FROM Product;

SELECT product_type, AVG(sale_price)
FROM Product
GROUP BY product_type
HAVING AVG(sale_price) > (SELECT AVG(sale_price) FROM Product);

SELECT product_type, product_name, sale_price
FROM Product AS P1
WHERE sale_price > (SELECT AVG(sale_price)
    FROM Product AS P2
    WHERE P1.product_type = P2.product_type
    GROUP BY product_type);










