-- AGGREGATE METHOD KULLANİMİ --
/*
-Aggregate Methodlari (	SUM(Topla),COUNT(Say),MIN(en kucuk deger),MAX(en buyuk deger),AVG(ortalama))
-Subquery icinde de kullanilir
-Ancak,sorgu tek bir deger donduruyor olmalidir
SYNTAX:sum() seklinde olmali sum()arasinda bosluk olmamali
*/
select * from calisanlar2

--Calisanlar2 tablosundaki en yuksek maas degerini listeleyiniz

SELECT max(maas) from calisanlar2

--Calisanlar2 tablosundaki maaslarin toplamini listeleyiniz
SELECT sum(maas) from calisanlar2

--Calisanlar2 tablosundaki maas ortalamalarini listeleyiniz
SELECT avg(maas) from calisanlar2
SELECT round(avg(maas)) from calisanlar2
SELECT round(avg(maas),2) from calisanlar2

--Calisanlar2 tablosundan en dusuk maasi listeleyiniz
SELECT min(maas) from calisanlar

--Calisanlar2 tablosundaki kac kisinin maas aldigini listeleyiniz
SELECT count(maas) from calisanlar2

select * from markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
SELECT marka_isim,calisan_sayisi,(select sum(maas)from calisanlar2 
WHERE marka_isim=isyeri)AS toplam_maas from markalar
--ALIAS (AS) tabloda gecici isim vermek istersek kosuldan sonra AS sutun_isim olarak kullanilir

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve 
-- minumum maaşini listeleyen bir Sorgu yaziniz.
SELECT marka_isim,calisan_sayisi,(SELECT max(maas) from calisanlar2 where marka_isim=isyeri)AS max_maas,
                                  (SELECT min(maas) from calisanlar2 where marka_isim=isyeri)AS min_maas
from markalar;

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
SELECT marka_id,marka_isim,(SELECT count(sehir)from calisanlar2
 WHERE marka_isim=isyeri)AS sehir_sayisi from markalar;		
 
 --Interview Question: En yüksek ikinci maas değerini çağırın.
 SELECT max(maas) AS enyuksek_ikinci_maas from calisanlar2
  WHERE maas < (SELECT max(maas) from calisanlar2)
  
  ---Interview Question: En düşük ikinci maas değerini çağırın.
  SELECT min(maas) AS endusuk_ikinci_maas from calisanlar2
  WHERE maas >(SELECT min(maas) from calisanlar2)
  
-- En yuksek ucuncu maas degerini bulun
  SELECT max(maas) as enyuksek_ucuncu_maas from calisanlar2
  WHERE maas < ( SELECT max(maas) from calisanlar2 WHERE maas < (SELECT max(maas)from calisanlar2))
  
 --En dusuk ucuncu maas degerini bulunuz(ODEV)
 SELECT min(maas) as endusuk_ucuncu_maas from calisanlar2
  WHERE maas > ( SELECT min(maas) from calisanlar2 WHERE maas > (SELECT min(maas)from calisanlar2))

