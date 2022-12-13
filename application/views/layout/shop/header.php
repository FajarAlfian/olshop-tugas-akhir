<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>Toko jaya <?= $title; ?></title>
		<link rel="icon" href="<?= base_url('style/assets/images/ican.png'); ?>" type="image/gif">

		<!-- Bootstrap core CSS -->
		<link href="<?php echo base_url();?>style/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

		<!-- Custom styles for this template -->
		<link href="<?php echo base_url();?>style/css/shop.css" rel="stylesheet">

		<link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
   		<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
		<link href="https://fonts.googleapis.com/css?family=Merriweather:900" rel="stylesheet">
		
		<script> 
	        // wait for the DOM to be loaded 
			function addToCart(product_id) {
				var quantity = "#quantity_"+product_id;
				quantity = $(quantity).val();
				// alert(product_id);
				// alert(quantity);
				if (quantity == "") {
						$("#alert_modal").modal("show");
						$("#modal_body").html("Masukkan jumlah barang terlebih dahulu");
						$("#modal_title").html("Warning");
						$("#modal_footer").html("<button type='button' class='btn btn-danger' data-dismiss='modal'>Tutup</button>");
				} else if (quantity < 0) {
						$("#alert_modal").modal("show");
						$("#modal_body").html("Quantity cannot be less than 0!");
						$("#modal_title").html("Warning");
						$("#modal_footer").html("<button type='button' class='btn btn-danger' data-dismiss='modal'>Tutup</button>");
				} else {
					$.post("<?= site_url('cart/addToCart'); ?>", {"quantity":quantity, "product_id":product_id},
						function(data) {
							console.log(data);
							$("#alert_modal").modal("show");
							$("#modal_body").html(data.message);
							$("#modal_title").html(data.title);
							if (data.success == true) {
								var footer = "<a href='<?= site_url('user/your_cart');?>'>";
								footer += "<button type='button' class='btn btn-success'>Checkout</button>";
								footer += "</a>";
								footer += "<button type='button' class='btn btn-danger' data-dismiss='modal'>Tutup</button>";
							} else {
								var footer = "<button type='button' class='btn btn-danger' data-dismiss='modal'>Tutup</button>";
							}
							$("#modal_footer").html(footer);
						}, 'json'
					)
				}
			}
		</script> 

		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

	</head>

	<body style="min-height: 100vh;display: flex;flex-direction: column;">

		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<div class="container">
				<a class="navbar-brand" href="<?= site_url('shop'); ?>" >
					<img style="width:5%" src="<?= base_url('style/assets/images/lgo.png'); ?>" alt="">
					Toko jaya
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
					
						<li class="nav-item <?= $about; ?>">
							<a class="nav-link" href="<?= site_url('shop/about');?>"><b>Tentang Kami</b></a>
						</li>
						</li>
						<li class="nav-item">
							<?php 	if ($this->session->userdata('usertype') == "admin") : ?>
								<li class="nav-item"><a class="nav-link" href="<?php echo base_url()?>index.php/admin"><b>Dashboard Admin</b></a></li>
								<li class="nav-item"><a class="nav-link" style="margin-left:5px" data-toggle="modal" data-target="#logout"><button class="btn btn-danger py-1">Keluar</button></a></li>
							<?php elseif ($this->session->userdata('usertype') == "user") : ?>
								<li class="nav-item"><a class="nav-link"  href="<?php echo base_url()?>index.php/user/dashboard"><b>Profil Anda</b></a></li>
								<li class="nav-item"><a class="nav-link" style="margin-left:5px" data-toggle="modal" data-target="#logout"><button class="btn btn-danger py-1">Keluar</button></a></li>
							<?php else : ?>
								<a class="nav-link" href="<?php echo base_url()?>index.php/Account"><button class="btn btn-success py-1">Masuk</button></a>
							<?php endif; ?>
						</li>
					</ul>
				</div>
			</div>
		</nav>
