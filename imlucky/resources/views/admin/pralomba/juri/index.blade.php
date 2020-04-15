@extends('layouts.master')

@section('title')

@endsection

@section('content')
<div class="card mt-4 wow fadeIn">
    <div class="card-body d-sm-flex justify-content-between">
        
        <table id="table" class="table table-sm table-bordered" data-href="{{ route('pralomba.listJuri') }}">
            <thead>
                <tr>
                    <th class="text-center" colspan="5">List Juri</th>
                </tr>
                <tr class="text-center">
                    <th scope="col">User</th>
                    <th scope="col">Group Juri</th>
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
                    <td colspan="5">
                        <a id="btn-add-juri" href="{{ route('juri.create') }}" class="btn btn-primary w-100" class="btn bg-orange text-white">Tambah Juri</a>
                    </td>
                </tr>
            </tfoot>
        </table>
        
    </div>
</div>
@include('common.modal')
@endsection

@push('scripts')
{{-- juri --}}
<script>
    let juri = new Crud('juri')
    
    $('#btn-add-juri').click(function (e) {
        e.preventDefault()
        let href = $(this).attr('href')
        juri.create(href)
    })

    $('body').on('click','.btn-edit-juri',function (e) {
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