@extends('admin.layouts.master')
@section('title')
    
@endsection

@section('content')

<form id="form-cetak" action="{{ route('sortasi.cetak') }}" method="post">
    <input id="html" type="hidden" name="html" value="">     
    <input id="orientasi" type="hidden" name="orientasi">
    @csrf
</form>

<div class="card mt-4 wow fadeIn">
    <div class="card-header d-flex ">
        <b>Tabel Juara</b>
        <button class="btn btn-sm btn-primary ml-auto btn-cetak" data-orientasi="landscape">Cetak</button>
    </div>
    <div class="card-body d-sm-flex justify-content-between">
        <table class="table table-sm table-bordered text-center">
            <thead>
                <tr>
                    <td style="width: 250px">JUARA</td>
                    <td>PELETON</td>
                    <td>NILAI</td>

                </tr>
            </thead>
            <tbody>
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
    </div>
</div>

<div class="card mt-4 wow fadeIn">
    <div class="card-header d-flex ">
        <b>Tabel Sortasi</b>
        <button class="btn btn-sm btn-primary ml-auto btn-cetak" data-orientasi="landscape">Cetak</button>
    </div>
    <div class="card-body d-sm-flex justify-content-between">
        <table class="table table-sm table-bordered">
            <thead class="text-center">
                <tr>
                    <td class="align-middle" rowspan="2">No</td>
                    <td class="align-middle" rowspan="2">Sekolah</td>
                    <td class="align-middle" colspan="{{ count($kategoris) + 1 }}">NILAI ORI</td>
                    <td class="align-middle" rowspan="2">PINALTI</td>
                    <td class="align-middle" rowspan="2">NILAI UMUM</td>
                    <td class="align-middle" rowspan="2">NILAI UTAMA</td>
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
                    <td>{{ $peleton_value['umum']  + $peleton_value['ballot'] * $persentase_ballot['ballot_umum']->value/100 }}</td>
                    <td>{{ $peleton_value['utama'] + $peleton_value['ballot'] * $persentase_ballot['ballot_utama']->value/100 }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

@endsection

@push('scripts')
    <script>
        $('.btn-cetak').on('click', function () {
            const html = $(this).closest('.card').find('.card-body').html(),
                orientasi = $(this).attr('data-orientasi');
            
            $('#html').val(html);
            $('#orientasi').val(orientasi);
            $('#form-cetak').submit();
        });
    </script>
@endpush