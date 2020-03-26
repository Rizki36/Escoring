@extends('layouts.master')

@section('title')

@endsection

@section('content')
<div class="mt-4 mb-4 d-flex">
    <button class="btn ml-auto">Edit mode</button>
</div>

<table id="table-group-juri" class="table table-sm table-bordered" data-href="{{ route('pralomba.listGroupJuri') }}">
    <thead>
        <tr>
            <th class="text-center" colspan="4">List Juri</th>
        </tr>
        <tr class="text-center">
            <th scope="col">kategori</th>
            <th scope="col">Action</th>
        </tr>
    </thead>
    <tbody>
        {!! $listGroupJuri !!}
    </tbody>
    <tfoot>
        <tr>
            <td colspan="4">
                <a id="btn-add-group-juri" href="{{ route('group-juri.create') }}" class="btn btn-primary w-100" class="btn bg-orange text-white">Tambah Group Juri</a>
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
    let refreshGroupJuri = $('#table-group-juri').attr('data-href'),
            groupJuri = new Crud('group-juri',refreshGroupJuri,'group-juri')
    console.log(refreshGroupJuri)
    $('#btn-add-group-juri').click(function (e) {
        e.preventDefault()
        let href = $(this).attr('href')
        groupJuri.create(href)
    })    
    $('body').on('click','.btn-edit-group-juri',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        groupJuri.edit(href)
    })
    $('body').on('click','.btn-delete-group-juri',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        groupJuri.destroy(href)
    })
</script>
@endpush