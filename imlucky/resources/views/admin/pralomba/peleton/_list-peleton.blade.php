@foreach($peletons as $peleton) 
<tr class="text-center">
    <th scope="row" class="align-middle">{{ $peleton->no }}</th>
    <td class="align-middle">{{ $peleton->nama }}</td>
    <td class="align-middl print-d-none">
        <a href="{{ route('peleton.edit',['no'=>$peleton->no]) }}" class="btn-edit-peleton btn btn-link btn-sm inline-block">Edit</button>
        <a href="{{ route('peleton.destroy',['no'=>$peleton->no]) }}" class="btn-delete-peleton btn btn-link btn-sm inline-block">Delete</a>
    </td>
</tr>
@endforeach