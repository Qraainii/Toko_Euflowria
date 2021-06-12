<div class = "container-fluid">
	<div class="card">
		<h5 class="card-header">Detail Produk</h5>
		<div class = "card-body">
			
			<?php foreach($barang as $brg): ?>
			<div class = "row">
				<div class = "col-md-4">
					<img src="<?php echo base_url().'/uploads/'.$brg->gambar ?>">
				</div>
				<div class = "col-md-8">
					<table class="table">
						<tr>
							<td>Nama Produk</td>
							<td><strong><?php echo $brg->nama_brg ?></strong></td>
							
							<td>Keterangan</td> 
							<td><strong><?php echo $brg->keterangan ?></strong></td>
							
							<td>Kategori</td> 
							<td><strong><?php echo $brg->kategori ?></strong></td>
							
							<td>Stok</td> 
							<td><strong><?php echo $brg->stok ?></strong></td>
							
							<td>Harga</td> 
							<td><strong><div class = "btn btn-sm btn-success">Rp. <?php echo number_format($brg->harga,0,',','.') ?></div></strong></td>
							
						</tr>
					</table>
					
					<?php echo anchor('dashboard/tambah_keranjang/'.$brg->id_brg,'<div class="btn btn-sm btn-primary">Tambah Keranjang</div>') ?>
					
					<?php echo anchor('dashboard/index/','<div class="btn btn-sm btn-danger">Kembali</div>') ?>
					
				</div>
				
			<?php endforeach; ?>	
				
			</div>	
		</div>		
	</div> 
</div> 