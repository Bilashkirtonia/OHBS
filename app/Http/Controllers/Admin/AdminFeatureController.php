<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Feature;

class AdminFeatureController extends Controller
{
    public function index()
    {
        $data['features'] = Feature::latest()->get();
        return view('admin.feature.view',$data);
    }

    public function add()
    {
        return view('admin.feature.add');
    }

    public function store(Request $request)
    {
        $request->validate([
            'icon' => 'required',
            'heading' => 'required'
        ]);

       Feature::insert([
            'icon' => $request->icon,
            'heading' => $request->heading,
            'text' => $request->text,
        ]);
        return redirect()->back()->with('success', 'Feature is added successfully.');

    }


    public function edit($id)
    {
        $data['feature_data'] = Feature::where('id',$id)->first();
        return view('admin.feature.edit', $data);
    }

    public function update(Request $request,$id)
    {
        $request->validate([
            'icon' => 'required',
            'heading' => 'required'
        ]);

        Feature::findOrFail($id)->update([
            'icon' => $request->icon,
            'heading' => $request->heading,
            'text' => $request->text,
        ]);

        return redirect()->back()->with('success', 'Feature is updated successfully.');
    }

    public function delete($id)
    {
        Feature::findOrFail($id)->delete();
        return redirect()->back()->with('success', 'Feature is deleted successfully.');
    }
}
