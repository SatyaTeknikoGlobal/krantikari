@extends('admin/layout')

@section('users')

active

@endsection

@section('transactions')

active

@endsection

@section('content')



<div class="container-fluid">

    <!-- Breadcrumb-->

    <div class="row pt-2 pb-2">

        <div class="col-sm-6">

            <h4 class="page-title">Transaction List</h4>

            <ol class="breadcrumb">

                <li class="breadcrumb-item"><a href="{{ url('dashboard') }}">Home</a></li>

                <li class="breadcrumb-item active"><a href="javaScript:void();">Transaction</a></li>

            </ol>

        </div>



    </div>

    <!-- End Breadcrumb-->
    <?php 
    $search = isset($_GET['search']) ? $_GET['search'] :'';
    $method = isset($_GET['method']) ? $_GET['method'] :'';
    $course_id = isset($_GET['course_id']) ? $_GET['course_id'] :'';
    $exportUrl = url('/export_transactions');
    ?>

    <form method="get" action="">
        <div class="row">
            <div class="col-lg-3">
                <div class="card">
                 <input type="text" name="search" value="{{$search}}" id="search" class="form-control" placeholder="Search By User Name">
             </div>
         </div>
         <div class="col-lg-3">
            <div class="card">
             <select class="form-control" name="course_id">
                <option value="" selected disabled>Select Course</option>
                <?php if(!empty($courses)){
                    foreach($courses as $course){
                        ?>

                        <option value="{{$course->id}}" <?php if($course_id == $course->id) echo "selected"?>>{{$course->title}}</option>
                    <?php }}?>
                </select>
            </div>
        </div>

        <div class="col-lg-3">
            <div class="card">
             <select class="form-control" name="method">
                <option value="" selected disabled>Select Method</option>
                <option value="Admin" <?php if($method == 'Admin') echo "selected"?>>Admin</option>
                <option value="Razorpay" <?php if($method == 'Razorpay') echo "selected"?>>Razorpay</option>
            </select>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="card d-flex" >
            <div>
             <button type="submit" class="btn btn-success">Search</button>
             <!-- <a  class="btn btn-danger" href="{{url('/export_transactions',['search'=>$search,'method'=>$method,'course_id'=>$course_id])}}">Export</a> -->
             <!-- <a  class="btn btn-danger" href="{{url('/export_transactions').'?search=$search&course_id=$course_id&method=$method'}}">Export</a> -->
               <?php if(!empty($transactions) && count($transactions) > 0){

                ?>
             <a  class="btn btn-danger" href="<?php echo $exportUrl.'?search='.$search.'&course_id='.$course_id.'&method='.$method ?>">Export</a>
         <?php }?>
         </div>
     </div>
 </div>

</div>
</form>


<div class="row">

    <div class="col-lg-12">

        <div class="card">

            <div class="card-header "><i class="fa fa-users"></i> Transaction List 


            </div>



            <div class="card-body">


                <div class="table-responsive">

                    <table id="default-datatable" class="table table-bordered">

                        <thead>

                            <tr>

                                <th>#</th>

                                <th>User Name</th>

                                <th>Purpose</th>
                                <th>Amount</th>
                                <th>Method</th>
                                <th>Txn No</th>
                                <th>Date</th>



                            </tr>

                        </thead>

                        <tbody>
                            <?php if(!empty($transactions)){
                                foreach($transactions as $transaction){

                                    ?>
                                    <tr>
                                        <td>{{$transaction->id}}</td>
                                        <td><?php 
                                        $user = \App\AppUser::where('id',$transaction->user_id)->first();
                                        $name = $user->name??'';
                                        $email = $user->email??'';
                                        $phone = $user->phone??'';
                                        echo $name. '<br>'.$email. '<br>'.$phone;

                                    ?></td>
                                    <td>{{$transaction->purpose}}</td>
                                    <td>{{$transaction->amount}}</td>
                                    <td>{{$transaction->method}}</td>

                                    <td>{{$transaction->txn_no}}</td>
                                    <td>{{$transaction->created_at}}</td>

                                </tr>
                            <?php }}?>

                        </tbody>




                    </table>




                    {{ $transactions->appends(request()->input())->links() }}




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
   // ajax: '{{ route("get_users")}}',
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

@endsection