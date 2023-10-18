<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Brand;
use Illuminate\Support\Facades\DB;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
       $brands = Brand::latest()->get();
        return view('backend.brand.brand_all', compact('brands'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('backend.brand.brand_add');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
       $brand = new Brand();
       $brand->brand_name = $request->brand_name;
       $brand->brand_slug = strtolower(str_replace(' ','-',$request->brand_name));
       
       if($image=$request->file('brand_image')){
        $customImageName = uniqid().'.'.$image->getClientOriginalExtension();
        // @unlink(public_path('backend/upload/brand/'.$adminUser->photo));
        $image->move(public_path('backend/upload/brand/'),$customImageName);
      }

       $brand->brand_image = $customImageName;

       $brand->save();

       $notification = array(
        'message' => "brand Added Successfully",
        'alert-type' => "success",
    );

    return redirect()->route('brand.all')->with($notification);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $brands = DB::table('brands')->find($id);
        return view('backend.brand.brand_update',compact('brands'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        
        //  $categories = Category::find($id);
       
        if ($image = $request->file('brand_image')) {
            $customImageName = uniqid() . '.' . $image->getClientOriginalExtension();
            @unlink(public_path('backend/upload/brand/'.Brand::find($id)->brand_image));
            $image->move(public_path('backend/upload/brand/'), $customImageName);
        }else{
            $customImageName = Brand::find($id)->brand_image;
        }

        // Query builder or DB builder
        DB::table('brands')->where('id',$id)->update([
            "brand_name" => $request->brand_name,
            "brand_slug" => strtolower(str_replace(' ', '-', $request->brand_name)),
            "brand_image" => $customImageName
        ]);

        $notification = array(
            'message' => "brand Updated Successfully",
            'alert-type' => "success",
        );

        return redirect()->route('brand.all')->with($notification);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // $brands = Brand::find($id);

        // ei part ta age hobe,tanahole id pabenna
        @unlink(public_path('backend/upload/brand/'.Brand::find($id)->brand_image));

        // Query builder or DB builder
        DB::table('brands')->where('id',$id)->delete();
       
        $notification = array(
            'message' => "Brand Delete Successfully",
            'alert-type' => "warning"
        );

        return redirect()->route('brand.all')->with($notification);
    }
}
