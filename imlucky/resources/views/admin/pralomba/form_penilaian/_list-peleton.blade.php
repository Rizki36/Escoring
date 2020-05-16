@foreach ($peletons as $peleton)
<tr>
    <td class="align-middle">
        {{ $peleton->no }}        
    </td>
    <td class="align-middle">
        {{ $peleton->nama }}  
    </td>
    <td class="align-middle">
        {{ $peleton->sub2 }} penilaian
    </td>
    <td class="align-middle">
        <a href="{{ route('form-penilaian.indexJuri', ['peleton'=>$peleton->id]) }}" role="button" class="btn btn-primary w-100">Lihat Penilaian</a>        
    </td>
</tr>
@endforeach