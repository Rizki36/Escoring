@extends('admin.layouts.master')
@section('title')
    
@endsection

@section('content')

<form id="form-cetak" action="{{ route('sortasi.cetak') }}" method="post">
    <input id="html" type="hidden" name="html">     
    <input id="title" type="hidden" name="title">
    <input id="orientasi" type="hidden" name="orientasi">
    <input id="nama_file" type="hidden" name="nama_file">
    @csrf
</form>

<div class="card mt-4 wow fadeIn">
    <div class="card-header d-flex ">
        <b>Tabel Juara</b>
        <button data-nama="Daftar Juara" data-title="{!! $config['title_juara']->value !!}" class="btn btn-sm btn-primary ml-auto btn-cetak" data-orientasi="portrait">Cetak</button>
    </div>
    <div class="card-body d-sm-flex justify-content-between">
        @include('admin.sortasi._table-juara')
    </div>
</div>

<div class="card mt-4 wow fadeIn">
    <div class="card-header d-flex ">
        <b>Tabel Sortasi</b>
        <button data-nama="Sortasi" data-title="{!! $config['title_sortasi']->value !!}" class="btn btn-sm btn-primary ml-auto btn-cetak" data-orientasi="landscape">Cetak</button>
    </div>
    <div class="card-body d-sm-flex justify-content-between">
        @include('admin.sortasi._table-sortasi')
    </div>
</div>

@endsection

@push('scripts')
    <script>
        $('.btn-cetak').on('click', function () {
            const html = $(this).closest('.card').find('.card-body').html(),
                orientasi = $(this).attr('data-orientasi'),
                title = $(this).attr('data-title'),
                nama_file = $(this).attr('data-nama');
            
            $('#html').val(html);
            $('#orientasi').val(orientasi);
            $('#title').val(title);
            $('#nama_file').val(nama_file);
            $('#form-cetak').submit();
        });
    </script>
@endpush