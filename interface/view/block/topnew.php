<?php 
$layMotTinMoiNhat = TinchitietDB::layMotTinMoiNhat();
$layMuoiTinHotNhat = TinchitietDB::layMuoiTinHotNhat();
?>

<div class="container">
	<div class="row">
		<div class="col-sm-8">
			<div class="card bg-dark text-white border-0" >
				<img  src="public/image/<?= $layMotTinMoiNhat->getImage() ?>" class="card-img" alt="<?= $layMotTinMoiNhat->getImage() ?>">
				<div class="card-img-overlay img-fluid">
					<h5 class="card-title font-weight-bold title-cus"><a href="?action=show_chi_tiet&idTheLoai=<?= $layMotTinMoiNhat->getIdTheLoai()?>&idTinChiTiet=<?= $layMotTinMoiNhat->getIdTinChiTiet()?>&idLoaiTin=<?= $layMotTinMoiNhat->getIdLoaiTin()?>"><?= $layMotTinMoiNhat->getTieuDe() ?></a></h5>
					<p class="card-text time-cus "><?= $layMotTinMoiNhat->getNgayDang() ?></p>
				</div>
			</div>
	
		</div>
		<div class="col-sm-4 list5new">
			<div class="card-header list-group-item-primary">
				Tin mới nhất
			</div>
			<div class="card">
				<ul class="list-group list-group-flush list5newitem overflow-auto">
					<?php foreach ($layMuoiTinHotNhat as $key => $value): ?>
						<li class="list-group-item p-1 pl-4"><a href="?action=show_chi_tiet&idTheLoai=<?= $value->getIdTheLoai(); ?>&idTinChiTiet=<?= $value->getIdTinChiTiet()?>&idLoaiTin=<?= $value->getIdLoaiTin()?>"><?= $value->getTieuDe() ?></a></li>
					<?php endforeach ?>
					
				</ul>
			</div>
		</div>
	</div>
</div>