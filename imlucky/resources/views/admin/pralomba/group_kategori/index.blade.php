@extends('admin.layouts.master')

@section('title')
    
@endsection

@section('content')
<div class="callout callout-info">
    Perhatian!<br>
    <small class="text-muted">Group Kategori berfungsi untuk <b> mengelompokan Group Juri berdasarkan Kategori</b> yang dinilai</small><br>
    <small class="text-muted">ex. group juri PBB : Kategori Pbb dan Danton</small><br>
    <small class="text-muted">ex. group juri FARVORYEL : Kategori Variasi, Formasi, dan Yel-yel</small><br>
    <small class="text-muted">ex. group juri FARVORYELKOS : Kategori, Variasi, Formasi, Yel-yel, dan Kostum</small><br>
</div>
<div class="card mt-4 wow fadeIn">
    <div class="card-body d-sm-flex justify-content-between">
        <table id="table" class="table table-sm table-bordered" data-href="{{ route('pralomba.list_group_kategori') }}">
            <thead>
                <tr>
                    <th class="text-center" colspan="5">Group Kategori</th>
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
    </div>
</div>
@include('common.modal')
@endsection

@push('scripts')
<script>
    let groupKategori = new Crud('group-kategori')
    
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