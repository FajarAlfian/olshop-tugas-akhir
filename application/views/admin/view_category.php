<div class="content-wrapper">
  <div class="container-fluid">
    <?php echo $this->session->flashdata("msg"); ?>
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<?= site_url('admin');?>">Dashboard</a>
      </li>
      <li class="breadcrumb-item active">List Kategori</li>
    </ol>
    <!-- View Categpory DataTables Card-->
    <div class="card mb-3">
      <div class="card-header">
        <i class="fa fa-tags"></i> List Kategori</div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th width="5%">No</th>
                <th width="25%">Bagian dari Kategori</th>
                <th width="25%">Nama Kategori</th>
                <th width="20%">Nomor Produk</th>
                <th style="text-align:center" width="10%">Aksi</th>
              </tr>
            </thead>
            <tfoot>
              <tr>
                <th width="5%">No</th>
                <th width="25%">Bagian dari Kategori</th>
                <th width="25%">Nama Kategori</th>
                <th width="20%">Nomor Produk</th>
                <th style="text-align:center" width="10%">Aksi</th>
              </tr>
            </tfoot>
            <tbody>
              <?php $count = 1; foreach($subcategorylist as $cl) : ?>
                  <tr>
                    <td><?= $count++; ?></td>
                    <td><?= $cl->parent_category_name ?></td>
                    <td><?= $cl->category_name ?></td>
                    <td><?= $cl->product_count?></td>
                    <td style="text-align:center">
                      <a href="<?= site_url('admin/manage_category/').$cl->category_id?>">
                        <button class="btn btn-primary">
                          Edit
                        </button>
                      </a>
                    </td>
                    </td>
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
</div>
