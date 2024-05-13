<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Photo;

class AdminPhotoController extends Controller
{
    public function index()
    {
        $data['photos'] = Photo::latest()->get();
        return view('admin.photo.view',$data);
    }

    public function add()
    {
        return view('admin.photo.add');
    }

    public function store(Request $request)
    {
        $request->validate([
            'photo' => 'required|image|mimes:jpg,jpeg,png,gif'
        ]);

        $ext = $request->file('photo')->extension();
        $final_name = time().'.'.$ext;
        $request->file('photo')->move(public_path('uploads/photo/'),$final_name);

        Photo::insert([
            'photo' => $final_name,
            'caption' => $request->caption,
        ]);

        return redirect()->back()->with('success', 'Photo is added successfully.');

    }


    public function edit($id)
    {
        $data['photo_data'] = Photo::where('id',$id)->first();
        return view('admin.photo.edit',$data);
    }

    public function update(Request $request,$id)
    {
        $obj = Photo::where('id',$id)->first();

        if($request->hasFile('photo')) {
            $request->validate([
                'photo' => 'image|mimes:jpg,jpeg,png,gif'
            ]);
            unlink(public_path('uploads/photo/'.$obj->photo));
            $ext = $request->file('photo')->extension();
            $final_name = time().'.'.$ext;
            $request->file('photo')->move(public_path('uploads/photo/'),$final_name);
            Photo::findOrFail($obj->id)->update([
                'photo' => $final_name,
            ]);
        }

        Photo::findOrFail($obj->id)->update([
            'caption' => $request->caption,
        ]);
        return redirect()->back()->with('success', 'Photo is updated successfully.');
    }

    public function delete($id)
    {
        $single_data = Photo::where('id',$id)->first();
        unlink(public_path('uploads/photo/'.$single_data->photo));
        $single_data->delete();

        return redirect()->back()->with('success', 'Photo is deleted successfully.');
    }
}
