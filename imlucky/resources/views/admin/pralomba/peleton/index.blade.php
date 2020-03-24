@extends('layouts.master')

@section('title')
    
@endsection

@section('content')
<div class="mt-4 mb-4 d-flex">
    <a id="btn-add-peleton" href="{{ route('peleton.create') }}" style="width: 180px;margin-right: 5px" class="btn bg-blue text-white">Tambah Peleton</a>
    <button class="btn ml-auto">Edit mode</button>
</div>

<table id="table-peleton" class="table table-sm table-bordered" data-href="{{ route('pralomba.listPeleton') }}">
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
@include('common.modal')
@endsection

@push('scripts')
<script src="{{ asset('js/crud.js') }}"></script>
{{-- peleton --}}
<script>
    let refreshPeleton = $('#table-peleton').attr('data-href'),
            peleton = new Crud('peleton',refreshPeleton,'peleton');
    
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
</script>
@endpush