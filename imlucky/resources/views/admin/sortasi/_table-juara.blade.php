<table class="table table-sm table-bordered text-center">
    <thead>
        <tr>
            <td style="width: 250px">JUARA</td>
            <td>PELETON</td>
            <td>NILAI</td>
        </tr>
    </thead>
    <tbody>
        {{--  juara umum --}}
        <tr>
            <td>Juara Umum</td>
            <td>{{ $umum['peleton'] ?? '' }}</td>
            <td>{{ $umum['umum'] ?? ''}}</td>
        </tr>
        
        {{-- Juara utama --}}
        @foreach ($utama as $juaraUtama)                    
        <tr>
            <td>Juara Utama {{ $loop->index + 1 }}</td>
            <td>{{ $juaraUtama['peleton'] }}</td>
            <td>{{ $juaraUtama['utama'] }}</td>
        </tr>
        @endforeach

        @foreach ($juara as $peletons)
            @foreach ($peletons as $index => $peleton)
            <tr>
                <td>Best {{ $peleton->kategori }} {{ $index + 1 }}</td>
                <td>{{ $peleton->peleton }}</td>
                <td>{{ $peleton->nilai }}</td>
            </tr>
            @endforeach
        @endforeach
    </tbody>
</table>