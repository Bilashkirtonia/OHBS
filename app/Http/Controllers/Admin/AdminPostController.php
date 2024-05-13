<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;

class AdminPostController extends Controller
{
    public function index()
    {
        $data['posts'] = Post::latest()->get();
        return view('admin.post.view',$data);
    }

    public function add()
    {
        return view('admin.post.add');
    }

    public function store(Request $request)
    {
        $request->validate([
            'photo' => 'required|image|mimes:jpg,jpeg,png,gif',
            'heading' => 'required',
            'short_content' => 'required',
            'content' => 'required'
        ]);

        $ext = $request->file('photo')->extension();
        $final_name = time().'.'.$ext;
        $request->file('photo')->move(public_path('uploads/post/'),$final_name);

        $obj = new Post();
        Post::insert([
            'photo' => $final_name,
            'heading' => $request->heading,
            'short_content' => $request->short_content,
            'content' => $request->content,
            'total_view' => 1,
        ]);

        return redirect()->back()->with('success', 'Post is added successfully.');

    }

    public function edit($id)
    {
        $data['post_data'] = Post::where('id',$id)->first();
        return view('admin.post.edit', $data);
    }

    public function update(Request $request,$id)
    {
        $obj = Post::where('id',$id)->first();

        if($request->hasFile('photo')) {
            $request->validate([
                'photo' => 'image|mimes:jpg,jpeg,png,gif'
            ]);
            unlink(public_path('uploads/post/'.$obj->photo));
            $ext = $request->file('photo')->extension();
            $final_name = time().'.'.$ext;
            $request->file('photo')->move(public_path('uploads/post/'),$final_name);
            
        }

        Post::findOrfail($id)->update([
            'photo' => $final_name,
            'heading' => $request->heading,
            'short_content' => $request->short_content,
            'content' => $request->content,
        ]);

        return redirect()->back()->with('success', 'Post is updated successfully.');
    }

    public function delete($id)
    {
        $single_data = Post::where('id',$id)->first();
        unlink(public_path('uploads/post/'.$single_data->photo));
        $single_data->delete();

        return redirect()->back()->with('success', 'Post is deleted successfully.');
    }
}
