<?php 
if(isset($_GET['loaitrang'])){
	$loatrang = $_GET['loaitrang'];
}else if(isset($_POST['loaitrang'])){
	$loaitrang = $_POST['loaitrang'];
}else{
	$loaitrang = 'noidungtinchitiet';
}
?>


<?php include_once('view/block/basethemehead.php') ?>
<div class="header">
	<?php include_once('view/block/header.php') ?>
</div>
<!-- het header -->
<div class="menu">
	<?php include_once('view/block/nav.php') ?>
</div>

<!-- het nav -->
<div class="noidungtinchitiet mt-3">
	<?php
	switch ($loaitrang) {
		case 'noidungtinchitiet':
		include_once('view/block/noidungtinchititet.php');
		break;
		case 'layKetQuaTimKiem':
		include_once('view/pages/ketquatimkiem.php');
		break;
		default:
			# code...
		break;
	}
	?>
	
</div>

<!-- alllastnew -->

<footer class="bg-light">
	<?php include_once('view/block/footer.php') ?>
</footer>
<?php include_once('view/block/basethemefooter.php') ?>

