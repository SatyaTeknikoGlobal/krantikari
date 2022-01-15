<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\AppUser;
use App\Board;

use App\UserLogin;
use App\Subject;
use App\Topic;
use App\SubscriptionHistory;

use DB;
use Artisan;
use App\Jobs\SendNotification;



class NotificationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = AppUser::select(['id','name'])->get();
        return view('admin/notification/specific',array('users'=>$users));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {


     


        $board = Board::get();
        $data['board'] = $board;

        $courses = Subject::where('status',1)->where('is_delete',0)->get();
        $batches = Topic::where('is_delete',0)->get();

        $data['courses'] = $courses;
        $data['batches'] = $batches;

        return view('admin/notification/alluser',$data);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' =>'required',
            'message'=>'required',
            'type'=>'required',
        ]);


        $course_id = isset($request->course_id) ? $request->course_id : '';
        $batch_id = isset($request->batch_id) ? $request->batch_id : '';
        $type = isset($request->type) ? $request->type : '';
        $title = isset($request->title) ? $request->title : '';
        $message = isset($request->message) ? $request->message : '';

        $dbArr = [];

        $file = $request->file('file');

        if (!empty($file)) {

            $imageName = time().'.'.request()->file->getClientOriginalExtension();
            request()->file->move(public_path('notification'), $imageName);

            $dbArr['image'] = $imageName;
            
        }



        $dbArr['course_id'] = $course_id;
        $dbArr['batch_id'] = $batch_id;
        $dbArr['title'] = $title;
        $dbArr['text'] = $message;
        $dbArr['type'] = $type;

        $success = DB::table('notifications_scheduling')->insert($dbArr);
        if($success){
            
            // Artisan::call('cache:clear');
            // Artisan::queue('send:notification');
            // Artisan::call('schedule:run');


            //////////////////////////////Send Notification////////////////////////////////////////
         $all_notifications = DB::table('notifications_scheduling')->where('status',0)->get();
         if(!empty($all_notifications)){
            foreach($all_notifications as $notif){
                if($notif->type == 'all'){
                /////ALL USERS///////
                    $users = AppUser::select('id')->get();
                    if(!empty($users)){
                        foreach($users as $user){
                            $user_logins = UserLogin::where('user_id',$user->id)->get();
                            if(!empty($user_logins)){
                                foreach($user_logins as $login){
                                   $deviceToken = $login->deviceToken;
                                   $sendData = array(
                                    'body' => $notif->text,
                                    'title' => $notif->title,
                                    'image'=>$notif->image,
                                    'sound' => 'Default',
                                );
                                   $result = $this->fcmNotification($deviceToken,$sendData);
                                   if($result){
                                    $dbArr = [];
                                    $dbArr['userID'] = $login->user_id;
                                    $dbArr['text'] = $notif->text;
                                    $dbArr['title'] = $notif->title;
                                    $dbArr['image'] = $notif->image;
                                    $dbArr['is_send'] = 1;
                                    
                                    DB::table('notifications')->insert($dbArr);
                                }
                            }
                        }
                    }
                }
                DB::table('notifications_scheduling')->where('id',$notif->id)->update(['status'=>1]);


            }else if($notif->type == 'course'){
                if(!empty($notif->course_id)){
                    $userIDs = [];
                    $sub_history = SubscriptionHistory::select('id','user_id')->where('subject_id',$notif->course_id)->get();
                    if(!empty($sub_history)){
                        foreach($sub_history as $his){
                            $userIDs[] = $his->user_id;
                        }
                    }
                    $users = AppUser::select('id')->whereIn('id',$userIDs)->get();
                    if(!empty($users)){
                        foreach($users as $user){
                            $user_logins = UserLogin::where('user_id',$user->id)->get();
                            if(!empty($user_logins)){
                                foreach($user_logins as $login){
                                   $deviceToken = $login->deviceToken;
                                   $sendData = array(
                                    'body' => $notif->text,
                                    'title' => $notif->title,
                                    'image'=>$notif->image,
                                    'sound' => 'Default',
                                );
                                   $result = $this->fcmNotification($deviceToken,$sendData);

                                   if($result){
                                    $dbArr = [];
                                    $dbArr['userID'] = $login->user_id;
                                    $dbArr['text'] = $notif->text;
                                    $dbArr['title'] = $notif->title;
                                    $dbArr['image'] = $notif->image;
                                    $dbArr['is_send'] = 1;
                                    DB::table('notifications')->insert($dbArr);
                                }
                            }
                        }
                    }
                }
                DB::table('notifications_scheduling')->where('id',$notif->id)->update(['status'=>1]);


            }


        }else if($notif->type == 'batch'){
            if(!empty($notif->batch_id)){
                $userIDs = [];
                $sub_history = SubscriptionHistory::select('id','user_id')->where('topic_id',$notif->batch_id)->get();
                if(!empty($sub_history)){
                    foreach($sub_history as $his){
                        $userIDs[] = $his->user_id;
                    }
                }

                $users = AppUser::select('id')->whereIn('id',$userIDs)->get();
                if(!empty($users)){
                    foreach($users as $user){
                        $user_logins = UserLogin::where('user_id',$user->id)->get();
                        if(!empty($user_logins)){
                            foreach($user_logins as $login){
                               $deviceToken = $login->deviceToken;
                               $sendData = array(
                                'body' => $notif->text,
                                'title' => $notif->title,
                                'image'=>$notif->image,
                                'sound' => 'Default',
                            );
                               $result = $this->fcmNotification($deviceToken,$sendData);

                               if($result){
                                $dbArr = [];
                                $dbArr['userID'] = $login->user_id;
                                $dbArr['text'] = $notif->text;
                                $dbArr['title'] = $notif->title;
                                $dbArr['image'] = $notif->image;
                                $dbArr['is_send'] = 1;
                                DB::table('notifications')->insert($dbArr);
                            }
                        }
                    }
                }
            }
            DB::table('notifications_scheduling')->where('id',$notif->id)->update(['status'=>1]);
        }
    }
}
}


////////////////////////////////////////End Send Notification/////////////////////////////////////





return redirect()->route('notification.create')->with('success','Notification Sent successfully.');
}else{
 return redirect()->route('notification.create')->with('error','Notification Not Sent ');

}


}



public function sedule_run(){
 Artisan::call('schedule:run');

}



    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    // public function store(Request $request)
    // {
    //     $request->validate([
    //         'title' =>'required',
    //         'message'=>'required',
    //         'type'=>'required',
    //     ]);


    //     $board_id = request('board_id');
    //     $subject_id = request('subject_id');
    //     $topic_id = request('topic_id');


    //     $title = isset($request->title) ? $request->title : '';
    //     $msg = isset($request->message) ? $request->message : '';

    //     $userIDs = [];
    //     //echo $board_id;

    //     if(!empty($board_id) && empty($subject_id) && empty($topic_id)){
    //         $users = AppUser::where('board_id',$board_id)->get();
    //         if(!empty($users)){
    //             foreach($users as $user){
    //                 $userIDs[] = $user->id;
    //             }
    //         }
    //     }
    //    if(!empty($board_id)  && !empty($topic_id)){
    //             $subshistory = SubscriptionHistory::where('topic_id',$topic_id)->get();
    //             if(!empty($subshistory)){
    //                 foreach($subshistory as $his){
    //                     $userIDs[] = $his->user_id;
    //                 }
    //             }
    //    }
    //    if(empty($board_id)){
    //     $users = AppUser::get();
    //         if(!empty($users)){
    //             foreach($users as $user){
    //                 $userIDs[] = $user->id;
    //             }
    //         }
    //    }

    //     if(!empty($userIDs)){
    //         $data = UserLogin::whereIn('user_id',$userIDs)->get();
    //         foreach ($data as $row) {
    //             $deviceToken = $row->deviceToken;

    //             $dbArray = [];
    //             $dbArray['userID'] = $row->user_id;
    //             $dbArray['title'] = $title;
    //             $dbArray['text'] = $msg;
    //             $result = DB::table('notifications')->insert($dbArray);


    //             $this->send_notification($title, $msg, $deviceToken , "admin");
    //         }
    //     }



    //     $board = Board::get();
    //     $data['board'] = $board;
    //     return view('admin/notification/alluser',$data);




    //     // if ($user=='all') {




    //     //     $data = UserLogin::get();
    //     //     foreach ($data as $row) {
    //     //         $deviceToken = $row->deviceToken;
    //     //         $this->send_notification($title, $msg, $deviceToken , "admin");
    //     //           return view('admin/notification/alluser');
    //     //     }




    //     // }
    //     // else{
    //     //     foreach ($user as  $row) {

    //     //         $dbArray = [];
    //     //         $dbArray['userID'] = $row;
    //     //         $dbArray['title'] = $title;
    //     //         $dbArray['text'] = $msg;
    //     //         $result = DB::table('notifications')->insert($dbArray);
    //     //         $data = UserLogin::where(['user_id'=>$row])->get();

    //     //         foreach ($data as $key => $val) {
    //     //             $deviceToken = $val->deviceToken;
    //     //             $this->send_notification($title, $msg, $deviceToken , "admin");
    //     //         //   return view('admin/notification/alluser');
    //     //         }


    //     //     }
    //     //     $users = AppUser::get();
    //     //     return view('admin/notification/specific',array('users'=>$users));
    //     // }

    // }

    public function send_notification($title, $body, $deviceToken , $type){
        $deviceToken = $deviceToken;
        $sendData = array(
            'body' => $body,
            'title' => $title,
            'type' => $type,
            'sound' => 'Default'
        );
        $this->fcmNotification($deviceToken,$sendData);
    }

    public function fcmNotification($device_id, $sendData)
    {
        #API access key from Google API's Console
        if (!defined('API_ACCESS_KEY')){
            define('API_ACCESS_KEY', 'AAAAP7qjih4:APA91bF4HF9dBjykpOL-dSi7CCgDRHS59QR65UP-5tmF-gtUDuDDBVlRZwoG_1tPSELqzOkIt5cf24fPyEj6UKZPKdsLqA1cR6OokKNCWTWymJfj4P0ebOgTcGqAazOE50Ku3KKLAVVJ');
        }

        $fields = array
        (
            'to'    => $device_id,
            'data'  => $sendData,
            'notification'  => $sendData
        );

        $headers = array
        (
            'Authorization: key=' . API_ACCESS_KEY,
            'Content-Type: application/json'
        );
        #Send Reponse To FireBase Server
        $ch = curl_init();
        curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
        curl_setopt( $ch,CURLOPT_POST, true );
        curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
        curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
        curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
        curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
        $result = curl_exec($ch);
        //$data = json_decode($result);
        if($result === false)
            die('Curl failed ' . curl_error($ch));

        curl_close($ch);
        return $result;
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
}
