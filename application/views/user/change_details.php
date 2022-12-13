  <!-- Navigation-->

  <div class="content-wrapper">
    <div class="container-fluid">
          <?php echo $this->session->flashdata("msg"); ?>
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
        <a href="<?= site_url('user/dashboard')?>">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Ubah Detail</li>
      </ol>
      <div class="card-body">
        <?=form_open(site_url('user/change_userdetail'));?>
          <div class="form-group">
            <label for="dispname">Nama Depan</label>
            <input class="form-control" id="fname" name="fname" type="text" aria-describedby="emailHelp" placeholder="Nama Depan" value="<?= $userData->first_name; ?>">
          </div>
          <div class="form-group">
            <label for="dispname">Nama Belakang</label>
            <input class="form-control" id="lname" name="lname" type="text" aria-describedby="emailHelp" placeholder="Nama Belakang" value="<?= $userData->last_name; ?>">
          </div>
          <div class="form-group">
            <label for="dispname">Username</label>
            <input class="form-control" id="username" name="username" type="text" aria-describedby="emailHelp" placeholder="Username" value="<?= $userData->username; ?>">
          </div>
            <div class="form-group">
            <label for="email">Email</label>
            <input class="form-control" id="email" name="email" type="email" aria-describedby="emailHelp" placeholder="Email Anda" value="<?= $userData->email; ?>">
          </div>
          <button class="btn btn-primary btn-block" type="submit" >Ubah</button>
        <?=form_close();?>

      </div>

    </div><!-- /.container-fluid-->  
  </div><!-- /.content-wrapper-->
