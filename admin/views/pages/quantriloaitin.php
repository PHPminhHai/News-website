<?php 	
	$LayTatCaLoaiTin = LoaiTinDB::LayTatCaLoaiTin();
 ?>

<table class="table table-dark">
	<thead>
		<tr>
			<th scope="col">STT</th>
			<th scope="col">ID Loại Tin</th>
			<th scope="col">ID Thể Loại</th>
			<th scope="col">Tên Loại Tin</th>
			<th scope="col">Tên Loại Tin không dấu</th>
			<th scope="col">Thu Tu</th>
			<th scope="col">Action</th>
		</tr>
	</thead>
	<tbody>
		<?php 	foreach ($LayTatCaLoaiTin as $key => $value): ?>
			<tr>
				<th scope="row">1</th>
				<td><?php echo $value->getIdLoaiTin();?></td>
				<td><?php echo $value->getIdTheLoai();?></td>
				<td><?php echo $value->getTenLoaiTin();?></td>
				<td><?php echo $value->getTenLoaiTinConKhongDau();?></td>
				<td><?php echo $value->getThuTu();?></td>
				<td colspan="2">
					<a href="?action=delete_theloai&">Edit</a>
					<a href="">Delete</a>
				</td>
			</tr>
		<?php 	endforeach; ?>
		<tr>
			<td colspan="5">
				<a href="?action=formthemtheloai" class="btn btn-outline-info">Thêm Thể Loại</a>
			</td>
		</tr>
	</tbody>
</table>