@include('admin.body.styles')
<!--wrapper-->
<div class="wrapper">
    <!--sidebar wrapper -->
    @include('admin.body.sidebar')
    <!--end sidebar wrapper -->
    <!--start header -->
    @include('admin.body.header')
    <!--end header -->
    <!--start page wrapper -->
    <div class="page-wrapper">

       @yield('main-content')

    </div>
    <!--end page wrapper -->
    @include('admin.body.footer')
</div>
<!--end wrapper-->

@include('admin.body.script')
