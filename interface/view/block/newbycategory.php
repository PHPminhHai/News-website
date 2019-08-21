
<div class="container">
	<?php foreach ($LayTatCaTheloai as $key => $value): 
		$layBonTinTheoTheLoai = TinchitietDB::layBonTinTheoTheLoai($value->getIdTheLoai())
		?>
		<div class="alert alert-primary p-1 pl-3 border-0" role="alert">
			<small class="p-0 text-capitalize"><a href=""><?= $value->getTenTheLoai() ?></a></small>
		</div>
		<div class="row">
			<div class="card-group">
				<?php foreach ($layBonTinTheoTheLoai as $key => $value2): ?>

					<div class="col-sm-3 mb-1">
						<div class="card-deck">
							<div class="card">
								<a href="?action=show_chi_tiet&idTheLoai=<?= $value2->getIdTheLoai(); ?>&idTinChiTiet=<?= $value2->getIdTinChiTiet()?>&idLoaiTin=<?= $value2->getIdLoaiTin()?>"><img src="public/image/<?= $value2->getImage() ?>" class="card-img-top" alt="<?= $value2->getImage() ?>"></a>
								<div class="card-body">
									<a href="?action=show_chi_tiet&idTheLoai=<?= $value2->getIdTheLoai(); ?>&idTinChiTiet=<?= $value2->getIdTinChiTiet()?>&idLoaiTin=<?= $value2->getIdLoaiTin()?>"><h5 class="card-title"><?= substr($value2->getTieuDe(),0,55); ?>...</h5> </a>
									<p class="card-text"><small class="text-muted"><?= $value2->getNgayDang() ?></small></p>
								</div>
							</div>
						</div>
					</div>
				<?php endforeach ?>
			</div>
		</div>
	<?php endforeach ?>
</div>