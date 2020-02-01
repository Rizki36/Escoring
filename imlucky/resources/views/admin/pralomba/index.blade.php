@extends('layouts.master')
@section('content')
<div class="mt-4 mb-4 d-flex">
    <button style="width: 180px;margin-right: 5px" class="btn bg-blue text-white">Tambah Sekolah</button>
    <button style="width: 180px;margin-right: 5px" class="btn bg-indigo text-white">Tambah Kategori</button>
    <button style="width: 180px;margin-right: 5px" class="btn bg-teal text-white">Tambah Juri</button>
    <button style="width: 180px;margin-right: 5px" class="btn bg-teal text-white">Buat Penilaian</button>
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

<table id="table-pleton" class="table table-sm table-bordered">
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
        <tr class="text-center">
            <th scope="row" class="align-middle">1</th>
            <td class="align-middle">Mark</td>
            <td class="align-middle">
                <button type="button" class="btn btn-link btn-sm inline-block">Edit</button>
                <button type="button" class="btn btn-link btn-sm inline-block">Delete</button>
            </td>
        </tr>
        <tr class="text-center">
            <th scope="row" class="align-middle">1</th>
            <td class="align-middle">Mark</td>
            <td class="align-middle">
                <button type="button" class="btn btn-link btn-sm inline-block">Edit</button>
                <button type="button" class="btn btn-link btn-sm inline-block">Delete</button>
            </td>
        </tr>
        <tr class="text-center">
            <th scope="row" class="align-middle">1</th>
            <td class="align-middle">Mark</td>
            <td class="align-middle">
                <button type="button" class="btn btn-link btn-sm inline-block">Edit</button>
                <button type="button" class="btn btn-link btn-sm inline-block">Delete</button>
            </td>
        </tr>
        <tr class="text-center">
            <th scope="row" class="align-middle">1</th>
            <td class="align-middle">Mark</td>
            <td class="align-middle">
                <button type="button" class="btn btn-link btn-sm inline-block">Edit</button>
                <button type="button" class="btn btn-link btn-sm inline-block">Delete</button>
            </td>
        </tr>
    </tbody>
</table>
@endsection