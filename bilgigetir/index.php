<?php
// Ürünlere ait bilgiyi getirmek için bir class tanımlayınız
// class i require_once ile bu dosyada içeri alınız (static)
require_once("../app/urunislemleri.php");
if(isset($_GET['fn'])){
    $fn=$_GET['fn'];
}else{
    $fn=NULL;
}
// Burada girilen parametreye göre ürün bilgisi getirilecek
// class da tanımlanan fonksyion ürüne ait bir id alacak
// ve geriye db deki verileri getirecek.. array
// Not:  db ve tablo oluşturulacak

// json_encode ile echo edilecek
// echo json_encode($dizi);
if($fn == NULL){
    $data=UrunIslemleri::hepsiniGetir();
}else{
    $data=UrunIslemleri::$fn();
}

echo json_encode($data);
