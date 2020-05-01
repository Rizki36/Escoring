<div class="sidebar">
  <nav class="sidebar-nav">
    <ul class="nav">
      <li class="nav-title">Peleton</li>
      @foreach ($peletons as $peleton)
      <li class="nav-item">
        <a class="nav-link" href="{{ route('juri',['no'=>$peleton->id]) }}">{{ $peleton->nama }}</a>
      </li>
      @endforeach
      
      <li class="divider"></li>

      <li class="nav-item mt-auto">
        <a class="nav-link nav-link-primary text-center" target="_top">
          V2.0</a>
      </li>
    </ul>
  </nav>
  <button class="sidebar-minimizer brand-minimizer" type="button"></button>
</div>