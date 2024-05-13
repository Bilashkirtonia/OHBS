<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admin;
use App\Mail\Websitemail;
// use Hash;
// use Auth;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Mail;


class AdminLoginController extends Controller
{
    public function login(){
        return view('admin.login');
    }

    public function login_submit(Request $request){

         $request->validate([
            'email' => 'required|email',
            'password' =>'required'
        ]);

        $credential = [
            'email' => $request->email,
            'password' =>$request->password,
        ];

        if(Auth::guard('admin')->attempt($credential)){
            return redirect()->route('dashboard');
        }else{
            return redirect()->route('login')->with('error','Login information is not currect!');
        }
    }

    public function login_logout(){
        Auth::guard('admin')->logout();
            return redirect()->route('login');

    }

    public function forget_password(){
        return view('admin.forget_password');
    }

    public function forget_password_submit(Request $request){
        $request->validate([
            'email'=>'required'
        ]);

        $email = Admin::where('email',$request->email)->first();


        if(!$email){
            return redirect()->back()->with('error','Email address not found!');
        }

        $token = hash("sha256",time());
        $email->token = $token;
        $email->update();

        $reset_link = url('admin/reset/link/'.$token.'/'.$request->email);
        $subject = 'Reset Password';
        $message = 'Please click on the following link: <br>';
        $message .= '<a href="'.$reset_link.'">Click here</a>';
        Mail::to($request->email)->send(new Websitemail($subject,$message));
        return redirect()->route('login')->with('success','Please check your email and follow the steps there');

    }

    public function reset_password($token,$email){

        $admin_data = Admin::where('token',$token)->where('email',$email)->first();
        if(!$admin_data) {
            return redirect()->route('login');
        }

        return view('admin.reset_password', compact('token','email'));
    }

    public function reset_password_submit(Request $request)
    {
        $request->validate([
            'password' => 'required',
            'retype_password' => 'required|same:password'
        ]);

        $admin_data = Admin::where('token',$request->token)->where('email',$request->email)->first();

        $admin_data->password = Hash::make($request->password);
        $admin_data->token = '';
        $admin_data->update();

        return redirect()->route('login')->with('success', 'Password is reset successfully');

    }
}
