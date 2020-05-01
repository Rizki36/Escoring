@extends('juri.layouts.master')

@section('title')
    
@endsection

@section('content')
<div id="kategori-container" class="mt-1 d-flex">
    @foreach ($kategoris as $kategori)
    <a class="btn kategori-item" data-id="{{ $kategori->id }}">
        {{ $kategori->nama }}
    </a>
    @endforeach
</div>

@foreach ($penilaian as $kategori_id => $kategori)
<div class="card mt-4 wow fadeIn">
    <div class="card-body"> 
        <h4 class="card-title text-center">{{ $kategori['nama'] }}</h4>
        <div class="row">
            {{-- @for ($u = 0; $u < 3; $u++) --}}
            @foreach ($kategori['subs'] as $sub_id => $sub)
            @foreach ($sub['sub2s'] as $sub2_id => $sub2)
            <div class="col-12">
                <span class="radio-title">{{ $sub2['nama'] }}</span>
                <div class="group-radio">
                    @foreach ($sub['kisaran_nilai'] as $kisaran)
                    <div class="custom-radio">
                        <input name="nilai[{{ $kategori_id }}][{{ $sub_id }}][{{ $sub2_id }}]" type="radio" value="{{ $kisaran }}">
                        <label for="nilai">{{ $kisaran }}</label>
                    </div>
                    @endforeach
                </div>
                <hr>
            </div>
            @endforeach
            @endforeach
            {{-- @endfor --}}
            <div class="col-12">
                <button class="btn btn-primary w-100">Simpan</button>
            </div>
        </div>
    </div>
</div>
@endforeach

@endsection

@push('scripts')
    
@endpush