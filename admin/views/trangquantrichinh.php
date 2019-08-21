<?php include_once('basethemehead.php') ?>
<div class="container-fluid bg-dark top_top">

	<div class="row  banner_top">
		<div class="col-sm-4  ">
			<h2>Minh Hải</h2>
		</div>
		<div class="col-sm-8 ">
			<h2 class="text-center">Chào mừng bạn đến với trang quản trị</h2>
		</div>
	</div>
</div>
<div class="container-fluid  position-relative">
	<div class="row menu_content">
		<div class="col-3 bg-dark menu_phai ">
			<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				<span class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#" id="quanlitheloai" >Quản Trị Thể Loại</span>
				<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" >Quản Trị loại tin</a>
				<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" >Quản trị tin</a>
			</div>
		</div>
		<div class="col-9  noidung">
			<?php 
			// include_once('views/pages/quantriloaitin.php')
			include_once('views/pages/quantritheloai.php')
			 ?>
		</div>
	</div>
</div> <!-- end container -->

</div>
</div>
</div>

<?php include_once('basethemefooter.php') ?>