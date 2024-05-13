<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Page;

class AdminAboutController extends Controller
{
    public function about()
    {
        $data['page_data'] = Page::findOrFail(1)->first();
        return view('admin.page.about', $data);
    }

    public function about_update(Request $request)
    {
        Page::findOrFail(1)->update([
            'about_heading' => $request->about_heading,
            'about_content' => $request->about_content,
            'about_status' => $request->about_status,
        ]);


        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function terms()
    {
        $data['page_data'] = Page::findOrFail(1)->first();
        return view('admin.page.terms', $data);
    }

    public function terms_update(Request $request)
    {
        Page::findOrFail(1)->update([
        'terms_heading' => $request->terms_heading,
        'terms_content' => $request->terms_content,
        'terms_status' => $request->terms_status,
        ]);

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function privacy()
    {
        $data['page_data'] = Page::findOrFail(1)->first();
        return view('admin.page.privacy', $data);
    }

    public function privacy_update(Request $request)
    {
        Page::findOrFail(1)->update([
            'privacy_heading' => $request->privacy_heading,
            'privacy_content' => $request->privacy_content,
            'privacy_status' => $request->privacy_status,
        ]);

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function contact()
    {
        $data['page_data'] = Page::findOrFail(1)->first();
        return view('admin.page.contact', $data);
    }

    public function contact_update(Request $request)
    {
        Page::findOrFail(1)->update([
        'contact_heading' => $request->contact_heading,
        'contact_map' => $request->contact_map,
        'contact_status' => $request->contact_status,
        ]);

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function photo_gallery()
    {
        $data['page_data'] = Page::findOrFail(1)->first();
        return view('admin.page.photo_gallery', $data);
    }

    public function photo_gallery_update(Request $request)
    {
        Page::findOrFail(1)->update([
            'photo_gallery_heading' => $request->photo_gallery_heading,
            'photo_gallery_status' => $request->photo_gallery_status,
        ]);

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function video_gallery()
    {
        $data['page_data'] = Page::findOrFail(1)->first();
        return view('admin.page.video_gallery', $data);
    }

    public function video_gallery_update(Request $request)
    {
         Page::findOrFail(1)->update([
            'video_gallery_heading' => $request->video_gallery_heading,
            'video_gallery_status' => $request->video_gallery_status,
        ]);

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function faq()
    {
        $data['page_data'] = Page::findOrFail(1)->first();
        return view('admin.page.faq', $data);
    }

    public function faq_update(Request $request)
    {
        $obj = Page::findOrFail(1)->update([
            'faq_heading' => $request->faq_heading,
            'faq_status' => $request->faq_status,
        ]);

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function blog()
    {
        $data['page_data'] = Page::findOrFail(1)->first();
        return view('admin.page.blog', $data);
    }

    public function blog_update(Request $request)
    {
        $obj = Page::findOrFail(1)->update([
            'blog_heading' => $request->blog_heading,
            'blog_status' => $request->blog_status,
        ]);

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }


    public function room()
    {
        $data['page_data'] = Page::findOrFail(1)->first();
        return view('admin.page.room', $data);
    }

    public function room_update(Request $request)
    {
        $obj = Page::findOrFail(1)->first();
        $obj->room_heading = $request->room_heading;
        $obj->update();

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function cart()
    {
        $data['page_data'] = Page::findOrFail(1)->first();
        return view('admin.page.cart', $data);
    }

    public function cart_update(Request $request)
    {
        $obj = Page::findOrFail(1)->first();
        $obj->cart_heading = $request->cart_heading;
        $obj->cart_status = $request->cart_status;
        $obj->update();

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function checkout()
    {
        $page_data = Page::findOrFail(1)->first();
        return view('admin.page.checkout', compact('page_data'));
    }

    public function checkout_update(Request $request)
    {
        $obj = Page::findOrFail(1)->first();
        $obj->checkout_heading = $request->checkout_heading;
        $obj->checkout_status = $request->checkout_status;
        $obj->update();

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function payment()
    {
        $page_data = Page::findOrFail(1)->first();
        return view('admin.page.payment', compact('page_data'));
    }

    public function payment_update(Request $request)
    {
        $obj = Page::findOrFail(1)->first();
        $obj->payment_heading = $request->payment_heading;
        $obj->update();

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function signup()
    {
        $page_data = Page::findOrFail(1)->first();
        return view('admin.page.signup', compact('page_data'));
    }

    public function signup_update(Request $request)
    {
        $obj = Page::findOrFail(1)->first();
        $obj->signup_heading = $request->signup_heading;
        $obj->signup_status = $request->signup_status;
        $obj->update();

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function signin()
    {
        $page_data = Page::findOrFail(1)->first();
        return view('admin.page.signin', compact('page_data'));
    }

    public function signin_update(Request $request)
    {
        $obj = Page::findOrFail(1)->first();
        $obj->signin_heading = $request->signin_heading;
        $obj->signin_status = $request->signin_status;
        $obj->update();

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function forget_password()
    {
        $page_data = Page::findOrFail(1)->first();
        return view('admin.page.forget_password', compact('page_data'));
    }

    public function forget_password_update(Request $request)
    {
        $obj = Page::findOrFail(1)->first();
        $obj->forget_password_heading = $request->forget_password_heading;
        $obj->update();

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }

    public function reset_password()
    {
        $page_data = Page::findOrFail(1)->first();
        return view('admin.page.reset_password', compact('page_data'));
    }

    public function reset_password_update(Request $request)
    {
        $obj = Page::findOrFail(1)->first();
        $obj->reset_password_heading = $request->reset_password_heading;
        $obj->update();

        return redirect()->back()->with('success', 'Data is updated successfully.');
    }
}
