<?php
class Kategori extends CI_Controller
{

	public function bibit_bunga()
	{
		$data['bibit_bunga'] = $this->model_kategori->data_bibit_bunga()->result();
		$this->load->view('templates/header');
		$this->load->view('templates/sidebar');
		$this->load->view('bibit_bunga', $data);
		$this->load->view('templates/footer');
	}

	public function buket_bunga()
	{
		$data['buket_bunga'] = $this->model_kategori->data_buket_bunga()->result();
		$this->load->view('templates/header');
		$this->load->view('templates/sidebar');
		$this->load->view('buket_bunga', $data);
		$this->load->view('templates/footer');
	}
}
