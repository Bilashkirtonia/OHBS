<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Faq;

class AdminFaqController extends Controller
{
    public function index()
    {
        $data['faqs'] = Faq::latest()->get();
        return view('admin.faq.view', $data);
    }

    public function add()
    {
        return view('admin.faq.add');
    }

    public function store(Request $request)
    {
        $request->validate([
            'question' => 'required',
            'answer' => 'required'
        ]);

        Faq::insert([
            'question' => $request->question,
            'answer' => $request->answer,
        ]);

        return redirect()->back()->with('success', 'FAQ is added successfully.');

    }


    public function edit($id)
    {
        $data['faq_data'] = Faq::where('id',$id)->first();
        return view('admin.faq.edit', $data);
    }

    public function update(Request $request,$id)
    {
        $obj = Faq::findOrfail($id)->update([
            'question' => $request->question,
            'answer' => $request->answer,
        ]);

        return redirect()->back()->with('success', 'FAQ is updated successfully.');
    }

    public function delete($id)
    {
        $single_data = Faq::findOrfail($id)->first();
        $single_data->delete();

        return redirect()->back()->with('success', 'FAQ is deleted successfully.');
    }
}
