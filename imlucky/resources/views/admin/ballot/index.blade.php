@extends('admin.layouts.master')

@section('title')
    
@endsection

@section('content')
<div class="card mt-4 wow fadeIn">
    <div class="card-body d-sm-flex justify-content-between"> 
        <table id="table" class="table table-sm" data-href="{{ route('ballot.listBallot') }}">
            <thead>
                <tr>
                    <th class="text-center" colspan="4">List Ballot Pleton</th>
                </tr>
                <tr class="text-center">
                    <th scope="col" style="width: 1px">No</th>
                    <th scope="col">Peleton</th>
                    <th scope="col">Ballot</th>
                    <th scope="col" style="width: 15%">Action</th>
                </tr>
            </thead>
            <tbody>
                {!! $peletons !!}
            </tbody>
        </table>
    </div>
</div>
@include('common.modal')
@endsection

@push('scripts')
<script>
    let ballot = new Crud('ballot');
    $('body').on('click','.btn-edit-ballot',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        ballot.edit(href)
    })
</script>
@endpush