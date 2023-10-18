@extends('admin.master')


@section('main-content')
    <div class="page-content">

        <div class="row">
             <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-5">
            <div class="breadcrumb-title pe-3">Admin Change password</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Change password</li>
                    </ol>
                </nav>
            </div>

        </div>
        <!--end breadcrumb-->


            <div class="col-lg-8 offset-lg-2">
                <div class="card">
                    <div class="card-body">

                        <form action="{{ route('admin.password.update') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            {{-- Message --}}
                            @if(session('status'))
                            <div class="alert border-0 border-start border-5 border-success alert-dismissible fade show py-2">
                                <div class="d-flex align-items-center">
                                    <div class="font-35 text-success"><i class="bx bxs-check-circle"></i>
                                    </div>
                                    <div class="ms-3">
                                        <h6 class="mb-0 text-success">Success</h6>
                                        <div>{{ session('status') }}</div>
                                    </div>
                                </div>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            @elseif(session('error'))
                            <div class="alert border-0 border-start border-5 border-danger alert-dismissible fade show py-2">
                                <div class="d-flex align-items-center">
                                    <div class="font-35 text-danger"><i class="bx bxs-message-square-x"></i>
                                    </div>
                                    <div class="ms-3">
                                        <h6 class="mb-0 text-danger">Danger</h6>
                                        <div>{{ session('error') }}</div>
                                    </div>
                                </div>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            @endif

                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Old Password</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="password" class="form-control" name="old_password" placeholder="old password" />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">New Password</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="password" class="form-control" name="new_password" placeholder="new password" />
                                </div>
                            </div>
                            
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Confirm Password</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="password" class="form-control" name="confirm_password" placeholder="confirm password" />
                                </div>
                            </div>
                            

                           
                            <div class="row">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9 text-secondary">
                                    <button type="submit" class="btn btn-primary px-4">Update Password</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>



    </div>
@endsection
