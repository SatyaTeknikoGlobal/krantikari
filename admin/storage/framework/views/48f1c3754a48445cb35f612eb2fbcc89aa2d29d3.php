<?php $__env->startSection('books'); ?>



active



<?php $__env->stopSection(); ?>



<?php $__env->startSection('primes'); ?>



active



<?php $__env->stopSection(); ?>



<?php $__env->startSection('content'); ?>



<div class="container-fluid">



  <!-- Breadcrumb-->



  <div class="row pt-2 pb-2">



    <div class="col-sm-9">



      <h4 class="page-title">Manage Prime Course</h4>



      <ol class="breadcrumb">



        <li class="breadcrumb-item"><a href="<?php echo e(url('dashboard')); ?>">Home</a></li>



        <li class="breadcrumb-item active"><a href="javaScript:void();">Prime Course</a></li>



    </ol>



</div>



<div class="col-sm-3">



 <div class="btn-group float-sm-right">



    <a type="button" class="btn btn-primary waves-effect waves-light" href="<?php echo e(route('primes.create')); ?>">Add</a>



</div>



</div>



</div>



<!-- End Breadcrumb-->



<div class="row">



    <div class="col-lg-12">



      <div class="card">



        <div class="card-header"><i class="fa fa-book"></i> Prime Course List </div>



        <div class="card-body">



          <div class="table-responsive">



              <table id="default-datatable" class="table table-bordered">



                <thead>



                    <tr>



                        <th>#</th>

                        <th>Name</th>
                        <th>Image</th>
                        <th>Status</th>
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

                        <td><?php echo e($row->title); ?></td>

                        <td>
                             <?php if(isset($row->file_name) && is_file(public_path('images/primecourse/' .$row->file_name))): ?>

                           <img src="<?php echo e(URL::asset('images/primecourse')); ?>/<?php echo e($row->file_name); ?>" alt="image" class="profile" height="80px" width="80px">

                         <?php endif; ?>
                          </td>

                          <td>

                             <?php if($row->status!='N'): ?>



                             <span class="badge badge-success">Active</span>



                             <?php else: ?>



                             <span class="badge badge-danger">Deactive</span>





                             <?php endif; ?>

                         </td>





                         <td>

                            <?php echo e(date('d M Y',strtotime($row->created_at))); ?> 

                        </td>

                        <td>



                            <?php echo e(date('d M Y',strtotime($row->updated_at))); ?>


                        </td>



                        <td>



                            <a href="<?php echo e(route('primes.edit', $row->id)); ?>" class="btn btn-primary btn-sm flex"><i class="fa fa-edit" aria-hidden="true"></i> Edit</a>

                             <a href="<?php echo e(route('primes.contents', $row->id)); ?>" class="btn btn-primary btn-sm flex"><i class="fa fa-fole-o" aria-hidden="true"></i> Contents</a>

                            <form action="<?php echo e(route('primes.destroy',$row->id)); ?>" method="POST" id="delete_record">



                              <?php echo csrf_field(); ?>



                              <?php echo method_field('DELETE'); ?>



                              <button href="javascript:void(0);" type="submit" class="btn btn-danger btn-sm" onclick="return confirm('You Want to Delete this?')"><i class="fa fa-trash" aria-hidden="true"></i> Delete</button></td>



                          </form>



                      </td>



                  </tr>



                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>



              </tbody>






          </table>



      </div>



  </div>







</div>

</div>
</div>


</div><!-- End Row-->



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
<?php echo $__env->make('admin/layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/appmantr/krantikari.appmantra.live/admin/resources/views/admin/prime/list.blade.php ENDPATH**/ ?>