<?php 
	/**
	 * summary
	 */
	include_once('database/classtheloai.php');
	class TheloaiDB
	{
		public static function LayTatCaTheloai()
		{
			$db = Database::connectDB();
			try {
				$query = "
				SELECT * FROM theloai
				ORDER BY thuTu ASC
				";
				$statement = $db->prepare($query);
				$statement->execute();
				$rows = $statement->fetchAll();
				$statement->closeCursor();
				$Allitem = array();
				foreach ($rows as $key => $value) {
					$item = new TheLoai($value['idTheLoai'], $value['tenTheLoai'], $value['tenTheLoaiKhongDau'],$value['thuTu'],$value['anHien']);
					$Allitem[] = $item;
				}
				return $Allitem;
			} catch (PDOException $e) {
				echo $e->getMessage();
			}
		}


		public static function xoaTheloai($idTheLoai){
			$db = Database::connectDB();
			try {
				$query = "DELETE FROM theloai
				WHERE idTheLoai = ?
				";
				$statement = $db->prepare($query);
				$statement->bindParam(1,$idTheLoai);
				$statement->execute();
				$statement->closeCursor();

			} catch (PDOException $e) {
				echo $e->getMessage();	
			}
		}

		public static function layTenTheLoaiBangIdTheLoai($idTheLoai){
			$db = Database::connectDB();
			try {
				$query = "SELECT * FROM theloai
				WHERE idTheLoai = ?
				";
				$statement = $db->prepare($query);
				$statement->bindParam(1,$idTheLoai);
				$statement->execute();
				$row = $statement->fetch();
				$statement->closeCursor();
				return $row;

			} catch (PDOException $e) {
				echo $e->getMessage();	
			}
		}

		public static function themTheLoaiMoi($idTheLoai,$tenTheLoai,$tenTheLoaiKhongDau,$thuTu){
			$db = Database::connectDB();
			try {
				$query = "
				INSERT INTO theloai(idTheLoai, tenTheLoai, tenTheLoaiKhongDau, thuTu)
				VALUES (?,?,?,?)
				";
				$statement = $db->prepare($query);
				$statement->bindParam(1,$idTheLoai);
				$statement->bindParam(2,$tenTheLoai);
				$statement->bindParam(3,$tenTheLoaiKhongDau);
				$statement->bindParam(4,$thuTu);
				$statement->execute();
			} catch (PDOException $e) {
				echo $e->getMessage();	
			}
		}
		public static function updateTheLoai($idTheLoai,$tenTheLoai,$tenTheLoaiKhongDau,$thuTu){
			$db = Database::connectDB();
			try {
				$query = "
				UPDATE theloai
				SET
				tenTheLoai = ?,
				tenTheLoaiKhongDau = ?,
				thuTu = ?
				WHERE idTheLoai = ?
				";
				$statement = $db->prepare($query);
				$statement->bindParam(1,$tenTheLoai);
				$statement->bindParam(2,$tenTheLoaiKhongDau);
				$statement->bindParam(3,$thuTu);
				$statement->bindParam(4,$idTheLoai);
				$statement->execute();
			} catch (PDOException $e) {
				echo $e->getMessage();	
			}
		}
	}
	?>