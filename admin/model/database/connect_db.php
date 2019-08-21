<?php 
	class Database{
		private static $dsn = 'mysql:host=localhost;dbname=webtintuc';
		private static $username = 'root';
		private static $pass='';
		private static $options = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8");
		private static $db;
		private function __construct(){			
		}		
		public static function connectDB(){
			if(!isset(self::$db)){
				try {
					self::$db = new PDO(self::$dsn,
										self::$username,
										self::$pass,
										self::$options);
				} catch (PDOException $e) {
					$error_message = $e->getMessage();
					echo "Error Connecting to databasse: ".$error_message;			
				}
			}
			return self::$db;
		}
	}
 ?>