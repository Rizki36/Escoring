@foreach ($peletons as $peleton)

<tr class="text-center">
    <td class="align-middle">{{ $peleton->no }}</td>
    <td class="align-middle">{{ $peleton->nama }}</td>
    <td class="align-middle">{{ $peleton->pinalti }}</td>
    <td class="align-middle"><a href="{{ route('pinalti.edit',['id'=>$peleton->id]) }}" class="btn btn-edit-pinalti btn-primary">Update</a></td>
</tr>

@endforeach