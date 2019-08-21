
<?php
$noiDungTimKiem = filter_input(INPUT_POST,'noiDungTimKiem');
$ketQuaTimKiem = TinchitietDB::layKetQuaTimKiem($noiDungTimKiem); 

$tongSoTinTimDuoc = count($ketQuaTimKiem);
?>
<div class="col-sm-8">
	<div class="alert alert-primary p-1 pl-3 border-0" role="alert">
		<small class="p-0 text-capitalize">Có <?= $tongSoTinTimDuoc ?> Tin có từ: <?= $noiDungTimKiem ?></small>
		<a href="" class="float-right pr-3">Hot New</a>
		<?php foreach ($ketQuaTimKiem as $key => $value): ?>
		</div>
		<div class="card mb-3">
			<div class="row no-gutters">
				<div class="col-md-4">
					<a href="?action=show_chi_tiet&idTheLoai=<?= $value->getIdTheLoai(); ?>&idTinChiTiet=<?= $value->getIdTinChiTiet()?>&idLoaiTin=<?= $value->getIdLoaiTin()?>"><img src="public/image/<?= $value->getImage() ?>"  class="card-img"  alt="<?= $value->getImage() ?>" ></a>
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<a href="?action=show_chi_tiet&idTheLoai=<?= $value->getIdTheLoai(); ?>&idTinChiTiet=<?= $value->getIdTinChiTiet()?>&idLoaiTin=<?= $value->getIdLoaiTin()?>"><h5 class="card-title"><?= $value->getTieuDe() ?></h5></a>
						<p class="card-text"><?= $value->getTomTat() ?></p>
						<p class="card-text"><small class="text-muted">Post on <?= $value->getNgayDang() ?></small></p>
						<i class="fas fa-heart"> <?= $value->getSoLanXem() ?></i>
					</div>
				</div>

			</div>
		<?php endforeach ?>
	</div>
</div>