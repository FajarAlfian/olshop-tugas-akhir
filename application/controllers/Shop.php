<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Shop extends CI_Controller {


    public function __construct() {
        parent::__construct();
        $this->load->model('category_model');
        $this->load->model('product_model');
        $this->load->model('contact_model');
        $active = array(
            "home" => null,
            "about" => null,
            "contact" => null
        );
    }
    
    public function index() {
        $this->load->library('pagination');
        
        $config['base_url'] = site_url('shop/index');
        $config['total_rows'] = $this->product_model->getProductCount();
        $config['per_page'] = 6;
        $config['uri_segment'] = 3;
        $config['num_links'] = 2;
        $config['use_page_numbers'] = TRUE;
        $config['full_tag_open'] 	= '<div class="text-center"><nav><ul class="pagination" style="justify-content: center">';
        $config['full_tag_close'] 	= '</ul></nav></div>';
        $config['num_tag_open'] 	= '<li class="page-item"><span class="page-link">';
        $config['num_tag_close'] 	= '</span></li>';
        $config['cur_tag_open'] 	= '<li class="page-item active"><span class="page-link">';
        $config['cur_tag_close'] 	= '<span class="sr-only">(current)</span></span></li>';
        $config['next_tag_open'] 	= '<li class="page-item"><span class="page-link">';
        $config['next_tagl_close'] 	= '<span aria-hidden="true">&raquo;</span></span></li>';
        $config['prev_tag_open'] 	= '<li class="page-item"><span class="page-link">';
        $config['prev_tagl_close'] 	= '</span></li>';
        $config['first_tag_open'] 	= '<li class="page-item"><span class="page-link">';
        $config['first_tagl_close'] = '</span></li>';
        $config['last_tag_open'] 	= '<li class="page-item"><span class="page-link">';
        $config['last_tagl_close'] 	= '</span></li>';
        
        
        $this->pagination->initialize($config);

        $categoryData = $this->category_model->getAllCategoriesWithSubCategories();
        $page = ($this->uri->segment(3)) ? $this->uri->segment(3) : 0;
        if ($page == 1 || $page == null){
            $offset = 0;
        } else {
            $offset = ($page-1)*$config['per_page']+1;
        }
        $sixProducts = $this->product_model->getLimitProducts($config['per_page'], $offset);
        $link = $this->pagination->create_links();
        $active = array(
            "home" => null,
            "about" => null,
            "contact" => null
        );
        $active['home'] = "active";
        
        
        $this->load->view('layout/shop/header', $active);
        $this->load->view('shop/home', array('categoryData' => $categoryData, 'sixProducts' => $sixProducts, "link" => $link));
        $this->load->view('layout/shop/footer');
    }
    
    public function product($product_id) {
        $data["product_id"] = $product_id;
        $product = $data['product'] = $this->product_model->getProduct($product_id)->row();
        $data['reviews'] = $this->product_model->getProductReview($product_id);
        $active = array(
            "home" => null,
            "about" => null,
            "contact" => null
        );
        $active['home'] = "active";
        $active['title'] = " - ".$product->product_name;
        $data['disabled'] = "";
        if ($this->session->userdata('usertype') != "user") {
            $data['disabled'] = "disabled";
        }
        $this->load->view('layout/shop/header', $active);
        $this->load->view('shop/product_page', $data);
        $this->load->view('layout/shop/footer');
    }
    
    public function about() {
        $active = array(
            "home" => null,
            "about" => null,
            "contact" => null
        );
        $active['about'] = "active";
        $active['title'] = " - Tentang Kami";
        $this->load->view('layout/shop/header', $active);
        $this->load->view('shop/about_page');
        $this->load->view('layout/shop/footer');
    }

    public function dangerAlert($message) {
        $alert = "<div class='alert alert-danger alert-dismissable'>";
        $alert .= "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
        $alert .= "$message";
        $alert .= "</div>";
        return $alert;
    }

    public function successAlert($message) {
        $alert = "<div class='alert alert-success alert-dismissable'>";
        $alert .= "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
        $alert .= "$message";
        $alert .= "</div>";
        return $alert;
    }

}
