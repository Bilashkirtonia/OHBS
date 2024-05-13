<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use Auth;

class CustomerHomeController extends Controller
{
    public function index()
    {
        $data['total_completed_orders'] = Order::where('status','Completed')->where('customer_id',Auth::guard('customer')->user()->id)->count();
        $data['total_pending_orders'] = Order::where('status','Pending')->where('customer_id',Auth::guard('customer')->user()->id)->count();
        return view('customer.home',$data);
    }
}
