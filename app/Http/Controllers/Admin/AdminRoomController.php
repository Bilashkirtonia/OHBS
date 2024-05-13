<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Amenity;
use App\Models\Room;
use App\Models\RoomPhoto;

class AdminRoomController extends Controller
{
    public function index()
    {
        $data['rooms'] = Room::get();
        return view('admin.room.view', $data);
    }

    public function add()
    {
        $data['all_amenities'] = Amenity::get();
        return view('admin.room.add',$data);
    }

    public function store(Request $request)
    {
        $amenities = '';
        $i=0;
        if(isset($request->arr_amenities)) {
            foreach($request->arr_amenities as $item) {
                if($i==0) {
                    $amenities .= $item;
                } else {
                    $amenities .= ','.$item;
                }
                $i++;
            }
        }

        $request->validate([
            'featured_photo' => 'required|image|mimes:jpg,jpeg,png,gif',
            'name' => 'required',
            'description' => 'required',
            'price' => 'required',
            'total_rooms' => 'required'
        ]);

        $ext = $request->file('featured_photo')->extension();
        $final_name = time().'.'.$ext;
        $request->file('featured_photo')->move(public_path('uploads/featured_photo/'),$final_name);

        Room::insert([
            'featured_photo' => $final_name,
            'name' => $request->name,
            'description' => $request->description,
            'price' => $request->price,
            'total_rooms' => $request->total_rooms,
            'amenities' => $amenities,
            'size' => $request->size,
            'total_beds' => $request->total_beds,
            'total_bathrooms' => $request->total_bathrooms,
            'total_balconies' => $request->total_balconies,
            'total_guests' => $request->total_guests,
            'video_id' => $request->video_id,
        ]);

        return redirect()->back()->with('success', 'Room is added successfully.');

    }

    public function edit($id)
    {
        $all_amenities = Amenity::get();
        $room_data = Room::where('id',$id)->first();

        $existing_amenities = array();
        if($room_data->amenities != '') {
            $existing_amenities = explode(',',$room_data->amenities);
        }
        return view('admin.room.edit', compact('room_data','all_amenities','existing_amenities'));
    }

    public function update(Request $request,$id)
    {
        $obj = Room::where('id',$id)->first();

        $amenities = '';
        $i=0;
        if(isset($request->arr_amenities)) {
            foreach($request->arr_amenities as $item) {
                if($i==0) {
                    $amenities .= $item;
                } else {
                    $amenities .= ','.$item;
                }
                $i++;
            }
        }

        $request->validate([
            'name' => 'required',
            'description' => 'required',
            'price' => 'required',
            'total_rooms' => 'required'
        ]);

        if($request->hasFile('featured_photo')) {
            $request->validate([
                'featured_photo' => 'image|mimes:jpg,jpeg,png,gif'
            ]);
            unlink(public_path('uploads/featured_photo/'.$obj->featured_photo));
            $ext = $request->file('featured_photo')->extension();
            $final_name = time().'.'.$ext;
            $request->file('featured_photo')->move(public_path('uploads/featured_photo/'),$final_name);
            Room::findOrFail($id)->update([
                'featured_photo' => $final_name,
            ]);

        }

        Room::findOrFail($id)->update([
            'name' => $request->name,
            'description' => $request->description,
            'price' => $request->price,
            'total_rooms' => $request->total_rooms,
            'amenities' => $amenities,
            'size' => $request->size,
            'total_beds' => $request->total_beds,
            'total_bathrooms' => $request->total_bathrooms,
            'total_balconies' => $request->total_balconies,
            'total_guests' => $request->total_guests,
            'video_id' => $request->video_id,
        ]);

        return redirect()->back()->with('success', 'Room is updated successfully.');
    }

    public function delete($id)
    {
        $single_data = Room::findOrFail($id)->first();
        unlink(public_path('uploads/featured_photo/'.$single_data->featured_photo));
        $single_data->delete();

        $room_photo_data = RoomPhoto::where('room_id',$id)->get();
        foreach($room_photo_data as $item) {
            unlink(public_path('uploads/roomgallery/'.$item->photo));
            $item->delete();
        }

        return redirect()->back()->with('success', 'Room is deleted successfully.');
    }

    public function gallery($id)
    {
        $room_data = Room::where('id',$id)->first();
        $room_photos = RoomPhoto::where('room_id',$id)->get();
        return view('admin.room.gallery', compact('room_data','room_photos'));
    }

    public function gallery_store(Request $request,$id)
    {
        $request->validate([
            'photo' => 'required|image|mimes:jpg,jpeg,png,gif'
        ]);

        $ext = $request->file('photo')->extension();
        $final_name = time().'.'.$ext;
        $request->file('photo')->move(public_path('uploads/roomgallery/'),$final_name);

            RoomPhoto::insert([
                'photo' => $final_name,
                'room_id' => $id,
            ]);


        return redirect()->back()->with('success', 'Photo is added successfully.');
    }

    public function gallery_delete($id)
    {
        $single_data = RoomPhoto::where('id',$id)->first();
        unlink(public_path('uploads/roomgallery/'.$single_data->photo));
        $single_data->delete();

        return redirect()->back()->with('success', 'Photo is deleted successfully.');
    }
}
