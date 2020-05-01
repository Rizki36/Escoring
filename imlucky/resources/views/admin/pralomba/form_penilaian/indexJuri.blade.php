@extends('admin.layouts.master')

@section('title')
    
@endsection

@section('content')
        <table id="table" class="table table-sm table-bordered mt-4">
            <thead class="text-center">
                <tr>
                    <td colspan="4">
                        No: {{ $peleton->no }} | {{ $peleton->nama }}
                    </td>
                </tr>
                <tr>
                    <td>
                        Kode
                    </td>
                    <td>
                        Nama
                    </td>
                    <td>
                        Detail
                    </td>
                    <td style="width: 150px">
                        Action
                    </td>
                </tr>
            </thead>
            <tbody class="text-center">
                @foreach ($juris as $juri)
                    <tr>
                        <td>
                            {{ $juri->kode }}
                        </td>
                        <td>
                            {{ $juri->nama }}
                        </td>
                        <td>
                            {{ $juri->sub2 }} Penilaian
                        </td>
                        <td>
                            <a class="btn btn-primary w-100" href="{{ route('form-penilaian.indexPenilaian',['peleton'=>$peleton->id,'juri'=>$juri->id]) }}">Lihat penilaian</a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
@endsection

@push('scripts')
    
@endpush