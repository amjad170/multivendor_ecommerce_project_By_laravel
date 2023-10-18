<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SubCategory;
use Illuminate\Support\Facades\DB;

class SubCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $subcategories = DB::table('sub_categories')->get();
        return view('backend.subcategory.subcategory_all',compact('subcategories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = DB::table('categories')->orderByDesc('category_name')->get();
        return view('backend.subcategory.subcategory_add',compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
         
        // Query builder or DB builder
        DB::table('sub_categories')->insert([
            "category_id" => $request->category_id,
            "subcategory_name" => $request->subcategory_name,
            "subcategory_slug" => strtolower(str_replace(' ', '-', $request->subcategory_name)),
            "created_at"=>now()
           
        ]);

        $notification = array(
            'message' => "Subcategory Added Successfully",
            'alert-type' => "success",
        );

        return redirect()->route('subcategory.all')->with($notification);
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
        $categories = DB::table('categories')->orderByDesc('category_name')->get();
        $subcategories = DB::table('sub_categories')->find($id);
        return view('backend.subcategory.subcategory_update',compact('subcategories','categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
         //  $categories = Category::find($id);
        // Query builder or DB builder
        DB::table('sub_categories')->where('id',$id)->update([
            "category_id" => $request->category_id,
            "subcategory_name" => $request->subcategory_name,
            "subcategory_slug" => strtolower(str_replace(' ', '-', $request->subcategory_name)),
            "updated_at"=>now()
        ]);

        $notification = array(
            'message' => "subcategory Updated Successfully",
            'alert-type' => "success",
        );

        return redirect()->route('subcategory.all')->with($notification);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // Query builder or DB builder
        DB::table('sub_categories')->where('id',$id)->delete();
       
        $notification = array(
            'message' => "Subcategory Delete Successfully",
            'alert-type' => "warning"
        );

        return redirect()->route('subcategory.all')->with($notification);
    }
}
