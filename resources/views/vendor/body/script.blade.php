
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- Bootstrap JS -->
<script src="{{asset('backend')}}/assets/js/bootstrap.bundle.min.js"></script>
<!--plugins-->
<script src="{{asset('backend')}}/assets/js/jquery.min.js"></script>
<script src="{{asset('backend')}}/assets/plugins/simplebar/js/simplebar.min.js"></script>
<script src="{{asset('backend')}}/assets/plugins/metismenu/js/metisMenu.min.js"></script>
<script src="{{asset('backend')}}/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
<script src="{{asset('backend')}}/assets/plugins/chartjs/js/Chart.min.js"></script>
<script src="{{asset('backend')}}/assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
<script src="{{asset('backend')}}/assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="{{asset('backend')}}/assets/plugins/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="{{asset('backend')}}/assets/plugins/sparkline-charts/jquery.sparkline.min.js"></script>
<script src="{{asset('backend')}}/assets/plugins/jquery-knob/excanvas.js"></script>
<script src="{{asset('backend')}}/assets/plugins/jquery-knob/jquery.knob.js"></script>
  <script>
      $(function() {
          $(".knob").knob();
      });
  </script>
  <script src="{{asset('backend')}}/assets/js/index.js"></script>
<!--app JS-->
<script src="{{asset('backend')}}/assets/js/app.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>


<script>
  @if(Session::has('message'))
  var type = "{{ Session::get('alert-type', 'info') }}"    // why 'info' here?
  switch(type){
    case 'info':
      toastr.info("{{ Session::get('message') }}");
      break;

    case 'success':
      toastr.success("{{ Session::get('message') }}");
      break;

    case 'warning':
      toastr.warning("{{ Session::get('message') }}");
      break;

    case 'error':
      toastr.error("{{ Session::get('message') }}");
      break;
  }

  @endif
</script>
</body>

</html>