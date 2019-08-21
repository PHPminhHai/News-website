<?php 
include_once('database/classslide.php');

class SlideDB
{
	public static function LayTatCaSlide(){
		$db = Database::connectDB();
		try {
			$query ="
			SELECT * FROM slide
			ORDER BY idSlide 
			";
			$statement = $db->prepare($query);
			$statement->execute();
			$rows = $statement->fetchAll();
			$statement->closeCursor();
			$Allitem = array();
			foreach($rows as $key => $value) {
				$item = new Slide($value['idSlide'], $value['idUser'], $value['image'], $value['groupImage']);
				$Allitem[] = $item;
			}
			return $Allitem;
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}

	public static function LayTatCaSlideTheo_imageGroup($imageGroup){
		$db = Daabase::connectDB();
		try {
			$query ="
			SELECT * FROM slide
			WHERE imageGroup = ?
			ORDER BY idSlide 
			";
			$statement = $db->prepare($query);
			$statement->bindParam(1,$imageGroup);
			$statement->execute();
			$statement->closeCursor();
			$rows = $statement->fetchAll();
			$Allitem = array();
			foreach ($rows as $key => $value) {
				$item = new Slide($value['idSlide'],$value['idUser'],$value['image'],$value['groupImage']);
				$Allitem[] = $item;
			}
			return $Allitem;
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}
}

?>