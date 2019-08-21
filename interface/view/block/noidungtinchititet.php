<?php 
$idLoaiTin = filter_input(INPUT_GET, 'idLoaiTin');
$idTheLoai = filter_input(INPUT_GET, 'idTheLoai');
$layTenTheLoaiVaTenLoaiTin= LoaiTinDB::layTenTheLoaiVaTenLoaiTin($idTheLoai,$idLoaiTin);
?>
<div class="container">
	<div class="row">
		<div class="col-sm-8">
			<div class="alert alert-primary" role="alert">
				<a href="?action=show_page_home">Trang chủ</a>>>
				<a href="?loaitrang=tintheoloaitin&idTheLoai=<?= $value2->getIdTheLoai(); ?>&idLoaiTin=<?=  $value2->getIdLoaiTin(); ?>"><?= $layTenTheLoaiVaTenLoaiTin['tenTheLoai'];?></a>>>
				<a  href="?loaitrang=tintheoloaitin&idTheLoai=<?= $value2->getIdTheLoai(); ?>&idLoaiTin=<?=  $value2->getIdLoaiTin(); ?>"><?= $layTenTheLoaiVaTenLoaiTin['tenLoaiTin'];?></a>
			</div>
			<div class="jumbotron">
				<h1 class="display-4"><?= $layNoiDungTin->getTieuDe() ?></h1>
				<img src="public/image/<?= $layNoiDungTin->getImage() ?>" alt="<?= $layNoiDungTin->getImage() ?>">
				<p class="lead"><?= $layNoiDungTin->getTomTat() ?></p>
				<hr class="my-4">
				<p><?= $layNoiDungTin->getNoiDung() ?></p>
			</div>
		</div>
		<div class="col-md-4">
			<ul class="list-group">
				<li class="alert alert-secondary" aria-disabled="true">Tin Lien Quan</li>
				<?php foreach ($layNhungTinCungLoaiTin as $key => $value):?>
					<li class="list-group-item"><a href="?action=show_chi_tiet&idTheLoai=<?= $value->getIdTheLoai(); ?>&idTinChiTiet=<?= $value->getIdTinChiTiet()?>&idLoaiTin=<?= $value->getIdLoaiTin()?>"><?= $value->getTieuDe(); ?></a></li>
				<?php endforeach; ?>
			</ul>
		</div>
	</div>
</div>