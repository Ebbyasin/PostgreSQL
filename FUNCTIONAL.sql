--Function olusturma
--Intelijde {} suslu parantez kullanirdik SQL(pgadmin4) ise $$ isareti kullanilir acma kapatma islemi icin 
-- Örnek: İki parametre ile çalışıp bu parametreleri 
--toplayarak return yapan bir fonksiyon oluşturun.


CREATE OR REPLACE FUNCTION toplamaF(x NUMERIC, y NUMERIC)
RETURNS NUMERIC 
LANGUAGE plpgsql
AS
$$
 BEGIN

 RETURN x+y;

 END
$$

SELECT * FROM 	toplamaF (15,25) AS toplam;