<?php

class Dashboard extends CI_Controller{

		public function __construct(){
			parent:: _construct();
			
			if($this->session->userdata('role_id')!='1'){
				$this->session->set_flashdata('pesan','<div class="alert alert-danger alert-dismissible fade show" role="alert">
					Anda belum login.
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>');
			redirect('auth/login');		
			 
			}
		}
	
	

    public function tambah_keranjang($id)
    {
        $barang = $this->model_barang->find($id);
        $data = array(
            'id'      => $barang->id_brg,
            'qty'     => 1,
            'price'   => $barang->harga,
            'name'    => $barang->nama_brg,
        );
        
        $this->cart->insert($data);
        redirect('Welcome');
    }
    
    public function detail_keranjang()
    {
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('keranjang');
        $this->load->view('templates/footer');
    }

    public function hapus_keranjang()
    {
        $this->cart->destroy();
        redirect('Welcome');
    }

    public function pembayaran()
    {
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('pembayaran');
        $this->load->view('templates/footer');
    }

    public function proses_pesanan()
    {
        $is_processed = $this->cart->model_tagihan->index();
		if($is_processed){
			$this->cart->destroy();
			$this->load->view('templates/header');
			$this->load->view('templates/sidebar');
			$this->load->view('proses_pesanan');
			$this->load->view('templates/footer');
		}
		else{
			echo "Maaf, pesanan anda gagal diproses.";
		}
    }
	
	public function detail(){
		$data['barang'] = $this->model_barang->detail_brg($id_barang);
		$this->load->view('templates/header');
		$this->load->view('templates/sidebar');
		$this->load->view('detail_barang',$data);
		$this->load->view('templates/footer');
	}
} 