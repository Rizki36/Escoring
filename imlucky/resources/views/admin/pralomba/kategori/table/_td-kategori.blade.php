<td data-kategori="" class="hover-container align-middle" rowspan="{{ $rowspan }}">
    <div class="hover-middle">
        <a role="button" class="btn-add-sub btn btn-sm btn-success d-block" href="{{ route('sub.create',['kategori'=>$kode]) }}"> + Sub</a>
        <a role="button" class="btn-edit-kategori btn btn-sm btn-warning" href="{{ route('kategori.edit',['id'=>$kode]) }}"><i class="icon-edit"></i>Edit</a>
        <a role="button" class="btn-delete-kategori btn-sm btn-danger" href="{{ route('kategori.destroy',['id'=>$kode]) }}">Hapus</a>
    </div>
    <span class="d-block">{{ $nama }}</span>
</td>    
<td data-nilai="" class="align-middle" rowspan="{{ $rowspan }}">nil</td>