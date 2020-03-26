@foreach ($group_juris as $group_juri)
    @if ($group_juri->kategoris->count() > 0)
        @foreach ($group_juri->kategoris as $kategori)
            <tr class="text-center">
                @if ($loop->first)
                <td class=" align-middle" rowspan="{{ $group_juri->kategoris_count == 0 ? '1' : $group_juri->kategoris_count}}">
                    <span class="d-block">
                        {{ $group_juri->kategori }}
                    </span>
                    <small> {{-- hover-middle --}}
                        <a role="button" class="btn-add-group-kategori" href="{{ route('group-kategori.create',['group_juri'=>$group_juri->id]) }}">Tambah Kategori</a>
                    </small>
                </td>
                @endif
                <td class=" align-middle">
                    <span class="d-block">{{ $kategori->nama }}</span>
                    <small> {{-- hover-middle --}}
                        <a role="button" class="btn-delete-group-kategori" href="{{ route('group-kategori.destroy',['group_juri'=>$group_juri->id,'kategori'=>$kategori->id]) }}">Hapus</a>
                    </small>
                </td>
            </tr>
        @endforeach
    @else
        <tr class="text-center">
            <td class=" align-middle">
                <span class="d-block">
                    {{ $group_juri->kategori }}
                </span>
                <small>
                    <a role="button" class="btn-add-group-kategori" href="{{ route('group-kategori.create',['group_juri'=>$group_juri->id]) }}">Tambah Kategori</a>
                </small>
            </td>
            <td class=" align-middle">
                <span class="d-block"></span>
            </td>
        </tr>
    @endif
@endforeach