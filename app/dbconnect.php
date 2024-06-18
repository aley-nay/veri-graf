<?php

class DBConnect
{
    private $db = null;

    public function __construct(){
        $this->openDatabaseConnection();
    }
	
    private function openDatabaseConnection(){
        /* Aşağıdaki bağlantı şeklinde veriler Object olarak geri getirilir. $result->user_name gibi!..
         Veri çekme işleminde FETCH_ASSOC kullanılırsa veriler şu şekilde alınır: $result["user_name] !
		*/

        $options = array( PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, 
			PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8");

        // PDO bağlayıcı ile veritabanı bağlantısının gerçekleştirilmesi
		try{// mysql:host=localhost;dbname=world			
			$this->db = new PDO(DB_TYPE . ':host=' . DB_HOST . ';port='.DB_PORT.';dbname=' . DB_NAME, DB_USER, DB_PASS, $options);
		}
		catch (PDOException $e){
			echo 'Failure: ' . $e->getMessage();
		}
    }
	//------------------------------------------
	// INSERT,UPDATE,DELETE
	public function sqlExec ($sql){
		$stmt = $this->db->prepare( $sql );
		// Execute
		try {
			$stmt->execute();
			$stmt->closeCursor();
			return true;// işlem gerçekleştiyse
		}
		catch (PDOException $e) {
			//$this->fatal( $e->getMessage() );
			return false;
		}
	}		
	// SELECT ile kullanılacak olanlar
	public function fetchAllData($sql){
		try{
			$dbSelect =  $this->db->prepare($sql);	
			$dbSelect->execute();
			// FETCH_ASSOC tablo field isimleriyle verileri getirir
			$data=$dbSelect->fetchAll(PDO::FETCH_ASSOC);	
			
			if($dbSelect->rowCount() <= 0){
				return false;
			}			
			
			// Kayıt sayısı
			//$recordCount=$this->sql_exec("SELECT FOUND_ROWS() AS recordCount");			
			//return array('recordCount'=>$recordCount[0]['recordCount'],'result'=>$data);
			return $data;
			
		}catch(PDOException $e){
			return null;
		}		
	}
		
	public  function fetchData($sql){
		
		try{
			$dbSelect =  $this->db->prepare($sql);	
			$dbSelect->execute();
			// FETCH_ASSOC tablo field isimleriyle verileri getirir
			$data=$dbSelect->fetch(PDO::FETCH_ASSOC);

			if($dbSelect->rowCount() <= 0){
				return false;
			}
			
			return $data;
			
		}catch(PDOException $e){
			return null;
		}				
	}

	public function fetchObject($sql){
		try{
			$dbSelect =  $this->db->prepare($sql);	
			$dbSelect->execute();
			$objdata=$dbSelect->fetch(PDO::FETCH_OBJ);		
			
			if($dbSelect->rowCount() < 0){
				return false;
			}
			
			return $objdata;

		}catch(PDOException $e){
			return null;
		}		
	}	
		
}