@extends('front.layouts.app')
@section('main_content')
<div class="page-top">
    <div class="bg"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{{ $about_data->about_heading }}</h2>
            </div>
        </div>
    </div>
</div>
@php
$ff = Str::limit($about_data->about_content , '10','...');
@endphp
<div class="page-content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                {!! $ff !!}
            </div>
        </div>
    </div>
</div>
@endsection
