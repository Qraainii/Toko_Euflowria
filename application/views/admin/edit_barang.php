<div class="container-fluid">
    <h3><i class="fas fa-edit"></i>EDIT DATA PRODUK</h3>

    <?php foreach($barang as $brg) : ?>

        <form method="post" action="<?php echo base_url().'admin/data_barang/update' ?>" >
            <div class="form-group">
            
                <label>Nama Produk</label>
                <input type="text" name="nama_brg" class="form-control" value="<?php echo $brg->nama_brg ?>">

                <label>Keterangan</label>
                <input type="hidden" name="id_brg" class="form-control" value="<?php echo $brg->id_brg ?>">
                <input type="text" name="keterangan" class="form-control" value="<?php echo $brg->keterangan ?>">

                <label>Kategori</label>
                <input type="text" name="kategori" class="form-control" value="<?php echo $brg->kategori ?>">

                <label>Harga</label>
                <input type="text" name="harga" class="form-control" value="<?php echo $brg->harga ?>">

                <label>Stok</label>
                <input type="text" name="stok" class="form-control" value="<?php echo $brg->stok ?>">

            </div>
            <button type="submit" class="btn btn-primary btn-sm">Simpan</button>
        </form>

    <?php endforeach; ?>
</div>