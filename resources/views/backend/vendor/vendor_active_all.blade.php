@extends('admin.master')


@section('main-content')
    {{-- ei jquery cnd bebohar kora lagbe karon master er jquery cdn sobar niche pore jay tai seta ei pager script er jonno kaj korena --}}
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- start page Wrapper -->
    <div class="page-content">
        <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <div class="breadcrumb-title pe-3">All Active vendor</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">All Active vendor</li>
                    </ol>
                </nav>
            </div>

        </div>
        <!--end breadcrumb-->

        <div class="row">
            <div class="col-lg-12">
                {{-- <a href="{{ route('category.add') }}" class="btn btn-primary btn-sm">Add Category</a> --}}
                <hr />
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="example" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>#SL</th>
                                        <th>Full Name</th>
                                        <th>User Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>Join Date</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    @foreach ($activeVendors as $key => $activeVendor)
                                        <tr>
                                            <td>{{ $key + 1 }}</td>
                                            <td>{{ $activeVendor->name }}</td>
                                            <td>{{ $activeVendor->username }}</td>
                                            <td>{{ $activeVendor->email }}</td>
                                            <td>{{ $activeVendor->phone }}</td>
                                            <td>{{ $activeVendor->address }}</td>
                                            <td>{{ $activeVendor->vendor_join }}</td>
                                            <td><a href=""
                                                    class="btn btn-sm btn-success">{{ $activeVendor->status }}</a></td>

                                            <td>
                                                <a href="{{ Route('vendor.details', $activeVendor->id) }}"
                                                    class="btn btn-sm btn-info" data-bs-toggle="modal"
                                                    data-bs-target="#active{{ $activeVendor->id }}">View Details</a>
                                                <a href="{{ Route('vendor.delete', $activeVendor->id) }}"
                                                    class="btn btn-sm btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                        <!-- Modal -->
                                        <div class="modal fade" id="active{{ $activeVendor->id }}" tabindex="-1"
                                            aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="{{ Route('vendor.update', $activeVendor->id) }}"
                                                            method="POST">
                                                            @csrf
                                                            <div class="form-group">
                                                                <label for="fullname">Vendor Full Name</label>
                                                                <input type="text" name="fullname" id="fullname"
                                                                    placeholder="Enter Vendor full name"
                                                                    class="form-control mb-3"
                                                                    value="{{ $activeVendor->name }}">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="username">Vendor Username</label>
                                                                <input type="text" disabled name="username"
                                                                    id="username" placeholder="Enter Vendor Username"
                                                                    class="form-control mb-3"
                                                                    value="{{ $activeVendor->username }}">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="email">Vendor email</label>
                                                                <input type="email" disabled name="email" id="email"
                                                                    placeholder="Enter Vendor email"
                                                                    class="form-control mb-3"
                                                                    value="{{ $activeVendor->email }}">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="phone">Vendor Phone</label>
                                                                <input type="text" name="phone" id="phone"
                                                                    placeholder="Enter Vendor phone"
                                                                    class="form-control mb-3"
                                                                    value="{{ $activeVendor->phone }}">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="address">Vendor Address</label>
                                                                <input type="text" name="address" id="address"
                                                                    placeholder="Enter Vendor address"
                                                                    class="form-control mb-3"
                                                                    value="{{ $activeVendor->address }}">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="status">Select Vendor Status</label>
                                                                <select name="status" id="status"
                                                                    class="form-control form-select">
                                                                    <option value="" disabled>--Select Status--
                                                                    </option>
                                                                    <option selected value="{{ $activeVendor->status }}">
                                                                        {{ $activeVendor->status }}</option>
                                                                    <option value="inactive">inactive</option>
                                                                </select>
                                                            </div>

                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary"
                                                                    data-bs-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-primary">Update
                                                                    Vendor</button>
                                                            </div>

                                                        </form>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    @endforeach

                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>#SL</th>
                                        <th>Full Name</th>
                                        <th>User Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>Join Date</th>
                                        <th>Status</th>
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
