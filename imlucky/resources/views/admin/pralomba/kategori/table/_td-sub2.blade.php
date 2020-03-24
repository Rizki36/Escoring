<td class="align-middle">
    <span class="d-block">{{ $nama }}</span>
    <small><a class="btn-edit-sub2" href="{{ route('sub2.edit',['kategori'=>$kategori,'sub'=>$sub,'sub2'=>$sub2]) }}">Edit</a> / <a class="btn-delete-sub2" href="{{ route('sub2.destroy',['kategori'=>$kategori,'sub'=>$sub,'sub2'=>$sub2]) }}">Hapus</a></small>
</td>
<td class="align-middle">{{ $kode }}</td>