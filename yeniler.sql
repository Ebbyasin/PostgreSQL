create table yagizlar(
id serial,
isim varchar(50),
veli_name varchar(50),
yazili_not real
);
Begin;
insert into yagizlar VALUES (default,'betus','adem',74.5);
insert into yagizlar VALUES (default,'Cemal','Alis',91.5);
savepoint y;
insert into yagizlar VALUES (default,'abdo','Azm',86.5);
insert into yagizlar VALUES (default,'guli','Ayla',64.5);
rollback to y;
select * from yagizlar;

commit;

CREATE TABLE ogrenciler
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler;
-- Soru : id'si 124 olan öğrenciyi siliniz

delete from ogrenciler where id=124;
delete from ogrenciler where isim='Kemal Yasa';
delete from ogrenciler where isim='Nesibe Yilmaz' or isim='Mustafa Bak';

delete from ogrenciler where isim='Ali Can' or id=123;

delete from ogrenciler;
truncate table ogrenciler;


create table personel9(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)    
);
select * from personel9;

alter table personel9 add cinsiyet varchar(20), add yas int ;

alter table personel9 drop column sirket;

alter table personel9 rename column sehir to ulke;

alter table personel9 rename to isciler;

drop table isciler;

CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);

CREATE TABLE calisanlar2(
id CHAR(5),
isim VARCHAR(50),	
maas int NOT NULL,
ise_baslama DATE,
CONSTRAINT pk_id PRIMARY KEY(id),	
CONSTRAINT ism_unq UNIQUE(isim)	
);







