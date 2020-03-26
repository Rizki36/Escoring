@extends('layouts.master')

@section('title')
    
@endsection

@section('content')
    @if($data->validated)
        <a class="btn btn-primary" href="">input Manual Form Penilaian</a>
        <a class="btn btn-success" href="">Generate Form Penilaian</a>
    @else
        {{ $data->message }}
    @endif
@endsection

@push('scripts')
    <script>

    </script>
@endpush