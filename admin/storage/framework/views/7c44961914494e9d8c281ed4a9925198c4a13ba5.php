<!DOCTYPE html>

<html lang="en">

<head>

  <meta charset="utf-8"/>

  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

  <meta name="description" content=""/>

  <meta name="author" content=""/>

  <title>ISA - Admin Dashboard</title>

  <!-- loader-->

  <link href="<?php echo e(URL::asset('assets/css/pace.min.css')); ?>" rel="stylesheet"/>

  <script src="<?php echo e(URL::asset('assets/js/pace.min.js')); ?>"></script>
  <script src="<?php echo e(URL::asset('assets/js/jquery.min.js')); ?>"></script>

  <!--favicon-->

  <!--Select Plugins-->
  <link href="<?php echo e(URL::asset('assets/plugins/select2/css/select2.min.css')); ?>" rel="stylesheet"/>


  <link rel="icon" href="<?php echo e(URL::asset('assets/images/logo.png')); ?>" type="image/x-icon"/>

  <!-- Vector CSS -->

  <link href="<?php echo e(URL::asset('assets/plugins/vectormap/jquery-jvectormap-2.0.2.css')); ?>" rel="stylesheet"/>

  <!-- simplebar CSS-->

  <link href="<?php echo e(URL::asset('assets/plugins/simplebar/css/simplebar.css')); ?>" rel="stylesheet"/>

  <!-- Bootstrap core CSS-->

  <link href="<?php echo e(URL::asset('assets/css/bootstrap.min.css')); ?>" rel="stylesheet"/>

  <!--Lightbox Css-->
  <link href="<?php echo e(URL::asset('assets/plugins/fancybox/css/jquery.fancybox.min.css')); ?>" rel="stylesheet" type="text/css"/>
  
  <!--multi select-->

  <link href="<?php echo e(URL::asset('assets/plugins/jquery-multi-select/multi-select.css')); ?>" rel="stylesheet" type="text/css">

  <!--Data Tables -->

  <link href="<?php echo e(URL::asset('assets/plugins/bootstrap-datatable/css/dataTables.bootstrap4.min.css')); ?>" rel="stylesheet" type="text/css">



  <link href="<?php echo e(URL::asset('assets/plugins/bootstrap-datatable/css/buttons.bootstrap4.min.css')); ?>" rel="stylesheet" type="text/css">

  <!-- animate CSS-->

  <link href="<?php echo e(URL::asset('assets/css/animate.css')); ?>" rel="stylesheet" type="text/css"/>

  <!-- Icons CSS-->

  <link href="<?php echo e(URL::asset('assets/css/icons.css')); ?>" rel="stylesheet" type="text/css"/>

  <!-- Sidebar CSS-->

  <link href="<?php echo e(URL::asset('assets/css/sidebar-menu.css')); ?>" rel="stylesheet"/>

  <!-- Custom Style-->

  <link href="<?php echo e(URL::asset('assets/css/app-style.css')); ?>" rel="stylesheet"/>

  <!-- skins CSS-->

  <link href="<?php echo e(URL::asset('assets/css/skins.css')); ?>" rel="stylesheet"/>

  <!--Image Upload CSS-->

  <link href="<?php echo e(URL::asset('assets/imageupload.css')); ?>" rel="stylesheet"/>

  <link href="<?php echo e(URL::asset('assets/demo.css')); ?>" rel="stylesheet"/>

  <!--inputtags-->
  <link href="<?php echo e(URL::asset('assets/plugins/inputtags/css/bootstrap-tagsinput.css')); ?>" rel="stylesheet" />



<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>

</head>

<body>

 <?php

 //echo date('Y-m-d H:i:s');
 ?>

  <!-- Start wrapper-->

  <div id="wrapper">

   

    <!--Start sidebar-wrapper-->

    <div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">

     <div class="brand-logo">

       <a href="<?php echo e(url('dashboard')); ?>">

        <img src="<?php echo e(URL::asset('assets/images/logo.png')); ?>" class="logo-icon" alt="logo icon">

        

      </a>

    </div>

    <div class="user-details">

      <div class="media align-items-center user-pointer collapsed" data-toggle="collapse" data-target="#user-dropdown">

        <div class="avatar"><img class="mr-3 side-user-img" src="<?php echo e(URL::asset('assets/images/logo.png')); ?>" alt="user avatar"></div>

        <div class="media-body">

         <h6 class="side-user-name"> 

           <?php if(Auth::check()): ?>

           <?php echo e(Auth::user()->name); ?>


           <?php endif; ?>

         </h6>

       </div>

     </div>

     <div id="user-dropdown" class="collapse">

      <ul class="user-setting-menu">

        <li><a href="<?php echo e(route('myprofile.index')); ?>"><i class="icon-user"></i>  My Profile</a></li>

        <li><a href="<?php echo e(route('setting.index')); ?>"><i class="icon-settings"></i> Setting</a></li>

        <li><a href="<?php echo e(url('/logout')); ?>"><i class="icon-power"></i> Logout</a></li>

      </ul>

    </div>

  </div>

  <ul class="sidebar-menu">

    <?php if(Auth::user()->is_admin==1 || Auth::user()->is_admin==0 ||Auth::user()->is_admin==3): ?>

    <li class="<?php echo $__env->yieldContent('dashboard'); ?>">

      <a href="<?php echo e(url('dashboard')); ?>" class="waves-effect">

        <i class="zmdi zmdi-view-dashboard"></i> <span>Dashboard</span>

      </a>

    </li>
    <?php endif; ?>
    <?php if(Auth::user()->is_admin==1): ?> 
    <li class="<?php echo $__env->yieldContent('course'); ?>">

      <a href="javaScript:void();" class="waves-effect">

        <i class="fa fa-gear"></i> <span>Master</span>

        <i class="fa fa-angle-left float-right"></i>

      </a>

      <ul class="sidebar-submenu">

        <li class="<?php echo $__env->yieldContent('course'); ?>">
          
          <a href="<?php echo e(route('course.index')); ?>" class="waves-effect">

            <i class="fa fa-clipboard"></i> <span>Category</span>

          </a>

        </li>

        
        <li class="<?php echo $__env->yieldContent('subject'); ?>">
          <!-- -->
          <a href=" <?php echo e(route('subject.index')); ?>" class="waves-effect">

            <i class="fa fa-book"></i> <span>Courses</span>

          </a>

        </li>

        <li class="<?php echo $__env->yieldContent('topic'); ?>">
          <a href="<?php echo e(route('topic.index')); ?>" class="waves-effect">

            <i class="fa fa-newspaper-o"></i> <span>Batches</span>

          </a>

        </li>
        <li class="<?php echo $__env->yieldContent('app_banner'); ?>">
          <a href=" <?php echo e(route('app_banner.index')); ?>" class="waves-effect">

            <i class="fa fa-picture-o"></i> <span>App Banners</span>

          </a>

        </li>



      </ul>

    </li>



    
    <?php endif; ?>
<?php if(Auth::user()->is_admin==2 ): ?>
<li class="<?php echo $__env->yieldContent('topic'); ?>">
          <a href="<?php echo e(route('topic.index')); ?>" class="waves-effect">

            <i class="fa fa-newspaper-o"></i> <span>Batches</span>

          </a>

        </li>
    <?php endif; ?>

    <?php if(Auth::user()->is_admin==1 || Auth::user()->is_admin==0 || Auth::user()->is_admin==3): ?>
    <li class="<?php echo $__env->yieldContent('users'); ?>">

      <a href="javaScript:void();" class="waves-effect">

        <i class="zmdi zmdi-accounts"></i> <span>Users</span>

        <i class="fa fa-angle-left float-right"></i>

      </a>

      
      <ul class="sidebar-submenu">
       <?php if(Auth::user()->is_admin==1): ?>
       <li class="<?php echo $__env->yieldContent('subadmin'); ?>">
        <a href="<?php echo e(route('subadmin.index')); ?>" class="waves-effect">

          <i class="zmdi zmdi-accounts"></i> <span>Subadmins/Accountant</span>

        </a>
      </li>
      <li class="<?php echo $__env->yieldContent('faculties'); ?>">
        <a href="<?php echo e(route('faculties.index')); ?>" class="waves-effect">

          <i class="zmdi zmdi-account"></i> <span>Faculties</span>
        </a>
        <?php endif; ?>
      </li>
      <?php if(Auth::user()->is_admin==0 || Auth::user()->is_admin==3 || Auth::user()->is_admin==1): ?>
      <li class="<?php echo $__env->yieldContent('app_users'); ?>">
        <a href="<?php echo e(route('app_users.index')); ?>" class="waves-effect">
          <i class="fa fa-address-book"></i> <span>Users</span>
        </a>
      </li>
      <?php endif; ?>
    </ul>
  </li>
  



  <li class="<?php echo $__env->yieldContent('book_category'); ?>">
    <a href="<?php echo e(route('book_category.index')); ?>" class="waves-effect">
      <i class="fa fa-address-book"></i> <span>Book Category  </span>
    </a>
  </li>


  <li class="<?php echo $__env->yieldContent('book'); ?>">
    <a href="<?php echo e(route('book.index')); ?>" class="waves-effect">
      <i class="fa fa-address-book"></i> <span>Book</span>
    </a>
  </li>

<?php if(Auth::user()->is_admin==1): ?>
       
        <li class="<?php echo $__env->yieldContent('examination'); ?>">

        <a href="javaScript:void();" class="waves-effect">

          <i class="fa fa-question-circle"></i> <span>Examination</span>

          <i class="fa fa-angle-left float-right"></i>

        </a>

        <ul class="sidebar-submenu">

          <li class="<?php echo $__env->yieldContent('question'); ?>">
            <a href="<?php echo e(route('question.index')); ?>"><i class="fa fa-book"></i>Question</a>

          </li>

          <li class="<?php echo $__env->yieldContent('exam'); ?>">
            <a href="<?php echo e(route('exam.index')); ?>"><i class="fa fa-question-circle"></i>Test Series</a>

          </li>

            <li class="<?php echo $__env->yieldContent('test'); ?> d-none">
            <a href="#"><i class="fa fa-question-circle"></i>Mock Test</a>

          </li>

             <!-- <li class="<?php echo $__env->yieldContent('quiz'); ?>">
            <a href="<?php echo e(route('quiz.index')); ?>"><i class="fa fa-question-circle"></i>Quizzes</a>

          </li> -->

           <li class="<?php echo $__env->yieldContent('instraction'); ?>">
            <a href="<?php echo e(route('instraction.index')); ?>"><i class="fa fa-question"></i>Instructions</a>

          </li>

        </ul>

       </li>
       <?php endif; ?>


    <li class="<?php echo $__env->yieldContent('live_classes'); ?>">
        <a href="<?php echo e(route('live_classes.index')); ?>" class="waves-effect">

          <i class="fa fa-video-camera"></i> <span>Live Classes</span>

        </a>

      </li>



  <li class="<?php echo $__env->yieldContent('primes'); ?>">
    <a href="<?php echo e(route('primes.index')); ?>" class="waves-effect">
      <i class="fa fa-address-book"></i> <span>Primes</span>
    </a>
  </li>




  <li class="<?php echo $__env->yieldContent('feedback'); ?>">
    <a href="<?php echo e(route('feedback.index')); ?>" class="waves-effect">
      <i class="fa fa-address-book"></i> <span>Feedback Videos</span>
    </a>
  </li>



  <li class="<?php echo $__env->yieldContent('chats'); ?>">

    <a href="javaScript:void();" class="waves-effect">

      <i class="zmdi zmdi-lock"></i> <span>Chats</span>

      <i class="fa fa-angle-left float-right"></i>

    </a>
    <?php
    $url = $_SERVER['REQUEST_URI'];
    ?>
    <ul class="sidebar-submenu">
     
      <li class="<?php if($url == '/chats/create') echo "active"?>"><a href="<?php echo e(route('chats.index')); ?>"><i class="fa fa-lock"></i>Doubts</a></li>

      <li class="<?php if($url == '/chats/create') echo "active"?>"><a href="<?php echo e(route('chats.group_chat')); ?>"><i class="fa fa-lock"></i>Group Chat</a></li>
    </ul>

  </li>




 <li class="<?php echo $__env->yieldContent('allusers'); ?>">
        
          <a href="<?php echo e(route('subcription.create')); ?>" class="waves-effect">

            <i class="fa fa-lock"></i> <span>Subcription Report</span>

          </a>

        </li>


         <li class="<?php echo $__env->yieldContent('transactions'); ?>">
    <a href="<?php echo e(route('transactions.index')); ?>" class="waves-effect">
      <i class="fa fa-address-book"></i> <span>Transaction History</span>
    </a>
  </li>

  
          <li class="<?php echo $__env->yieldContent('allusers'); ?>">
        
          <a href="<?php echo e(route('notification.create')); ?>" class="waves-effect">

            <i class="fa fa-book"></i> <span>Notification</span>

          </a>

        </li>




  <li class="">

    <a href="<?php echo e(url('logout')); ?>" class="waves-effect">

      <i class="icon-power"></i> <span>Logout</span>

    </a>

  </li>
  <?php endif; ?>
<?php if(Auth::user()->is_admin==2): ?>
 <li class="<?php echo $__env->yieldContent('allusers'); ?>">
        
          <a href="<?php echo e(route('subcription.create')); ?>" class="waves-effect">

            <i class="fa fa-lock"></i> <span>Subcription Report</span>

          </a>

        </li>
<?php endif; ?>




</ul>



</div>

<!--End sidebar-wrapper-->



<!--Start topbar header-->

<header class="topbar-nav">

 <nav id="header-setting" class="navbar navbar-expand fixed-top">

  <ul class="navbar-nav mr-auto align-items-center">

    <li class="nav-item">

      <a class="nav-link toggle-menu" href="javascript:void();">

       <i class="icon-menu menu-icon"></i>

     </a>

   </li>

   <li class="nav-item">

    <form class="search-bar">

      <input type="text" class="form-control" placeholder="Enter keywords">

      <a href="javascript:void();"><i class="icon-magnifier"></i></a>

    </form>

  </li>

</ul>



<ul class="navbar-nav align-items-center right-nav-link">

  <li class="nav-item">

    <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown" href="#">

      <span class="user-profile"><img src="<?php echo e(URL::asset('assets/images/logo.png')); ?>" class="img-circle" alt="user avatar"></span>

    </a>

    <ul class="dropdown-menu dropdown-menu-right">

      <li class="dropdown-item"><i class="icon-power mr-2"></i> <a href="<?php echo e(url('/logout')); ?>">Logout</a></li>

    </ul>

  </li>

</ul>

</nav>

</header>

<!--End topbar header-->




<div class="content-wrapper">

  <div class="container-fluid">



    <?php echo $__env->yieldContent('content'); ?>

    <!-- End container-fluid-->

    

  </div><!--End content-wrapper-->

  <!--Start Back To Top Button-->

  <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>

  <!--End Back To Top Button-->
</div>

</div>

<!--End footer-->




<!-- Bootstrap core JavaScript-->



<script src="<?php echo e(URL::asset('assets/js/popper.min.js')); ?>"></script>

<script src="<?php echo e(URL::asset('assets/js/bootstrap.min.js')); ?>"></script>

<!-- js image upload CSS-->
<script type="text/javascript" src="<?php echo e(URL::asset('assets/imageupload.js')); ?>"></script>

<!-- simplebar js -->

<script src="<?php echo e(URL::asset('assets/plugins/simplebar/js/simplebar.js')); ?>"></script>

<!-- sidebar-menu js -->

<script src="<?php echo e(URL::asset('assets/js/sidebar-menu.js')); ?>"></script>

<!-- loader scripts -->

<script src="<?php echo e(URL::asset('assets/js/jquery.loading-indicator.html')); ?>"></script>

<!-- Custom scripts -->

<script src="<?php echo e(URL::asset('assets/js/app-script.js')); ?>"></script>

<!-- Chart js -->



<script src="<?php echo e(URL::asset('assets/plugins/Chart.js/Chart.min.js')); ?>"></script>

<!-- Vector map JavaScript -->

<script src="<?php echo e(URL::asset('assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js')); ?>"></script>

<script src="<?php echo e(URL::asset('assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js')); ?>"></script>

<!-- Easy Pie Chart JS -->

<script src="<?php echo e(URL::asset('assets/plugins/jquery.easy-pie-chart/jquery.easypiechart.min.js')); ?>"></script>

<!-- Sparkline JS -->

<script src="<?php echo e(URL::asset('assets/plugins/sparkline-charts/jquery.sparkline.min.js')); ?>"></script>

<script src="<?php echo e(URL::asset('assets/plugins/jquery-knob/excanvas.js')); ?>"></script>

<script src="<?php echo e(URL::asset('assets/plugins/jquery-knob/jquery.knob.js')); ?>"></script>



<!--Data Tables js-->

<script src="<?php echo e(URL::asset('assets/plugins/bootstrap-datatable/js/jquery.dataTables.min.js')); ?>"></script>

<script src="<?php echo e(URL::asset('assets/plugins/bootstrap-datatable/js/dataTables.bootstrap4.min.js')); ?>"></script>

<script src="<?php echo e(URL::asset('assets/plugins/bootstrap-datatable/js/dataTables.buttons.min.js')); ?>"></script>

<script src="<?php echo e(URL::asset('assets/plugins/bootstrap-datatable/js/buttons.bootstrap4.min.js')); ?>"></script>

<script src="<?php echo e(URL::asset('assets/plugins/bootstrap-datatable/js/jszip.min.js')); ?>"></script>

<script src="<?php echo e(URL::asset('assets/plugins/bootstrap-datatable/js/pdfmake.min.js')); ?>"></script>

<script src="<?php echo e(URL::asset('assets/plugins/bootstrap-datatable/js/vfs_fonts.js')); ?>"></script>

<script src="<?php echo e(URL::asset('assets/plugins/bootstrap-datatable/js/buttons.html5.min.js')); ?>"></script>

<script src="<?php echo e(URL::asset('assets/plugins/bootstrap-datatable/js/buttons.print.min.js')); ?>"></script>

<script src="<?php echo e(URL::asset('assets/plugins/bootstrap-datatable/js/buttons.colVis.min.js')); ?>"></script>

<!--Light-box-->
<script src="<?php echo e(URL::asset('assets/plugins/fancybox/js/jquery.fancybox.min.js')); ?>"></script>
<!-- // aaSorting : [[0, 'desc']], -->






<script>

 $(document).ready(function() {

      //Default data table

       //$('#default-datatable').DataTable();



       var table = $('#default-datatable').DataTable( {

        lengthChange: true,

        "lengthMenu": [
        [10, 25, 50, 100, -1],
        [10, 25, 50, 100, "All"]
        ],
        
        aaSorting : [[0, 'desc']]

         //buttons: [ 'copy', 'excel', 'pdf', 'print', 'colvis' ]

      } );



       table.buttons().container().appendTo( '#default-datatable_wrapper .col-md-6:eq(0)' );

       

     } );



   </script>



   <script>

    $(function() {

      $(".knob").knob();

    });

  </script>

  <!-- Index js -->

  <!-- <script src="<?php echo e(URL::asset('assets/js/index.js')); ?>"></script> -->


<!-- <script type="text/javascript" src="<?php echo e(URL::asset('assets/tinymce/js/jquery.min.js')); ?>"></script>
    <script type="text/javascript" src="<?php echo e(URL::asset('assets/tinymce/plugin/tinymce/tinymce.min.js')); ?>"></script>
    <script type="text/javascript" src="<?php echo e(URL::asset('assets/tinymce/plugin/tinymce/init-tinymce.js')); ?>"></script> -->

<!-- <script src="https://cdn.tiny.cloud/1/hn0hkmezzc5loqi41fbzd7xqiqcz5bqzafnf23xsor7eq5sq/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

<script>
    tinymce.init({
      selector: 'textarea',
      height:"500px",
      plugins: 'advlist autolink lists link image charmap print preview hr anchor pagebreak',
      toolbar_mode: 'floating',

   });
 </script> -->

 <!--  <script src="https://cdn.tiny.cloud/1/7ptlxlaep680iy9ieoh2a43r5um6iigegc06o0fepu1i827u/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script> -->
 <script>
    //tinymce.init({
     // selector: 'textarea',
    //  plugins: 'a11ychecker advcode casechange export formatpainter linkchecker autolink lists checklist media mediaembed pageembed permanentpen powerpaste table advtable tinycomments tinymcespellchecker',
     // toolbar: 'a11ycheck addcomment showcomments casechange checklist code export formatpainter pageembed permanentpen table',
     // toolbar_mode: 'floating',
    //  tinycomments_mode: 'embedded',
     // tinycomments_author: 'Author name',
     // height:"250px",
  // });
</script>
</body>

</html>

<?php /**PATH /home/appmantr/krantikari.appmantra.live/admin/resources/views/admin/layout.blade.php ENDPATH**/ ?>