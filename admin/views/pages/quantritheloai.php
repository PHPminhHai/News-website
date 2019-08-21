<?php 
$LayTatCaTheloai = TheLoaiDB::LayTatCaTheloai();
$tongTheLoai = count($LayTatCaTheloai);
?>
<table class="table table-dark">
	<thead>
		<tr>
			<th scope="col">STT</th>
			<th scope="col">ID Thể Loại</th>
			<th scope="col">Tên Thể Loại</th>
			<th scope="col">Tên Thể Loại không dấu</th>
			<th scope="col">Thứ Tự</th>
			<th scope="col">Action</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($LayTatCaTheloai as $key => $value):?>
			<tr>	
					
				<th scope="row">1</th>

				<td><?php echo $value->getIdTheLoai();?></td>
				<td><?php echo $value->getTenTheLoai();?></td>
				<td><?php echo $value->getTenTheLoaiKhongDau();?></td>
				<td><?php echo $value->getThuTu();?></td>
				<td colspan="2">
					<a href="?action=formedit_theloai&idTheLoai=<?= $value->getIdTheLoai();?>">Edit</a>
					<a href="?action=delete_theloai&idTheLoai=<?= $value->getIdTheLoai(); ?>" onclick="return confirm('Bạn có muốn xóa thể loại')">Delete</a>
				</td>
			</tr>
		
		<?php endforeach; ?>
		<tr>
			<td colspan="5">
				<a href="?action=formthemtheloai" class="btn btn-outline-info">Thêm Thể Loại</a>
			</td>
		</tr>
	</tbody>
</table>