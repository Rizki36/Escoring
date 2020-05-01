<!DOCTYPE html>
<!--
* CoreUI - Free Bootstrap Admin Template
* @version v2.1.15
* @link https://coreui.io
* Copyright (c) 2018 creativeLabs Łukasz Holeczek
* Licensed under MIT (https://coreui.io/license)
-->

<html lang="en">

<head>
  <base href="./">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
  <meta name="description" content="CoreUI - Open Source Bootstrap Admin Template">
  <meta name="author" content="Łukasz Holeczek">
  <meta name="keyword" content="Bootstrap,Admin,Template,Open,Source,jQuery,CSS,HTML,RWD,Dashboard">
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>E-Scoring | @yield('title')</title>
  <link href="{{ mix('css/app.css') }}" rel="stylesheet"> 
  <link href="{{ asset('css/custom.css') }}" rel="stylesheet">
</head>

<body class="app header-fixed sidebar-fixed aside-menu-fixed sidebar-lg-show">
  @include('admin.common.header')
  <div class="app-body">
    @include('admin.common.sidebar')

    <main class="main">
      
      <div class="container-fluid">
        <div class="animated fadeIn">
          @yield('content')
        </div>
      </div>
    </main>
  </div>
  <script src="{{ mix('js/app.js') }}"></script>  
  <script>
    $.ajaxSetup({
        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}
    });
  </script>
  @stack('scripts')
</body>

</html>