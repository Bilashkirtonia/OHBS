<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Testimonial;

class AdminTestimonialController extends Controller
{
    public function index()
    {
        $data['testimonials'] = Testimonial::latest()->get();
        return view('admin.testimonial.view', $data);
    }

    public function add()
    {
        return view('admin.testimonial.add');
    }

    public function store(Request $request)
    {
        $request->validate([
            'photo' => 'required|image|mimes:jpg,jpeg,png,gif',
            'name' => 'required',
            'designation' => 'required',
            'comment' => 'required'
        ]);

        $ext = $request->file('photo')->extension();
        $final_name = time().'.'.$ext;
        $request->file('photo')->move(public_path('uploads/testimonial/'),$final_name);

        Testimonial::insert([
            'photo' => $final_name,
            'name' => $request->name,
            'designation' => $request->designation,
            'comment' => $request->comment,
        ]);

        return redirect()->back()->with('success', 'Testimonial is added successfully.');

    }


    public function edit($id)
    {
        $data['testimonial_data'] = Testimonial::where('id',$id)->first();
        return view('admin.testimonial.edit', $data);
    }

    public function update(Request $request,$id)
    {

        $obj = Testimonial::where('id',$id)->first();

        if($request->hasFile('photo')) {
            $request->validate([
                'photo' => 'image|mimes:jpg,jpeg,png,gif'
            ]);
            unlink(public_path('uploads/testimonial/'.$obj->photo));
            $ext = $request->file('photo')->extension();
            $final_name = time().'.'.$ext;
            $request->file('photo')->move(public_path('uploads/testimonial/'),$final_name);
            Testimonial::findOrFail($id)->update([
                'photo' => $final_name,
            ]);
        }

        Testimonial::findOrFail($id)->update([
            'name' => $request->name,
            'designation' => $request->designation,
            'comment' => $request->comment,
        ]);

        return redirect()->back()->with('success', 'Testimonial is updated successfully.');
    }

    public function delete($id)
    {
        $single_data = Testimonial::where('id',$id)->first();
        unlink(public_path('uploads/testimonial/'.$single_data->photo));
        $single_data->delete();

        return redirect()->back()->with('success', 'Testimonial is deleted successfully.');
    }
}
