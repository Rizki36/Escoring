<tr class="text-center">
    <td class="hover-container align-middle" rowspan="3">
        <div class="hover-middle">
            <a role="button" class="btn btn-sm btn-success d-block" href=""> + Sub</a>
            <a role="button" class="btn btn-sm btn-warning" href=""><i class="icon-edit"></i>Edit</a>
            <a role="button" class="btn btn-sm btn-danger" href="">Hapus</a>
        </div>
        <span class="d-block">PBB</span>
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

@foreach ($kategoris as $kategori)
<tr class="text-center" style="min-height: 200px">
    <td class="hover-container align-middle" rowspan="">
        <div class="hover-middle">
            <a role="button" class="btn-add-sub btn btn-sm btn-success d-block" href="{{ route('sub.create',['kategori'=>$kategori->kode]) }}"> + Sub</a>
            <a role="button" class="btn-edit-kategori btn btn-sm btn-warning" href="{{ route('kategori.edit',['id'=>$kategori->kode]) }}"><i class="icon-edit"></i>Edit</a>
            <a role="button" class="btn-delete-kategori btn-sm btn-danger" href="{{ route('kategori.destroy',['id'=>$kategori->kode]) }}">Hapus</a>
        </div>
        <span class="d-block">{{ $kategori->nama }}</span>
    </td>
    <td class="align-middle" rowspan="">80</td>
    <td class="align-middle" rowspan="">
        <span class="d-block">sub</span>
        <small><a href="">Edit</a> / <a href="">Hapus</a></small>
    </td>
    <td class="align-middle">
        <span class="d-block">iuhisgdfishfisudhfiudhiuh</span>
        <small><a href="">Edit</a> / <a href="">Hapus</a></small>
    </td>
    <td class="align-middle">Ka01</td>
</tr>
@endforeach 