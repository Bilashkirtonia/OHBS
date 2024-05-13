@extends('admin.layouts.app')

@section('heading', 'Add Slide')

@section('right-top-botton')
    <a href="{{ route('admin.slide.view') }}" class="btn btn-primary"><i class="fa fa-eye"></i> View All</a>
@endsection

@section('content')
 <div class="section-body">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin.slide.store') }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-4">
                                    <div class="row">
                                        <div class="col-6">
                                            <label class="form-label">Photo *</label>
                                            <div>
                                                {{-- <input id="image" type="file" name="photo"> --}}
                                                <input type="file"  accept="image/*" name="photo" id="file"  onchange="loadFile(event)" >
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="float-end">
                                                <img id="show_image" style="width: 120px; height:100px" class="img img-fluid " src="{{ asset('defaultImage/image.jpg') }}">
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Heading</label>
                                    <input type="text" class="form-control" name="heading" value="{{ old('heading') }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Text</label>
                                    <textarea name="text" class="form-control h_100" cols="30" rows="10">{{ old('text') }}</textarea>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Button Text</label>
                                    <input type="text" class="form-control" name="button_text" value="{{ old('button_text') }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Button URL</label>
                                    <input type="text" class="form-control" name="button_url" value="{{ old('button_url') }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label"></label>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

 @endsection
