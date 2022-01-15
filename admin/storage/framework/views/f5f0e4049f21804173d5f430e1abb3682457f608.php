

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

        <a type="button" class="btn btn-primary waves-effect waves-light" href="<?php echo e(route('subject.index')); ?>">List</a>

      </div>

     </div>

     </div>

    <!-- End Breadcrumb-->

	<div class="card">

        <div class="card-header">Add Courses</div>

           <div class="card-body">

           	 <?php if($errors->any()): ?>

              <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

              <div id="fadeout-msg" class="alert alert-danger">

                  <?php echo e($error); ?>


              </div>

              <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

          <?php endif; ?>

            <form action="<?php echo e(route('subject.store')); ?>" method="post" enctype="multipart/form-data">

            <?php echo csrf_field(); ?>

            <div class="form-group row">

                  <label for="basic-select" class="col-sm-2 col-form-label">Select Category *</label>

                  <div class="col-sm-10">

                  <select class="form-control form-control-rounded" id="large-select" name="board_id">

                    <option readonly>Select Category</option>

                    <?php $__currentLoopData = $board; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                      <option value="<?php echo e($row->id); ?>"><?php echo e($row->board_name); ?></option>

                      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                    </select>

                  </div>

            </div>

           <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Title *</label>

            <div class="col-sm-10">

            <input type="text" class="form-control form-control-rounded" id="input-26" placeholder="Enter Title" name="title">

            </div>

          </div>

          
            <div class="form-group row">

          <label for="basic-textarea" class="col-sm-2 col-form-label">Description</label>

          <div class="col-sm-10">

          <textarea rows="4" name="description" class="form-control form-control-rounded" id="basic-textarea"></textarea>

          </div>

          </div>

           <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Course Thumbnail *</label>

            <div class="col-sm-10">
<strong style="color:red;">(Image Size should be 16:9 ratio) </strong>
            <input type="file" class="form-control-file" id="input-26" name="image">
              

            </div>

          </div>

           <div class="form-group row">

                  <label for="basic-select" class="col-sm-2 col-form-label">Select Faculties</label>

                  <div class="col-sm-10">

                  <select class="form-control form-control-rounded" id="large-select" name="faculties_id" >

                    <option readonly>Select Faculties*</option>

                    <?php $__currentLoopData = $faculties; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $f): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                      <option value="<?php echo e($f->id); ?>"><?php echo e($f->name); ?> (<?php echo e($f->phone); ?>)</option>

                      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                    </select>

                  </div>

            </div>

         <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">About Course *</label>

            <div class="col-sm-10">

            <input type="file" class="form-control-file" id="input-26" name="about" >

            </div>

          </div>


           <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Contents *</label>

            <div class="col-sm-10">

            <input type="file" class="form-control-file" id="input-26" name="contents" >

            </div>

          </div>

           <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Batch Schedule *</label>

            <div class="col-sm-10">

            <input type="file" class="form-control-file" id="input-26" name="batch_schedule" >

            </div>

          </div>

        <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Priority</label>

            <div class="col-sm-10">

            <input type="text" class="form-control form-control-rounded" id="input-26" name="priority" >

            </div>

          </div>


            <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Average Rating</label>

            <div class="col-sm-10">

            <input type="text" class="form-control form-control-rounded" id="input-26" name="avg_rating" >

            </div>

          </div>



            <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Total Rating</label>

            <div class="col-sm-10">

            <input type="text" class="form-control form-control-rounded" id="input-26" name="total_rating" >

            </div>

          </div>





            <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Selling Price</label>

            <div class="col-sm-10">

            <input type="text" class="form-control form-control-rounded" id="input-26" name="price" >

            </div>

          </div>


            <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Mrp</label>

            <div class="col-sm-10">

            <input type="text" class="form-control form-control-rounded" id="input-26" name="mrp" >

            </div>

          </div>


            <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Tags</label>

            <div class="col-sm-10">

            <input type="text" class="form-control form-control-rounded" id="input-26" name="tag" >

            </div>

          </div>




              <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">More Info</label>

            <div class="col-sm-10">

            <input type="text" class="form-control form-control-rounded" id="input-26" name="more_info" >

            </div>

          </div>


              <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Link</label>

            <div class="col-sm-10">

            <input type="text" class="form-control form-control-rounded" id="input-26" name="link" >

            </div>

          </div>



          <div class="form-group row">

              <label for="exampleInputEmail1" class="col-sm-2 col-form-label">Status *</label>

               <div class="col-sm-10">

              <select class="form-control form-control-rounded" name="status" id="status">

                  <option value="Y" selected="">Active</option>

                  <option value="N">Deactive</option>

              </select>

            </div>

          </div>

           <div class="form-group row">

            <label class="col-sm-2 col-form-label"></label>

            <div class="col-sm-10">

            <button type="submit" class="btn btn-dark btn-round px-5"><i class="icon-lock"></i> Submit</button>

            </div>

          </div>

          </form>

         </div>

         </div>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

   <?php if($message = Session::get('success')): ?>

        <script>

        Swal.fire({

            icon: 'success',

            title: '<?php echo e($message); ?>',

            showConfirmButton: false,

            timer: 2500

          });

        setInterval(function(){ window.location.href="<?php echo e(route('subject.index')); ?>"}, 1500);

        </script>



        <?php endif; ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin/layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/appmantr/krantikari.appmantra.live/admin/resources/views/admin/subject/add.blade.php ENDPATH**/ ?>