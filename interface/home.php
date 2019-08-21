
<?php include_once('view/block/basethemehead.php'); 
// controller cho loai trang phan page
if (isset($_GET['loaitrang'])) {
	$loaitrang = $_GET['loaitrang'];
}elseif (isset($_POST['loaitrang'])) {
	$loaitrang = $_POST['loaitrang'];
}else {
	$loaitrang = '';
}
// het controller cho loai trang phan page
?>
<div class="header">
	<?php include_once('view/block/header.php') ?>
</div>
<!-- het header -->
<div class="menu">
	<?php include_once('view/block/nav.php') ?>
</div>

<!-- het nav -->
<div class="topnew mt-3">
	<?php include_once('view/block/topnew.php') ?>
</div>
<!-- top new -->
<div class="alllastnew mt-3">
	<div class="container">
		<div class="row">
			<?php
			switch ($loaitrang) {
				case 'tintheoloaitin':
					include_once('view/pages/tintheoloaitin.php');
					break;
				case 'layKetQuaTimKiem':
					include_once('view/pages/ketquatimkiem.php');
					break;
				case'hotnew':
				
				include_once('view/pages/hotnew.php');
				break;
				default:
					include_once('view/pages/alllastnew.php');
					break;
			}
			  ?>
			<!-- 8 all last new -->
			<?php include_once('view/block/formlogin.php') ?>
			<!-- login -->
		</div>
	</div>
</div>
<!-- alllastnew -->
<div class="newbycategory">
	<?php include_once('view/block/newbycategory.php') ?>
</div>
<footer class="bg-light">
	<?php include_once('view/block/footer.php') ?>
</footer>
<?php include_once('view/block/basethemefooter.php') ?>

