<div class="content-wrapper">
  <div class="container-fluid">
    <?php echo $this->session->flashdata("msg"); ?>
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<?= site_url('admin');?>">Dashboard</a>
      </li>
      <li class="breadcrumb-item active">Tambah Produk</li>
    </ol>
    <!-- Example DataTables Card-->
    <?= form_open_multipart('product/add', array('class' => 'form-horizontal')) ?>
    <div class="card mb-3">
      <div class="card-header">
        Tambah Produk 
      </div>

      <div class="card-body">
        <div class="form-group">
          <?php if(isset($image_error)) {echo $image_error; }?>
          <label class="control-label">Gambar</label>
          <div class="row">
            <div class="col-md-4">
              <img src="<?= base_url('style/assets/images/no_image.png')?>" id="product_image" name="product_image" class="img-thumbnail">
              <input type="file" id="my_file" onchange="readURL(this);" accept='image/*' name="image_link"/>
            </div>
          </div>
        </div>

        <div class="form-group">
          <?= form_error('product_name'); ?>
          <label class="control-label">Nama Produk</label>
          <div>
            <input id="product_name" type="text" class="form-control" name="product_name" value="<?php echo set_value('product_name'); ?>">
          </div>
        </div>

        <div class="form-group">
          <?= form_error('product_price'); ?>
          <label class="control-label">Harga</label>
          <div>
            <input id="product_price" type="text" class="form-control" name="product_price" value="<?php echo set_value('product_price'); ?>">
          </div>
        </div>

        <div class="form-group">
          <?= form_error('product_short_description'); ?>
          <label class="control-label">Deskripsi Singkat Produk</label>
          <div>
            <input id="product_short_description" type="text" class="form-control" name="product_short_description" value="<?php echo set_value('product_short_description'); ?>">
          </div>
        </div>

        <div class="form-group">
          <?= form_error('product_stock'); ?>
          <label class="control-label">Jumlah Stok</label>
          <div>
          <input id="product_stock" type="number" class="form-control" name="product_stock" value="<?php echo set_value('product_stock'); ?>" min="0">
          </div>
        </div>

        <div class="form-group">
          <?= form_error('product_description'); ?>
          <label class="control-label">Deskripsi Lengkap Produk</label>
          <div>
            <textarea id="textarea" name="product_description"></textarea>
          </div>
        </div>

        <div class="form-group">
          <label class="control-label">Kategori Produk</label>
          <div>
            <select id="product_category" type="text" class="form-control" name="product_category">
              <?php 
                foreach($categories as $category):
                  foreach($category->subCategory as $subCat):
              ?>
                <option value="<?= $subCat->category_id?>">
                  <?= $category->category_name; ?>: <?= $subCat->category_name; ?>
                </option>
              <?php endforeach; endforeach; ?>
            </select>
          </div>
        </div>

        <div class="form-group">
          <input type="submit" value="Simpan" Class="btn btn-primary form-control">
        </div>
      </div>
    </div>
    <?= form_close(); ?>
  </div>
  <!-- /.container-fluid-->
  <!-- /.content-wrapper-->
</div>

<script>
  function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#product_image')
                .attr('src', e.target.result)
                .width(300)
                .height(300);
        };

        reader.readAsDataURL(input.files[0]);
    }
  }
</script>
