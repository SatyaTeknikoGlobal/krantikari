<?php $__env->startSection('dashboard'); ?>

active

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>


<!--Start Dashboard Content-->


<h2 style="text-transform: capitalize;">Dashboard</h2>
<div class="container">
  <div class="row">

   <div class="col-12 col-lg-6 col-xl-3">

     <div class="card gradient-deepblue">

       <div class="card-body">

        <h5 class="text-white mb-0"><?php echo e(count($total_user ?? '')); ?> <span class="float-right"><i class="fa fa-users"></i></span></h5>

        <div class="progress my-3" style="height:3px;">

         <div class="progress-bar" style="width:55%"></div>

       </div>
       <?php if (Auth::user()->is_admin==2){?>
        <p class="mb-0 text-white small-font">Total Users <span class="float-right"></span></p>
      <?php }else{?>
        <a href="<?php echo e(url('/app_users')); ?>"> <p class="mb-0 text-white small-font">Total Users <span class="float-right"></span></p></a>
      <?php }?>

    </div>

  </div> 

</div>



<div class="col-12 col-lg-6 col-xl-3">

 <div class="card gradient-ohhappiness">

  <div class="card-body">

    <h5 class="text-white mb-0"><?php echo e($faculties ?? ''); ?> <span class="float-right"><i class="fa fa-eye"></i></span></h5>

    <div class="progress my-3" style="height:3px;">

     <div class="progress-bar" style="width:55%"></div>

   </div>
   <?php if (Auth::user()->is_admin==2){?>
     <p class="mb-0 text-white small-font">Faculties <span class="float-right"></span></p>
      <?php }else{?>
   <a href="<?php echo e(url('/faculties')); ?>"><p class="mb-0 text-white small-font">Faculties <span class="float-right"></span></p></a>
      <?php }?>

 </div>

</div>

</div>

<div class="col-12 col-lg-6 col-xl-3">

 <div class="card gradient-ibiza">

  <div class="card-body">

    <h5 class="text-white mb-0"><?php echo e(count($boards)); ?> <span class="float-right"><i class="fa fa-envira"></i></span></h5>

    <div class="progress my-3" style="height:3px;">

     <div class="progress-bar" style="width:55%"></div>

   </div>
    <?php if (Auth::user()->is_admin==2){?>
   <p class="mb-0 text-white small-font">Courses <span class="float-right"></span></p>
      <?php }else{?>
   <a href="<?php echo e(url('/course')); ?>"><p class="mb-0 text-white small-font">Courses <span class="float-right"></span></p> </a>
 <?php }?>
 </div>


</div>

</div>


<div class="col-12 col-lg-6 col-xl-3">

 <div class="card gradient-orange">

   <div class="card-body">
    <h5 class="text-white mb-0"><?=$free_user?> <span class="float-right"><i class="fa fa-usd"></i></span></h5>

    <div class="progress my-3" style="height:3px;">

     <div class="progress-bar" style="width:55%"></div>

   </div>

   <p class="mb-0 text-white small-font">Free Users<span class="float-right"></span></p>

 </div>

</div>

</div>





</div>
</div>
</div>



<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin/layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/appmantr/krantikari.appmantra.live/admin/resources/views/admin/dashboard.blade.php ENDPATH**/ ?>