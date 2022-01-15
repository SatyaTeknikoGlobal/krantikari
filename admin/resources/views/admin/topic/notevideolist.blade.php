@extends('admin/layout')



@section('manage_content')



active



@endsection



@section('contents')



active



@endsection



@section('content')



<div class="container-fluid">



  <!-- Breadcrumb-->



  <div class="row pt-2 pb-2">



    <div class="col-sm-9">



      <h4 class="page-title">Manage Contents</h4>



      <ol class="breadcrumb">



        <li class="breadcrumb-item"><a href="{{ url('dashboard') }}">Home</a></li>



        <li class="breadcrumb-item active"><a href="javaScript:void();">Contents</a></li>


        <li class="breadcrumb-item"><a href="javaScript:void();">{{$subject_name}}</a></li>

        <li class="breadcrumb-item"><a href="javaScript:void();">{{$topic_name}}</a></li>



    </ol>



</div>



<div class="col-sm-3">



   <div class="btn-group float-sm-right">

     <a  class="btn btn-primary" href="{{url('topic')}}">Back</a>
     &nbsp;&nbsp;&nbsp;
     <?php if (Auth::user()->is_admin !=2 ){?>
       <a data-target="#myModal" data-toggle="modal" class="btn btn-primary" id="MainNavHelp" 
       href="#myModal">ADD</a>
     <?php }?>
      



   </div>




   <div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Content</h4>
            </div>
            <form action="{{ route('content.store')}}" method="post" enctype="multipart/form-data">

                @csrf

                <input type="hidden" name="topic_id" value="{{$topic_id}}">
                <div class="modal-body">
                    <div class="form-group row">

            <label for="input-26" class="col-sm-2 col-form-label">Title*</label>

            <div class="col-sm-10">

            <input type="text" class="form-control form-control-rounded" id="input-26" placeholder="Enter Title" name="title" >

            </div>

          </div>


            <div class="form-group row">

              <label for="exampleInputEmail1" class="col-sm-2 col-form-label">Url Type</label>

               <div class="col-sm-10">

              <select class="form-control form-control-rounded" name="hls_type" id="hls_type" required="true">

                  <option value="youtube" >Youtube</option>
                  <option value="local" >Local</option>
                     <option value="vimeo" >Vimeo</option>

              </select>

            </div>

          </div>



          <div class="form-group row" id="hls_div">

              <label for="exampleInputEmail1" class="col-sm-2 col-form-label">Video ID*</label>

               <div class="col-sm-10">
                <input class="form-control form-control-rounded" type="text" name="hls" id="hls_input" >

            </div>

          </div>

           <div class="form-group row" id= "file_upload_div" style="display: none;">

            <label for="file_upload" class="col-sm-2 col-form-label">File Upload*</label>

            <div class="col-sm-10">

            <input type="file" class="form-control-file" id="file_upload_input" name="hls">

            </div>

          </div>


                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>

            </form>
        </div>

    </div>
</div>









</div>



</div>



<!-- End Breadcrumb-->



<div class="row">



    <div class="col-lg-12">



      <div class="card">



        <div class="card-header"><i class="fa fa-clipboard"></i> Video's List </div>



        <div class="card-body">



          <div class="table-responsive">



              <table id="defaulttable1" class="table table-bordered">



                <thead>



                    <tr>



                        <th>#</th>





                        <th>Topic</th>

                        

                        <th>Video</th>

                         <?php if (Auth::user()->is_admin !=2 ){?>

                        <th>Action</th>

                      <?php }?>

                    </tr>



                </thead>



                <tbody>



                    @php



                    $i=1



                    @endphp



                    @foreach($video as $row)



                    <tr>

                        <td>{{$i++}}</td>



                        <td>{{$row->title}}</td>
                      <td>

                          <?php if($row->type == 'video'){?>
                           <iframe id="ytplayer" type="text/html" width="200" height="100"
                           src="https://www.youtube.com/embed/{{$row->hls}}"
                           frameborder="0"></iframe>




                       <?php }?>

                   </td>
                    <?php if (Auth::user()->is_admin !=2 ){?>
                   <td>

                     <a href="{{ route('content.edit', $row->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit" aria-hidden="true"></i> Edit</a>
                     <form action="{{ route('content.destroy',$row->id) }}" method="POST" id="delete_record">

                      @csrf

                      @method('DELETE')

                      <button href="javascript:void(0);" type="submit" class="btn btn-danger btn-sm" onclick="return confirm('You Want to Delete this?')"><i class="fa fa-trash" aria-hidden="true"></i> Delete</button>
                    </td>
                  <?php }?>

                  </form>

              </td>

          </tr>



          @endforeach



      </tbody>



  </table>



</div>



</div>



</div>



</div>



</div><!-- End Row-->
<?php 
$pre_id = isset($pre_id) ? $pre_id : 0;
?>

 <div class="row">



    <div class="col-lg-12">



      <div class="card">



    <div class="card-body">



      <div class="table-responsive">



          <table id="defaulttable" class="table table-bordered">



            <thead>



                <tr>


                    <th>#</th>





                    <th>Topic</th>


                    <th>Notes</th>

 <?php if (Auth::user()->is_admin !=2 ){?>

                    <th>Action</th>
                  <?php }?>



                </tr>



            </thead>



            <tbody>



                @php



                $i=1



                @endphp



                @foreach($notes as $row)



                <tr>



               <td>{{$i++}}</td>



               <td>{{$row->title}}</td>

              <td>



               @if(isset($row->hls))


               <a href="{{url('/public/content/notes/'.$row->hls)}}" target="_blank">View Pdf</a>

               @endif



           </td>
            <?php if (Auth::user()->is_admin !=2 ){?>
           <td>

             <form action="{{ route('content.destroy',$row->id) }}" method="POST" id="delete_record">

              @csrf

              @method('DELETE')

              <button href="javascript:void(0);" type="submit" class="btn btn-danger btn-sm" onclick="return confirm('You Want to Delete this?')"><i class="fa fa-trash" aria-hidden="true"></i> Delete</button></td>
            <?php }?>
          </form>

      </td>

  </tr>



  @endforeach



</tbody>



</table>



</div>



</div>



</div>



</div>



</div><!-- End Row-->


<!--start overlay-->



<div class="overlay toggle-menu"></div>



<!--end overlay-->



</div>



<!-- End container-fluid-->



<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>



@if ($message = Session::get('success'))



<script>



    Swal.fire({



        icon: 'success',



        title: '{{ $message }}',



        showConfirmButton: false,



        timer: 2500



    });



</script>



@endif

<script>



 $(document).ready(function() {



   var table = $('#defaulttable1').DataTable( {



    lengthChange: true,



    buttons: [ 'copy', 'excel', 'pdf', 'print', 'colvis' ]



} );







   table.buttons().container()



   .appendTo( '#default-datatable_wrapper .col-md-6:eq(0)' );







} );









</script>



<script>



 $(document).ready(function() {



   var table = $('#defaulttable').DataTable( {



    lengthChange: true,



    buttons: [ 'copy', 'excel', 'pdf', 'print', 'colvis' ]



} );







   table.buttons().container()



   .appendTo( '#default-datatable_wrapper .col-md-6:eq(0)' );







} );









</script>

<script type="text/javascript">
  
           $('#hls_type').change(function(){
              var hls_type = $('#hls_type').val();
              if(hls_type != 'youtube' && hls_type != 'vimeo'){
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
        </script>

@endsection