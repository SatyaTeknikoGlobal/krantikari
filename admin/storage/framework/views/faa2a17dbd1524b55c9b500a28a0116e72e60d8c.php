<?php $__env->startSection('subcription'); ?>

active

<?php $__env->stopSection(); ?>

<?php $__env->startSection('histories'); ?>

active

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

<div class="container-fluid">

  <!-- Breadcrumb-->

  <div class="row pt-2 pb-2">

    <div class="col-sm-9">

      <h4 class="page-title">Manage Users Subscription</h4>

      <ol class="breadcrumb">

        <li class="breadcrumb-item"><a href="<?php echo e(url('dashboard')); ?>">Home</a></li>

        <li class="breadcrumb-item active"><a href="javaScript:void();">Subcription</a></li>

      </ol>

    </div>

  </div>

  <!-- End Breadcrumb-->
  <?php
  $course = isset($_GET['course']) ? $_GET['course'] :'';
  $subject_id = isset($_GET['subject_id']) ? $_GET['subject_id'] :'';
  $topic_id = isset($_GET['topic_id']) ? $_GET['topic_id'] :'';

  ?>


<?php if (Auth::user()->is_admin !=2 ){?>
  <form action="<?php echo e(url('subcription/create')); ?>" method="get" id="sub_form">
    <div class="row">
      <div class="col-lg-12">
        <div class="form-group">
          <label>Select Course</label>
          <table>
            <tr>
              <td>
                <select class="form-control" name="course" id="board_id" onchange="getSubject()">
                  <option value="" selected>Select Category</option>
                  <?php foreach($boards as $board){?>
                    <option value="<?php echo e($board->id); ?>" <?php if($board->id == $course) echo "selected"?>><?php echo e($board->board_name); ?></option>
                  <?php }?>
                </select>
              </td>

              <td>
                <select class="form-control" name="subject_id" onchange="getChapter()" id="subject_id">
                    <option readonly value="0">Select Courses</option>
                    <?php if(!empty($courses)){
                      foreach($courses as $course){
                      ?>

                      <option value="<?php echo e($course->id); ?>" <?php if($subject_id == $course->id) echo "selected";?>><?php echo e($course->title); ?></option>

                    <?php }}?>
                    
                </select>
              </td>


          <td>
                <select class="form-control" name="topic_id" id="topic_id">
                <option readonly value="0">Select Batch</option>
                   <?php if(!empty($batches)){
                      foreach($batches as $batch){
                      ?>

                      <option value="<?php echo e($batch->id); ?>" <?php if($topic_id == $batch->id) echo "selected";?>><?php echo e($batch->name); ?></option>

                    <?php }}?>
                </select>
              </td>

              <input type="hidden" name="is_export" id="is_export" value="0">





              <label>&nbsp;&nbsp;&nbsp;&nbsp;</label>
              <td style="padding : 1px 18px">
                <span><button class="btn btn-success" type="submit">Submit</button></span>
                &nbsp;
                  <?php if(count($data) > 0 && !empty($data)){?>
                <a class="btn btn-warning" onclick="export_user()">Export</a>
                     &nbsp;
                   <?php }?>
                <a class="btn btn-danger" href="<?php echo e(url('subcription/create')); ?>" type="reset">Reset</a>
              
              </td>
            </tr>
          </table>
          </div>
        </div>

      </div>
    </form>
<?php }?>

    <div class="row">

      <div class="col-lg-12">

        <div class="card">

          <div class="card-header"><i class="fa fa-users"></i> Subcription Histroy </div>

          <div class="card-body">

            <div class="table-responsive">

              <table id="default-datatable" class="table table-bordered">

                <thead>

                  <tr>

                    <th>#</th>

                    <th>Name</th>

                    <th>Phone</th>

                    <th>Email</th>

                    <th>Couse Details</th>

                    <th>Sub From</th>

                    <th>Amount</th>

                    <th>Paid Amount</th>

                    <th>Purchage Date</th>

                  </tr>

                </thead>

                <tbody>

                  <?php

                  $i=1

                  ?>
                  <?php if(count($data) > 0 && !empty($data)){?>
                  <?php $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                  <tr>

                    <td><?php echo e($i++); ?></td>

                    <td>

                     <?php echo e($row->name); ?>



                   </td>
                   <td><?php echo e($row->phone); ?>

                   </td>
                   <td><?php echo e($row->email); ?></td>
                   <td>
                    <?php 
                    $boards = \App\Board::where('id',$row->board_id)->first();
                    $subjects = \App\Subject::where('id',$row->subject_id)->first();
                    $topics = \App\Topic::where('id',$row->topic_id)->first();



                    ?>

                    <p><?php echo e($boards->board_name ?? ''); ?></p>
                    <p><?php echo e($subjects->title ?? ''); ?></p>
                    <p><?php echo e($topics->name ?? ''); ?></p>



                  </td>

                  <td>
                    <?php if($row->txn_id==0): ?>
                    ADMIN

                    <?php else: ?>
                    APP
                    <?php endif; ?>
                  </td>

                  <td><?php echo e($row->amount); ?></td>

                  <td><?php echo e($row->new_amount); ?></td>

                  <td>


                   <?php echo e(date('d M Y',strtotime($row->created_at))); ?> 

                 </td>

               </tr>

               <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

             <?php }?>
             </tbody>

           </table>
              <?php if(count($data) > 0 && !empty($data)){?>
          <?php echo e($data->appends(request()->input())->links()); ?>

        <?php }?>
         </div>

       </div>

    
 <!-- End Row-->

 <!--start overlay-->

 <div class="overlay toggle-menu"></div>

 <!--end overlay-->

</div>

<!-- End container-fluid-->

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

<script type="text/javascript">
  function export_user(){
   $('#is_export').val(1);
    $('#sub_form').submit();
  }
</script>

<script type="text/javascript">
    function getSubject() {

             boards = $("#board_id").val();

             $.ajax({

                type: "POST",

                url: "<?php echo e(url ('/getSubjectList')); ?>",

                data: {'board_id':boards,'_token':'<?php echo e(csrf_token()); ?>'},

                success:function(data){

                    var data = jQuery.parseJSON(data);

                    $('#subject_id').html(data.subjectList);
                      $('#chapter_id').html( '<option readonly value="0">Select Chapter</option>');
                     $('#topic_id').html('<option readonly value="0">Select Program</option>');

                }

             });

           }
          function getChapter() {

              sub_id  = $("#subject_id").val();

               $.ajax({

            type: "POST",

            url: "<?php echo e(url ('/getSubject')); ?>",

            data: {id:sub_id,'_token':'<?php echo e(csrf_token()); ?>'},

            success:function(data){

                $('#topic_id').html(data);
                  //$('#topic_id').html('<option readonly value="0">Select Program</option>');

            }

        });

          }
</script>



<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin/layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/appmantr/krantikari.appmantra.live/admin/resources/views/admin/subcription/report.blade.php ENDPATH**/ ?>