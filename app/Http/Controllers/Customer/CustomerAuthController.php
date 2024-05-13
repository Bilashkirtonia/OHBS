<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customer;
use App\Mail\Websitemail;
use Auth;
use Hash;

class CustomerAuthController extends Controller
{
    public function customer_login(){
        return view('customer.login');
    }


    public function login_submit(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        $credential = [
            'email' => $request->email,
            'password' => $request->password,
            'status' => 1
        ];

        if(Auth::guard('customer')->attempt($credential)) {
            return redirect()->route('customer.home');
        } else {
            return redirect()->route('customer.login')->with('error', 'Information is not correct!');
        }
    }

    public function customer_signup(){
        return view('customer.signup');
    }

    public function customer_signup_submit(Request $request){

        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:customers',
            'password' => 'required',
            'retype_password' =>'required|same:password'
        ]);

        $token = hash('sha256', time());
        $password = Hash::make($request->password);
        $verification_link = url('signup-verify/'.$request->email.'/'.$token);

        Customer::insert([
            'name' => $request->name,
            'email' => $request->email,
            'password' => $password,
            'token' => $token,
            'status' => 0,
        ]);

        // Send email
        $subject = 'Sign Up Verification';
        $message = 'Please click on the link below to confirm sign up process:<br>';
        $message .= '<a href="'.$verification_link.'">';
        $message .= $verification_link;
        $message .= '</a>';

        \Mail::to($request->email)->send(new Websitemail($subject,$message));

        return redirect()->back()->with('success', 'To complete the signup, please check your email and click on the link');


    }

    public function signup_verify($email,$token)
    {

        $customer_data = Customer::where('email',$email)->where('token',$token)->first();

        if($customer_data) {

            $customer_data->token = '';
            $customer_data->status = 1;
            $customer_data->update();

            return redirect()->route('customer.login')->with('success', 'Your account is verified successfully!');

        } else {
            return redirect()->route('customer.login');
        }
    }

    public function logout()
    {
        Auth::guard('customer')->logout();
        return redirect()->route('customer.login');
    }

    public function forget_password()
    {
        return view('customer.forget_password');
    }

    public function forget_password_submit(Request $request)
    {
        $request->validate([
            'email' => 'required|email'
        ]);

        $customer_data = Customer::where('email',$request->email)->first();
        if(!$customer_data) {
            return redirect()->back()->with('error','Email address not found!');
        }

        $token = hash('sha256',time());

        $customer_data->token = $token;
        $customer_data->update();

        $reset_link = url('reset-password/'.$token.'/'.$request->email);
        $subject = 'Reset Password';
        $message = 'Please click on the following link to reset the password: <br>';
        $message .= '<a href="'.$reset_link.'">Click here</a>';

        \Mail::to($request->email)->send(new Websitemail($subject,$message));

        return redirect()->route('customer.login')->with('success','Please check your email and follow the steps there');

    }


    public function reset_password($token,$email)
    {
        $customer_data = Customer::where('token',$token)->where('email',$email)->first();
        if(!$customer_data) {
            return redirect()->route('customer_login');
        }

        return view('customer.reset_password', compact('token','email'));

    }

    public function reset_password_submit(Request $request)
    {
        $request->validate([
            'password' => 'required',
            'retype_password' => 'required|same:password'
        ]);

        $customer_data = Customer::where('token',$request->token)->where('email',$request->email)->first();

        $customer_data->password = Hash::make($request->password);
        $customer_data->token = '';
        $customer_data->update();

        return redirect()->route('customer.login')->with('success', 'Password is reset successfully');

    }

}
