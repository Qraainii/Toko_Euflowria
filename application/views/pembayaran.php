<div class="container-fluid">
    <div class="row">
        <div class="col-md2"></div>
        <div class="col-md8">
            <div class="btn btn-sm btn-success">
                <?php
                $grand_total = 0;
                if ($keranjang = $this->cart->contents()) {
                    foreach ($keranjang as $item) {
                        $grand_total = $grand_total + $item['subtotal'];
                    }
                    echo "<h5>Total Belanja Anda: Rp " . number_format($grand_total, 0, ',', '.');
                ?>
            </div><br><br>

            <h5>Input Alamat Pengiriman dan Pembayaran</h5>

            <form action="<?php echo base_url('dashboard/proses_pesanan'); ?>" method="post">

                <div class="form-group">
                    <label>Nama Lengkap</label>
                    <input type="text" name="nama" placeholder="Nama Lengkap Anda" class="form-control">
                </div>

                <div class="form-group">
                    <label>Alamat Lengkap</label>
                    <input type="text" name="alamat" placeholder="Alamat Lengkap Anda" class="form-control">
                </div>

                <div class="form-group">
                    <label>No. Telepon</label>
                    <input type="text" name="no_telp" placeholder="Nomor Telepon Anda" class="form-control">
                </div>

                <div class="form-group">
                    <label>Jasa Pengiriman</label>
                    <select class="form-control">
                        <option>JNE</option>
                        <option>Tiki</option>
                        <option>POS Indonesia</option>
                        <option>GoJek</option>
                        <option>Grab</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Pilih Bank</label>
                    <select class="form-control">
                        <option>BCA - XXXXXXXX</option>
                        <option>BNI - XXXXXXXX</option>
                        <option>BRI - XXXXXXXX</option>
                        <option>MANDIRI - XXXXXXXX</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-btn-sm btn-primary mb-3">Pesan</button>

            </form>

        <?php
                } else {
                    echo "<h5>Keranjang Belanja Anda masih kosong</h5>";
                }
        ?>

        </div>

        <div class="col-md2"></div>
    </div>
</div>