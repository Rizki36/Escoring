@extends('layouts.master')

@section('title')
    
@endsection

@section('content')
    @if($data->validated)
        @if (session('status'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('status') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
        @endif
        <div class="card mt-4 wow fadeIn">
            <div class="card-header d-flex">
                <a id="btn-generate" class="btn btn-success btn-sm ml-auto" href="{{ route('form-penilaian.generate') }}">Generate Form Penilaian</a>
                <a id="url-truncate" class="d-none" href="{{ route('form-penilaian.truncate') }}"></a>    
            </div>

            <div class="card-body d-sm-flex justify-content-between">
                <table id="" class="table table-sm table-bordered" data-href="">
                    <thead class="text-center">
                        <tr>
                            <td colspan="4">
                                List Form Penilaian
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 75px">
                                No
                            </td>
                            <td>
                                Peleton
                            </td>
                            <td style="width: 300px">
                                Detail
                            </td>
                            <td style="width: 150px">
                                Action
                            </td>
                        </tr>
                    </thead>
                    <tbody id="table-peleton" class="text-center">
                        {{ view('admin.pralomba.form_penilaian._list-peleton',['peletons'=>$peletons]) }}
                    </tbody>
                </table>
            </div>
        </div>
    @else
        {{ $data->message }}
    @endif
@endsection

@push('scripts')
    <script>
        let url_truncate = $("#url-truncate").attr('href')
        
        $('#btn-generate').on('click',function(e){
            e.preventDefault()
            let url_generate = $(this).attr('href')
            console.log(url_generate)
            Swal.fire({
                title: 'Apakah anda yakin?',
                text: "Menggenerate form penilaian akan menghapus semua penilaian yang ada dan menggantikan dengan yang baru",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Generate!'
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        type: "GET",
                        url: url_truncate,
                        success: function (response) {
                            window.location.href = url_generate   
                        }
                    })        
                }
            })
        })
        
    </script>
@endpush