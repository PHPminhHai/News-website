<div class="container">
	<div class="row">
		<div class="col-sm-4 font-weight-bolder text-center">
			<h1 class="display-6 pt-5 text-uppercase"><a href="?action=show_page_home">logo company</a></h1>
		</div>
		<div class="col-sm-8">
			<div id="Slides2" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<?php 
					$LayTatCaSlide = SlideDB::LayTatCaSlide();
					foreach ($LayTatCaSlide as $key => $value) : ?>
					<div class="carousel-item active">
						<img src="public/slide/carousel/<?php echo $value->getImage(); ?>" class="d-block w-100" alt="...">
					</div>
					<!-- <div class="carousel-item">
						<img src="public/slide/carousel/2.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="public/slide/carousel/3.jpg" class="d-block w-100" alt="...">
					</div> -->
				<?php endforeach; ?>
				</div>
			</div>
		</div>
	</div>
</div>