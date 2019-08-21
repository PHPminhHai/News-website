<?php 
include_once('database/classtinchitiet.php');

class TinchitietDB
{
	public static function layTatCaTin()
	{
		$db = Database::connectDB();
		try {
			$query = "
			SELECT * FROM tinchitiet
			ORDER BY RAND()
			";
			$statement = $db->prepare($query);
			$statement->execute();
			$rows = $statement->fetchAll();
			$statement->closeCursor();
			$allItem = array();
			foreach ($rows as $key => $value) {
				$item = new Tinchitiet($value['idTinChiTiet'],$value['idTheLoai'],$value['idLoaiTin'] ,$value['tieuDe'],$value['tieuDeKhongDau'],$value['tomTat'],$value['noiDung'],$value['image'],$value['ngayDang'],$value['tinNoiBat'],$value['soLanXem'],$value['anHien']);
				$allItem[]=$item;
			}
			return $allItem;
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}

	public static function layMotTinMoiNhat()
	{
		$db = Database::connectDB();
		try {
			$query = "
			SELECT * FROM tinchitiet
			ORDER BY idTinChiTiet DESC
			LIMIT 0,1
			";
			$statement = $db->prepare($query);
			$statement->execute();
			$item = $statement->fetch();
			$statement->closeCursor();
			$row = new Tinchitiet($item['idTinChiTiet'],$item['idTheLoai'],$item['idLoaiTin'] ,$item['tieuDe'],$item['tieuDeKhongDau'],$item['tomTat'],$item['noiDung'],$item['image'],$item['ngayDang'],$item['tinNoiBat'],$item['soLanXem'],$item['anHien']);
			return $row;
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}

	public static function layMuoiTinHotNhat()
	{
		$db = Database::connectDB();
		try {
			$query = "
			SELECT * FROM tinchitiet
			ORDER BY soLanXem DESC
			LIMIT 0,10
			";
			$statement = $db->prepare($query);
			$statement->execute();
			$rows = $statement->fetchAll();
			$statement->closeCursor();
			$allItem = array();
			foreach ($rows as $key => $value) {
				$item = new Tinchitiet($value['idTinChiTiet'],$value['idTheLoai'],$value['idLoaiTin']  ,$value['tieuDe'],$value['tieuDeKhongDau'],$value['tomTat'],$value['noiDung'],$value['image'],$value['ngayDang'],$value['tinNoiBat'],$value['soLanXem'],$value['anHien']);
				$allItem[]=$item;
			}
			return $allItem;
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}

	public static function layBonTinTheoTheLoai($idTheLoai)
	{
		$db = Database::connectDB();
		try {
			$query = "
			SELECT * FROM tinchitiet
			WHERE idTheLoai = ?
			ORDER BY idTinChiTiet DESC
			LIMIT 0,4
			";
			$statement = $db->prepare($query);
			$statement->bindParam(1,$idTheLoai);
			$statement->execute();
			$rows = $statement->fetchAll();
			$statement->closeCursor();
			$allItem = array();
			foreach ($rows as $key => $value) {
				$item = new Tinchitiet($value['idTinChiTiet'],$value['idTheLoai'],$value['idLoaiTin']  ,$value['tieuDe'],$value['tieuDeKhongDau'],$value['tomTat'],$value['noiDung'],$value['image'],$value['ngayDang'],$value['tinNoiBat'],$value['soLanXem'],$value['anHien']);
				$allItem[]=$item;
			}
			return $allItem;
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}

	public static function layNoiDungTin($idTinChiTiet)
	{
		$db = Database::connectDB();
		try {
			$query = "
			SELECT * FROM tinchitiet
			WHERE idTinChiTiet = $idTinChiTiet
			";
			$statement = $db->prepare($query);
			$statement->bindParam(1,$idTinChiTiet);
			$statement->execute();
			$item = $statement->fetch();
			$statement->closeCursor();
			$row = new Tinchitiet($item['idTinChiTiet'],$item['idTheLoai'],$item['idLoaiTin'] ,$item['tieuDe'],$item['tieuDeKhongDau'],$item['tomTat'],$item['noiDung'],$item['image'],$item['ngayDang'],$item['tinNoiBat'],$item['soLanXem'],$item['anHien']);
			return $row;
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}

	public static function layTatCaTin_PhanTrang($form, $sotinmottrang)
	{
		$db = Database::connectDB();
		try {
			$query = "
			SELECT * FROM tinchitiet
			ORDER BY RAND()
			LIMIT $form, $sotinmottrang
			";
			$statement = $db->prepare($query);
			$statement->execute();
			$rows = $statement->fetchAll();
			$statement->closeCursor();
			$allItem = array();
			foreach ($rows as $key => $value) {
				$item = new Tinchitiet($value['idTinChiTiet'],$value['idTheLoai'],$value['idLoaiTin']  ,$value['tieuDe'],$value['tieuDeKhongDau'],$value['tomTat'],$value['noiDung'],$value['image'],$value['ngayDang'],$value['tinNoiBat'],$value['soLanXem'],$value['anHien']);
				$allItem[]=$item;
			}
			return $allItem;
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}

	public static function layTinTheoLoaitin($idLoaiTin)
	{
		$db = Database::connectDB();
		try {
			$query = "
			SELECT * FROM tinchitiet
			WHERE idLoaiTin = ?
			ORDER BY idTinChiTiet DESC
			";
			$statement = $db->prepare($query);
			$statement->bindParam(1,$idLoaiTin);
			$statement->execute();
			$rows = $statement->fetchAll();
			$statement->closeCursor();
			$allItem = array();
			foreach ($rows as $key => $value) {
				$item = new Tinchitiet($value['idTinChiTiet'],$value['idTheLoai'],$value['idLoaiTin']  ,$value['tieuDe'],$value['tieuDeKhongDau'],$value['tomTat'],$value['noiDung'],$value['image'],$value['ngayDang'],$value['tinNoiBat'],$value['soLanXem'],$value['anHien']);
				$allItem[]=$item;
			}
			return $allItem;
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}

	public static function layKetQuaTimKiem($noiDungTimKiem)
	{
		$db = Database::connectDB();
		$noiDungTimKiem = "%$noiDungTimKiem%";
		try {
			$query = "
			SELECT * FROM tinchitiet
			WHERE tieuDe LIKE ? OR tomTat LIKE ? OR ngayDang LIKE ?
			ORDER BY idTinChiTiet DESC
			";
			$statement = $db->prepare($query);
			$statement->bindParam(1,$noiDungTimKiem);
			$statement->bindParam(2,$noiDungTimKiem);
			$statement->bindParam(3,$noiDungTimKiem);
			$statement->execute();
			$rows = $statement->fetchAll();
			$statement->closeCursor();
			$allItem = array();
			foreach ($rows as $key => $value) {
				$item = new Tinchitiet($value['idTinChiTiet'],$value['idTheLoai'],$value['idLoaiTin']  ,$value['tieuDe'],$value['tieuDeKhongDau'],$value['tomTat'],$value['noiDung'],$value['image'],$value['ngayDang'],$value['tinNoiBat'],$value['soLanXem'],$value['anHien']);
				$allItem[]=$item;
			}
			return $allItem;
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}

	public static function layNhungTinCungLoaiTin($idTinChiTiet,$idLoaiTin){
		$db = Database::connectDB();
		try {
			$query = "
			SELECT * FROM tinchitiet
			WHERE idTinChiTiet <> ?
			AND idLoaiTin = ?
			ORDER BY idTinChiTiet
			LIMIT 0,5
			";
			$statement = $db->prepare($query);
			$statement->bindParam(1,$idTinChiTiet);
			$statement->bindParam(2,$idLoaiTin);
			$statement->execute();
			$rows = $statement->fetchAll();
			$statement->closeCursor();
			$allItem = array();
			foreach ($rows as $key => $value) {
				$item = new Tinchitiet($value['idTinChiTiet'],$value['idTheLoai'],$value['idLoaiTin'] ,$value['tieuDe'],$value['tieuDeKhongDau'],$value['tomTat'],$value['noiDung'],$value['image'],$value['ngayDang'],$value['tinNoiBat'],$value['soLanXem'],$value['anHien']);
				$allItem[]=$item;
			}
			return $allItem;	
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}
	public static function laySoLanXemTin($idTinChiTiet){
		$db = Database::connectDB();
		try {
			$query = "
			UPDATE tinchitiet
			SET soLanXem = soLanXem + 1
			WHERE idTinChiTiet = ?
			";
			$statement = $db->prepare($query);
			$statement->bindParam(1,$idTinChiTiet);
			$statement->execute();
			$statement->closeCursor();
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}

	public static function layNhungTinXemNhieuNhat(){
		$db = Database::connectDB();
		try {
			$query = "
			SELECT * FROM tinchitiet
			WHERE soLanXem > 0
			ORDER BY soLanXem DESC
			LIMIT 0,10
			";
			$statement = $db->prepare($query);
			$statement->execute();
			$rows = $statement->fetchAll();
			$statement->closeCursor();
			$allItem = array();
			foreach ($rows as $key => $value) {
				$item = new Tinchitiet($value['idTinChiTiet'],$value['idTheLoai'],$value['idLoaiTin']  ,$value['tieuDe'],$value['tieuDeKhongDau'],$value['tomTat'],$value['noiDung'],$value['image'],$value['ngayDang'],$value['tinNoiBat'],$value['soLanXem'],$value['anHien']);
				$allItem[]=$item;
			}
			return $allItem;	
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}

	public static function tinHotNhat_PhanTrang($form, $sotinmottrang)
	{
		$db = Database::connectDB();
		try {
			$query = "
			SELECT * FROM tinchitiet
			ORDER BY soLanXem DESC
			LIMIT $form, $sotinmottrang
			";
			$statement = $db->prepare($query);
			$statement->execute();
			$rows = $statement->fetchAll();
			$statement->closeCursor();
			$allItem = array();
			foreach ($rows as $key => $value) {
				$item = new Tinchitiet($value['idTinChiTiet'],$value['idTheLoai'],$value['idLoaiTin']  ,$value['tieuDe'],$value['tieuDeKhongDau'],$value['tomTat'],$value['noiDung'],$value['image'],$value['ngayDang'],$value['tinNoiBat'],$value['soLanXem'],$value['anHien']);
				$allItem[]=$item;
			}
			return $allItem;
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}
}
?>