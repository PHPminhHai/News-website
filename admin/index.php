<?php 
include('model/database/connect_db.php');
include('model/runtheloai.php');
include('model/runloaitin.php');
include('model/runslide.php');
include('model/runtinchitiet.php');
include('model/functions.php');

$action = filter_input(INPUT_POST,'action');
if(empty($action)){
	$action = filter_input(INPUT_GET,'action');
	if(empty($action)){
		$action = 'show_trang_quang_tri';
	}
}

switch ($action) {
	case 'show_trang_quang_tri':
		include_once('views/trangquantrichinh.php');
		break;
	case'formthemtheloai':
	include_once('views/formthemtheloai.php');
	break;
	case'addtheloai':
	$idTheLoai = $_POST['idTheLoai'];
	$tenTheLoai = $_POST['tenTheLoai'];
	$tenTheLoaiKhongDau = changeTitle($tenTheLoai);
	$thuTu = $_POST['thuTu'];
	settype($thuTu, "int");
	TheLoaiDB::themTheLoaiMoi($idTheLoai,$tenTheLoai,$tenTheLoaiKhongDau,$thuTu);
	include_once('views/trangquantrichinh.php');
	break;
	case'delete_theloai':
	$idTheLoai = filter_input(INPUT_GET,'idTheLoai');
	TheLoaiDB::xoaTheloai($idTheLoai);
	include_once('views/trangquantrichinh.php');
	break;
	case'formedit_theloai':
	$idTheLoai = filter_input(INPUT_GET,'idTheLoai');
	$TheLoai = TheLoaiDB::layTenTheLoaiBangIdTheLoai($idTheLoai);
	include_once('views/formedittheloai.php');
	break;
	case'edittheloai':
	$idTheLoai = $_POST['idTheLoai'];
	$tenTheLoai = $_POST['tenTheLoai'];
	$tenTheLoaiKhongDau = changeTitle($tenTheLoai);
	$thuTu = $_POST['thuTu'];
	settype($thuTu, "int");
	TheLoaiDB::updateTheLoai($idTheLoai,$tenTheLoai,$tenTheLoaiKhongDau,$thuTu);
	include_once('views/trangquantrichinh.php');
	break;
	default:
		// code...
		break;
}
?>