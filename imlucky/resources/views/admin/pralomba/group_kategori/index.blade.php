@extends('layouts.master')

@section('title')
    
@endsection

@section('content')
<div class="mt-4 mb-4 d-flex">
    <button class="btn ml-auto">Edit mode</button>
</div>

<table id="table-group-kategori" class="table table-sm table-bordered" data-href="{{ route('pralomba.list_group_kategori') }}">
    <thead>
        <tr>
            <th class="text-center" colspan="5">List Juri</th>
        </tr>
        <tr class="text-center">
            <th scope="col">Group Juri</th>
            <th scope="col">Kategori</th>
        </tr>
    </thead>
    <tbody>
        {!! $list_group_kategori !!}
    </tbody>
</table>
@include('common.modal')
@endsection

@push('scripts')
<script src="{{ asset('js/crud.js') }}">

</script>

<script>
    let refreshGroupKategori = $('#table-group-kategori').attr('data-href'),
            groupKategori = new Crud('group-kategori',refreshGroupKategori,'group-kategori')
    
    $('body').on('click','.btn-add-group-kategori',function (e) {
        e.preventDefault()
        let href = $(this).attr('href')
        groupKategori.create(href)
    })    
    $('body').on('click','.btn-edit-group-kategori',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        groupKategori.edit(href)
    })
    $('body').on('click','.btn-delete-group-kategori',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        groupKategori.destroy(href)
    })
</script>
@endpush