<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Amenity;

class AdminAmenityController extends Controller
{
    public function index()
    {
        $data['amenities'] = Amenity::latest()->get();
        return view('admin.amenity.view', $data);
    }

    public function add()
    {
        return view('admin.amenity.add');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required'
        ]);

        Amenity::insert([
            'name' => $request->name,
        ]);

        return redirect()->back()->with('success', 'Amenity is added successfully.');

    }


    public function edit($id)
    {
        $data['amenity_data'] = Amenity::where('id',$id)->first();
        return view('admin.amenity.edit', $data);
    }

    public function update(Request $request,$id)
    {
        $obj = Amenity::findOrfail($id)->update([
            'name' => $request->name,
        ]);

        return redirect()->back()->with('success', 'Amenity is updated successfully.');
    }

    public function delete($id)
    {
        $single_data = Amenity::findOrfail($id)->first();
        dd($single_data);
        return redirect()->back()->with('success', 'Amenity is deleted successfully.');
    }
}
