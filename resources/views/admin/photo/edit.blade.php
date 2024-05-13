@extends('admin.layouts.app')

@section('heading', 'Edit Photo')

@section('right-top-botton')
<a href="{{ route('admin.photo.view') }}" class="btn btn-primary"><i class="fa fa-eye"></i> View All</a>
@endsection


@section('content')
<div class="section-body">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin.photo.update',$photo_data->id) }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-4">
                                    <div class="row">
                                        <div class="col-6">
                                            <label class="form-label">Photo *</label>
                                            <div>
                                                <input type="file"  accept="image/*" name="photo" id="file"  onchange="loadFile(event)" >
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="float-end">
                                                <img id="show_image" style="width: 120px; height:100px" class="img img-fluid " src="{{ asset('uploads/photo/'.$photo_data->photo) }}">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Caption</label>
                                    <input type="text" class="form-control" name="caption" value="{{ $photo_data->caption }}">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label"></label>
                                    <button type="submit" class="btn btn-primary">Update</button>
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
