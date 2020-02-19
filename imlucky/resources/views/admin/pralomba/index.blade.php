@extends('layouts.master')
@section('content')
<div class="mt-4 mb-4 d-flex">
    <a id="btn-add-sekolah" href="{{ route('sekolah.create') }}" style="width: 180px;margin-right: 5px" class="btn bg-blue text-white">Tambah Sekolah</button>
    <a id="btn-add-juri" href="{{ route('juri.create') }}" style="width: 180px;margin-right: 5px" class="btn bg-orange text-white">Tambah Juri</button>
    <a id="btn-add-kategori" style="width: 180px;margin-right: 5px" class="btn bg-indigo text-white">Tambah Kategori</button>
    <a id="btn-add-penilaian" style="width: 180px;margin-right: 5px" class="btn bg-teal text-white">Buat Penilaian</a>
    <button class="btn ml-auto">Edit mode</button>
</div>


<table id="table-juri" class="table table-sm table-bordered" data-href="{{ route('pralomba.listJuri') }}">
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
        {!! $listJuri !!}
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
    class Crud{
        constructor(name,urlRefresh){
            // ,urlCreate,urlStore,urlEdit,urlUpdate,urlDestroy
            this.name = name;
            this.urlRefresh = urlRefresh;
            // this.urlCreate = urlCreate;
            // this.urlStore = urlStore;
            // this.urlEdit = urlEdit;
            // this.urlUpdate = urlUpdate;
            // this.urlDestroy = urlDestroy;
        }
        create(){
            let href = $(`#btn-add-${this.name}`).attr('href'),
                parent = this
            // alert(`#btn-add-${this.name}`)
            $.ajax({
                type: "Get",
                url: href,
                success: function (response) {
                    $('#modal-title').html('Tambah ' + parent.name)
                    $('#modal-body').html(response)
                    $('#modal').modal('show')
                    $('#btn-modal-submit').off('click').on('click',(e) => {
                        parent.store()
                    })        
                },error: function (response){
                    alert('Terjadi kesalahan, Lihat Console untuk detailnya')
                    console.log(response)
                }
            });
        }
        store(){
            let form = $('#form-'+this.name),
                data = $(form).serialize(),
                action = $(form).attr('action'),
                parent = this
            $.ajax({
                type: "POST",
                url: action,
                data: data,
                success: function (response) {
                    $('#modal').modal('hide');
                    Swal.fire(
                        'Success',
                        `${parent.name} berhasil ditambahkan!`,
                        'success'
                    )   
                    parent.refresh();
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
        edit(href){
            let parent = this
            $.ajax({
                type: "GET",
                url: href,
                success: function (response) {
                    $('#modal-title').html('Update '+parent.name)
                    $('#modal-body').html(response);
                    $('#btn-modal-submit').html('Update');
                    $('#modal').modal('show');
                    $('#btn-modal-submit').off('click').on('click',function(e){
                        parent.update()
                    })        
                },error(response){
                    alert('Terjadi kesalahan, Lihat Console untuk detailnya')
                    console.log(response);
                }
            });
        }
        update(){
            let form = $(`#form-${this.name}`),
                data = $(form).serialize(),
                action = $(form).attr('action'),
                parent = this
            $.ajax({
                type: "PUT",
                url: action,
                data: data,
                success: function (response) {
                    $('#modal').modal('hide');
                    Swal.fire(
                        'Updated',
                        `Update ${parent.name} berhasil!`,
                        'success'
                    )
                    parent.refresh()
                },error(response){
                    $.each(response.responseJSON.errors, function (index, value) { 
                        $('#'+index).addClass('is-invalid');
                        $('#'+index).siblings('.invalid-feedback').html(value);
                    });
                    console.log(response)
                }
            });
        }
        destroy(href){
            let parent = this
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
                    $.ajax({
                        type: "DELETE",
                        url: href,
                        success: function (response) {
                            parent.refresh()
                            // Swal if ajax success
                            Swal.fire(
                                'Deleted!',
                                `${parent.name} berhasil dihapus!`,
                                'success'
                            )        

                        },error(e){
                            Swal.fire(
                                'Error',
                                `${parent.name} gagal dihapus!`,
                                'error'
                            )
                            console.log(e);
                        }
                    });
                }
            })
            
        }
        refresh(){
            let parent = this
            $.ajax({
                type: "GET",
                url: parent.urlRefresh,
                success: function (response) {
                    $(`#table-${parent.name} tbody`).html(response);
                },error(e){
                    Swal.fire(
                        'Error',
                        `Gagal merefresh data ${parent.name}`,
                        'error'
                    )
                    console.log(e);
                }
            });
        }
    }
    let refreshSekolah = $('#table-sekolah').attr('data-href');
    let refreshJuri = $('#table-juri').attr('data-href');
    let sekolah = new Crud('sekolah',refreshSekolah);
    let juri = new Crud('juri',refreshJuri);

    $('#btn-add-sekolah').click(function (e) {
        e.preventDefault()
        sekolah.create()
    })    
    $('body').on('click','.btn-edit-sekolah',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        sekolah.edit(href)
    })
    $('body').on('click','.btn-delete-sekolah',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        sekolah.destroy(href)
    })

    
    $('#btn-add-juri').click(function (e) {
        e.preventDefault()
        juri.create()
    })    
    $('body').on('click','.btn-edit-juri',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        juri.edit(href)
    })
    $('body').on('click','.btn-delete-juri',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        juri.destroy(href)
    })

</script>
@endpush
