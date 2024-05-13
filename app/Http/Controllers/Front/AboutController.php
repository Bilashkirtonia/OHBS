<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Page;

class AboutController extends Controller
{
    public function index()
    {
        $data['about_data'] = Page::latest()->where('id',1)->first();
        return view('front.about',$data);
    }
}
