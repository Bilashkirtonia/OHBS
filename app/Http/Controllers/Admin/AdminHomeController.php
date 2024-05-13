<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Customer;
use App\Models\Room;
use App\Models\Subscriber;

class AdminHomeController extends Controller
{
    public function dashboard(){
        $data['total_completed_orders'] = Order::where('status','Completed')->count();
        $data['total_pending_orders'] = Order::where('status','Pending')->count();
        $data['total_active_customers'] = Customer::where('status',1)->count();
        $data['total_pending_customers'] = Customer::where('status',0)->count();
        $data['total_rooms'] = Room::count();
        $data['total_subscribers'] = Subscriber::where('status',1)->count();
        $data['orders'] = Order::orderBy('id','desc')->skip(0)->take(5)->get();

        return view('admin.dashboard',$data);
    }
}
