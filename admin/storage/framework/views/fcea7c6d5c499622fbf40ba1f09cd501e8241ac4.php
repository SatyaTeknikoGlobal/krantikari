
<!DOCTYPE html>

<html lang="en">

<head>

  <meta charset="utf-8"/>

  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

  <meta name="description" content=""/>

  <meta name="author" content=""/>

  <title>ISA - Admin Login</title>

  <!-- loader-->

  <link href="<?php echo e(URL::asset('assets/css/pace.min.css')); ?>" rel="stylesheet"/>

  <script src="<?php echo e(URL::asset('assets/js/pace.min.js')); ?>"></script>

 
  <!--favicon-->

  <link rel="icon" href="<?php echo e(URL::asset('assets/images/logo.png')); ?>" type="image/x-icon"/>

  <!-- Bootstrap core CSS-->

  <link href="<?php echo e(URL::asset('assets/css/bootstrap.min.css')); ?>" rel="stylesheet"/>

  <!-- animate CSS-->

  <link href="<?php echo e(URL::asset('assets/css/animate.css')); ?>" rel="stylesheet" type="text/css"/>

  <!-- Icons CSS-->

  <link href="<?php echo e(URL::asset('assets/css/icons.css')); ?>" rel="stylesheet" type="text/css"/>

  <!-- Custom Style-->

  <link href="<?php echo e(URL::asset('assets/css/app-style.css')); ?>" rel="stylesheet"/>

</head>



<body>



<!-- Start wrapper-->

 <div id="wrapper">



 <div class="height-100v d-flex align-items-center justify-content-center">

  <div class="card card-authentication1 mb-0">

    <div class="card-body">

     <div class="card-content p-2">

      <div class="text-center">

        <img src="<?php echo e(URL::asset('assets/images/logo.png')); ?>" alt="logo icon">

      </div>

      <div class="card-title text-uppercase text-center py-3">Admin Login</div>

          <?php if($errors->any()): ?>

              <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

              <div id="fadeout-msg" class="alert alert-danger">

                  <?php echo e($error); ?>


              </div>

              <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

          <?php endif; ?>

        <form action="<?php echo e(route('login.store')); ?>" method="POST">

        <?php echo csrf_field(); ?>

        <div class="form-group">

        <label for="exampleInputUsername">Email</label>

         <div class="position-relative has-icon-right">

          <input type="text" id="exampleInputUsername" class="form-control input-shadow" placeholder="Enter Email" name="email">

          <div class="form-control-position">

            <i class="icon-user"></i>

          </div>

         </div>

        </div>

        <div class="form-group">

        <label for="exampleInputPassword">Password</label>

         <div class="position-relative has-icon-right">

          <input type="password" id="exampleInputPassword" class="form-control input-shadow" placeholder="Enter Password" name="password">

          <div class="form-control-position">

            <i class="icon-lock"></i>

          </div>

         </div>

        </div>

      <div class="form-row">

       <div class="form-group col-6">

         <div class="icheck-material-primary">

                <input type="checkbox" id="user-checkbox" checked="" />

                <label for="user-checkbox">Remember me</label>

        </div>

       </div>

      </div>

       <button type="submit" class="btn btn-primary btn-block">LogIn</button>

       </form>

       </div>

      </div>

       </div>

   </div>

    

     <!--Start Back To Top Button-->

    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>

    <!--End Back To Top Button-->

  

  

  

  </div><!--wrapper-->

  

  <!-- Bootstrap core JavaScript-->

  <script src="<?php echo e(URL::asset('assets/js/jquery.min.js')); ?>"></script>

  <script src="<?php echo e(URL::asset('assets/js/popper.min.js')); ?>"></script>

  <script src="<?php echo e(URL::asset('assets/js/bootstrap.min.js')); ?>"></script>

  

  <!-- sidebar-menu js -->

  <script src="<?php echo e(URL::asset('assets/js/sidebar-menu.js')); ?>"></script>

  

  <!-- Custom scripts -->

  <script src="<?php echo e(URL::asset('assets/js/app-script.js')); ?>"></script>

  

</body>

</html>

<?php /**PATH /home/appmantr/krantikari.appmantra.live/admin/resources/views/admin/login.blade.php ENDPATH**/ ?>