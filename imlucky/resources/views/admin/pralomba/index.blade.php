@extends('layouts.master')
@section('content')
{{-- <div class="mt-4 mb-4 d-flex">
    <a id="btn-add-peleton" href="{{ route('peleton.create') }}" style="width: 180px;margin-right: 5px" class="btn bg-blue text-white">Tambah Peleton</button>
    <a id="btn-add-juri" href="{{ route('juri.create') }}" style="width: 180px;margin-right: 5px" class="btn bg-orange text-white">Tambah Juri</button>
    
    <a id="btn-add-penilaian" style="width: 180px;margin-right: 5px" class="btn bg-teal text-white">Buat Penilaian</a>
    <button class="btn ml-auto">Edit mode</button>
</div> --}}
@include('common.modal')
@endsection

@push('scripts')
@endpush

