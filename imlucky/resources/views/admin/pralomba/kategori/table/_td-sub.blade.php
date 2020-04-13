<td class = "align-middle" rowspan = "{{ $rowspan }}">
<span class = "d-block">{{ $nama }}</span>

<small class = "d-block">
    <a class = "btn-add-sub2"   href  = "{{ route('sub2.create',['kategori'=>$kategori, 'sub'=>$sub]) }}">Tambah Sub2</a> /
    <a class = "btn-edit-sub"   href  = "{{ route('sub.edit',['kategori'=>$kategori, 'sub'=>$sub]) }}">Edit</a> /
    <a class = "btn-delete-sub" href  = "{{ route('sub.destroy',['kategori'=>$kategori, 'sub'=>$sub]) }}">Hapus</a>
</small>

<small class="d-block">
    Kisaran Nilai
</small>

<small class="d-block">
    {{ $kisaran_nilai }}
</small>

</td>