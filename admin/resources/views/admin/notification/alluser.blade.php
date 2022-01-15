@extends('admin/layout')

@section('notification')

active

@endsection

@section('allusers')

active

@endsection

@section('content')



<div class="container-fluid">

      <!-- Breadcrumb-->

     <div class="row pt-2 pb-2">

        <div class="col-sm-9">

        <h4 class="page-title">Manage Notification</h4>

        <ol class="breadcrumb">

            <li class="breadcrumb-item"><a href="{{ url('dashboard') }}">Home</a></li>

            <li class="breadcrumb-item active"><a href="javaScript:void();">All User</a></li>

         </ol>

     </div>

     <div class="col-sm-3">

       <div class="btn-group float-sm-right">


      </div>

     </div>

     </div>

    <!-- End Breadcrumb-->


<div class="card">

        <div class="card-header">Send Notification</div>

           <div class="card-body">

             @if ($errors->any())

              @foreach ($errors->all() as $error)

              <div id="fadeout-msg" class="alert alert-danger">

                  {{ $error }}

              </div>

              @endforeach

          @endif

            <form action="{{ route('notification.store')}}" method="post" enctype="multipart/form-data">

            @csrf



             <div class="form-group row">
                  <label for="basic-select" class="col-sm-2 col-form-label">Select Type*</label>
                  <div class="col-sm-10">
                  <select class="form-control form-control-rounded" name="type" id="type">
                    <option value="all" selected>All</option>
                    <option value="course">Course Wise</option>
                    <option value="batch">Batch Wise</option>

                    </select>

                  </div>

            </div>


             <div class="form-group row" id="choose_course">
                  <label for="basic-select" class="col-sm-2 col-form-label">Select Course*</label>
                  <div class="col-sm-10">
                  <select class="form-control form-control-rounded" name="course_id">
                    <option value="" selected disabled>Select Courses</option>
                    <?php if(!empty($courses)){
                      foreach($courses as $course){
                      ?>
                      <option value="{{$course->id}}">{{$course->title}}</option>


                    <?php }}?>
                  </select>

                  </div>

            </div>



             <div class="form-group row" id="choose_batch">
                  <label for="basic-select" class="col-sm-2 col-form-label">Select Batches*</label>
                  <div class="col-sm-10">
                  <select class="form-control form-control-rounded" name="batch_id">
                   <option value="" selected disabled>Select Batch</option>
                    <?php if(!empty($batches)){
                      foreach($batches as $batch){
                      ?>
                      <option value="{{$batch->id}}">{{$batch->name}}</option>


                    <?php }}?>
                    </select>

                  </div>

            </div>




           <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Title *</label>

            <div class="col-sm-10">

            <input type="text" class="form-control form-control-rounded" placeholder="Enter Title" id="input-26" placeholder="" name="title"  value="">

            </div>

          </div>




           <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Image *</label>

            <div class="col-sm-10">

            <input type="file" class="form-control form-control-rounded"  name="file"  value="">

            </div>

          </div>



          <div class="form-group row">

              <label for="exampleInputEmail1" class="col-sm-2 col-form-label">Message *</label>

               <div class="col-sm-10">

                <textarea class="form-control form-control-rounded" placeholder="Enter Description" rows="5" name="message"></textarea>

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

   @if ($message = Session::get('success'))

        <script>

        Swal.fire({

            icon: 'success',

            title: '{{ $message }}',

            showConfirmButton: false,

            timer: 2500

          });

        setInterval(function(){ window.location.href="{{ route('notification.create')}}"}, 1500);

        </script>

   
        @endif


        <script>

           function getSubject() {

             boards = $("#board_id").val();

             $.ajax({

                type: "POST",

                url: "{{ url ('/getSubjectList') }}",

                data: {'board_id':boards,'_token':'{{ csrf_token() }}'},

                success:function(data){

                    var data = jQuery.parseJSON(data);

                    $('#subject_id').html(data.subjectList);
                      $('#chapter_id').html( '<option readonly value="0">Select Chapter</option>');
                     $('#topic_id').html('<option readonly value="0">Select Batch</option>');

                }

             });

           }
          function getChapter() {

              sub_id  = $("#subject_id").val();

               $.ajax({

            type: "POST",

            url: "{{ url ('/getSubject') }}",

            data: {id:sub_id,'_token':'{{ csrf_token() }}'},

            success:function(data){

                $('#topic_id').html(data);
                  //$('#topic_id').html('<option readonly value="0">Select Program</option>');

            }

        });

          }

          function getTopic() {

                chapter_id  = $("#chapter_id").val();

                $.ajax({

                    type: "POST",

                    url: "{{ url ('/getTopic') }}",

                    data: {id:chapter_id,'_token':'{{ csrf_token() }}'},

                    success:function(data){

                        $('#topic_id').html(data);

                    }

                });

            }

        </script>

        <script type="text/javascript">
          $(document).ready(function(){
           $('#hls_type').change(function(){
              var hls_type = $('#hls_type').val();
              if(hls_type != 'vimeo'){
                $('#file_upload_div').css('display','');
                $('#file_upload_input').attr('required',true);
                $('#hls_div').css('display','none');
                $('#hls_input').removeAttr('required');
              }else{
                $('#file_upload_div').css('display','none');
                $('#file_upload_input').removeAttr('required');
                $('#hls_div').css('display','');
                $('#hls_input').attr('required',true);
              }
           });
          });
        </script>



  <script type="text/javascript">



          $(document).ready(function(){

 $('#choose_batch').css('display','none');
 $('#choose_course').css('display','none');


           $('#type').change(function(){
              var type = $('#type').val();
              if(type == 'course'){
                $('#choose_course').css('display','');
                $('#course_id').attr('required',true);
                $('#choose_batch').css('display','none');
                $('#batch_id').removeAttr('required');
              }else if(type == 'batch'){
                $('#choose_course').css('display','none');
                $('#course_id').removeAttr('required');
                $('#choose_batch').css('display','');
                $('#batch_id').attr('required',true);
              }else{
                $('#choose_batch').css('display','none');
                $('#choose_course').css('display','none');
              }
           });
          });
        </script>




@endsection