<div class = "container-fluid">
	<h4>Detail Pesanan<div class = "btn btn-sm btn-success">No. Tagihan : <?php echo $invoice->id?></div></h4>
	
	<table class ="table table-bordered table-hover table-striped">
		<tr>
			<th>NO.</th>
			<th>Nama Produk</th>
			<th>Jumlah Pesanan</th>
			<th>Harga Satuan</th>
			<th>Sub-Total</th>
		<tr> 
		
		<?php
			$total = 0;
			foreach ($pesanan as $psn) :
				$subtotal = $psn->jumlah*$psn->harga;
				$total = $total+$subtotal;
			
		?>
		
		<tr>
			<td><?php echo $psn->id_brg  ?></td>
			<td><?php echo $psn->nama_brg  ?></td>
			<td><?php  $psn->jumlah  ?></td>
			<td><?php echo $psn->harga  ?></td>
			<td><?php echo $psn->harga  ?></td>
			<td><?php echo number_format($psn->harga, 0,',','.')  ?></td>
			<td><?php echo number_format($subtotal, 0,',','.')  ?></td>
		</tr>
		
		<?php endforeach; ?>
		
		<tr>
			<td colspan="4" align="right">Grand Total</td>
			<td align="right"><?php echo number_format($total, 0,',','.')  ?></td>
		</tr>
		
	</table>
	
	<a href="<?php echo base_url(admin/tagihan/index) ?>"><div class="btn btn-sm btn-primary"></div></a>
	
</div>