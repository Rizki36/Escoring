@extends('layouts.master')
@section('content')
<div class="mt-4 mb-4 d-flex">
    <a id="btn-add-sekolah" href="{{ route('sekolah.create') }}" style="width: 180px;margin-right: 5px" class="btn bg-blue text-white">Tambah Sekolah</button>
    <a id="btn-add-juri" style="width: 180px;margin-right: 5px" class="btn bg-orange text-white">Tambah Juri</button>
    <a id="btn-add-kategori" style="width: 180px;margin-right: 5px" class="btn bg-indigo text-white">Tambah Kategori</button>
    <a id="btn-add-penilaian" style="width: 180px;margin-right: 5px" class="btn bg-teal text-white">Buat Penilaian</a>
    <button class="btn ml-auto">Edit mode</button>
</div>


<table id="table-juri" class="table table-sm table-bordered">
    <thead>
        <tr>
            <th class="text-center" colspan="4">List Juri</th>
        </tr>
        <tr class="text-center">
            <th scope="col">kode</th>
            <th scope="col">Nama</th>
            <th scope="col">Password</th>
            <th scope="col">Action</th>
        </tr>
    </thead>
    <tbody>
        <tr class="text-center">
            <th scope="row" class="align-middle">J1</th>
            <td class="align-middle">Mark</td>
            <td class="align-middle">J1</td>
            <td class="align-middle">
                <button type="button" class="btn btn-link btn-sm inline-block">Edit</button>
                <button type="button" class="btn btn-link btn-sm inline-block">Delete</button>
            </td>
        </tr>
        <tr class="text-center">
            <th scope="row" class="align-middle">J2</th>
            <td class="align-middle">Mark</td>
            <td class="align-middle">J1</td>
            <td class="align-middle">
                <button type="button" class="btn btn-link btn-sm inline-block">Edit</button>
                <button type="button" class="btn btn-link btn-sm inline-block">Delete</button>
            </td>
        </tr>
        <tr class="text-center">
            <th scope="row" class="align-middle">J3</th>
            <td class="align-middle">Mark</td>
            <td class="align-middle">J1</td>
            <td class="align-middle">
                <button type="button" class="btn btn-link btn-sm inline-block">Edit</button>
                <button type="button" class="btn btn-link btn-sm inline-block">Delete</button>
            </td>
        </tr>
    </tbody>
</table>

<table id="table-kategori" class="table table-sm table-bordered">
    <thead>
        <tr>
            <th class="text-center" colspan="5">List Kategori</th>
        </tr>
        <tr class="text-center">
            <th scope="col" style="width: 10%">Kategori</th>
            <th scope="col" style="width: 1px">%</th>
            <th scope="col" style="width: 20%">Sub</th>
            <th scope="col">Sub2</th>
            <th scope="col" style="width: 1px">kode</th>
        </tr>
    </thead>
    <tbody>
        <tr class="text-center">
            <td class="align-middle" rowspan="3">
                <span class="d-block">PBB</span>
                <small><a href="">Edit</a> / <a href="">Hapus</a></small>
            </td>
            <td class="align-middle" rowspan="3">80</td>
            <td class="align-middle" rowspan="2">
                <span class="d-block">Gerakan Ditempat</span>
                <small><a href="">Edit</a> / <a href="">Hapus</a></small>
            </td> 
            <td class="align-middle">
                <span class="d-block">iuhisgdfishfisudhfiudhiuh</span>
                <small><a href="">Edit</a> / <a href="">Hapus</a></small>
            </td>
            <td class="align-middle">Ka01</td>
        </tr>
        <tr class="text-center">            
            <td class="align-middle">
                <span class="d-block">iuhisgdfishfisudhfiudhiuh</span>
                <small><a href="">Edit</a> / <a href="">Hapus</a></small>
            </td>
            <td class="align-middle">Ka02</td>
        </tr>
        <tr class="text-center">
            <td class="align-middle">
                <span class="d-block">Gerakan Pindah Tempat</span>
                <small><a href="">Edit</a> / <a href="">Hapus</a></small>
            </td> 
            <td class="align-middle">
                <span class="d-block">iuhisgdfishfisudhfiudhiuh</span>
                <button type="button" class="btn btn-link btn-sm inline-block">Edit</button>
                <button type="button" class="btn btn-link btn-sm inline-block">Delete</button>
            </td>
            <td class="align-middle">Ka03</td>
        </tr>

        <tr class="text-center">
            <td class="align-middle" rowspan="3">
                <span class="d-block">PBB</span>
                <small><a href="">Edit</a> / <a href="">Hapus</a></small>
            </td>
            <td class="align-middle" rowspan="3">80</td>
            <td class="align-middle" rowspan="2">
                <span class="d-block">Gerakan Ditempat</span>
                <small><a href="">Edit</a> / <a href="">Hapus</a></small>
            </td> 
            <td class="align-middle">
                <span class="d-block">iuhisgdfishfisudhfiudhiuh</span>
                <small><a href="">Edit</a> / <a href="">Hapus</a></small>
            </td>
            <td class="align-middle">Ka01</td>
        </tr>
        <tr class="text-center">            
            <td class="align-middle">
                <span class="d-block">iuhisgdfishfisudhfiudhiuh</span>
                <small><a href="">Edit</a> / <a href="">Hapus</a></small>
            </td>
            <td class="align-middle">Ka02</td>
        </tr>
        <tr class="text-center">
            <td class="align-middle">
                <span class="d-block">Gerakan Pindah Tempat</span>
                <small><a href="">Edit</a> / <a href="">Hapus</a></small>
            </td> 
            <td class="align-middle">
                <span class="d-block">iuhisgdfishfisudhfiudhiuh</span>
                <button type="button" class="btn btn-link btn-sm inline-block">Edit</button>
                <button type="button" class="btn btn-link btn-sm inline-block">Delete</button>
            </td>
            <td class="align-middle">Ka03</td>
        </tr>
    </tbody>
</table>

<table id="table-sekolah" class="table table-sm table-bordered" data-href="{{ route('pralomba.listSekolah') }}">
    <thead>
        <tr>
            <th class="text-center" colspan="3">List Pleton</th>
        </tr>
        <tr class="text-center">
            <th scope="col" style="width: 1px">No</th>
            <th scope="col">Peleton</th>
            <th scope="col" style="width: 15%">Action</th>
        </tr>
    </thead>
    <tbody>
        {!! $listSekolah !!}
    </tbody>
</table>
@include('common.modal')
@endsection

@push('scripts')
<script>
    let refreshSekolah = $('#table-sekolah').attr('data-href');

    $('#btn-add-sekolah').click(function (e) { 
        e.preventDefault();
        let href = $(this).attr('href');
        sekolahStore(href);
    });
    function sekolahStore(href){
        $.ajax({
            type: "GET",
            url: href,
            success: function (response) {
                $('#modal-body').html(response);
                $('#modal-title').html('Tambah Pleton');
                $('#btn-modal-submit').html('Submit');
                $('#modal').modal('show');
                $('#btn-modal-submit').off('click').on('click',function(e){
                    e.preventDefault();
                    ajaxSekolahStore();
                })
            },error(e){
                console.log(e)
            }
        });
    }
    function ajaxSekolahStore(){
        let form = $('#form-sekolah'),
            data = $(form).serialize(),
            action = $(form).attr('action');
        $.ajax({
            type: "POST",
            url: action,
            data: data,
            success: function (response) {
                $('#modal').modal('hide');
                Swal.fire(
                    'Success',
                    'Pleton berhasil ditambahkan!',
                    'success'
                )   
                refreshListSekolah();
            },error(response){
                $.each(response.responseJSON.errors, function (index, value) { 
                     $('#'+index).addClass('is-invalid');
                    //  console.log('#'+index + ' .invalid-feedback')
                     $('#'+index).siblings('.invalid-feedback').html(value);
                });
                console.log(response)
            }
        });
    }
    
    $('body').on('click','.btn-edit-sekolah',function(e){
        e.preventDefault();
        let href = $(this).attr('href');
        sekolahUpdate(href);
    })
    function sekolahUpdate(href){
        $.ajax({
            type: "GET",
            url: href,
            success: function (response) {
                $('#modal-title').html('Update Pleton')
                $('#modal-body').html(response);
                $('#btn-modal-submit').html('Update');
                $('#modal').modal('show');
                $('#btn-modal-submit').off('click').on('click',function(e){
                    ajaxSekolahUpdate();
                })        
            },error(response){
                console.log(response);
            }
        });
        
    }
    function ajaxSekolahUpdate(){
        let form = $('#form-sekolah'),
            data = $(form).serialize(),
            action = $(form).attr('action');
        $.ajax({
            type: "PUT",
            url: action,
            data: data,
            success: function (response) {
                $('#modal').modal('hide');
                Swal.fire(
                    'Updated',
                    'Update pleton berhasil!',
                    'success'
                )
                refreshListSekolah();
            },error(response){
                $.each(response.responseJSON.errors, function (index, value) { 
                     $('#'+index).addClass('is-invalid');
                     $('#'+index).siblings('.invalid-feedback').html(value);
                });
                console.log(response)
            }
        });
    }

    $('body').on('click','.btn-delete-sekolah',function(e){
        e.preventDefault();
        let href = $(this).attr('href');
        sekolahDestroy(href);
    });
    function sekolahDestroy(href){
        // Swal question
        Swal.fire({
            title: 'Apakah kamu yakin?',
            text: "Kamu akan menghapus pleton!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes'
            }).then((result) => {
            // action if answer is true
            if (result.value) {
                // ajax delete sekolah
                ajaxSekolahDistroy(href);
            }
        })
    }
    function ajaxSekolahDistroy(href){
        $.ajax({
            type: "DELETE",
            url: href,
            success: function (response) {
                refreshListSekolah();
                // Swal if ajax success
                Swal.fire(
                    'Deleted!',
                    'Pleton berhasil dihapus!',
                    'success'
                )        

            },error(e){
                Swal.fire(
                    'Error',
                    'Pleton gagal dihapus!',
                    'error'
                )
                console.log(e);
            }
        });
    }

    function refreshListSekolah(){
        $.ajax({
            type: "GET",
            url: refreshSekolah,
            success: function (response) {
                $('#table-sekolah tbody').html(response);
            },error(e){
                Swal.fire(
                    'Error',
                    'Gagal merefresh data pleton!',
                    'error'
                )
                console.log(e);
            }
        });
    }
</script>
@endpush