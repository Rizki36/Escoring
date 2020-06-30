@extends('admin.layouts.master')
@section('title')
    
@endsection

@section('content')

<form id="form-cetak" action="{{ route('sortasi.cetak') }}" method="post">
    <input id="html" type="hidden" name="html">     
    <input id="title" type="hidden" name="title">
    <input id="orientasi" type="hidden" name="orientasi">
    <input id="nama_file" type="hidden" name="nama_file">
    @csrf
</form>

<div class="card mt-4 wow fadeIn">
    <div class="card-header d-flex ">
        <b>Tabel Juara</b>
        <button data-nama="Daftar Juara" data-title="{!! $config['title_juara']->value !!}" class="btn btn-sm btn-primary ml-auto btn-cetak" data-orientasi="portrait">Cetak</button>
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
                {{--  juara umum --}}
                <tr>
                    <td>Juara Umum</td>
                    <td>{{ $umum['peleton'] }}</td>
                    <td>{{ $umum['umum'] }}</td>
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
    </div>
</div>

<div class="card mt-4 wow fadeIn">
    <div class="card-header d-flex ">
        <b>Tabel Sortasi</b>
        <button data-nama="Sortasi" data-title="{!! $config['title_sortasi']->value !!}" class="btn btn-sm btn-primary ml-auto btn-cetak" data-orientasi="landscape">Cetak</button>
    </div>
    <div class="card-body d-sm-flex justify-content-between">
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
</div>

@endsection

@push('scripts')
    <script>
        $('.btn-cetak').on('click', function () {
            const html = $(this).closest('.card').find('.card-body').html(),
                orientasi = $(this).attr('data-orientasi'),
                title = $(this).attr('data-title'),
                nama_file = $(this).attr('data-nama');
            
            $('#html').val(html);
            $('#orientasi').val(orientasi);
            $('#title').val(title);
            $('#nama_file').val(nama_file);
            $('#form-cetak').submit();
        });
    </script>
@endpush