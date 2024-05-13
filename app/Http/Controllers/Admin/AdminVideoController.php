<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Video;

class AdminVideoController extends Controller
{
    public function index()
    {
        $data['videos'] = Video::latest()->get();
        return view('admin.video.view', $data);
    }

    public function add()
    {
        return view('admin.video.add');
    }

    public function store(Request $request)
    {
        $request->validate([
            'video_id' => 'required'
        ]);

        Video::insert([
            'video_id' => $request->video_id,
            'caption' => $request->caption,
        ]);


        return redirect()->back()->with('success', 'Video is added successfully.');

    }


    public function edit($id)
    {
        $data['video_data'] = Video::where('id',$id)->first();
        return view('admin.video.edit', $data);
    }

    public function update(Request $request,$id)
    {
        $obj = Video::findOrfail($id)->update([
            'video_id' => $request->video_id,
            'caption' => $request->caption,
        ]);

        return redirect()->back()->with('success', 'Video is updated successfully.');
    }

    public function delete($id)
    {
        $single_data = Video::findOrfail($id)->first();
        $single_data->delete();

        return redirect()->back()->with('success', 'Video is deleted successfully.');
    }
}
