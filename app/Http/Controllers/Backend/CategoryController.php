<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // $categorys = Category::all();

        $categorys = DB::table('categories')->get();
        return view('backend.category.category_all', compact('categorys'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('backend.category.category_add');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        
        if ($image = $request->file('category_image')) {
            $customImageName = uniqid() . '.' . $image->getClientOriginalExtension();
            // @unlink(public_path('backend/upload/category/'.$adminUser->photo));
            $image->move(public_path('backend/upload/category/'), $customImageName);
        }

        // Query builder or DB builder
        DB::table('categories')->insert([
            "category_name" => $request->category_name,
            "category_slug" => strtolower(str_replace(' ', '-', $request->category_name)),
            "category_image" => $customImageName
        ]);

        $notification = array(
            'message' => "category Added Successfully",
            'alert-type' => "success",
        );

        return redirect()->route('category.all')->with($notification);


        // $category = new Category();
        // $category->category_name = $request->category_name;
        // $category->category_slug = strtolower(str_replace(' ', '-', $request->category_name));

        // if ($image = $request->file('category_image')) {
        //     $customImageName = uniqid() . '.' . $image->getClientOriginalExtension();
        //     // @unlink(public_path('backend/upload/category/'.$adminUser->photo));
        //     $image->move(public_path('backend/upload/category/'), $customImageName);
        // }

        // $category->category_image = $customImageName;

        // $category->save();

        // $notification = array(
        //     'message' => "category Added Successfully",
        //     'alert-type' => "success",
        // );

        // return redirect()->route('category.all')->with($notification);
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
        $categories = DB::table('categories')->find($id);
        return view('backend.category.category_update',compact('categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //  $categories = Category::find($id);
       
        if ($image = $request->file('category_image')) {
            $customImageName = uniqid() . '.' . $image->getClientOriginalExtension();
            @unlink(public_path('backend/upload/category/'.Category::find($id)->category_image));
            $image->move(public_path('backend/upload/category/'), $customImageName);
        }else{
            $customImageName = Category::find($id)->category_image;
        }

        // Query builder or DB builder
        DB::table('categories')->where('id',$id)->update([
            "category_name" => $request->category_name,
            "category_slug" => strtolower(str_replace(' ', '-', $request->category_name)),
            "updated_at" => now()
            
        ]);

        $notification = array(
            'message' => "category Updated Successfully",
            'alert-type' => "success",
        );

        return redirect()->route('category.all')->with($notification);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // $categories = Category::find($id);

        // ei part ta age hobe,tanahole id pabenna
        @unlink(public_path('backend/upload/category/'.Category::find($id)->category_image));

        // Query builder or DB builder
        DB::table('categories')->where('id',$id)->delete();
       
        $notification = array(
            'message' => "category Delete Successfully",
            'alert-type' => "warning"
        );

        return redirect()->route('category.all')->with($notification);
    }
}
