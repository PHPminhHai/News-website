<?php 
// phan trang
$sotinmottrang = 5; 
$tongSoTin = count(TinchitietDB::layTatCaTin());
$tongSoTrang = ceil($tongSoTin/$sotinmottrang);
if(isset($_GET['so_trang'])){
	$so_trang = $_GET['so_trang'];
	settype($so_trang,"int");
}else{
	$so_trang = 1;
}
$from = ($so_trang - 1) * $sotinmottrang;

$layTatCaTin_PhanTrang = TinchitietDB::layTatCaTin_PhanTrang($from,$sotinmottrang);
?>

<!-- het phan trang -->
<div class="col-sm-8">
	<div class="alert alert-primary p-1 pl-3 border-0" role="alert">
		<small class="p-0 text-capitalize">Tin Mới Nhất</small>
		<a href="?loaitrang=hotnew" class="float-right pr-3">Hot New</a>
		<?php foreach ($layTatCaTin_PhanTrang as $key => $value): ?>
		</div>
		<div class="card mb-3">
			<div class="row no-gutters">
				<div class="col-md-4">
					<a href="?action=show_chi_tiet&idTheLoai=<?= $value->getIdTheLoai(); ?>&idTinChiTiet=<?= $value->getIdTinChiTiet()?>&idLoaiTin=<?= $value->getIdLoaiTin()?>"><img src="public/image/<?= $value->getImage() ?>"  class="card-img"  alt="<?= $value->getImage() ?>" ></a>
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<a  href="?action=show_chi_tiet&idTheLoai=<?= $value->getIdTheLoai(); ?>&idTinChiTiet=<?= $value->getIdTinChiTiet()?>&idLoaiTin=<?= $value->getIdLoaiTin()?>"><h5 class="card-title"><?= $value->getTieuDe() ?></h5></a>
						<p class="card-text"><?= $value->getTomTat() ?></p>
						<p class="card-text"><small class="text-muted">Post on <?= $value->getNgayDang() ?></small></p>
						<i class="fas fa-heart"> <?= $value->getSoLanXem() ?></i>
					</div>
				</div>

			</div>
		<?php endforeach ?>
	</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<?php 
			for ($i=1; $i <= $tongSoTrang ; $i++):?>
				<li class="page-item"><a <?php if($i==$so_trang) echo"style='background-color:black'";?> class="page-link" href="?action=page_phan_trang&so_trang=<?php echo $i; ?>"><?php echo $i ?></a></li>
			<?php endfor; ?>
			<a class="page-link" href="#" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
	</ul>
</nav>
</div>