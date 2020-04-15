@extends('layouts.master')

@section('title')

@endsection

@section('content')
<div class="card mt-4 wow fadeIn">
    <div class="card-body d-sm-flex justify-content-between">        

        <table id="table" class="table table-sm table-bordered" data-href="{{ route('pralomba.listKategori') }}">
            <thead>
                <tr>
                    <th class="text-center" colspan="5">List Kategori</th>
                </tr>
                <tr class="text-center">
                    <th scope="col" style="width: 200px">Kategori</th>
                    <th scope="col" style="width: 50px">%</th>
                    <th scope="col" style="width: 200px">Sub</th>
                    <th scope="col">Sub2</th>
                    <th scope="col" style="width: 1px">kode</th>
                </tr>
            </thead>
            <tbody>
                {!! $listKategori !!}
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5"><a id="btn-add-kategori" style="width: 100%;margin-right: 5px"
                            class="btn bg-indigo text-white" href="{{ route('kategori.create') }}">Tambah Kategori</button></td>
                </tr>
            </tfoot>
        </table>

    </div>
</div>
@include('common.modal')
@endsection


@push('scripts')
{{-- kategori --}}
<script>
    $('#form-kategori').inputmask('0');
    $('#form-sub').inputmask('0');
    $('#form-sub2').inputmask('00');
    let kategori = new Crud('kategori')

    $('body').on('click', '#btn-add-kategori', function (e) {
        e.preventDefault()
        let href = $(this).attr('href')
        kategori.create(href)
    })
    $('body').on('click','.btn-edit-kategori',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        kategori.edit(href)
    })
    $('body').on('click','.btn-delete-kategori',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        kategori.destroy(href)
    })
   
    let sub = new Crud('sub')
    $('body').on('click', '.btn-add-sub', function (e) {
        e.preventDefault()
        let href = $(this).attr('href')
        sub.create(href)
    })
    $('body').on('click','.btn-edit-sub',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        sub.edit(href)
    })
    $('body').on('click','.btn-delete-sub',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        sub.destroy(href)
    })
    
    let sub2 = new Crud('sub2')
    $('body').on('click', '.btn-add-sub2', function (e) {
        e.preventDefault()
        let href = $(this).attr('href')
        sub2.create(href)
    })
    $('body').on('click','.btn-edit-sub2',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        sub2.edit(href)
    })
    $('body').on('click','.btn-delete-sub2',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        sub2.destroy(href)
    })
</script>
@endpush