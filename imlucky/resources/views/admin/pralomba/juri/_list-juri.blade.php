@foreach ($juris as $juri) 
<tr class="text-center">
    <th scope="row" class="align-middle">{{ $juri->kode }}</th>
    <td class="align-middle">{{ $juri->nama }}</td>
    <td class="align-middle">{{ $juri->password }}</td>
    <td class="align-middle">
        <a href="{{ route('juri.edit',['id'=>$juri->id]) }}" type="button" class="btn-edit-juri btn btn-link btn-sm inline-block">Edit</button>
        <a href="{{ route('juri.destroy',['id'=>$juri->id]) }}" type="button" class="btn-delete-juri btn btn-link btn-sm inline-block">Delete</a>
    </td>
</tr>
@endforeach