<div class="sidebar">
  <nav class="sidebar-nav">
    <ul class="nav">
      <li class="nav-item">
        <a class="nav-link" href="/">
          <i class="nav-icon icon-speedometer"></i> Dashboard
        </a>
      </li>
      <li class="nav-title">Menu</li>
      <li class="nav-item">
        <a class="nav-link" href="">
          <i class="nav-icon icon-drop"></i> Setup</a>
      </li>

      <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="">
          <i class="nav-icon icon-pencil"></i> Pralomba</a>
        <ul class="nav-dropdown-items">
          <li class="nav-item">
            <a class="nav-link" href="{{ route('group-juri.index') }}">
              <i class="nav-icon fas fa-bell"></i>Group Juri</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{ route('juri.index') }}">
              <i class="nav-icon fas fa-bell"></i> Juri</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{ route('kategori.index') }}">
              <i class="nav-icon fas fa-bell"></i> Kategori</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{ route('group-kategori.index') }}">
              <i class="nav-icon fas fa-bell"></i> Group Kategori</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{ route('peleton.index') }}">
              <i class="nav-icon fas fa-bell"></i> Peleton</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{ route('pinalti.indexPralomba') }}">
              <i class="nav-icon fas fa-bell"></i> Pinalti</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{ route('ballot.indexPralomba') }}">
              <i class="nav-icon fas fa-bell"></i> Ballot</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{{ route('form-penilaian.indexPeleton') }}">
              <i class="nav-icon fas fa-bell"></i> Form Penilaian</a>
          </li>
        </ul>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="{{ route('ballot.index') }}">
          <i class="nav-icon icon-pencil"></i> Ballot</a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="{{ route('pinalti.index') }}">
          <i class="nav-icon icon-pencil"></i> Pinalti</a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="{{ route('sortasi.index') }}">
          <i class="nav-icon icon-pencil"></i> Sortasi</a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="{{ route('laporan.index') }}">
          <i class="nav-icon icon-pencil"></i> Laporan</a>
      </li>
      <li class="divider"></li>

      <li class="nav-item mt-auto">
        <a class="nav-link nav-link-primary text-center" href="https://coreui.io" target="_top">
          {{-- <i class="nav-icon icon-cloud-download"></i>  --}}
          V1.0</a>
      </li>
    </ul>
  </nav>
  <button class="sidebar-minimizer brand-minimizer" type="button"></button>
</div>