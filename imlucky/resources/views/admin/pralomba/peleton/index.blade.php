@extends('admin.layouts.master')

@section('title')
    
@endsection

@section('content')

<div class="d-flex mt-4">
    <div class="btn-group ml-auto">
        <a id="btn-add-peleton" href="{{ route('peleton.create') }}" role="button" id="btn-tambah" class="btn btn-primary modal-show" title="Tambah Sekolah">Tambah Peleton</a>
        <a id="btn-import-peleton" href="{{ route('peleton.import') }}" role="button" id="btn-tambah" class="btn modal-show" title="Import Sekolah">Import</a>
        <a href="{{ route('peleton.export') }}"  class="btn" title="Tambah Sekolah">Export</a>
    </div>
</div>

<div class="card mt-4 wow fadeIn">
    {{-- <div class="card-header d-flex">
        <button class="btn btn-primary ml-auto">Cetak</button>
    </div> --}}

    <div class="card-body d-sm-flex justify-content-between">
        <table id="table" class="table table-sm table-bordered" data-href="{{ route('pralomba.listPeleton') }}">
            <thead>
                <tr>
                    <th class="text-center" colspan="3">List Pleton</th>
                </tr>
                <tr class="text-center">
                    <th scope="col" style="width: 1px">No</th>
                    <th scope="col">Peleton</th>
                    <th scope="col" style="width: 15%">Action</th>
                </tr>
            </thead>
            <tbody>
                {!! $listPeleton !!}
            </tbody>
        </table>
    </div>
</div>
@include('common.modal')
@endsection

@push('scripts')
{{-- peleton --}}
<script>
    $('body').on("change",".custom-file-input", function() {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });

    let peleton = new Crud('peleton');
    
    $('#btn-add-peleton').click(function (e) {
        e.preventDefault()
        let href = $(this).attr('href')
        peleton.create(href)
    })    
    $('body').on('click','.btn-edit-peleton',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        peleton.edit(href)
    })
    $('body').on('click','.btn-delete-peleton',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        peleton.destroy(href)
    })

    $('#btn-import-peleton').on('click',function(e){
        e.preventDefault()
        const HREF = $(this).attr('href')
        $.ajax({
            type: "GET",
            url: HREF,
            success: function (response) {
                $('.modal-body').html(response)
                $('#btn-modal-submit').html('Import Peleton')
                $('#modal').modal()
                $('#btn-modal-submit').click(function(){
                    $('#form-import').submit()
                })
            }
        });
    })
</script>
@endpush