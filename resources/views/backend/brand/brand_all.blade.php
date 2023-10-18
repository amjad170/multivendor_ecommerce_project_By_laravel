@extends('admin.master')


@section('main-content')
    {{-- ei jquery cnd bebohar kora lagbe karon master er jquery cdn sobar niche pore jay tai seta ei pager script er jonno kaj korena --}}
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- start page Wrapper -->
    <div class="page-content">
        <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <div class="breadcrumb-title pe-3">All Brand</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">All Brand</li>
                    </ol>
                </nav>
            </div>

        </div>
        <!--end breadcrumb-->

        <div class="row">
            <div class="col-lg-12">
                <a href="{{ route('brand.add') }}" class="btn btn-primary btn-sm">Add brand</a>
                <hr />
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="example" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>#SL</th>
                                        <th>Brand Name</th>
                                        <th>Brand Image</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    @foreach ($brands as $key=>$brand)
                                    <tr>
                                        <td>{{ $key+1 }}</td>
                                        <td>{{ $brand->brand_name }}</td>
                                        <td>
                                            <img src="{{(empty($brand->brand_image)? url('/backend/upload/admin/avatar.png') :  url('/backend/upload/brand/'.$brand->brand_image))}}" alt="Admin"
                                            width="60" height="60" alt="{{ $brand->brand_name }}">
                                        </td>
                                        <td>
                                            <a href="" class="btn btn-sm btn-secondary">Show</a>
                                            <a href="{{ Route('brand.edit',$brand->id) }}" class="btn btn-sm btn-info">Edit</a>
                                            <a href="{{ Route('brand.destroy',$brand->id) }}" class="btn btn-sm btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                    @endforeach
                                   
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>#SL</th>
                                        <th>Brand Name</th>
                                        <th>Brand Image</th>
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
