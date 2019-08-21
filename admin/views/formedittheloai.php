

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
			<form action="" method="POST">
				<div class="form-group row ">
					<label  class="col-sm-2 col-form-label">ID Thể Loại</label>
					<div class="col-sm-4 push-sm-4">
						<input name="idTheLoai" type="text" class="form-control" id="inputEmail3" placeholder="Nhập ID thể loại Ví dụ Xã Hội ID là XH" value="<?= $TheLoai['idTheLoai'] ?>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Tên Thể Loại</label>
					<div class=" col-sm-4 push-sm-4">
						<input name="tenTheLoai" type="text" class="form-control" id="inputPassword3" placeholder="Tên Thể Loại" value="<?= $TheLoai['tenTheLoai'] ?>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Thứ Tự</label>
					<div class=" col-sm-4 push-sm-4">
						<input name="thuTu" type="text" class="form-control" id="inputPassword3" placeholder="Tên Thể Loại" value="<?= $TheLoai['thuTu'] ?>">
					</div>
				</div>
				
				<div class="form-group row text-left">
					<div class="col-sm-10">
						<button name="action" value="edittheloai" type="submit" class="btn btn-primary">Sửa</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div> <!-- end container -->

</div>
</div>
</div>


<?php include_once('basethemefooter.php') ?>