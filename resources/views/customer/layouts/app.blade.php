<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">

    <link rel="icon" type="image/png" href="uploads/favicon.png">

    <title>Customer Panel</title>

    @include('customer.layouts.style')
</head>

<body>
<div id="app">
    <div class="main-wrapper">

        <div class="navbar-bg"></div>
        @include('customer.layouts.nav')



        @include('customer.layouts.sidebar')

        <div class="main-content">
            <section class="section">
                <div class="section-header">
                    <h1> @yield('heading')</h1>

                    <div class="ml-auto">
                        @yield('right-top-botton')
                    </div>

                </div>
                @yield('content')

            </section>
        </div>

    </div>
</div>

@include('customer.layouts.script')
@if($errors->any())
    @foreach($errors->all() as $error)
        <script>
            iziToast.error({
                title: '',
                position: 'topRight',
                message: '{{ $error }}',
            });
        </script>
    @endforeach
@endif

@if(session()->get('error'))
    <script>
        iziToast.error({
            title: '',
            position: 'topRight',
            message: '{{ session()->get('error') }}',
        });
    </script>
@endif

@if(session()->get('success'))
    <script>
        iziToast.success({
            title: '',
            position: 'topRight',
            message: '{{ session()->get('success') }}',
        });
    </script>
@endif
</body>
</html>
