<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\BookBanner;
use App\Subject;
use App\Transaction;
use App\Exports\UserExport;
use Maatwebsite\Excel\Facades\Excel;



class TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

     $search = isset($_GET['search']) ? $_GET['search'] :'';
     $method = isset($_GET['method']) ? $_GET['method'] :'';
     $course_id = isset($_GET['course_id']) ? $_GET['course_id'] :'';

     //$data = Transaction::latest();

     // if(!empty($method)){
     //    $data->where('method',$method);
     // }
     //  if(!empty($course_id)){
     //    $data->where('course_id',$course_id);
     // }


     $data = Transaction::select('transaction_histories.*','users.name','users.email','users.phone')
     ->leftJoin('users', 'transaction_histories.user_id', '=', 'users.id')->latest();


     if(!empty($method)){
        $data->where('transaction_histories.method',$method);
    }
    if(!empty($course_id)){
        $data->where('transaction_histories.course_id',$course_id);
    }
    if(!empty($search)){
        $data->where('users.name', 'like', '%' . $search . '%');
        $data->orWhere('users.email', 'like', '%' . $search . '%');
        $data->orWhere('users.phone', 'like', '%' . $search . '%');
    }

    $data = $data->paginate(10);

    $courses = Subject::where('status',1)->get(); 

    return view('admin/transaction/list', array('transactions'=>$data,'courses'=>$courses));
}

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin/bookbanner/add');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' =>'required',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:8192',
            'status'=>'required',
            'author_name'=>'required',
        ]);
        $imageName = time().'.'.request()->image->getClientOriginalExtension();
        request()->image->move(public_path('images/bookbanner'), $imageName);
        BookBanner::create([
            'name'=>request('name'),
            'banner'=>$imageName,
            'status'=>request('status'),   
            'author_name'=>request('author_name'),   
            'description'=>request('description'),   
        ]);
        return redirect()->route('book_banner.index')
        ->with('success','Banners Added successfully.');
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
       $data = BookBanner::where(['id'=>$id])->first();
       return view('admin/bookbanner/edit',array('data'=>$data));
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
       $request->validate([
        'name' =>'required',
        'image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:8192',
        'status'=>'required',
    ]);
       $image = $request->file('image');
       $data =array();
       if (!empty($image)) {
        //Store Image In Folder
        $imageName = time().'.'.request()->image->getClientOriginalExtension();
        request()->image->move(public_path('images/bookbanner'), $imageName);
        $data = array(
            'name'=>request('name'),
            'banner'=>$imageName,
            'status'=>request('status'),   
        );
    }
    else{
       $data = array(
           'name'=>request('name'),
           'status'=>request('status'),  
       ); 
   }
   BookBanner::where(['id'=>$id])->update($data);
   return redirect()->route('book_banner.index')
   ->with('success','Banners Updated successfully.');
}

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        BookBanner::find($id)->delete();
        return redirect()->route('book_banner.index')
        ->with('success','Banners Deleted successfully.');
    }



    public function export_transactions(Request $request){
       $search = isset($request->search) ? $request->search :'';
       $method = isset($request->method) ? $request->method :'';
       $course_id = isset($request->course_id) ? $request->course_id :'';

       $users = Transaction::select('transaction_histories.*','users.name','users.email','users.phone')
       ->leftJoin('users', 'transaction_histories.user_id', '=', 'users.id')->latest();


       if(!empty($method)){
        $users->where('transaction_histories.method',$method);
    }
    if(!empty($course_id)){
        $users->where('transaction_histories.course_id',$course_id);
    }
    if(!empty($search)){
        $users->where('users.name', 'like', '%' . $search . '%');
        $users->orWhere('users.email', 'like', '%' . $search . '%');
        $users->orWhere('users.phone', 'like', '%' . $search . '%');
    }

    $users = $users->get();

    if(!empty($users) && $users->count() > 0){
        foreach($users as $user){
            $subject = Subject::where('id',$user->course_id)->first();
            $userArr = [];
            $userArr['id'] = $user->id;
            $userArr['User Name'] = $user->name;
            $userArr['Email'] = $user->email;
            $userArr['Phone'] = $user->phone;
            $userArr['DOB'] = $user->dob;
            $userArr['Course Name'] = $subject->title ?? '';
            $userArr['Transaction No'] = $user->txn_no;
            $userArr['Payment Method'] = $user->method;
            $userArr['Amount'] = $user->amount;
            $userArr['Created At'] = $user->created_at->toDateTimeString();
            $userArr['Updated At'] = $user->updated_at->toDateTimeString();
            $exportArr[] = $userArr;
        }
    }

    $filedNames = array_keys($exportArr[0]);
    $fileName = 'transactions_'.date('Y-m-d-H-i-s').'.xlsx';

    return Excel::download(new UserExport($exportArr, $filedNames), $fileName);



}











}
