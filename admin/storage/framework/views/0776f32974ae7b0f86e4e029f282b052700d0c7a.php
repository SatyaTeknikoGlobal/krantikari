<?php $__env->startSection('app_setting'); ?>

active

<?php $__env->stopSection(); ?>

<?php $__env->startSection('subject'); ?>

active

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <div class="container-fluid">

      <!-- Breadcrumb-->

     <div class="row pt-2 pb-2">

        <div class="col-sm-9">

		    <h4 class="page-title">Manage Courses</h4>

		    <ol class="breadcrumb">

            <li class="breadcrumb-item"><a href="<?php echo e(url('dashboard')); ?>">Home</a></li>

            <li class="breadcrumb-item active"><a href="javaScript:void();">Courses</a></li>

         </ol>

	   </div>

	   <div class="col-sm-3">

       <div class="btn-group float-sm-right">

        <a type="button" class="btn btn-primary waves-effect waves-light" href="<?php echo e(route('subject.create')); ?>">Add</a>

      </div>

     </div>

     </div>

    <!-- End Breadcrumb-->

      <div class="row">

        <div class="col-lg-12">

          <div class="card">

            <div class="card-header"><i class="fa fa-book"></i>Courses List </div>

            <div class="card-body">

              <div class="table-responsive">

              <table id="default-datatable" class="table table-bordered">

                <thead>

                    <tr>

                        <th>#</th>

                         <th>Category</th>

                        <th>Courses Name</th>

                        <th>Faculties</th>

                        <th>Image</th>

                        <th>Created At</th>

                        <th>Updated At</th>

                        <th>Action</th>

                    </tr>

                </thead>

                <tbody>

                    <?php

                    $i=1

                    ?>

                    <?php $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                    <tr>

                        <td><?php echo e($i++); ?></td>

                        <td><?php echo e($row->board_name); ?></td>

                        <td><?php echo e($row->title); ?></td>

                        <td>
                           <?php $__currentLoopData = $faculties; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $r): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                              <?php 
                                      $qData = explode(",", $row->faculties_id);
                                       foreach ($qData as $key => $f):
                                        
                                        ?>
                                        <?php if ($f==$r->id): ?>
                                           <span><?= $key +1?> -<?php echo e($r->name); ?></span>
                                            <br>
                                        <?php endif ?>
                                        <?php endforeach ?>

                                      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </td>
                      

                        <td>

                         <?php if(isset($row->image) && is_file(public_path('images/subject/' .$row->image))): ?>

                           <img src="<?php echo e(URL::asset('images/subject')); ?>/<?php echo e($row->image); ?>" alt="image" class="profile" height="80px" width="80px">

                         <?php endif; ?>
                        </td>


                         <td>
                            <?php echo e(date('d M Y',strtotime($row->created_at))); ?> 
                          </td>
                          <td>
                            
                            <?php echo e(date('d M Y',strtotime($row->updated_at))); ?>

                          </td>

                        <td>

                            <a href="<?php echo e(route('subject.edit', $row->id)); ?>" class="btn btn-primary btn-sm flex"><i class="fa fa-edit" aria-hidden="true"></i> Edit</a>

                            <form action="<?php echo e(route('subject.destroy',$row->id)); ?>" method="POST" id="delete_record">

                              <?php echo csrf_field(); ?>

                              <?php echo method_field('DELETE'); ?>

                            <button href="javascript:void(0);" onclick="return confirm('You Want to Delete this?')" type="submit" class="btn btn-danger btn-sm"><i class="fa fa-trash" aria-hidden="true"></i> Delete</button></td>

                             </form>

                        </td>

                    </tr>

                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                </tbody>

            </table>

        </div>

      </div><!-- End Row-->

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

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin/layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/appmantr/krantikari.appmantra.live/admin/resources/views/admin/subject/list.blade.php ENDPATH**/ ?>