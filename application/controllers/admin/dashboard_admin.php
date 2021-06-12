<?php
    class Dashboard_admin extends CI_Controller{
        
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
		
		public function index()
        {
            $this->load->view('templates_admin/header');
            $this->load->view('templates_admin/sidebar');
            $this->load->view('admin/dashboard');
            $this->load->view('templates_admin/footer');
        }
    }