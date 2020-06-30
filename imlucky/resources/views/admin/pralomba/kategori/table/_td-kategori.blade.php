<td class=" align-middle" rowspan="{{ $rowspan }}"> {{--  hover-container --}}
    <span class="d-block">{{ $nama }}</span>
    <small> {{-- hover-middle --}}
        <a role="button" class="btn-add-sub" href="{{ route('sub.create', ['kategori'=>$kategori]) }}"> Tambah Sub</a> /
        <a role="button" class="btn-edit-kategori" href="{{ route('kategori.edit',['kategori'=>$kategori]) }}"><i class="icon-edit"></i>Edit</a> /
        <a role="button" class="btn-delete-kategori" href="{{ route('kategori.destroy',['kategori'=>$kategori]) }}">Hapus</a>
    </small>
</td>    

<td class="align-middle" rowspan="{{ $rowspan }}"><small class="d-block">Umum: <br>{{ $umum }}%</small><small class="d-block">Utama: <br>{{ $utama }}%</small></td>