@foreach ($penilaians as $penilaian)
<tr>
    <td>
        {{ $penilaian->kategori }}
    </td>
    <td>
        {{ $penilaian->sub }}
    </td>

    <td>
        {{ $penilaian->sub2 }}
    </td>
    <td>
        {{ $penilaian->nilai }}
    </td>
    <td>
        <a class="btn-edit-penilaian btn btn-primary w-100" href="{{ route('form-penilaian.edit',[
                                'peleton'=>$data->peleton_id,
                                'juri'=> $data->juri_id,
                                'kategori'=> $penilaian->kategori_id,
                                'sub'=> $penilaian->sub_id,
                                'sub2'=> $penilaian->sub2_id
                                ])}}">Edit</a>
    </td>
</tr>
@endforeach