@extends('admin.layouts.master')

@section('title')

@endsection

@section('content')
<div class="callout callout-info">
    Perhatian!<br>
    <small class="text-muted">Nilai Umum = Nilai Umum - (Nilai Umum * Persentase Pinalti Umum/100) </small><br>
    <small class="text-muted">Nilai Utama = Nilai Utama - (Nilai Utama * Persentase Pinalti Utama/100) </small><br>
</div>
<div class="card mt-4 wow fadeIn">
    <div class="card-body">
        <form action="{{ route('pinalti.updatePralomba') }}" method="post">
            @csrf
            <div class="row ">
                <div class="col-md-6 col-12">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Persetase Pinalti Umum  &nbsp;</span>
                        </div>
                        <input name="pinalti_umum" type="number" class="form-control" value="{{ $pinalti->umum }}">
                    </div>
                </div>

                <div class="col-md-6 col-12">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Persentase Pinalti Utama</span>
                        </div>
                        <input name="pinalti_utama" type="number" class="form-control" value="{{ $pinalti->utama }}">
                    </div>
                </div>
            </div>
            <div class="d-flex mt-3">
                <button class="btn btn-primary w-100" type="submit">Update</button>
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
<script>

</script>
@endpush