@include('vendor.body.styles')
<!--wrapper-->
<div class="wrapper">
    <!--sidebar wrapper -->
    @include('vendor.body.sidebar')
    <!--end sidebar wrapper -->
    <!--start header -->
    @include('vendor.body.header')
    <!--end header -->
    <!--start page wrapper -->
    <div class="page-wrapper">

       @yield('main-content')

    </div>
    <!--end page wrapper -->
    @include('vendor.body.footer')
</div>
<!--end wrapper-->

@include('vendor.body.script')
