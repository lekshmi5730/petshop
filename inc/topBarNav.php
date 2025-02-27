<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar with Dual Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-4 px-lg-5">
            <button class="navbar-toggler btn btn-sm" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <a class="navbar-brand" href="./">
                <img src="<?php echo validate_image($_settings->info('logo')) ?>" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">
                <?php echo $_settings->info('short_name') ?>
            </a>

            <form class="form-inline" id="search-form">
                <div class="input-group">
                    <input class="form-control form-control-sm form" type="search" placeholder="Search" aria-label="Search" name="search" value="<?php echo isset($_GET['search']) ? $_GET['search'] : "" ?>" aria-describedby="button-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-light btn-sm m-0" type="submit" id="button-addon2"><i class="fa fa-search"></i></button>
                    </div>
                </div>
            </form>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link" aria-current="page" href="./">Home</a></li>
                    <?php 
                    $cat_qry = $conn->query("SELECT * FROM categories where status = 1 ");
                    while($crow = $cat_qry->fetch_assoc()):
                      $sub_qry = $conn->query("SELECT * FROM sub_categories where status = 1 and parent_id = '{$crow['id']}' ");
                      if($sub_qry->num_rows <= 0):
                    ?>
                    <li class="nav-item"><a class="nav-link" aria-current="page" href="./?p=products&c=<?php echo md5($crow['id']) ?>"><?php echo $crow['category'] ?></a></li>
                    <?php else: ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown<?php echo $crow['id'] ?>" href="#" role="button" data-toggle="dropdown" aria-expanded="false"><?php echo $crow['category'] ?></a>
                        <ul class="dropdown-menu p-0" aria-labelledby="navbarDropdown<?php echo $crow['id'] ?>">
                            <?php while($srow = $sub_qry->fetch_assoc()): ?>
                            <li><a class="dropdown-item border-bottom" href="./?p=products&c=<?php echo md5($crow['id']) ?>&s=<?php echo md5($srow['id']) ?>"><?php echo $srow['sub_category'] ?></a></li>
                            <?php endwhile; ?>
                        </ul>
                    </li>
                    <?php endif; ?>
                    <?php endwhile; ?>
                    <li class="nav-item"><a class="nav-link" href="./?p=about">About</a></li>
                </ul>
                <div class="d-flex align-items-center">
                    <?php if(!isset($_SESSION['userdata']['id'])): ?>
                    <div class="dropdown">
                        <button class="btn btn-outline-light dropdown-toggle" type="button" id="loginDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Login
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="loginDropdown">
                            <a class="dropdown-item" id="client-login-btn" href="#">Client Login</a>
                            <a class="dropdown-item" id="admin-login-btn" href="admin/index.php">Admin Login</a>
                        </div>
                    </div>
                    <?php else: ?>
                    <a class="text-white mr-2 nav-link" href="./?p=cart">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-light text-dark ms-1 rounded-pill" id="cart-count">
                            <?php 
                            if(isset($_SESSION['userdata']['id'])):
                              $count = $conn->query("SELECT SUM(quantity) as items from `cart` where client_id =".$_settings->userdata('id'))->fetch_assoc()['items'];
                              echo ($count > 0 ? $count : 0);
                            else:
                              echo "0";
                            endif;
                            ?>
                        </span>
                    </a>
                    <a href="./?p=my_account" class="text-white nav-link"><b> Hi, <?php echo $_settings->userdata('firstname')?>!</b></a>
                    <a href="logout.php" class="text-white nav-link"><i class="fa fa-sign-out-alt"></i></a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </nav>

    <script>
      $(function(){
        $('#client-login-btn').click(function(){
          uni_modal("Client Login", "login.php");
        });
        $('#admin-login-btn').click(function(){
          uni_modal("Admin Login", "admin_login.php");
        });

        $('#search-form').submit(function(e){
          e.preventDefault();
          var sTxt = $('[name="search"]').val();
          if (sTxt != '') location.href = './?p=products&search=' + sTxt;
        });
      });
    </script>
</body>
</html>
