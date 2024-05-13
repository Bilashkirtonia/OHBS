@extends('admin.layouts.app')

@section('heading', 'Add Photo')

@section('right-top-botton')
    <a href="{{ route('admin.photo.view') }}" class="btn btn-primary"><i class="fa fa-eye"></i> View All</a>
@endsection

@section('content')
<div class="section-body">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin.photo.store') }}" method="post" enctype="multipart/form-data">
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
                                    <label class="form-label">Caption</label>
                                    <input type="text" class="form-control" name="caption" value="{{ old('caption') }}">
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
<script>
    var loadFile = function(event) {
        var image = document.getElementById('show_image');
        image.src = URL.createObjectURL(event.target.files[0]);
    };
 </script>

 @endsection
