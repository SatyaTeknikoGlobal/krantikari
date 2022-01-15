@extends('admin/layout')

@section('examination')

active

@endsection

@section('quiz')

active

@endsection

@section('content')

<div class="container-fluid">

      <!-- Breadcrumb-->

     <div class="row pt-2 pb-2">

        <div class="col-sm-9">

		    <h4 class="page-title">Manage Exam</h4>

		    <ol class="breadcrumb">

            <li class="breadcrumb-item"><a href="{{ url('dashboard') }}">Home</a></li>

            <li class="breadcrumb-item active"><a href="javaScript:void();">Quiz</a></li>

         </ol>

	   </div>

	   <div class="col-sm-3">

       <div class="btn-group float-sm-right">

        <a type="button" class="btn btn-primary waves-effect waves-light" href="{{  route('quiz.index') }}">List</a>

      </div>

     </div>

     </div>

    <!-- End Breadcrumb-->

	<div class="card">

        <div class="card-header">Edit Quiz</div>

           <div class="card-body">

           	 @if ($errors->any())

              @foreach ($errors->all() as $error)

              <div id="fadeout-msg" class="alert alert-danger">

                  {{ $error }}

              </div>

              @endforeach

          @endif
            <form action="{{ route ('quiz.update',$exam->id)}}" method="post" enctype="multipart/form-data">
            @csrf
            @method('PUT')

             <div class="row">

            <div class="col">

              <div class="form-group">

              <label for="validationCustom08">Select Courses *</label>

                  <select class="form-control valid" name="board_id[]" id="board_id" aria-invalid="false"  onchange="getSubject()" required="">
                     
                        @foreach($boards as $row)
                        @if($row->id == $exam->board_id)
                        <option value="{{$row->id}}" selected="">{{$row->board_name}}</option>
                        @else
                         <option value="{{$row->id}}">{{$row->board_name}}</option>
                        @endif
                        @endforeach
                      </select>

                </div>

              </div>

            <div class="col">

             
               <div class="form-group row">

                  <label class="col-form-label">Time*(In Minutes)</label>

                  <input type="number" name="time" class="form-control" value="{{$exam->session_time}}" placeholder="Enter Time in Minutes" required="">

                </div>
          </div>
        </div>

          <hr>

          <div class="row">

            <div class="col"></div>

             <div class="col">

                <label class="col-form-label">Image</label>

                  <input type="file" name="image" class="form-control-file">

              </div>

              <div class="col">
                  @if(isset($exam->image) && is_file(public_path('images/exam/' .$exam->image)))
                <img src="{{URL::asset('images/exam')}}/{{$exam->image}}" alt="profile-image" class="profile" height="80px" width="80px">
                 @endif
              </div>

          </div>

            <div class="row">

              <div class="col">

                 <label class="col-form-label">Title*</label>

                  <input type="text" name="title" class="form-control" value="{{$exam->title}}" required="">

              </div>

              <div class="col">

                  

                    <label class="col-form-label">Select Instruction*</label>

                    <select class="form-control valid" id="input-6" name="instruction" required="" aria-invalid="false" required="">

                        <option >Select Instruction</option>

                        @foreach($instructions as $row)
                        @if($row->id==$exam->instruction)

                          <option value="{{$row->id}}" selected="">{{$row->title}}</option>

                        @else
                           <option value="{{$row->id}}">{{$row->title}}</option>

                        @endif

                        @endforeach

                    </select>

              </div>

            </div>

            <div class="row">

              <div class="col">

                 <label class="col-form-label">Start Date*</label>

                  <input type="date" name="start_date" class="form-control" value="{{$exam->start_date}}">

              </div>

              <div class="col">

                  <label class="col-form-label">End Date*</label>

                  <input type="date" name="end_date" class="form-control" value="{{$exam->end_date}}">

              </div>

            </div>

            <div class="row">

              <div class="col">

                 <label class="col-form-label">Start Time*</label>

                  <input type="time" name="start_time" class="form-control" value="{{$exam->start_time}}" >

              </div>

              <div class="col">

                  <label class="col-form-label">End Time*</label>

                  <input type="time" name="end_time" class="form-control" value="{{$exam->end_time}}">

              </div>

            </div>

             <div class="row">

              <div class="col">

                 <label class="col-form-label">Marks Per Question*</label>

                  <input type="text" name="marks" placeholder="Marks Per Question" value="{{$exam->marks}}" class="form-control">

              </div>

            </div>


             <div class="row">

              <div class="col">

                 <label class="col-form-label">Negetive Mark Per Question*</label>

                  <input type="text" name="negetive_marks" value="{{$exam->negetive_marks}}" placeholder="Negetive Mark Per Question" class="form-control">

              </div>

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

         <script>

  $(document).ready(function() {

      getSubject();

      } );


           function getSubject() {

             boards = $("#board_id").val();
             $.ajax({

                type: "POST",

                url: "{{ url ('/getSubjectList') }}",

                data: {'board_id':boards,'_token':'{{ csrf_token() }}'},

                success:function(data){

                     var data = jQuery.parseJSON(data);

                    $('#subject_list').html(data.subjectList);

                }

             });

           }

         </script>

@endsection