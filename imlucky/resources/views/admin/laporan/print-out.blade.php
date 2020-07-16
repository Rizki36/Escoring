<html>
<head>
    <title>Lembar Nilai {{ $data['peleton'] }}</title>
    <style>
        @page {
            margin: 0cm 0cm;
        }
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            /* text-transform: capitalize; */
            text-transform: uppercase;
        }
        /** Define now the real margins of every page in the PDF **/
        body {
            margin-top: 2cm;
            margin-left: 2cm;
            margin-right: 2cm;
            margin-bottom: 2cm;
        }

        .text-center {
            text-align: center;
        }

        .text-left {
            text-align: left;
        }

        table {
            /* border-collapse: collapse; */
            width: 100%;
        }

        table,
        td,
        th {
            border: 0.5px solid black;
            border-spacing: 0px;
        }

        .head {
            font-weight: bold;
            text-transform: uppercase;
        }

        .ttd{
            margin-top: 30mm;

        }
        .border-white, .border-white thead, .border-white thead tr, .border-white thead tr td {
            border-color: #fff !important;
            text-align: center;
        }
        .border-white thead tr td{
            padding-bottom: 10px;
        }
    </style>
</head>
<body>
    <table style="margin-bottom: 30px" class="border-white head">
        <thead>
            <tr>
                <td style="width: 150px">
                    <img width="100%" src="{{ base_path('public/images/logo-print.png') }}" alt="">
                </td>
                <td>
                    {!! nl2br(e($judul)) ?? 'test' !!}
                </td>
            </tr>
        </thead>
    </table>

    <table>
        <tbody>
            <tr class="head text-center">
                <td></td>
                <td>NOMOR UNDIAN</td>
                <td colspan="{{ $juri_lenght + 1 }}">{{ $data['no'] }}</td>
            </tr>
            <tr class="head text-center">
                <td></td>
                <td>PELETON</td>
                <td colspan="{{ $juri_lenght + 1 }}">{{ $data['peleton'] }}</td>
            </tr>
            <tr class="head text-center">
                <td colspan="2"></td>
                @for ($i = 0; $i < $juri_lenght; $i++)
                <td>JURI {{ $i + 1 }}</td>
                @endfor
                <td>TOTAL</td>
            </tr>
            
            @foreach ($data['penilaian'] as $kategori)
                <tr class="text-center">
                    {{-- 2 => column no dan peleton,  --}}
                    {{-- $juri_lenght => column juri,  --}}
                    {{-- 1=> column total --}}
                    <td class="head" colspan="{{ 2 + $juri_lenght + 1 }}">{{ $kategori['kategori'] }}</td>
                </tr>
                @foreach ($kategori['subs'] as $key_sub => $sub)
                    @if (count($kategori['subs']) > 1)
                        <tr>
                            <td class="head text-center">{{ $key_sub }}</td>
                                {{-- $juri_lenght => column juri,  --}}
                                {{-- 1=> column total --}}
                            <td class="head" colspan="{{ 1 + $juri_lenght +1 }}"> &nbsp;{{ $sub['sub'] }}</td>
                        </tr>
                    @endif
                    @foreach ($sub['sub2s'] as $key_sub2 => $sub2)
                        <tr>
                            <td class="text-center">{{ $loop->index + 1 }}</td>
                            <td>&nbsp;{{ $key_sub2 }}</td>
                            @for ($i = 0; $i < $juri_lenght; $i++)
                                @if (array_key_exists($i,$sub2))
                                    <td class="text-center">{{ $sub2[$i] }}</td>
                                @else
                                    @if ($loop->first)
                                        <td class="text-center" rowspan="{{ count($sub['sub2s']) }}">
                                        </td>
                                    @endif
                                @endif
                            @endfor
                            @if ($loop->first)
                                <td class="text-center" rowspan="{{ count($sub['sub2s']) }}">
                                    {{ $sub['total'] }}
                                </td>
                            @endif
                        </tr>
                    @endforeach
                @endforeach
            @endforeach

            @foreach ($data['penilaian'] as $kategori)
                <tr class="head text-center">
                    <td colspan="2">{{ $kategori['kategori'] }}</td>
                    <td colspan="{{ $juri_lenght + 1 }}">{{ $kategori['total'] }}</td>
                </tr>
                @endforeach
                <tr class="head text-center">
                    <td colspan="2">Pinalti</td>
                    <td colspan="{{ $juri_lenght + 1 }}">{{ $data['pinalti'] }}</td>
                </tr>
                <tr class="head text-center">
                    <td colspan="2">Jumlah Juara Utama</td>
                    <td colspan="{{ $juri_lenght + 1 }}">{{ $data['utama'] }}</td>
                </tr>
                <tr class="head text-center">
                    <td colspan="2">Jumlah Juara Umum</td>
                    <td colspan="{{ $juri_lenght + 1 }}">{{ $data['umum'] }}</td>
                </tr>
        </tbody>
    </table>
    <img style="margin-top: 30px" width="100%" src="{{ base_path('public/images/ttd.png') }}" alt="">
</body>
</html>