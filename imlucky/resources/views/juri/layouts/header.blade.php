<header class="app-header navbar">
    <button class="navbar-toggler sidebar-toggler d-lg-none mr-auto" type="button" data-toggle="sidebar-show">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="#">
        <img class="navbar-brand-full" src="{{ asset('images/logo.svg') }}" width="89" height="25">
        <img class="navbar-brand-minimized" src="{{ asset('images/logo-min.jpg') }}" width="30" height="30">
    </a>
    <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button" data-toggle="sidebar-lg-show">
        <span class="navbar-toggler-icon"></span>
    </button>

    <ul class="nav navbar-nav ml-auto">
        <li class="nav-item mr-2 d-none d-lg-block">
            <a class="nav-link">
                <span style="color: #73818f">{{ session('juri')->nama }}</span>
                <img class="img-avatar" src="{{ asset('images/avatar.png') }}" alt="img-admin">
            </a>
        </li>
        <li>
            <b class="d-none d-lg-block"> | </b>
        </li>
        <li class="nav-item mr-4">
            <a class="nav-link" href="{{ route('logout.juri') }}">
                <i class="fa fa-sign-out-alt"></i>
            </a>
        </li>
    </ul>
</header>