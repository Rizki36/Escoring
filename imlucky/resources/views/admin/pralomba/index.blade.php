@extends('layouts.master')
@section('content')
<div class="mt-4 mb-4 d-flex">
    <a id="btn-add-peleton" href="{{ route('peleton.create') }}" style="width: 180px;margin-right: 5px" class="btn bg-blue text-white">Tambah Peleton</button>
    <a id="btn-add-juri" href="{{ route('juri.create') }}" style="width: 180px;margin-right: 5px" class="btn bg-orange text-white">Tambah Juri</button>
    
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

<table id="table-kategori" class="table table-sm table-bordered" data-href="{{ route('pralomba.listKategori') }}">
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
        {!! $listKategori !!}
    </tbody>
    <tfoot>
        <tr><td colspan="5"><a id="btn-add-kategori" style="width: 100%;margin-right: 5px" class="btn bg-indigo text-white" href="{{ route('kategori.create') }}">Tambah Kategori</button></td></tr>
    </tfoot>
</table>

<table id="table-peleton" class="table table-sm table-bordered" data-href="{{ route('pralomba.listPeleton') }}">
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
        {!! $listPeleton !!}
    </tbody>
</table>
@include('common.modal')
@endsection

@push('scripts')

<script>
    class Crud{
        constructor(name,urlRefresh){
            this.name = name
            this.urlRefresh = urlRefresh
        }
        create(href){
            let parent = this
            $.ajax({
                type: "Get",
                url: href,
                success: (response) => {
                    $('#modal-title').html('Tambah ' + parent.name)
                    $('#modal-body').html(response)
                    $('#modal').modal('show')
                    $('#btn-modal-submit').off('click').on('click',(e) => {
                        parent.store()
                    })        
                },error: (response) => {
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
            console.log(data)
            $.ajax({
                type: "POST",
                url: action,
                data: data,
                success: function (response) {
                    $('#modal').modal('hide')
                    Swal.fire(
                        'Success',
                        `${parent.name} berhasil ditambahkan!`,
                        'success'
                    )   
                    parent.refresh()
                },error(response){
                    $.each(response.responseJSON.errors, function (index, value) { 
                            $('#'+index).addClass('is-invalid')
                        //  console.log('#'+index + ' .invalid-feedback')
                            $('#'+index).siblings('.invalid-feedback').html(value)
                    })
                    console.log(response)
                }
            })
        }
        edit(href){
            let parent = this
            $.ajax({
                type: "GET",
                url: href,
                success: function (response) {
                    $('#modal-title').html('Update '+parent.name)
                    $('#modal-body').html(response)
                    $('#btn-modal-submit').html('Update')
                    $('#modal').modal('show')
                    $('#btn-modal-submit').off('click').on('click',function(e){
                        parent.update()
                    })        
                },error(response){
                    alert('Terjadi kesalahan, Lihat Console untuk detailnya')
                    console.log(response)
                }
            })
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
                    $('#modal').modal('hide')
                    Swal.fire(
                        'Updated',
                        `Update ${parent.name} berhasil!`,
                        'success'
                    )
                    parent.refresh()
                },error(response){
                    $.each(response.responseJSON.errors, function (index, value) { 
                        $('#'+index).addClass('is-invalid')
                        $('#'+index).siblings('.invalid-feedback').html(value)
                    });
                    console.log(response)
                }
            });
        }
        destroy(href){
            let parent = this
            Swal.fire({
                title: 'Apakah kamu yakin?',
                text: `Kamu akan menghapus ${parent.name}!`,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes'
                }).then((result) => {
                // action if answer is true
                if (result.value) {
                    // ajax delete peleton
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
                            console.log(e)
                        }
                    })
                }
            })
            
        }
        refresh(){
            let parent = this
            $.ajax({
                type: "GET",
                url: parent.urlRefresh,
                success: function (response) {
                    $(`#table-${parent.name} tbody`).html(response)
                },error(e){
                    Swal.fire(
                        'Error',
                        `Gagal merefresh data ${parent.name}`,
                        'error'
                    )
                    console.log(e)
                }
            });
        }
    }
    let refreshPeleton = $('#table-peleton').attr('data-href'),
        peleton = new Crud('peleton',refreshPeleton);

    $('#btn-add-peleton').click(function (e) {
        e.preventDefault()
        let href = $(this).attr('href')
        peleton.create(href)
    })    
    $('body').on('click','.btn-edit-peleton',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        peleton.edit(href)
    })
    $('body').on('click','.btn-delete-peleton',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        peleton.destroy(href)
    })

    
    let refreshJuri = $('#table-juri').attr('data-href'),
        juri = new Crud('juri',refreshJuri)

    $('#btn-add-juri').click(function (e) {
        e.preventDefault()
        let href = $(this).attr('href')
        juri.create(href)
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
    
    let refreshKategori = $('#table-kategori').attr('data-href'),
        kategori = new Crud('kategori', refreshKategori)

    $('body').on('click', '#btn-add-kategori', function (e) {
        e.preventDefault()
        let href = $(this).attr('href')
        kategori.create(href)
    })
    $('body').on('click','.btn-edit-kategori',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        kategori.edit(href)
    })
    $('body').on('click','.btn-delete-kategori',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        kategori.destroy(href)
    })
   
    let sub = new Crud('sub',refreshKategori)

    $('body').on('click', '.btn-add-sub', function (e) {
        e.preventDefault()
        let href = $(this).attr('href')
        sub.create(href)
    })
    $('body').on('click','.btn-edit-sub',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        sub.edit(href)
    })
    $('body').on('click','.btn-delete-sub',function(e){
        e.preventDefault()
        let href = $(this).attr('href')
        sub.destroy(href)
    })
    

</script>
<script>
</script>
@endpush
