@foreach ($peletons as $peleton)
    <tr class="text-center">
        <td class="align-middle" >{{ $peleton->no }}</td>
        <td class="align-middle" >{{ $peleton->nama }}</td>
        <td class="align-middle" ><a href="{{ route('laporan.printout',['no'=>$peleton->no]) }}" class="btn btn-primary w-100">Print</a></td>
    </tr>
@endforeach