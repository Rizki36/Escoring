@foreach ($juris as $juri) 
<tr class="text-center">
    <th scope="row" class="align-middle">{{ $juri->kode }}</th>
    <td class="align-middle">{{ $juri->nama }}</td>
    <td class="align-middle">{{ $juri->password }}</td>
    <td class="align-middle">
        <a href="{{ route('juri.edit',['id'=>$juri->kode]) }}" type="button" class="btn-edit-juribtn btn-link btn-sm inline-block">Edit</button>
        <a href="{{ route('juri.destroy',['id'=>$juri->kode]) }}" type="button" class="btn-delete-juribtn btn-link btn-sm inline-block">Delete</a>
    </td>
</tr>
@endforeach