-- IS NULL,IS NOT NULL,COALESCE --
/*
IS NULL ve IS NOT NULL boolean operatorleridir
Bir ifadenin null olup olmadigini kontrol eder
COALESCE  (birlestirme) bir fonksiyondur ve icerisindeki parametrelerden null olmayan ilk ifadeyi dondurur
*/

CREATE TABLE insanlar 
(
    ssn CHAR(9), -- Social Security Number
    isim VARCHAR(50), 
    adres VARCHAR(50) 
);
INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');
select * from insanlar

--İSİM İ NULL OLANLARİ SORGULA
SELECT * from insanlar  where isim is null

--null olmayanlari getirelim
select * from insanlar WHERE isim is not null

-- isim'i NULL olan kisilerin isim'ine NO NAME atayiniz.
UPDATE insanlar 
SET isim='NO NAME'
WHERE isim is null

--Tabloyu bir onceki soruyu cozmeden onceki haline geri getirin
UPDATE insanlar
SET isim=null
WHERE isim='NO NAME'

--NOT=Coklu degisimde her degisim icin SET ... WHERE isim IS NULL gibi
--ifade yazmamak icin COACESCE(Birlestirme) kullanilir

/* 
isim 'i NULL olanlara 'Henuz isim girilmedi'
adres 'i NULL olanlara 'Henuz adres girilmedi'
ssn 'i NULL olanlara ' no ssn' atayalım.
*/

UPDATE insanlar
SET isim =coalesce (isim,'HENUZ ISIM GİRİLMEDİ'),
    adres =coalesce (adres, 'HENUZ ADRES GIRILMEDI'),
	ssn = coalesce (ssn,'NO SSN')
	
select * from insanlar