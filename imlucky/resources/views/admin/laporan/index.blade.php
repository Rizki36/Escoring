@extends('layouts.master')

@section('title')
    test
@endsection

@section('content')
<div class="card mt-4 wow fadeIn">
    <div class="card-body d-sm-flex justify-content-between">
        
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
    </div>
</div>
@include('common.modal')
@endsection

@push('scripts')
    <script>

    </script>
@endpush