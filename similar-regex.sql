--SELECT - SIMILAR TO - REGEX(Regular Expressions) --
/*
SIMILAR TO : Daha karmasik pattern(kalip) ile sorgulama islemi icin SIMILAR TO kullanilabilir
Sadece PostgreSQL de kullanilir. Buyuk Kucuk harf onemlidir

REGEX : Herhangi bir kod, metin icerisinde istenen yazi veya kod parcasinin aranip bulunmasini saglayan
kendine ait bir soz dizimi olan bir yapidir(REGEXP_LIKE) olarak kullanilir
PostgreSQL'de karakteri ile kullanilir.
*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
   select * from kelimeler
   
   --icerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
   --Veya islemi icin | karakteri kullanilir
   
   --SIMILAR TO ile
   select * from kelimeler WHERE kelime SIMILAR TO '%(at|ot|Ot|oT|At|aT|OT)%'
   --LIKE ile
   select * from kelimeler WHERE kelime ILIKE '%at%' or kelime ILIKE '%ot%'
   select * from kelimeler WHERE kelime ~~* '%at%' or kelime ~~* '%ot%'
   --REGEX
   select * from kelimeler WHERE kelime ~* 'ot' or kelime ~* 'at'
   
   -- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
   --SIMILAR TO ile
   select * from kelimeler WHERE kelime similar to 'ho%|hi%'
   --LIKE ile
   select * from kelimeler WHERE kelime ~~* 'ho%' or kelime ~~*'hi%'
   --REGEX ile
   select * from kelimeler where kelime ~* 'h[oi](.*)' -- REGEX te ".(nokta) bir karakteri temsil eder"
   --ilk hafr h,ikinci harf o yada i ,sonrasi ne olursa olsun...yani ikinci harf icin koseli parantez kullanilir.
   
   --sonu 't' ve 'm' ile bitenleri listeleyiniz
   --SIMILAR TO ile
   select * from kelimeler where kelime similar to '%t|%m';
   --REGEX ile
   select * from kelimeler where kelime ~* '(.*)[tm]$'--$ karakteri bitisi gosterir..
   
   --h ile baslayip t ile biten 3 harfli kelimeleri listeleyiniz
   --SIMILAR TO ile
   select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t';
   --LIKE ile
   select * from kelimeler where kelime ~~* 'h_t';
   --REGEX ile
   select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t'
   
   
   --Ilk karakteri 'h',son karakteri 't' ve ikinci karakteri 'a' dan 'e' ye herhangi bir karakter olan
   --"kelime" degerlerini cagirin.
  --SIMILAR TO ile 
   Select kelime from kelimeler where kelime similar to 'h[a-e](.*)%t'
   --REGEX ile
   select kelime from kelimeler where kelime ~* 'h[a-e](.*)t'
   
   --İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
   select * from kelimeler where kelime ~ '^[say](.*)'-- ^baslangic i temsil eder.
   
   --Son karakteri 'm', 'a' veya 'f' olan "kelime" degerlerini cagirin.
   select * from kelimeler where kelime ~ '(.*)[maf]$';
   
   --İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
   --SIMILAR to ile
   select * from kelimeler where kelime similar to 'h[a|i]t';
   --REGEX ile
   select * from kelimeler where kelime ~'^h[a|i]t$'
   
   --ilk harfi 'b' dan 's' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup
   --ucuncu harfi 'l' olan "kelime degerlerini cagirin"
   select kelime from kelimeler WHERE kelime ~ '^[b-s].l(.*)'
   
   --içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
   select * from kelimeler where kelime similar to '%[o][o]%'
   select * from kelimeler where kelime similar to '%[o]{2}%'' -- Süslü parantez içinde belirttiğimiz rakam bir önceki
                                                           --köşeli parantez içinde kaçtane olduğunu belirtir
  
   --içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
   select * from kelimeler where kelime similar to '%[o]{4}%'
   --'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
   SELECT kelime FROM kelimeler WHERE kelime ~ '^[a|s|y](.*)[m|f]$';
  
  
