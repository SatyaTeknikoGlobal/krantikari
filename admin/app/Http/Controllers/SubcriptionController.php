<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Subject;
use App\Topic;
use App\Board;
use App\AppUser;
use Auth;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\UserExport;

use Rap2hpoutre\FastExcel\FastExcel;

class SubcriptionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

       // DB::enableQueryLog(); // Enable query log

       $data= DB::table('subscription_histories')
       ->select('subscription_histories.*','subscription_types.title as type_title','users.name','users.phone','users.email')
       ->leftjoin('subscription_types','subscription_histories.subs_sub_type_id','=','subscription_types.type_id')
       ->leftjoin('users','subscription_histories.user_id','=','users.id')
       ->get();


//dd(DB::getQueryLog()); // Show results of log




       return  view('admin/subcription/list',array('data'=>$data));
   }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {



        DB::enableQueryLog(); // Enable query log
        $subjectIds = [];

        if (Auth::user()->is_admin ==2 ){
            $subjectIds = Subject::select('id')->where('faculties_id',Auth::user()->faculties_id)->pluck('id')->toArray();
        }
        $data = [];
        $course = isset($request->course) ? $request->course:'';
        $subject_id = isset($request->subject_id) ? $request->subject_id:'';
        $topic_id = isset($request->topic_id) ? $request->topic_id:'';
        $is_export = isset($request->is_export) ? $request->is_export:0;
        $detail = [];

        




        if (Auth::user()->is_admin !=2 ){

            $detail =DB::table('subscription_histories')
            ->select('subscription_histories.*','users.name','users.phone','users.email')
            ->leftjoin('users','subscription_histories.user_id','=','users.id')
            ->orderby('id','desc');

            if(!empty($course)){
               $detail->where('subscription_histories.board_id','=',$course);
           }
           if(!empty($subject_id) && $subject_id !=0){
               $detail->where('subscription_histories.subject_id','=',$subject_id);
           }

           if(!empty($topic_id)  && $topic_id !=0){
               $detail->where('subscription_histories.topic_id','=',$topic_id);
           }

           if($is_export == 1){
            $detail = $detail->get();

            if(!empty($detail) && $detail->count() > 0){
                foreach($detail as $user){
                    $boards = Board::where('id',$user->board_id)->first();
                    $subjects = Subject::where('id',$user->subject_id)->first();
                    $topics = Topic::where('id',$user->topic_id)->first();



                    $userArr = [];
                    $userArr['ID'] = $user->id;
                    $userArr['Name'] = $user->name ?? '';
                    $userArr['Email'] = $user->email ?? '';
                    $userArr['Phone'] = $user->phone ?? '';
                    $userArr['Category'] = $boards->board_name ?? '';
                    $userArr['Course'] = $subjects->title ?? '';
                    $userArr['Batch'] = $topics->name ?? '';
                    $userArr['End Date'] = $user->end_date ?? '';
                    $exportArr[] = $userArr;
                }

                $filedNames = array_keys($exportArr[0]);

                $fileName = 'users_'.date('Y-m-d-H-i-s').'.xlsx';
                return Excel::download(new UserExport($exportArr, $filedNames), $fileName);
            }




        }
        else{
            $detail = $detail->paginate(10);
        }





    }else{
        if(!empty($subjectIds)){
            $detail =DB::table('subscription_histories')
            ->select('subscription_histories.*','users.name','users.phone','users.email')
            ->leftjoin('users','subscription_histories.user_id','=','users.id')
            ->whereIn('subscription_histories.subject_id',$subjectIds)->orderby('id','desc');
            $detail = $detail->paginate(10); 
        }

    }






    $data['boards'] = DB::table('boards')->get();
    $data['data'] = $detail;

    if(!empty($course)){
        $data['courses'] = Subject::where('board_id',$course)->get();
    }
    if(!empty($subject_id)){
        $data['batches'] = Topic::where('subject_id',$subject_id)->get();
    }


        // $users = DB::table('new')->get();
        // if(!empty($users)){
        //     foreach ($users as $key) {
        //         $user_details = AppUser::where('email',$key->name)->first();
        //             $dbArr = [];
        //             $dbArr['user_id'] = $user_details->id ?? 0;
        //             $dbArr['email'] = $key->name ?? '';
        //             $dbArr['board_id'] = 1;
        //             $dbArr['subject_id'] = 15;
        //             $dbArr['topic_id'] = 26;
        //             DB::table('subscription_historiesnew')->insert($dbArr);
        //     }
        // }





    return  view('admin/subcription/report',$data);
}

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    public function export(Request $request){
     $course = isset($_GET['course']) ? $_GET['course'] :'';
     $subject_id = isset($_GET['subject_id']) ? $_GET['subject_id'] :'';
     $topic_id = isset($_GET['topic_id']) ? $_GET['topic_id'] :'';

     $users =DB::table('subscription_histories')->orderBy('id','desc');
     if(!empty($course)){
        $users->where('board_id', $course);
    }
    if(!empty($subject_id)){
        $users->where('board_id', $subject_id);
    }
    if(!empty($topic_id)){
        $users->where('topic_id', $topic_id);
    }

    $users = $users->get();
    if(!empty($users) && $users->count() > 0){

        foreach($users as $user){
           $userArr = [];
           $userArr['ID'] = $user->id;
           // $userArr['Name'] = $user->name ?? '';
           // $userArr['Email'] = $user->email ?? '';
           // $userArr['Phone'] = $user->phone ?? '';
           $exportArr[] = $userArr;
       }

       $filedNames = array_keys($exportArr[0]);

       $fileName = 'users_'.date('Y-m-d-H-i-s').'.xlsx';
       return Excel::download(new UserExport($exportArr, $filedNames), $fileName);
   }
}








}
