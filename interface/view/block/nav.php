<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand font-weight-bold" href="?action=show_page_home">NEW</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<?php 
				$LayTatCaTheloai = TheLoaiDB::LayTatCaTheloai();
				foreach ($LayTatCaTheloai as $key => $value):
					$LayLoaiTinTheoTheLoai = LoaiTinDB::LayLoaiTinTheoTheLoai($value->getIdTheLoai());
					?>
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<?php echo 	$value->getTenTheLoai(); ?>
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<?php 	foreach ($LayLoaiTinTheoTheLoai as $key => $value2) : ?>
								<a class="dropdown-item" href="?loaitrang=tintheoloaitin&idTheLoai=<?= $value2->getIdTheLoai(); ?>&idLoaiTin=<?=  $value2->getIdLoaiTin(); ?>"><?=  $value2->getTenLoaiTin(); ?></a>
							<?php 	endforeach; ?>
						</div>
					</li>
				<?php 	endforeach; ?>

			</ul>
			<form class="form-inline my-2 my-lg-0" method="POST">
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="noiDungTimKiem">
				<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit" name="loaitrang" value="layKetQuaTimKiem">Search</button>
			</form>
		</div>
	</div>
</nav>