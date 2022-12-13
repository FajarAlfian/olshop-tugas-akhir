  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="<?= site_url('admin');?>">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">List Keranjang</li>
      </ol>
      <!-- Active Cart Card-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-shopping-cart"></i> List Keranjang</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>No</th>
                  <th>Nama Pelanggan</th>
                  <th>Total harga</th>
                  <!-- <th>Checkout Time</th> -->
                  <th>Aksi</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>No</th>
                  <th>Nama Pelanggan</th>
                  <th>Total Harga</th>
                  <!-- <th>Checkout Time</th> -->
                  <th>Aksi</th>
                </tr>
              </tfoot>
              <tbody>
                <?php $count = 1; foreach($carts as $cart): ?>
                  <tr align="center">
                    <td><?= $count++;?></td>
                    <td align="left"><?= $cart->first_name . " " . $cart->last_name; ?></td>
                    <td>Rp. <?= number_format ( $cart->totalPrice, 2, ",", "." );  ?></td>
                    <!-- <td>datetime</td> -->
                    <td><a href="<?= site_url('admin/view_cart/'.$cart->cart_id)?>">Lihat Keranjang</a></td>
                  </tr>
                <?php endforeach; ?>
              </tbody>
            </table>
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
 