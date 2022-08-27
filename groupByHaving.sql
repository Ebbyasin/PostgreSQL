/*
-- GROUP BY HAVING --
HAVING ifadesinin islevi WHERE ifadesininkine cok benziyor.Ancak kumeleme fonksiyonlari ile
WHERE ifadesi birlikte kullanılmadığında HAVING ifadesine ihtiyac duyulmuştur
GROUP BY ile kullanılır gruplamadan sonraki şart için group by dan sonra HAVING kullanılır
*/

--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke,round(avg(maas)) as maas_ortalamasi from personel
WHERE cinsiyet='E'
group by ulke
having avg(maas)>3000

--ODEVVV--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu
