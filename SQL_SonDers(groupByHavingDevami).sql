-- GROUP BY -- HAVİNG --
/*
HAVING ifadesinin işlevi WHERE ifadesininkine çok benziyor. Ancak kümeleme fonksiyonları ile
WHERE ifadesi birlikte kullanılmadığında HAVING ifadesine ihtiyac duyulmuştur
GROUP BY ile kullanılır gruplamadan sonraki şart için group by dan sonra HAVING kullanılır
--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke,round(avg(maas)) AS maas_ortalamasi from personel
where cinsiyet = 'E'
group by ulke
having avg(maas) >3000
--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu
select ulke, avg(maas) as ortalama_yas, count (cinsiyet) as calisan_sayi from personel
where cinsiyet='E'
GROUP by ulke having count(cinsiyet)>1;
*/

CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);

INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM workers;

--Toplam salary degeri 2500 uzeri olan her bir calisan icin salary toplamini bulun.

select name, sum(salary) as "Total Salary"
from workers
group by name 
having sum(salary) >= 2500; -->"Group By" ardindan "Where" kullanilmaz.

--Birden fazla calisani olan, her bir state icin calisan toplamlarini bulun.

select state,COUNT(state) AS nubler_of_employees
FROM workers
GROUP BY state
HAVING COUNT(state)> 1; -- Having, Group By ardindan filtreleme icin kullanilir.

--Her bir state icin degeri 3000'den az olan maximum salary degerlerini bulun.
select state,MAX(salary)
from workers
group by state
HAVING MAX(salary) < 3000;

--Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.
select company, min(salary) as min_salary
from  workers
group by company
having min(salary)>2000;

--Tekrarsız isimleri çağırın.
select distinct name from  workers;--distinct clause cağrılan terimlerden tekrarlı
--olanların sadece birini alır
--Name değerlerini company kelime uzunluklarına göre sıralayın.

select name, company
from workers
order by length(company);

--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.
--concat() fonksiyonu birden fazla sutun veya string degerini birlestirmek icin kullanilir 
--1. Yol
select concat(name, '  ',state) as name_and_state
from workers
order by length(name) + length(state);

--2.Yol
select name || ' ' || state || ' ' || length(name) + length(state) as "Name and States"
from workers
order by length(name) + length(state);

select * from workers

/*
UNION Operator: 1) iki sorgu(query) sonucunu birlestirmek icin kullanilir.
                2) Tekrarsiz(unique) recordlari verir.
				3) Tek bir sutuna cok sutun koyarken mevcut data durumuna dikkat etmek gerekir.
*/

--salary degeri 3000'den yuksek olan state degerlerini ve salary degeri 2000'den kucuk
--olan name degerlerini tekrarsiz olarak bulun.
 select state AS "Name and State",salary
 from workers
 where salary> 3000;
 
 UNION
 
 select NAME,salary
 from workers
 where salary< 2000;
 
 --salary değeri 3000'den yüksek olan state değerlerini ve salary değeri 2000'den küçük olan name 
 --değerlerini tekrarli olarak bulun.
SELECT state AS "Name and State", salary
FROM workers
WHERE salary > 3000

UNION ALL --> UNION ile ayni isi yapar, ancak ,tekrar degerleri de verir.

SELECT name, salary
FROM workers
WHERE salary < 2000;

--salary degeri 1000'den yuksek ,2000'den az olan "ortak" name degerlirini bulun.

select name
from workers
where salary > 1000

INTERSECT

select name
from workers
where salary < 2000;

-->salary degeri 2000'den az olan ve company degeri IBM,APPLE ya da MICROSOFT olan ortak "name" degerlerini bulun.

select name
from workers
where salary < 2000

INTERSECT 

select name
from workers 
where company IN('IBM','APPLE', 'MICROSOFT');

--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır. Unique(tekrarsız) 
--recordları verir.

--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.
select name 
from workers
where salary <3000

except  ---> matematik teki fark formulu gibi..google da calisanlari cikartirsam,calismayanlar kalir.

select name
from workers
where company ='GOOGLE';



CREATE TABLE my_companies
(
  company_id CHAR(3),
  company_name VARCHAR(20)
);

INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');

SELECT * FROM my_companies;

CREATE TABLE orders
(
  company_id CHAR(3),
  order_id CHAR(3),
  order_date DATE
);

INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');

SELECT * FROM orders;

/*
JOINS: 1)INNER JOIN:ORTAK (COMMON) DATAYİ verir.
       2)LEFT JOIN:Birinci table'in tum datasini verir.
	   3)RIGHT JOIN:İkinci table'in tum datasini verir.
	   4)FULL JOIN:İki table'in da tum datasini verir.
       5)SELF JOIN:Tek table uzerinde calisirken iki table varmis gibi calisilir.
*/	   
--1) INNER JOIN
--Ortak companyler için company_name, order_id ve order_date değerlerini çağırın.

  select mc.company_name, o.order_id, o.order_date
  from my_companies mc inner join orders o
  on mc.company_id= o.company_id;
  
--2) LEFT JOIN
--my_companies table'indaki companyler icin order_id ve order_date degerlerini cagirin.

select mc.company_name, o.order_id, o.order_date
from my_companies mc LEFT JOIN orders o
ON mc.company_id = o.company_id;

--3) RIGHT JOIN
--Orders table'ındaki company'ler için company_name, company_id ve order_date değerlerini çağırın.
--1. Yol

select mc.company_name, o.company_id,o.order_date
from my_companies mc RIGHT JOIN orders o
ON mc.company_id = o.company_id;

--FULL JOIN
--İki table'dan da company_name, order_id ve order_date değerlerini çağırın.

select mc.company_name, o.company_id,o.order_date
from orders o FULL JOIN my_companies mc
ON mc.company_id= o.company_id;

--SELF JOIN

CREATE TABLE workers
(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2)
);

INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

SELECT * FROM workers;

--workers tablosunu kullanarak çalışanların yöneticilerini gösteren bir tablo hazırlayın.

SELECT employee.name AS Employee, manager.name AS Manager
FROM workers employee FULL JOIN workers manager
ON employee.manager_id = manager.id;




