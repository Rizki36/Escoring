@foreach($sekolahs as $sekolah) 
<tr class="text-center">
    <th scope="row" class="align-middle">{{ $sekolah->id }}</th>
    <td class="align-middle">{{ $sekolah->nama }}</td>
    <td class="align-middle">
        <a href="{{ route('sekolah.edit',['id'=>$sekolah->id]) }}" class="btn-edit-sekolah btn btn-link btn-sm inline-block">Edit</button>
        <a href="{{ route('sekolah.destroy',['id'=>$sekolah->id]) }}" class="btn-delete-sekolah btn btn-link btn-sm inline-block">Delete</a>
    </td>
</tr>
@endforeach