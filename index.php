<?php 
include('admin/model/database/connect_db.php');
include('admin/model/runtheloai.php');
include('admin/model/runloaitin.php');
include('admin/model/runslide.php');
include('admin/model/runtinchitiet.php');

$action = filter_input(INPUT_POST,'action');
if(empty($action)){
	$action = filter_input(INPUT_GET,'action');
	if(empty($action)){
		$action = 'show_page_home';
	}
}
switch ($action) {
	case 'show_page_home':
	include('interface/home.php');
	break;
	case 'show_chi_tiet':
	$idTinChiTiet = filter_input(INPUT_GET,'idTinChiTiet');
	$idLoaiTin = filter_input(INPUT_GET,'idLoaiTin');
	$layNoiDungTin = TinchitietDB::layNoiDungTin($idTinChiTiet);
	$layNhungTinCungLoaiTin = TinchitietDB::layNhungTinCungLoaiTin($idTinChiTiet,$idLoaiTin);
	TinchitietDB::laySoLanXemTin($idTinChiTiet);
	include_once('interface/tinchitiet.php');
	break;
	case'page_phan_trang':
	include('interface/home.php');
	break;
	default:
		# code...
	break;
}

?>