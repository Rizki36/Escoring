@foreach ($peletons as $peleton)
<tr class="text-center">
    <td class="align-middle">{{ $peleton->no }}</td>
    <td class="align-middle">{{ $peleton->nama }}</td>
    <td class="align-middle">{{ $peleton->ballot }}</td>
    <td class="align-middle"><a href="{{ route('ballot.edit',['id'=>$peleton->id]) }}" class="btn btn-edit-ballot btn-primary">Update</a></td>
</tr>
@endforeach