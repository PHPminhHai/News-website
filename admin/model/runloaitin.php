<?php 
include_once('database/classloaitin.php');
class LoaiTinDB{
	public static function LayTatCaLoaiTin(){
		$db = Database::connectDB();
		try {
			$query ="
				SELECT * FROM loaitin 
				ORDER BY idLoaiTin DESC
			";
			$statement = $db->prepare($query);
			$statement -> execute();
			$rows = $statement->fetchAll();
			$statement->closeCursor();
			$Allitem = array();
			foreach ($rows as $key => $value) {
				$item = new LoaiTin($value['idLoaiTin'],$value['idTheLoai'] ,$value['tenLoaiTin'],$value['tenLoaiTinKhongDau'],$value['thuTu'],$value['anHien']);
				$Allitem[] = $item;
			}
			return $Allitem;
		} catch (PDOException $e) {
			echo $e->getMessage();			
		}
	}

	public static function LayLoaiTinTheoTheLoai($idTheLoai){
		$db = Database::connectDB();
		try {
			$query ="
				SELECT * FROM loaitin 
				WHERE idTheLoai = ?
				ORDER BY idLoaiTin DESC
			";
			$statement = $db->prepare($query);
			$statement->bindParam(1,$idTheLoai);
			$statement->execute();
			$rows = $statement->fetchAll();
			$statement->closeCursor();
			$Allitem = array();
			foreach ($rows as $key => $value) {
				$item = new LoaiTin($value['idLoaiTin'],$value['idTheLoai'] ,$value['tenLoaiTin'],$value['tenLoaiTinKhongDau'],$value['thuTu'],$value['anHien']);
				$Allitem[] = $item;
			}
			return $Allitem;
		} catch (PDOException $e) {
			echo $e->getMessage();			
		}
	}

	public static function layTenTheLoaiVaTenLoaiTin($idTheLoai,$idLoaiTin){
		$db = Database::connectDB();
		try {
			$query = "
				SELECT t.idTheLoai,t.tenTheLoai,l.idLoaiTin,l.tenLoaiTin
				FROM loaitin as l
				INNER JOIN theloai as t
				ON l.idTheLoai = t.idTheLoai
				WHERE l.idTheLoai = ?
				AND l.idLoaiTin = ?
			";
			$statement = $db->prepare($query);
			$statement->bindParam(1,$idTheLoai);
			$statement->bindParam(2,$idLoaiTin);
			$statement->execute();
			$rows = $statement->fetch();
			return $rows;
		} catch (PDOException $e) {
			echo $e->getMessage();			
		}
	}
}
?>