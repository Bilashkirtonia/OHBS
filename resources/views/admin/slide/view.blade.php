@extends('admin.layouts.app')

@section('heading', 'Add Slide')

@section('right-top-botton')
    <a href="{{ route('admin.slide.add') }}" class="btn btn-primary"><i class="fa fa-pius"></i> Add New</a>
@endsection

@section('content')
 <div class="section-body">
    <div class="row">
        <div class="col-12">
            <div class="card">
                @if ($slides->count() >= 1)
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="example1">
                            <thead>
                                <tr>
                                    <th>SL</th>
                                    <th>Photo</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($slides as $row)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>
                                        <img src="{{ asset('uploads/slider/'.$row->photo) }}" alt="" class="w_200">
                                    </td>
                                    <td class="pt_10 pb_10">
                                        <a href="{{ route('admin.slide.edit',$row->id) }}" class="btn btn-primary">Edit</a>
                                        <a href="{{ route('admin.slide.delete',$row->id) }}" class="btn btn-danger" onClick="return confirm('Are you sure?');">Delete</a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                @else
                <h4>Data not found</h4>
                @endif
            </div>
        </div>
    </div>
</div>
 @endsection
