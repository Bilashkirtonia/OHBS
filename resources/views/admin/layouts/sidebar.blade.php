<div class="main-sidebar">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            <a href="{{ route('dashboard') }}">Admin Panel</a>
        </div>
        <div class="sidebar-brand sidebar-brand-sm">
            <a href="index.html"></a>
        </div>

        <ul class="sidebar-menu">

            <li class="active"><a class="nav-link" href="index.html"><i class="fas fa-hand-point-right"></i> <span>Dashboard</span></a></li>

            <li class="nav-item dropdown {{ Request::is('admin/slide/add')||Request::is('admin/slide/view') ?'active':'' }}">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-hand-point-right"></i><span>Slide</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ Request::is('/admin/slide/add')?'active':'' }}">
                        <a class="nav-link" href="{{ route('admin.slide.add') }}">
                            <i class="fas fa-angle-right"></i>
                            Add
                        </a>
                    </li>

                    <li class="{{ Request::is('/admin/slide/view') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.slide.view') }}"><i class="fas fa-angle-right"></i> View</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown {{ Request::is('admin/photo/add')||Request::is('admin/photo/view') ?'active':'' }}">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-hand-point-right"></i><span>Photo</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ Request::is('admin/photo/add') ?'active':'' }}"><a class="nav-link" href="{{ route('admin.photo.add') }}"><i class="fas fa-angle-right"></i>Add</a></li>
                    <li class="{{ Request::is('admin/photo/view') ?'active':'' }}"><a class="nav-link" href="{{ route('admin.photo.view') }}"><i class="fas fa-angle-right"></i> View</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown {{ Request::is('admin/feature/add')||Request::is('admin/feature/view')?'active':'' }}">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-hand-point-right"></i><span>Feature</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ Request::is('admin/feature/add')?'active':'' }}"><a class="nav-link" href="{{ route('admin.feature.add') }}"><i class="fas fa-angle-right"></i>Add</a></li>
                    <li class="{{ Request::is('admin/feature/view')?'active':'' }}"><a class="nav-link" href="{{ route('admin.feature.view') }}"><i class="fas fa-angle-right"></i> View</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown ">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-hand-point-right"></i><span>Page</span></a>
                <ul class="dropdown-menu">
                    <li class="active"><a class="nav-link" href="{{ route('admin.page.about') }}"><i class="fas fa-angle-right"></i>About</a></li>
                    <li class=""><a class="nav-link" href="{{ route('admin.page.terms') }}"><i class="fas fa-angle-right"></i> Terms</a></li>
                    <li class="active"><a class="nav-link" href="{{ route('admin.page.privacy') }}"><i class="fas fa-angle-right"></i>Privacy</a></li>
                    <li class=""><a class="nav-link" href="{{ route('admin.page.contact') }}"><i class="fas fa-angle-right"></i>Contact</a></li>
                    <li class=""><a class="nav-link" href="{{ route('admin.page.photo.gallery') }}"><i class="fas fa-angle-right"></i>Photo Gallery</a></li>
                    <li class="active"><a class="nav-link" href="{{ route('admin.page.video.gallery') }}"><i class="fas fa-angle-right"></i>Video Gallery</a></li>
                    <li class=""><a class="nav-link" href="{{ route('admin.page.faq') }}"><i class="fas fa-angle-right"></i>Faq</a></li>


                    <li class="active"><a class="nav-link" href="{{ route('admin.page.blog') }}"><i class="fas fa-angle-right"></i>Blog</a></li>
                    <li class=""><a class="nav-link" href="{{ route('admin.page.room') }}"><i class="fas fa-angle-right"></i>Room</a></li>
                    <li class="active"><a class="nav-link" href="{{ route('admin.page.cart') }}"><i class="fas fa-angle-right"></i>Cart</a></li>
                    <li class=""><a class="nav-link" href="{{ route('admin.page.checkout') }}"><i class="fas fa-angle-right"></i>checkout</a></li>
                    <li class=""><a class="nav-link" href="{{ route('admin.page.payment') }}"><i class="fas fa-angle-right"></i>Payment</a></li>
                    <li class="active"><a class="nav-link" href="{{ route('admin.page.signup') }}"><i class="fas fa-angle-right"></i>Signup</a></li>
                    <li class=""><a class="nav-link" href="{{ route('admin.page.signin') }}"><i class="fas fa-angle-right"></i>Signin</a></li>
                    <li class="active"><a class="nav-link" href="{{ route('admin.page.forget.password') }}"><i class="fas fa-angle-right"></i>Forget password</a></li>
                    <li class=""><a class="nav-link" href="{{ route('admin.page.reset.password') }}"><i class="fas fa-angle-right"></i>Reset password</a></li>

                </ul>
            </li>

            <li class="nav-item dropdown {{ Request::is('admin/testimonial/add')||Request::is('admin/testimonial/view')?'active':'' }}">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-hand-point-right"></i><span>Testimonial</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ Request::is('admin/testimonial/add')?'active':'' }}"><a class="nav-link" href="{{ route('admin.testimonial.add') }}"><i class="fas fa-angle-right"></i>Add</a></li>
                    <li class="{{ Request::is('admin/testimonial/view')?'active':'' }}"><a class="nav-link" href="{{ route('admin.testimonial.view') }}"><i class="fas fa-angle-right"></i> View</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown {{ Request::is('admin/post/add')||Request::is('admin/post/view')?'active':'' }}">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-hand-point-right"></i><span>Post</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ Request::is('admin/post/add')?'active':'' }}"><a class="nav-link" href="{{ route('admin.post.add') }}"><i class="fas fa-angle-right"></i>Add</a></li>
                    <li class="{{ Request::is('admin/post/view')?'active':'' }}"><a class="nav-link" href="{{ route('admin.post.view') }}"><i class="fas fa-angle-right"></i> View</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown {{ Request::is('admin/video/add')||Request::is('admin/video/view')?'active':'' }}">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-hand-point-right"></i><span>Video</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ Request::is('admin/video/add')?'active':'' }}"><a class="nav-link" href="{{ route('admin.video.add') }}"><i class="fas fa-angle-right"></i>Add</a></li>
                    <li class="{{ Request::is('admin/video/view')?'active':'' }}"><a class="nav-link" href="{{ route('admin.video.view') }}"><i class="fas fa-angle-right"></i> View</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown {{ Request::is('admin/faq/add')||Request::is('admin/faq/view')?'active':'' }}">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-hand-point-right"></i><span>FAQ</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ Request::is('admin/faq/add')?'active':'' }}"><a class="nav-link" href="{{ route('admin.faq.add') }}"><i class="fas fa-angle-right"></i>Add</a></li>
                    <li class="Request::is('admin/faq/view')?'active':'' }}"><a class="nav-link" href="{{ route('admin.faq.view') }}"><i class="fas fa-angle-right"></i> View</a></li>
                </ul>
            </li>


            <li class="nav-item dropdown {{ Request::is('admin/amenity/add')||Request::is('admin/amenity/view')?'active':'' }}">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-hand-point-right"></i><span>Amenity</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ Request::is('admin/amenity/add')?'active':'' }}"><a class="nav-link" href="{{ route('admin.amenity.add') }}"><i class="fas fa-angle-right"></i>Add</a></li>
                    <li class="{{ Request::is('admin/amenity/view')?'active':'' }}"><a class="nav-link" href="{{ route('admin.amenity.view') }}"><i class="fas fa-angle-right"></i> View</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown {{ Request::is('admin/subscriber/show')||Request::is('admin/subscriber/email')?'active':'' }}" >
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-hand-point-right"></i><span>Subscribe</span></a>
                <ul class="dropdown-menu">

                    <li class="{{ Request::is('admin/subscriber/show')?'active':'' }}">
                        <a class="nav-link" href="{{ route('admin.subscriber.show') }}"><i class="fas fa-angle-right"></i> View</a>
                    </li>

                    <li class="{{ Request::is('admin/subscriber/email') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin.subscriber.send.email') }}"><i class="fas fa-angle-right"></i> Send email</a>
                    </li>
                </ul>
            </li>


            <li class="nav-item dropdown {{ Request::is('admin/room/add')||Request::is('admin/room/view')?'active':'' }}" >
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-hand-point-right"></i><span>Room</span></a>
                <ul class="dropdown-menu">

                    <li class="{{ Request::is('admin/room/view')?'active':'' }}">
                        <a class="nav-link" href="{{ route('admin.room.view') }}"><i class="fas fa-angle-right"></i> View</a>
                    </li>

                    <li class="{{ Request::is('admin/room/add') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin.room.add') }}"><i class="fas fa-angle-right"></i>Add</a>
                    </li>
                </ul>
            </li>

            <li class="nav-item dropdown {{ Request::is('admin/order/view')||Request::is('admin/room/view')?'active':'' }}" >
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-hand-point-right"></i><span>Order</span></a>
                <ul class="dropdown-menu">

                    <li class="{{ Request::is('admin/room/view')?'active':'' }}">
                        <a class="nav-link" href="{{ route('admin_customer') }}"><i class="fas fa-angle-right"></i> Customer</a>
                    </li>

                    <li class="{{ Request::is('admin/room/add') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin_orders') }}"><i class="fas fa-angle-right"></i>Order</a>
                    </li>
                </ul>
            </li>

            <li class="{{ Request::is('admin/datewise-rooms') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin_datewise_rooms') }}"><i class="fa fa-calendar"></i> <span>Datewise Rooms</span></a></li>














            <li class=""><a class="nav-link" href="{{ route('admin_setting') }}"><i class="fas fa-hand-point-right"></i> <span>Setting</span></a></li>

            <li class=""><a class="nav-link" href="form.html"><i class="fas fa-hand-point-right"></i> <span>Form</span></a></li>

            <li class=""><a class="nav-link" href="table.html"><i class="fas fa-hand-point-right"></i> <span>Table</span></a></li>

            <li class=""><a class="nav-link" href="invoice.html"><i class="fas fa-hand-point-right"></i> <span>Invoice</span></a></li>

        </ul>
    </aside>
</div>
