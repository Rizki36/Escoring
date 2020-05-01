@extends('admin.layouts.master')

@section('title')
    
@endsection

@section('content')
    <table id="table" class="table table-sm table-bordered mt-4" data-href="{{ route('form-penilaian.table',['peleton'=>$data->peleton_id,'juri'=>$data->juri_id]) }}">
            <thead class="text-center">
                <tr>
                    <td colspan="5">
                        No: {{ $data->no }} | Juri : {{ $data->kode }} | {{ $data->peleton }}
                    </td>
                </tr>
                <tr>
                    <td>
                        kategori
                    </td>
                    <td>
                        sub
                    </td>
                    <td>
                        sub2
                    </td>
                    <td>
                        Nilai
                    </td>
                    <td style="width: 150px">
                        Action
                    </td>
                </tr>
            </thead>
            
            <tbody class="text-center">
                {{ view('admin.pralomba.form_penilaian._listPenilaian',['penilaians'=>$data->penilaian,'data'=>$data]) }}
            </tbody>
        </table>
    @include('common.modal')
@endsection

@push('scripts')
    <script>
        let penilaian = new Crud('penilaian')
        $('body').on('click','.btn-edit-penilaian',function(e){
            e.preventDefault()
            let href = $(this).attr('href')
            penilaian.edit(href)
        })
    </script>
@endpush