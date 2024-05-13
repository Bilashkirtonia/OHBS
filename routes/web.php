<?php

use Illuminate\Support\Facades\Route;




// AdminHomeController


// AdminHomeController
Route::get('/login',[App\Http\Controllers\Admin\AdminLoginController::class,'login'])->name('login');
Route::post('admin/login/submit',[App\Http\Controllers\Admin\AdminLoginController::class,'login_submit'])->name('admin.login.submit');
Route::get('admin/logout',[App\Http\Controllers\Admin\AdminLoginController::class,'login_logout'])->name('admin.logout');

Route::get('admin/forget/password',[App\Http\Controllers\Admin\AdminLoginController::class,'forget.password'])->name('admin.forget.password');
Route::post('admin/forget/password/submit',[App\Http\Controllers\Admin\AdminLoginController::class,'forget.password.submit'])->name('reset.password.submit');
Route::get('/admin/reset/link/{token}/{email}', [App\Http\Controllers\Admin\AdminLoginController::class, 'reset.password'])->name('reset.password');
Route::post('/admin/reset/password/submit', [App\Http\Controllers\Admin\AdminLoginController::class, 'reset.password.submit'])->name('reset.password.submit');


// Front
Route::get('/', [App\Http\Controllers\Front\HomeController::class, 'index'])->name('home');
Route::get('/about', [App\Http\Controllers\Front\AboutController::class, 'index'])->name('about');
Route::group(['middleware' => ['admin:admin']],function(){
    Route::get('/dashboard',[App\Http\Controllers\Admin\AdminHomeController::class,'dashboard'])->name('dashboard');
    Route::get('/edit/profile',[App\Http\Controllers\Admin\AdminProfileController::class,'edit_profile'])->name('edit.profile');
    Route::post('/admin/edit-profile-submit', [App\Http\Controllers\Admin\AdminProfileController::class, 'profile_submit'])->name('admin_profile_submit');
// slide

Route::get('/admin/slide/view', [App\Http\Controllers\Admin\AdminSlideController::class, 'index'])->name('admin.slide.view');
Route::get('/admin/slide/add', [App\Http\Controllers\Admin\AdminSlideController::class, 'add'])->name('admin.slide.add');
Route::post('/admin/slide/store', [App\Http\Controllers\Admin\AdminSlideController::class, 'store'])->name('admin.slide.store');
Route::get('/admin/slide/edit/{id}', [App\Http\Controllers\Admin\AdminSlideController::class, 'edit'])->name('admin.slide.edit');
Route::post('/admin/slide/update/{id}', [App\Http\Controllers\Admin\AdminSlideController::class, 'update'])->name('admin.slide.update');
Route::get('/admin/slide/delete/{id}', [App\Http\Controllers\Admin\AdminSlideController::class, 'delete'])->name('admin.slide.delete');

// Photo

Route::get('/admin/photo/view', [App\Http\Controllers\Admin\AdminPhotoController::class, 'index'])->name('admin.photo.view');
Route::get('/admin/photo/add', [App\Http\Controllers\Admin\AdminPhotoController::class, 'add'])->name('admin.photo.add');
Route::post('/admin/photo/store', [App\Http\Controllers\Admin\AdminPhotoController::class, 'store'])->name('admin.photo.store');
Route::get('/admin/photo/edit/{id}', [App\Http\Controllers\Admin\AdminPhotoController::class, 'edit'])->name('admin.photo.edit');
Route::post('/admin/photo/update/{id}', [App\Http\Controllers\Admin\AdminPhotoController::class, 'update'])->name('admin.photo.update');
Route::get('/admin/photo/delete/{id}', [App\Http\Controllers\Admin\AdminPhotoController::class, 'delete'])->name('admin.photo.delete');

// Feature

Route::get('/admin/feature/view', [App\Http\Controllers\Admin\AdminFeatureController::class, 'index'])->name('admin.feature.view');
Route::get('/admin/feature/add', [App\Http\Controllers\Admin\AdminFeatureController::class, 'add'])->name('admin.feature.add');
Route::post('/admin/feature/store', [App\Http\Controllers\Admin\AdminFeatureController::class, 'store'])->name('admin.feature.store');
Route::get('/admin/feature/edit/{id}', [App\Http\Controllers\Admin\AdminFeatureController::class, 'edit'])->name('admin.feature.edit');
Route::post('/admin/feature/update/{id}', [App\Http\Controllers\Admin\AdminFeatureController::class, 'update'])->name('admin.feature.update');
Route::get('/admin/feature/delete/{id}', [App\Http\Controllers\Admin\AdminFeatureController::class, 'delete'])->name('admin.feature.delete');

//testimonial

Route::get('/admin/testimonial/view', [App\Http\Controllers\Admin\AdminTestimonialController::class, 'index'])->name('admin.testimonial.view');
Route::get('/admin/testimonial/add', [App\Http\Controllers\Admin\AdminTestimonialController::class, 'add'])->name('admin.testimonial.add');
Route::post('/admin/testimonial/store', [App\Http\Controllers\Admin\AdminTestimonialController::class, 'store'])->name('admin.testimonial.store');
Route::get('/admin/testimonial/edit/{id}', [App\Http\Controllers\Admin\AdminTestimonialController::class, 'edit'])->name('admin.testimonial.edit');
Route::post('/admin/testimonial/update/{id}', [App\Http\Controllers\Admin\AdminTestimonialController::class, 'update'])->name('admin.testimonial.update');
Route::get('/admin/testimonial/delete/{id}', [App\Http\Controllers\Admin\AdminTestimonialController::class, 'delete'])->name('admin.testimonial.delete');

// Post

Route::get('/admin/post/view', [App\Http\Controllers\Admin\AdminPostController::class, 'index'])->name('admin.post.view');
Route::get('/admin/post/add', [App\Http\Controllers\Admin\AdminPostController::class, 'add'])->name('admin.post.add');
Route::post('/admin/post/store', [App\Http\Controllers\Admin\AdminPostController::class, 'store'])->name('admin.post.store');
Route::get('/admin/post/edit/{id}', [App\Http\Controllers\Admin\AdminPostController::class, 'edit'])->name('admin.post.edit');
Route::post('/admin/post/update/{id}', [App\Http\Controllers\Admin\AdminPostController::class, 'update'])->name('admin.post.update');
Route::get('/admin/post/delete/{id}', [App\Http\Controllers\Admin\AdminPostController::class, 'delete'])->name('admin.post.delete');

// Video

Route::get('/admin/video/view', [App\Http\Controllers\Admin\AdminVideoController::class, 'index'])->name('admin.video.view');
Route::get('/admin/video/add', [App\Http\Controllers\Admin\AdminVideoController::class, 'add'])->name('admin.video.add');
Route::post('/admin/video/store', [App\Http\Controllers\Admin\AdminVideoController::class, 'store'])->name('admin.video.store');
Route::get('/admin/video/edit/{id}', [App\Http\Controllers\Admin\AdminVideoController::class, 'edit'])->name('admin.video.edit');
Route::post('/admin/video/update/{id}', [App\Http\Controllers\Admin\AdminVideoController::class, 'update'])->name('admin.video.update');
Route::get('/admin/video/delete/{id}', [App\Http\Controllers\Admin\AdminVideoController::class, 'delete'])->name('admin.video.delete');

// Faq

Route::get('/admin/faq/view', [App\Http\Controllers\Admin\AdminFaqController::class, 'index'])->name('admin.faq.view');
Route::get('/admin/faq/add', [App\Http\Controllers\Admin\AdminFaqController::class, 'add'])->name('admin.faq.add');
Route::post('/admin/faq/store', [App\Http\Controllers\Admin\AdminFaqController::class, 'store'])->name('admin.faq.store');
Route::get('/admin/faq/edit/{id}', [App\Http\Controllers\Admin\AdminFaqController::class, 'edit'])->name('admin.faq.edit');
Route::post('/admin/faq/update/{id}', [App\Http\Controllers\Admin\AdminFaqController::class, 'update'])->name('admin.faq.update');
Route::get('/admin/faq/delete/{id}', [App\Http\Controllers\Admin\AdminFaqController::class, 'delete'])->name('admin.faq.delete');


Route::get('/admin/page/about', [App\Http\Controllers\Admin\AdminAboutController::class, 'about'])->name('admin.page.about');
Route::post('/admin/page/about/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'about_update'])->name('admin.page.about.update');

Route::get('/admin/page/terms', [App\Http\Controllers\Admin\AdminAboutController::class, 'terms'])->name('admin.page.terms');
Route::post('/admin/page/terms/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'terms_update'])->name('admin.page.terms.update');

Route::get('/admin/page/privacy', [App\Http\Controllers\Admin\AdminAboutController::class, 'privacy'])->name('admin.page.privacy');
Route::post('/admin/page/privacy/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'privacy_update'])->name('admin.page.privacy.update');

Route::get('/admin/page/contact', [App\Http\Controllers\Admin\AdminAboutController::class, 'contact'])->name('admin.page.contact');
Route::post('/admin/page/contact/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'contact_update'])->name('admin.page.contact.update');

Route::get('/admin/page/photo-gallery', [App\Http\Controllers\Admin\AdminAboutController::class, 'photo_gallery'])->name('admin.page.photo.gallery');
Route::post('/admin/page/photo-gallery/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'photo_gallery_update'])->name('admin.page.photo.gallery.update');

Route::get('/admin/page/video-gallery', [App\Http\Controllers\Admin\AdminAboutController::class, 'video_gallery'])->name('admin.page.video.gallery');
Route::post('/admin/page/video-gallery/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'video_gallery_update'])->name('admin.page.video.gallery.update');

Route::get('/admin/page/faq', [App\Http\Controllers\Admin\AdminAboutController::class, 'faq'])->name('admin.page.faq');
Route::post('/admin/page/faq/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'faq_update'])->name('admin.page.faq.update');

Route::get('/admin/page/blog', [App\Http\Controllers\Admin\AdminAboutController::class, 'blog'])->name('admin.page.blog');
Route::post('/admin/page/blog/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'blog_update'])->name('admin.page.blog.update');

Route::get('/admin/page/room', [App\Http\Controllers\Admin\AdminAboutController::class, 'room'])->name('admin.page.room');
Route::post('/admin/page/room/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'room_update'])->name('admin.page.room.update');

Route::get('/admin/page/cart', [App\Http\Controllers\Admin\AdminAboutController::class, 'cart'])->name('admin.page.cart');
Route::post('/admin/page/cart/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'cart_update'])->name('admin.page.cart.update');

Route::get('/admin/page/checkout', [App\Http\Controllers\Admin\AdminAboutController::class, 'checkout'])->name('admin.page.checkout');
Route::post('/admin/page/checkout/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'checkout_update'])->name('admin.page.checkout.update');

Route::get('/admin/page/payment', [App\Http\Controllers\Admin\AdminAboutController::class, 'payment'])->name('admin.page.payment');
Route::post('/admin/page/payment/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'payment_update'])->name('admin.page.payment.update');

Route::get('/admin/page/signup', [App\Http\Controllers\Admin\AdminAboutController::class, 'signup'])->name('admin.page.signup');
Route::post('/admin/page/signup/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'signup_update'])->name('admin.page.signup.update');

Route::get('/admin/page/signin', [App\Http\Controllers\Admin\AdminAboutController::class, 'signin'])->name('admin.page.signin');
Route::post('/admin/page/signin/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'signin_update'])->name('admin.page.signin.update');

Route::get('/admin/page/forget.password', [App\Http\Controllers\Admin\AdminAboutController::class, 'forget_password'])->name('admin.page.forget.password');
Route::post('/admin/page/forget.password/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'forget_password_update'])->name('admin.page.forget.password.update');

Route::get('/admin/page/reset/password', [App\Http\Controllers\Admin\AdminAboutController::class, 'reset_password'])->name('admin.page.reset.password');
Route::post('/admin/page/reset/password/update', [App\Http\Controllers\Admin\AdminAboutController::class, 'reset_password_update'])->name('admin.page.reset.password.update');

//amenity

Route::get('/admin/amenity/view', [App\Http\Controllers\Admin\AdminAmenityController::class, 'index'])->name('admin.amenity.view');
Route::get('/admin/amenity/add', [App\Http\Controllers\Admin\AdminAmenityController::class, 'add'])->name('admin.amenity.add');
Route::post('/admin/amenity/store', [App\Http\Controllers\Admin\AdminAmenityController::class, 'store'])->name('admin.amenity.store');
Route::get('/admin/amenity/edit/{id}', [App\Http\Controllers\Admin\AdminAmenityController::class, 'edit'])->name('admin.amenity.edit');
Route::post('/admin/amenity/update/{id}', [App\Http\Controllers\Admin\AdminAmenityController::class, 'update'])->name('admin.amenity.update');
Route::get('/admin/amenity/delete/{id}', [App\Http\Controllers\Admin\AdminAmenityController::class, 'delete'])->name('admin.amenity.delete');

//subscriber

Route::get('/admin/subscriber/show', [App\Http\Controllers\Admin\AdminSubscriberController::class, 'show'])->name('admin.subscriber.show');
Route::get('/admin/subscriber/email', [App\Http\Controllers\Admin\AdminSubscriberController::class, 'send_email'])->name('admin.subscriber.send.email');
Route::post('/admin/subscriber/send/email/submit', [App\Http\Controllers\Admin\AdminSubscriberController::class, 'send_email_submit'])->name('admin.subscriber.send.email.submit');

// setting
Route::get('/admin/setting', [App\Http\Controllers\Admin\AdminSettingController::class, 'index'])->name('admin_setting');
Route::post('/admin/setting/update', [App\Http\Controllers\Admin\AdminSettingController::class, 'update'])->name('admin_setting_update');



//room

Route::get('/admin/room/view', [App\Http\Controllers\Admin\AdminRoomController::class, 'index'])->name('admin.room.view');
Route::get('/admin/room/add', [App\Http\Controllers\Admin\AdminRoomController::class, 'add'])->name('admin.room.add');
Route::post('/admin/room/store', [App\Http\Controllers\Admin\AdminRoomController::class, 'store'])->name('admin.room.store');
Route::get('/admin/room/edit/{id}', [App\Http\Controllers\Admin\AdminRoomController::class, 'edit'])->name('admin.room.edit');
Route::post('/admin/room/update/{id}', [App\Http\Controllers\Admin\AdminRoomController::class, 'update'])->name('admin.room.update');
Route::get('/admin/room/delete/{id}', [App\Http\Controllers\Admin\AdminRoomController::class, 'delete'])->name('admin.room.delete');

Route::get('/admin/room/gallery/{id}', [App\Http\Controllers\Admin\AdminRoomController::class, 'gallery'])->name('admin.room.gallery');
Route::post('/admin/room/gallery/store/{id}', [App\Http\Controllers\Admin\AdminRoomController::class, 'gallery_store'])->name('admin.room.gallery.store');
Route::get('/admin/room/gallery/delete/{id}', [App\Http\Controllers\Admin\AdminRoomController::class, 'gallery_delete'])->name('admin.room.gallery.delete');
Route::get('/room/{id}', [App\Http\Controllers\Front\RoomController::class, 'single_room'])->name('room_detail');
Route::get('/room', [App\Http\Controllers\Front\RoomController::class, 'index'])->name('room');

Route::get('/admin/datewise-rooms', [App\Http\Controllers\Admin\AdminDatewiseRoomController::class, 'index'])->name('admin_datewise_rooms');
Route::post('/admin/datewise-rooms/submit', [App\Http\Controllers\Admin\AdminDatewiseRoomController::class, 'show'])->name('admin_datewise_rooms_submit');


});

Route::get('/room/{id}', [App\Http\Controllers\Front\RoomController::class, 'single_room'])->name('room_detail');
Route::get('/room', [App\Http\Controllers\Front\RoomController::class, 'index'])->name('room');
Route::post('/booking/submit', [App\Http\Controllers\Front\BookingController::class, 'cart_submit'])->name('cart_submit');
Route::get('/cart', [App\Http\Controllers\Front\BookingController::class, 'cart_view'])->name('cart');
Route::get('/cart/delete/{id}', [App\Http\Controllers\Front\BookingController::class, 'cart_delete'])->name('cart_delete');
Route::get('/checkout', [App\Http\Controllers\Front\BookingController::class, 'checkout'])->name('checkout');
Route::post('/payment', [App\Http\Controllers\Front\BookingController::class, 'payment'])->name('payment');
Route::post('/payment/method', [App\Http\Controllers\Front\BookingController::class, 'payment_method'])->name('payment.method');



Route::get('/payment/paypal/{price}', [App\Http\Controllers\Front\BookingController::class, 'paypal'])->name('paypal');
Route::post('/payment/stripe/{price}', [App\Http\Controllers\Front\BookingController::class, 'stripe'])->name('stripe');






Route::get('/photo/gallery', [App\Http\Controllers\Front\photoController::class, 'index'])->name('photo.gallery');
Route::get('/video/gallery', [App\Http\Controllers\Front\VideoController::class, 'index'])->name('video.gallery');
Route::get('/blog', [App\Http\Controllers\Front\BlogController::class, 'index'])->name('blog');
Route::get('/post/{id}', [App\Http\Controllers\Front\BlogController::class, 'single_blog'])->name('blogs');
Route::get('/contact', [App\Http\Controllers\Front\ContactController::class, 'index'])->name('contact');
Route::post('/contact/submit',[App\Http\Controllers\Front\ContactController::class,'contact_submit_ajax'])->name('contact.submit.ajax');


Route::get('/terms', [App\Http\Controllers\Front\TermsController::class, 'index'])->name('terms');
Route::get('/privacy', [App\Http\Controllers\Front\PrivacyController::class, 'index'])->name('privacy');
Route::get('/faq', [App\Http\Controllers\Front\FaqController::class, 'index'])->name('faq');

Route::post('/subscribe/submit',[App\Http\Controllers\Front\SubscribeController::class,'subscribe_submit'])->name('subscribe.submit');
Route::get('/subscriber/verify/{email}/{token}',[App\Http\Controllers\Front\SubscribeController::class,'verify'])->name('subscriber.verify');


Route::get('/admin/order/view', [App\Http\Controllers\Admin\AdminOrderController::class, 'index'])->name('admin_orders');
Route::get('/admin/order/invoice/{id}', [App\Http\Controllers\Admin\AdminOrderController::class, 'invoice'])->name('admin_invoice');
Route::get('/admin/order/delete/{id}', [App\Http\Controllers\Admin\AdminOrderController::class, 'delete'])->name('admin_order_delete');

Route::get('/admin/customers', [App\Http\Controllers\Admin\AdminCustomerController::class, 'index'])->name('admin_customer');
Route::get('/admin/customer/change-status/{id}', [App\Http\Controllers\Admin\AdminCustomerController::class, 'change_status'])->name('admin_customer_change_status');




Route::get('/customer/order/view', [App\Http\Controllers\Customer\OrderController::class, 'index'])->name('customer.order.view');
Route::get('/customer/invoice/{id}', [App\Http\Controllers\Customer\OrderController::class, 'invoice'])->name('customer_invoice');















Route::get('/customer/login',[App\Http\Controllers\customer\CustomerAuthController::class,'customer_login'])->name('customer.login');
Route::post('/customer/login/submit',[App\Http\Controllers\customer\CustomerAuthController::class,'login_submit'])->name('customer.login.submit');

Route::get('/customer/signup',[App\Http\Controllers\customer\CustomerAuthController::class,'customer_signup'])->name('customer.signup');

Route::post('/customer/signup/submit',[App\Http\Controllers\customer\CustomerAuthController::class,'customer_signup_submit'])->name('customer.signup.submit');

Route::get('/signup-verify/{email}/{token}', [App\Http\Controllers\customer\CustomerAuthController::class, 'signup_verify'])->name('customer_signup_verify');

Route::group(['middleware' =>['customer:customer']],function(){

    Route::get('/customer/home', [App\Http\Controllers\customer\CustomerHomeController::class, 'index'])->name('customer.home');
    Route::get('/customer/logout', [App\Http\Controllers\customer\CustomerAuthController::class, 'logout'])->name('customer.logout');
    Route::get('/forget-password', [App\Http\Controllers\customer\CustomerAuthController::class, 'forget_password'])->name('customer.forget.password');
    Route::post('/forget-password-submit', [App\Http\Controllers\customer\CustomerAuthController::class, 'forget_password_submit'])->name('customer.forget.password.submit');
    Route::get('/reset-password/{token}/{email}', [App\Http\Controllers\customer\CustomerAuthController::class, 'reset_password'])->name('customer.reset.password');
    Route::post('/reset-password-submit', [App\Http\Controllers\customer\CustomerAuthController::class, 'reset_password_submit'])->name('customer.reset.password.submit');
    Route::get('/customer/edit/profile', [App\Http\Controllers\customer\CustomerProfileController::class, 'index'])->name('customer.profile');
    Route::post('/customer/edit/profile/submit', [App\Http\Controllers\customer\CustomerProfileController::class, 'profile_submit'])->name('customer.profile.submit');


});


