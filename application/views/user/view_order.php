<div class="content-wrapper">
    <div class="container-fluid">
      <?php echo $this->session->flashdata("msg"); ?>
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="<?= site_url('user/dashboard');?>">Dashboard</a>
        </li>
        <li class="breadcrumb-item">
          <a href="<?= site_url('user/your_order');?>">List Pesanan</a>
        </li>
        <li class="breadcrumb-item active">Pesanan Anda</li>
      </ol>
      <!-- Active Cart Card-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-shopping-cart"> </i> Pesanan Anda</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table" id="dataTable" width="100%" cellspacing="0">
              <tbody>
                <?php $count = 1; ?>
                  <thead>
                    <th>No</th>
                    <th>Gambar Produk</th>
                    <th>Nama</th>
                    <th>Jumlah</th>
                    <th>Harga</th>
                  </thead>
                  <?php foreach($cartData as $cart): ?>
                  <tr align="center">
                    <td rowspan=2>
                      <?= $count++;?>
                    </td>
                    <td rowspan=2>
                      <img src="<?= base_url($cart->image_link)?>" class="img-fluid img-thumbnail" height="70px" width="70px"></img>
                    </td>
                    <td rowspan=1 align="left" >
                      <a href="<?= site_url('shop/product/'.$cart->product_id);?>">
                        <strong><em><?= $cart->product_name; ?></em></strong>
                      </a>
                    </td>
                    <td rowspan=1 align="left" >
                      Jml : <?= $cart->quantity;?>
                    </td>
                    <td rowspan=1 align="left" >
                      Harga : Rp <?= number_format ( $cart->price * $cart->quantity, 2 );?>
                    </td>
                  </tr><tr>
                    <td rowspan=1 colspan=3 align="left"><?= $cart->short_desc; ?></td>
                  </tr>
                <?php
                  endforeach;
                ?>
                <tr><td colspan=3></td><th colspan=1>Harga Total :</th><th colspan='2'> Rp. <?= number_format( $totalPrice, 2, ",", "." ); ?></th></tr>
                <tr><td colspan=3></td><th colspan=1>Tanggal Pembelian :</th><th colspan='2'>
                    <?= date_format(date_create($cart->date_buy), "d M Y"); ?>
                </th></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->

    <script>
    $(document).ready(function() {
        $('table.display').DataTable();
    } );
    </script>

 