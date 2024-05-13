<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Slide;

// use Intervention\Image\ImageManager;
// use Intervention\Image\Drivers\Imagick\Driver;


class AdminSlideController extends Controller
{
    public function index()
    {
        $data['slides'] = Slide::latest()->get();
        return view('admin.slide.view',$data);
    }

    public function add()
    {
        return view('admin.slide.add');
    }

    public function store(Request $request)
    {
        $request->validate([
            'photo' => 'required|image|mimes:jpg,jpeg,png,gif|max:2048'
        ]);

        $ext = $request->file('photo')->extension();
        $final_name = time().'.'.$ext;
        $request->file('photo')->move(public_path('uploads/slider'),$final_name);


        Slide::insert([
            'photo' => $final_name,
            'heading' => $request->heading,
            'text' => $request->text,
            'button_text' => $request->button_text,
            'button_url' => $request->button_url,
        ]);


        return redirect()->back()->with('success', 'Slide is added successfully.');

    }

    public function edit($id)
    {
        $data['slide_data'] = Slide::where('id',$id)->first();
        return view('admin.slide.edit',$data);
    }

    public function update(Request $request,$id)
    {

        $obj = Slide::where('id',$id)->first();
        if($request->hasFile('photo')) {
            $request->validate([
                'photo' => 'image|mimes:jpg,jpeg,png,gif'
            ]);
            unlink(public_path('uploads/slider/'.$obj->photo));
            $ext = $request->file('photo')->extension();
            $final_name = time().'.'.$ext;
            $request->file('photo')->move(public_path('uploads/slider'),$final_name);

        }

        Slide::findOrFail($obj->id)->update([
            'photo' => $final_name,
            'heading' => $request->heading,
            'text' => $request->text,
            'button_text' => $request->button_text,
            'button_url' => $request->button_url,
        ]);

        return redirect()->route('admin.slide.view')->with('success', 'Slide is updated successfully.');
    }

    public function delete($id)
    {
        $single_data = Slide::where('id',$id)->first();
        unlink(public_path('uploads/slider/'.$single_data->photo));
        $single_data->delete();

        return redirect()->back()->with('success', 'Slide is deleted successfully.');
    }
}
