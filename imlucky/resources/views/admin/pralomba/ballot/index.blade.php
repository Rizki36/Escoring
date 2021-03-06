@extends('admin.layouts.master')

@section('title')
    
@endsection

@section('content')
<div class="callout callout-info">
    Perhatian!<br>
    <small class="text-muted">Nilai Umum = Nilai Umum + (Nilai ballot * Persentase Ballot Umum/100) </small><br>
    <small class="text-muted">Nilai Utama = Nilai Utama + (Nilai ballot * Persentase Ballot Utama/100) </small><br>
</div>
<div class="card mt-4 wow fadeIn">
    <div class="card-body">
        <form action="{{ route('ballot.updatePralomba') }}" method="post">
            @csrf
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">Persetase Umum</span>
                </div>
                <input name="ballot_umum" type="number" class="form-control" value="{{ $ballot->umum }}">
                <div class="input-group-prepend">
                    <span class="input-group-text">Persentase Utama</span>
                </div>
                <input name="ballot_utama" type="number" class="form-control" value="{{ $ballot->utama }}">
                <div class="input-group-append">
                    <button class="btn btn-primary" type="submit">Update</button>
                </div>
            </div>
        </form>
    </div>
</div>
@if (session('status'))
    <div class="alert alert-success">
        {{ session('status') }}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
@endif
@endsection

@push('scripts')
    
@endpush