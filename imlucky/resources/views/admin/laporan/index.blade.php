@extends('layouts.master')

@section('title')
    test
@endsection

@section('content')
<table id="table" class="table table-sm border-white" data-href="{{ route('pralomba.listPeleton') }}">
    <thead>
        <tr class="text-center">
            <th scope="col" style="width: 50px">No</th>
            <th scope="col">Peleton</th>
            <th scope="col" style="width: 50px">Action</th>
        </tr>
    </thead>
    <tbody>
        {{ view('admin.laporan._list-peleton',['peletons'=>$peletons]) }}
    </tbody>
</table>
@include('common.modal')
@endsection

@push('scripts')
    <script src="{{ asset('js/crud.js') }}"></script>
    <script>

    </script>
@endpush