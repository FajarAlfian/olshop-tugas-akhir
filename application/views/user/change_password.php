<!-- Navigation-->

<div class="content-wrapper">
        <?php echo $this->session->flashdata("msg"); ?>
  <div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<?= site_url('user/dashboard')?>">Dashboard</a>
      </li>
      <li class="breadcrumb-item active">Ubah Password</li>
    </ol>
    <div class="card-body">
      <?=form_open(site_url('user/change_userpassword'));?>
        <div class="form-group">
          <label for="email">Password Sekarang</label>
          <input class="form-control nospace" id="oldpassword" name="oldpassword" type="password" aria-describedby="emailHelp" placeholder="Masukan Password Lama" required="true">
        </div>
        <div class="form-group">
          <label for="email">Password Baru</label>
          <input class="form-control nospace" id="newpassword" name="newpassword" type="password" aria-describedby="emailHelp" placeholder="Masukan Password Baru" pattern=".{5,10}" required title="Please set your password between 5 to 10 characters">
        </div>
        <div class="form-group">
          <label for="email">Ketik Ulang Password Baru</label>
          <input class="form-control nospace" id="renewpassword" name="renewpassword" type="password" aria-describedby="emailHelp" placeholder="Masukan Password Baru" pattern=".{5,10}"  required title="Please set your password between 5 to 10 characters">
        </div>
        <button class="btn btn-primary btn-block" type="submit" >Ubah</button>
      <?=form_close();?>

    </div>

  </div><!-- /.container-fluid-->  
</div><!-- /.content-wrapper-->
