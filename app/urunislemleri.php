<?php
require_once("config.php");
require_once("dbconnect.php");

class UrunIslemleri{
 

    public static function hepsiniGetir(){
        $db=new DBConnect();
        //$sql=".................";
        $sql="SELECT urunadi,GROUP_CONCAT(fiyat) AS satisfiyatlari FROM urunler
        GROUP by urunadi";
        $result=$db->fetchAllData($sql);
        return $result;
    }    
   
    public static function satistoplam(){
        $db=new DBConnect();
        $sql="SELECT urunadi,SUM(fiyat) AS satisfiyatlari FROM urunler  GROUP by urunadi";
        $result=$db->fetchAllData($sql);
        return $result;
    }

    /*public static function grubagorefiyat() {
        $db = new DBConnect();
        $sql = "SELECT ug.grpadi AS urungrubu, u.fiyat AS satisfiyatlari FROM urungruplari ug 
        INNER JOIN urunler u ON ug.urungrpid = u.urungrpid";
        $result = $db->fetchAllData($sql);
        return $result;
    }*/

    /*public static function grubagorefiyat() {
        $db = new DBConnect();
        $sql = "SELECT GROUP_CONCAT(ug.grpadi SEPARATOR ', ') AS urungrubu, SUM(u.fiyat) AS satisfiyatlari 
                FROM urungruplari ug 
                INNER JOIN urunler u ON ug.urungrpid = u.urungrpid
                GROUP BY ug.grpadi";
        $result = $db->fetchAllData($sql);
        return $result;
    }*/
    public static function grubagorefiyat() {
        $db = new DBConnect();
        $sql = "SELECT GROUP_CONCAT(DISTINCT ug.grpadi ORDER BY ug.grpadi SEPARATOR ', ') AS urungrubu, SUM(u.fiyat) AS satisfiyatlari 
                FROM urungruplari ug 
                INNER JOIN urunler u ON ug.urungrpid = u.urungrpid
                GROUP BY ug.grpadi";
        $result = $db->fetchAllData($sql);
        return $result;
    }
    
    
    
    
    public static function cinsiyetgorefiyat() {
        $db=new DBConnect();
        $sql="SELECT cinsiyet,SUM(fiyat) AS satisfiyatlari FROM urunler  GROUP by cinsiyet";
        $result=$db->fetchAllData($sql);
        return $result;
    }

    public static function markagorefiyat() {
        $db=new DBConnect();
        $sql="SELECT marka,SUM(fiyat) AS satisfiyatlari FROM urunler  GROUP by marka";
        $result=$db->fetchAllData($sql);
        return $result;
    }

    public static function turegorefiyat() {
        $db=new DBConnect();
        $sql="SELECT urunturu,SUM(fiyat) AS satisfiyatlari FROM urunler  GROUP by urunturu";
        $result=$db->fetchAllData($sql);
        return $result;
    }


    // isteniler diğer metodlar buraya yazılacak
}