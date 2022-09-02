--1. Örnek: companies tablosundan en yüksek ikinci number_of_employees değeri olan company ve 
--number_of_employees değerlerini çağırın.
--1.Yol offset ve fetch next kullanarak
select company,number_of_employees
from companies
order by number_of_employees desc
offset 1 row
fetch next 1 row only;

select * from companies;

/*
Select company, number_of_employees --sirket ve calisan sayilarini sec
from companies --sirketler tablosundan
order by number_of_employees desc --calisan sayisina gore buyukten kucuge sirala
offset 1 row --birinci sirayi atla demek
fetch next 1 row only; --sadece belirttigim sirayi getir.
*/

CREATE TABLE companies
(
  company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);




select company,number_of_employees
from companies
WHERE number_of_employees = (SELECT MAX(number_of_employees)
                             FROM companies
                             WHERE number_of_employees < (SELECT MAX(number_of_employees)
                             FROM companies))

--1. Örnek: number_of_employees değeri ortalama çalışan sayısından az olan
--number_of_employees değerlerini 16000 olarak UPDATE edin.

select * from companies;

update companies
set number_of_employees =16000
where number_of_employees < (select avg(number_of_employees)
                            from companies)
							

CREATE TABLE companies
(
  company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);



