<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;

class BlogController extends Controller
{
    public function index()
    {
        $data['post_all'] = Post::latest()->paginate(9);
        return view('front.blog',$data);
    }

    public function single_blog($id)
    {
        $single_post_data = Post::where('id',$id)->first();
        $single_post_data->total_view = $single_post_data->total_view + 1;
        $single_post_data->update();
        return view('front.blog_details', compact('single_post_data'));
    }

}
