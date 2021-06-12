<?php
	class Model_kategori extends CI_Model{
		public function data_bibit_bunga(){
			return $this->db->get_where("tb_barang", array('kategori'=>'data_bibit_bunga'));
		}
		
		public function data_buket_bunga(){
			return $this->db->get_where("tb_barang", array('kategori'=>'data_buket_bunga'));
		}
	}
	
?>