@extends('admin.master')


@section('main-content')
    {{-- ei jquery cnd bebohar kora lagbe karon master er jquery cdn sobar niche pore jay tai seta ei pager script er jonno kaj korena --}}
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- start page Wrapper -->
    <div class="page-content">
        <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <div class="breadcrumb-title pe-3">All Category</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">All Category</li>
                    </ol>
                </nav>
            </div>

        </div>
        <!--end breadcrumb-->

        <div class="row">
            <div class="col-lg-12">
                <a href="{{ route('category.add') }}" class="btn btn-primary btn-sm">Add Category</a>
                <hr />
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="example" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>#SL</th>
                                        <th>Category Name</th>
                                        <th>Category Image</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    @foreach ($categorys as $key=>$category)
                                    <tr>
                                        <td>{{ $key+1 }}</td>
                                        <td>{{ $category->category_name }}</td>
                                        <td>
                                            <img src="{{(empty($category->category_image)? url('/backend/upload/category/avatar.png') :  url('/backend/upload/category/'.$category->category_image))}}" alt="category"
                                            width="60" height="60" alt="{{ $category->category_name }}">
                                        </td>
                                        <td>
                                            <a href="" class="btn btn-sm btn-secondary">Show</a>
                                            <a href="{{ Route('category.edit',$category->id) }}" class="btn btn-sm btn-info">Edit</a>
                                            <a href="{{ Route('category.destroy',$category->id) }}" class="btn btn-sm btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                    @endforeach
                                   
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>#SL</th>
                                        <th>Category Name</th>
                                        <th>Category Image</th>
                                        <th>Action</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- End page Wrapper -->
@endsection
