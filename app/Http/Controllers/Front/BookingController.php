<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

// use App\Models\Customer;
// use App\Models\Order;
// use App\Models\OrderDetail;
// use App\Models\BookedRoom;
// use App\Models\Room;
use Auth;
use DB;
// use App\Mail\Websitemail;
// use PayPal\Api\Amount;
// use PayPal\Api\Details;
// use PayPal\Api\Payment;
// use PayPal\Api\PaymentExecution;
// use PayPal\Api\Transaction;
// Use Stripe;
use Carbon\Carbon;
use Session;

class BookingController extends Controller{
    public function cart_submit(Request $request){

        $request->validate([
            'room_id' => 'required',
            'checkin_checkout' => 'required',
            'adult' => 'required',

        ]);

        $dates = explode('-',$request->checkin_checkout);

        $checkin_date = $dates[0];
        $checkout_date = $dates[1];

        $d1 = explode(' ',$checkin_date);
        $d2 = explode(' ',$checkout_date);
         
        $df1 = $d1[0];
        $df2 = $d2[1];

        $dy1 = explode('/',$df1);
        $dy2 = explode('/',$df2);

        $d1_new = $dy1[2].'-'.$dy1[1].'-'.$dy1[0];
        $d2_new = $dy2[2].'-'.$dy2[1].'-'.$dy2[0];

        $dtt1 = Carbon::parse($d1_new);
        $dtt2 = Carbon::parse($d2_new);
        $differDay = $dtt1->diffInDays($dtt2);   

        session()->push('cart_room_id',$request->room_id);
        session()->push('cart_checkin_date',$checkin_date);
        session()->push('cart_checkout_date',$checkout_date);
        session()->push('total_day',$differDay);
        session()->push('cart_adult',$request->adult);
        session()->push('cart_children',$request->children);


        return redirect()->back()->with('success', 'Room is added to the cart successfully.');

    }

    public function cart_view()
    {
        return view('front.cart');
    }

    public function cart_delete($id)
    {
        
        $arr_cart_room_id = array();
        $i=0;
        foreach(session()->get('cart_room_id') as $value) {
            $arr_cart_room_id[$i] = $value;
            $i++;
        }

        

        $arr_cart_checkin_date = array();
        $i=0;
        foreach(session()->get('cart_checkin_date') as $value) {
            $arr_cart_checkin_date[$i] = $value;
            $i++;
        }

        $arr_cart_checkout_date = array();
        $i=0;
        foreach(session()->get('cart_checkout_date') as $value) {
            $arr_cart_checkout_date[$i] = $value;
            $i++;
        }

        $arr_cart_adult = array();
        $i=0;
        foreach(session()->get('cart_adult') as $value) {
            $arr_cart_adult[$i] = $value;
            $i++;
        }

        $arr_cart_children = array();
        $i=0;
        foreach(session()->get('cart_children') as $value) {
            $arr_cart_children[$i] = $value;
            $i++;
        }

        $arr_cart_total_day = array();
        $i=0;
        foreach(session()->get('total_day') as $value) {
            $arr_cart_total_day[$i] = $value;
            $i++;
        }


        session()->forget('cart_room_id');
        session()->forget('cart_checkin_date');
        session()->forget('cart_checkout_date');
        session()->forget('cart_adult');
        session()->forget('cart_children');
        session()->forget('cart_children');
        session()->forget('total_day');

        for($i=0; $i<count($arr_cart_room_id); $i++)
        {
            if($arr_cart_room_id[$i] == $id)
            {
                continue;
            }
            else
            {
                session()->push('cart_room_id',$arr_cart_room_id[$i]);
                session()->push('cart_checkin_date',$arr_cart_checkin_date[$i]);
                session()->push('cart_checkout_date',$arr_cart_checkout_date[$i]);
                session()->push('cart_adult',$arr_cart_adult[$i]);
                session()->push('cart_children',$arr_cart_children[$i]);
                session()->push('total_day',$arr_cart_total_day[$i]);
            }
        }

        return redirect()->back()->with('success', 'Cart item is deleted.');

    }

    public function checkout()
    {
        if(!Auth::guard('customer')->check()) {
            return redirect()->route('customer.login')->with('error', 'You must have to login in order to checkout');
        }

        if(!session()->has('cart_room_id')) {
            return redirect()->route('home')->with('error', 'There is no item in the cart');
        }

        return view('front.checkout');


    }

    public function payment(Request $request)
    {
        if(!Auth::guard('customer')->check()) {
            return redirect()->route('customer.login')->with('error', 'You must have to login in order to checkout');
        }

        if(!session()->has('cart_room_id')) {
            return redirect()->route('home')->with('error', 'There is no item in the cart');
        }

        $request->validate([
            'billing_name' => 'required',
            'billing_email' => 'required|email',
            'billing_phone' => 'required',
            'billing_country' => 'required',
            'billing_address' => 'required',
            'billing_state' => 'required',
            'billing_city' => 'required',
            'billing_zip' => 'required'
        ]);

        session()->put('billing_name',$request->billing_name);
        session()->put('billing_email',$request->billing_email);
        session()->put('billing_phone',$request->billing_phone);
        session()->put('billing_country',$request->billing_country);
        session()->put('billing_address',$request->billing_address);
        session()->put('billing_state',$request->billing_state);
        session()->put('billing_city',$request->billing_city);
        session()->put('billing_zip',$request->billing_zip);

        return view('front.payment');
    }

     

    public function payment_method(Request $request){
        //  dd(Session::all());  

        $obj = new Order();
        $obj->customer_id = Auth::guard('customer')->user()->id;
        $obj->order_no = time();
        $obj->payment_method = $request->payment_method;
        $obj->paid_amount = $paid_amount;
        $obj->booking_date = date('d/m/Y');
        $obj->status = 'Completed';
        $obj->save();
    }
    public function paypal($final_price)
    {
        
        if($result->state == 'approved')
        {
            $paid_amount = $result->transactions[0]->amount->total;
            
            $order_no = time();

            $statement = DB::select("SHOW TABLE STATUS LIKE 'orders'");
            $ai_id = $statement[0]->Auto_increment;

            $obj = new Order();
            $obj->customer_id = Auth::guard('customer')->user()->id;
            $obj->order_no = $order_no;
            $obj->transaction_id = $result->id;
            $obj->payment_method = 'PayPal';
            $obj->paid_amount = $paid_amount;
            $obj->booking_date = date('d/m/Y');
            $obj->status = 'Completed';
            $obj->save();
            
            $arr_cart_room_id = array();
            $i=0;
            foreach(session()->get('cart_room_id') as $value) {
                $arr_cart_room_id[$i] = $value;
                $i++;
            }

            $arr_cart_checkin_date = array();
            $i=0;
            foreach(session()->get('cart_checkin_date') as $value) {
                $arr_cart_checkin_date[$i] = $value;
                $i++;
            }

            $arr_cart_checkout_date = array();
            $i=0;
            foreach(session()->get('cart_checkout_date') as $value) {
                $arr_cart_checkout_date[$i] = $value;
                $i++;
            }

            $arr_cart_adult = array();
            $i=0;
            foreach(session()->get('cart_adult') as $value) {
                $arr_cart_adult[$i] = $value;
                $i++;
            }

            $arr_cart_children = array();
            $i=0;
            foreach(session()->get('cart_children') as $value) {
                $arr_cart_children[$i] = $value;
                $i++;
            }

            for($i=0;$i<count($arr_cart_room_id);$i++)
            {
                $r_info = Room::where('id',$arr_cart_room_id[$i])->first();
                $d1 = explode('/',$arr_cart_checkin_date[$i]);
                $d2 = explode('/',$arr_cart_checkout_date[$i]);
                $d1_new = $d1[2].'-'.$d1[1].'-'.$d1[0];
                $d2_new = $d2[2].'-'.$d2[1].'-'.$d2[0];
                $t1 = strtotime($d1_new);
                $t2 = strtotime($d2_new);
                $diff = ($t2-$t1)/60/60/24;
                $sub = $r_info->price*$diff;

                $obj = new OrderDetail();
                $obj->order_id = $ai_id;
                $obj->room_id = $arr_cart_room_id[$i];
                $obj->order_no = $order_no;
                $obj->checkin_date = $arr_cart_checkin_date[$i];
                $obj->checkout_date = $arr_cart_checkout_date[$i];
                $obj->adult = $arr_cart_adult[$i];
                $obj->children = $arr_cart_children[$i];
                $obj->subtotal = $sub;
                $obj->save();

                while(1) {
                    if($t1>=$t2) {
                        break;
                    }
    
                    $obj = new BookedRoom();
                    $obj->booking_date = date('d/m/Y',$t1);
                    $obj->order_no = $order_no;
                    $obj->room_id = $arr_cart_room_id[$i];
                    $obj->save();
    
                    $t1 = strtotime('+1 day',$t1);
                }

            }

            $subject = 'New Order';
            $message = 'You have made an order for hotel booking. The booking information is given below: <br>';
            $message .= '<br>Order No: '.$order_no;
            $message .= '<br>Transaction Id: '.$result->id;
            $message .= '<br>Payment Method: PayPal';
            $message .= '<br>Paid Amount: '.$paid_amount;
            $message .= '<br>Booking Date: '.date('d/m/Y').'<br>';

            for($i=0;$i<count($arr_cart_room_id);$i++) {

                $r_info = Room::where('id',$arr_cart_room_id[$i])->first();

                $message .= '<br>Room Name: '.$r_info->name;
                $message .= '<br>Price Per Night: $'.$r_info->price;
                $message .= '<br>Checkin Date: '.$arr_cart_checkin_date[$i];
                $message .= '<br>Checkout Date: '.$arr_cart_checkout_date[$i];
                $message .= '<br>Adult: '.$arr_cart_adult[$i];
                $message .= '<br>Children: '.$arr_cart_children[$i].'<br>';
            }            

            $customer_email = Auth::guard('customer')->user()->email;

            \Mail::to($customer_email)->send(new Websitemail($subject,$message));

            session()->forget('cart_room_id');
            session()->forget('cart_checkin_date');
            session()->forget('cart_checkout_date');
            session()->forget('cart_adult');
            session()->forget('cart_children');
            session()->forget('billing_name');
            session()->forget('billing_email');
            session()->forget('billing_phone');
            session()->forget('billing_country');
            session()->forget('billing_address');
            session()->forget('billing_state');
            session()->forget('billing_city');
            session()->forget('billing_zip');

            return redirect()->route('home')->with('success', 'Payment is successful');
        }
        else
        {
            return redirect()->route('home')->with('error', 'Payment is failed');
        }


    }

}



















