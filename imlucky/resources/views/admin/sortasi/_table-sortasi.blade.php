<div class="table-responsive">
<table class="table table-sm table-bordered">
    <thead class="text-center">
        <tr>
            <td class="align-middle" rowspan="2">No</td>
            <td class="align-middle" rowspan="2">Sekolah</td>
            <td class="align-middle" colspan="{{ count($kategoris) + 1 }}">NILAI ORI</td>
            <td class="align-middle" rowspan="2">PINALTI</td>
            <td class="align-middle" rowspan="2">NILAI<br>UMUM</td>
            <td class="align-middle" rowspan="2">NILAI<br>UTAMA</td>
        </tr>
        <tr>
            @foreach ($kategoris as $kategori)
            <td>{{ $kategori['nama'] }}</td>
            @endforeach
            <td>Ballot</td>
        </tr>
    </thead>
    <tbody>
        @foreach ($sortasi as $peleton_id => $peleton_value)
        <tr class="text-center">
            <td>{{ $peleton_id }}</td>
            <td>{{ $peleton_value['peleton'] }}</td>
            @foreach ($kategoris as $kategori)
                <td>
                    {{ array_key_exists($kategori['kode'],$peleton_value['penilaian']) ? $peleton_value['penilaian'][$kategori['kode']]['total'] : ''}}
                </td>
            @endforeach
            <td>{{ $peleton_value['ballot'] }}</td>
            <td>{{ $peleton_value['pinalti'] }}</td>
            <td>{{ $peleton_value['umum']  + $peleton_value['ballot'] * $config['ballot_umum']->value/100 }}</td>
            <td>{{ $peleton_value['utama'] + $peleton_value['ballot'] * $config['ballot_utama']->value/100 }}</td>
        </tr>
        @endforeach
    </tbody>
</table>
</div>
