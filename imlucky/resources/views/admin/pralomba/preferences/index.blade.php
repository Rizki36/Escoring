@extends('admin.layouts.master')

@section('title')
    Preferences
@endsection

@section('content')
    <form action="{{ route('preferences.post') }}" method="post">
        @csrf
        <div class="form-group">
            <label for="lembar-juara">Header Lembar Juara</label>
            <textarea name="lembar_juara" class="form-control" id="lembar-juara" rows="3">{!! $config['title_juara']->value !!}</textarea>
        </div>
        <div class="form-group">
            <label for="lembar-sortasi">Header Lembar Sortasi</label>
            <textarea name="lembar_sortasi" class="form-control" id="lembar-sortasi" rows="3">{!! $config['title_sortasi']->value !!}</textarea>
        </div>
        <div class="form-group">
            <label for="lembar-laporan">Header Laporan</label>
            <textarea name="lembar_laporan" class="form-control" id="lembar-laporan" rows="3">{!! $config['title_laporan']->value !!}</textarea>
        </div>
        <div class="d-flex">
            <button type="submit" class="btn btn-primary ml-auto">Ubah</button>
            <button type="" class="btn">reset</button>
        </div>
    </form>
@endsection

@push('scripts')
    
@endpush