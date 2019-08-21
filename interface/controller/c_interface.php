<?php 
include_once('../../admin/model/database/connect_db.php');
include_once('../../admin/model/runtheloai.php');
include_once('../../admin/model/runloaitin.php');
include_once('../../admin/model/runtinchitiet.php');
$action = filter_input(INPUT_POST,'action');
if (empty($action)) {
	$action = filter_input(INPUT_GET,'action');
	if (empty($action)) {
		$action = 'show_interface';
	}
}
	switch ('$action') {
		case 'show_interface':
			include_once('../../index.php');
			break;
		
		default:
			// code...
			break;
	}







?>