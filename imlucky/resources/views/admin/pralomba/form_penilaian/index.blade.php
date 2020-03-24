@extends('layouts.master')

@section('title')
    
@endsection

@section('content')
    @if($data->validated)
        test
    @else
        {{ $data->message }}
    @endif
@endsection

@push('scripts')
    <script>

    </script>
@endpush