@extends('layouts.master')

@section('title')

@endsection

@section('content')
<div class="mt-4 mb-4 d-flex">
    <button class="btn ml-auto">Edit mode</button>
</div>

<table id="table-juri" class="table table-sm table-bordered" data-href="{{ route('pralomba.listJuri') }}">
    <thead>
        <tr>
            <th class="text-center" colspan="4">List Juri</th>
        </tr>
        <tr class="text-center">
            <th scope="col">kode</th>
            <th scope="col">Nama</th>
            <th scope="col">Password</th>
            <th scope="col">Action</th>
        </tr>
    </thead>
    <tbody>
        {!! $listJuri !!}
    </tbody>
    <tfoot>
        <tr>
            <td colspan="4">
                <a id="btn-add-juri" href="{{ route('juri.create') }}" class="btn btn-primary w-100" class="btn bg-orange text-white">Tambah Juri</a>
            </td>
        </tr>
    </tfoot>
</table>
@include('common.modal')
@endsection

@push('scripts')
<script src="{{ asset('js/crud.js') }}">

</script>
{{-- juri --}}
<script>
    let refreshJuri = $('#table-juri').attr('data-href'),
            juri = new Crud('juri',refreshJuri)
    
    $('#btn-add-juri').click(function (e) {
        e.preventDefault()
        let href = $(this).attr('href')
        juri.create(href)
    })    
    $('body').on('click','.btn-edit-juri',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        juri.edit(href)
    })
    $('body').on('click','.btn-delete-juri',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        juri.destroy(href)
    })
</script>
@endpush