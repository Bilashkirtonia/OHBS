@extends('admin.layouts.app')

@section('heading', 'Add Testimonial')

@section('right-top-botton')
    <a href="{{ route('admin.testimonial.add') }}" class="btn btn-primary"><i class="fa fa-plus"></i> Add New</a>
@endsection

@section('content')
<div class="section-body">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="example1">
                            <thead>
                                <tr>
                                    <th>SL</th>
                                    <th>Photo</th>
                                    <th>Name</th>
                                    <th>Designation</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($testimonials as $row)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>
                                        <img src="{{ asset('uploads/testimonial/'.$row->photo) }}" alt="" class="w_100">
                                    </td>
                                    <td>{{ $row->name }}</td>
                                    <td>{{ $row->designation }}</td>
                                    <td class="pt_10 pb_10">
                                        <a href="{{ route('admin.testimonial.edit',$row->id) }}" class="btn btn-primary">Edit</a>
                                        <a href="{{ route('admin.testimonial.delete',$row->id) }}" class="btn btn-danger" onClick="return confirm('Are you sure?');">Delete</a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
 @endsection
