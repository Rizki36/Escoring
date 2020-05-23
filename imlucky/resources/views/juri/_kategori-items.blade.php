@foreach ($kategoris as $kategori)
    @php
        if(!isset($active_kategori)){
            $active_kategori = 'halo';
        }   
    @endphp
    <a class="btn {{ $kategori->is_complete == 1 ? 'kategori-complete' : '' }} kategori-item {{ $active_kategori == $kategori->id ? 'kategori-active' : '' }}" data-id="{{ $kategori->id }}">
        {!!  $kategori->is_complete == 1 ? '<i class="fas fa-check-circle"></i>' : ''  !!}
        <span class="d-block">{{ $kategori->nama }}</span>
    </a>
@endforeach