<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Slide;
use App\Models\Feature;
use App\Models\Testimonial;
use App\Models\Post;
use App\Models\Room;

class HomeController extends Controller
{
    public function index(){
        $data['slide_all'] = Slide::latest()->limit(3)->get();
        $data['feature_all'] = Feature::latest()->get();
        $data['testimonial_all'] = Testimonial::latest()->limit(2)->get();
        $data['post_all'] = Post::latest()->limit(3)->get();
        $data['room_all'] = Room::latest()->get();
        return view('front.home',$data);
    }
}
