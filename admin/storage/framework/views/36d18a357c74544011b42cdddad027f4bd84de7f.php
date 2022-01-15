<?php $__env->startSection('users'); ?>

active

<?php $__env->stopSection(); ?>

<?php $__env->startSection('app_users'); ?>

active

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

<?php 
$search = isset($_GET['search']) ? $_GET['search'] :'';
 $exportUrl = url('/export');
?>

<div class="container-fluid">

    <!-- Breadcrumb-->

    <div class="row pt-2 pb-2">

        <div class="col-sm-6">

            <h4 class="page-title">Manage Users</h4>

            <ol class="breadcrumb">

                <li class="breadcrumb-item"><a href="<?php echo e(url('dashboard')); ?>">Home</a></li>

                <li class="breadcrumb-item active"><a href="javaScript:void();">User</a></li>

            </ol>

        </div>

       <!--  <div class="col-sm-3">
            
                 <select class="form-control">
                <option>0-100000</option>
                <option>100000-200000</option>
                <option>200000-300000</option>
            </select>
        </div> <?php echo e(route('export_users')); ?>-->
         <?php if(!empty($users) && count($users) > 0){?>
        <div class="col-sm-3">
            <a class="btn btn-primary" href="<?php echo $exportUrl.'?search='.$search?>"><i class="fa fa-file"></i>  Export</a>
        </div>
    <?php }?>



        <div class="col-sm-3">
            <a class="btn btn-primary" href="<?php echo e(route('add_app_user')); ?>"><i class="fa fa-plus"></i>  Add</a>
        </div>

    </div>

    <!-- End Breadcrumb-->


    <div class="row">
      <h4 class="page-title"> &nbsp;&nbsp;&nbsp;Search By User Name,Email,Phone</h4>

  </div>
  <form method="get" action="">
    <div class="row">
        <div class="col-lg-8">
            <div class="card">
               <input type="text" name="search" value="<?php echo e($search); ?>" id="search" class="form-control" placeholder="Search By name,email,mobile">

           </div>


       </div>
       <div class="col-lg-4">
        <div class="card">
           <button type="submit" class="btn btn-success">Search</button>
       </div>
   </div>
</div>
</form>


<div class="row">

    <div class="col-lg-12">

        <div class="card">

            <div class="card-header "><i class="fa fa-users"></i> Users List 


            </div>



            <div class="card-body">


                <div class="table-responsive">

                    <table id="default-datatable" class="table table-bordered">

                        <thead>

                            <tr>

                                <th>#</th>

                                <th>User</th>

                                <th>Phone</th>

                                <th>Courses</th>
                                <th>Prime Or Not</th>


                                <th>Location</th>



                                <th>Referral </th> 

                                <th>Action</th>

                            </tr>

                        </thead>

                        <tbody>
                            <?php if(!empty($users)){
                                foreach($users as $user){

                                    $name = mb_strlen(strip_tags($user->name),'utf-8') > 30 ? mb_substr(strip_tags($user->name),0,30,'utf-8').'...' : strip_tags($user->name);
                                    $email = mb_strlen(strip_tags($user->email),'utf-8') > 30 ? mb_substr(strip_tags($user->email),0,30,'utf-8').'...' : strip_tags($user->email);


                                    $exist = DB::table('prime')->where('user_id',$user->id)->first();


                                            //echo count($users);
                                    ?>
                                    <tr>
                                        <td><?php echo e($user->id); ?></td>
                                        <td><a href="<?php echo e(url('app_users/'.$user->id)); ?>"><?php echo e($name); ?></a> 
                                            <br>
                                            <?php echo e($email); ?>

                                        </td>
                                        <td><?php echo e($user->phone); ?></td>

                                        <td>
                                            <?php 
                                            $board = \DB::table('boards')->where('id',$user->board_id)->first();

                                            echo $board->board_name ?? '';
                                            ?>


                                        </td>

                                        <td>
                                    <?php /*
                                    if(!empty($exist)){
                                        echo "<b style='color:green;''>Prime</b>";
                                    }else{
                                        echo "<b style='color:red;'>Not Prime</b>";
                                    } */
                                    ?>
                                    <select id="prime" onchange="get_prime(<?php echo $user->id; ?>, this.value)">
                                        <option value="1" <?php if(!empty($exist)) { echo "selected" ;}?>>Prime</option>
                                        <option value="0" <?php if(empty($exist)) { echo "selected" ;}?>>Not Prime</option>
                                    </select>


                                </td>
                                <td>
                                    <?php 
                                    $state = \App\State::where('id',$user->state_id)->first();
                                    $city = \App\City::where('id',$user->city_id)->first();



                                    ?>

                                    <p><?php echo e($state->name ??''); ?>

                                        <br><?php echo e($city->name ??''); ?>

                                    </p>



                                </td>
                                <td>
                                    <?php 
                                    $user_name = '';
                                    if(!empty($user->referredBy)){
                                        $users = \App\AppUser::where('id',$user->referredBy)->first();

                                        $user_name = $user->name ??'';
                                    }


                                    ?>
                                    <p>Referral By :- <?php echo e($user_name); ?>

                                        <br>
                                        Wallet : - <?php echo e($user->wallet); ?>


                                    </p>


                                </td>


                                <td>
                                    <a href='<?php echo e(url ("app_users/".$user->id."/edit")); ?>' class="btn btn-primary btn-sm"><i class="fa fa-edit" aria-hidden="true"></i> Edit</a>



                                    <a href='<?php echo e(url("reset_device/".$user->id)); ?>' class="btn btn-info btn-sm"><i class="fa fa-lock" aria-hidden="true"></i> Reset Device</a>

                                    <a href='<?php echo e(url("change_password/".$user->id)); ?>' class="btn btn-info btn-sm"><i class="fa fa-lock" aria-hidden="true"></i>Change Password</a>

                                     <a href='<?php echo e(url("delete/".$user->id)); ?>' class="btn btn-danger btn-sm" onclick="return confirm('You want to Delete this ?')"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a>
<!-- 
                                    <form action='<?php echo e(url("app_users/".$user->id)); ?>' method="POST">
                                        <?php echo csrf_field(); ?> <?php echo method_field("DELETE"); ?>
                                        <button href="javascript:void(0);" type="submit" class="btn btn-danger btn-sm" onclick="return confirm("You Want to Delete this?")"><i class="fa fa-trash" aria-hidden="true"></i> Delete</button></form> -->


                                    </td>

                                </tr>



                            <?php }}?>

                        </tbody>




                    </table>




                    <?php echo e($users->appends(request()->input())->links()); ?>





                </div>

            </div>


            <!--start overlay-->

            <div class="overlay toggle-menu"></div>

            <!--end overlay-->

        </div>

        <!-- End container-fluid-->

        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous"></script>
        <script src="//cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>

        <script type="text/javascript">
   // var table = $('#default').DataTable({
   // ordering: false,
   // processing: true,
   // serverSide: true,
   // ajax: '<?php echo e(route("get_users")); ?>',
   // columns: [
   // { data: 'id', name: 'id' },
   // { data: 'name', name: 'name' ,searchable: false, orderable: false},
   // { data: 'phone', name: 'phone'},
   



   // { data: 'state', name: 'state' },
   // { data: 'city', name: 'city' },
   // { data: 'status', name: 'status' },
//    { data: 'action', searchable: false, orderable: false }

//    ],
// });

</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<script type="text/javascript">
    function get_prime(user_id,status){

     var _token = '<?php echo e(csrf_token()); ?>';

     $.ajax({
        url: "<?php echo e(route('get_prime')); ?>",
        type: "POST",
        data: {user_id:user_id,status:status},
        dataType:"JSON",
        headers:{'X-CSRF-TOKEN': _token},
        cache: false,
        success: function(resp){
            if(resp.status){
                alert(resp.message);
            }
            else{

            }

        }
    });



 }
</script>













<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<?php if($message = Session::get('success')): ?>

<script>

    Swal.fire({

        icon: 'success',

        title: '<?php echo e($message); ?>',

        showConfirmButton: false,

        timer: 2500

    });

</script>

<?php endif; ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin/layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/appmantr/krantikari.appmantra.live/admin/resources/views/admin/users/list.blade.php ENDPATH**/ ?>