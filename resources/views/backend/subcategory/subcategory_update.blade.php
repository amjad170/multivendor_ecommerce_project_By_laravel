@extends('admin.master')


@section('main-content')
    {{-- ei jquery cnd bebohar kora lagbe karon master er jquery cdn sobar niche pore jay tai seta ei pager script er jonno kaj korena --}}
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- start page Wrapper -->
    <div class="page-content">
        <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <div class="breadcrumb-title pe-3">Update SubCategory</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Update SubCategory</li>
                    </ol>
                </nav>
            </div>

        </div>
        <!--end breadcrumb-->

        
              
               <div class="row">
                 <!-- Brand Add -->
                <div class="col-xl-7 mx-auto">
                   
                    <div class="card border-top border-0 border-4 border-primary">
                        <div class="card-body p-5">
                            <div class="card-title d-flex align-items-center">
                                
                                <h5 class="mb-0 text-primary">Update SubCategory</h5>
                            </div>
                            <hr>

                            <form  action="{{ route('subcategory.update',$subcategories->id) }}" method="POST" enctype="multipart/form-data">
                                @csrf

                                <div class="col-md-12 mb-3">
                                    <label for="category_id" class="form-label">Category Name(category id)</label>
                                    <select name="category_id" id="category_id" class="form-control">
                                        <option value="" disabled selected>--select Category--</option>                                   
                                        {{-- All category List oreder by name --}}
                                        @foreach($categories as $key=>$category) 
                                        <option value="{{$category->id }}">{{ $category->category_name }}</option>
                                        @endforeach
                                        {{-- <option selected  value="{{ $subcategories->category_id }}">{{ $category->category_name }}</option> --}}
                                    </select>
                                </div>

                                <div class="col-md-12 mb-3">
                                    <label for="subcategory_name" class="form-label">SubCategory Name</label>
                                    <input type="text" class="form-control" id="subcategory_name" name="subcategory_name" placeholder="subcategory name" value="{{ $subcategories->subcategory_name }}">
                                </div>

                                {{-- <div class="col-md-12 mb-3">
                                    <label for="category_image" class="form-label">SubCategory Image</label>
                                    <input type="file" class="form-control" id="category_image" name="category_image">
                                </div> --}}

                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary px-5">Save SubCategory</button>
                                </div>

                            </form>

                           
                        </div>
                    </div>
                   
                </div>
            </div>
             
               
            
        </div>

    </div>
    <!-- End page Wrapper -->
@endsection
