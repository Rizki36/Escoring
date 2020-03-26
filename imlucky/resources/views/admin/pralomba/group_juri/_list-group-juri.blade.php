@foreach ($groupJuris as $groupsJuri) 
<tr class="text-center">
    <td class="align-middle">{{ $groupsJuri->kategori }}</td>
    <td class="align-middle">
        <a href="{{ route('group-juri.edit',['id'=>$groupsJuri->id]) }}" type="button" class="btn-edit-group-juri btn btn-link btn-sm inline-block">Edit</button>
        <a href="{{ route('group-juri.destroy',['id'=>$groupsJuri->id]) }}" type="button" class="btn-delete-group-juri btn btn-link btn-sm inline-block">Delete</a>
    </td>
</tr>
@endforeach