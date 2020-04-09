<html>
<head>
    <title>Document</title>
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
            border-collapse: collapse;
            width: 100%;
        }

        table,
        td,
        th {
            border: 1px solid black;
        }

        .head {
            font-weight: bold;
            text-transform: uppercase;
        }

        .ttd{
            margin-top: 30mm;
            /* position: relative; */
            /* display: inline-block; */
        }
        .border-white{
            border-color: #fff
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th colspan="{{ $data['length'] + 3 }}">LEMBAR PENILAIAN</th>
            </tr>
            <tr>
                <th colspan="{{ $data['length'] + 3 }}">TES</th>
            </tr>
            <tr>
                <th colspan="{{ $data['length'] + 3 }}">GERAK KREATIVITAS GENERASI MUDA PASKIBRA</th>
            </tr>
            
            <tr class="head text-center">
                <td></td>
                <td>NOMOR UNDIAN</td>
                <td colspan="{{ $data['length'] + 1 }}">{{ $data['no'] }}</td>
            </tr>
            <tr class="head text-center">
                <td></td>
                <td>PELETON</td>
                <td colspan="{{ $data['length'] + 1 }}">{{ $data['peleton'] }}</td>
            </tr>
            
            <tr class="head text-center">
                <td colspan="2"></td>
                @for ($i = 0; $i < $data['length']; $i++)
                <td>JURI {{ $i + 1 }}</td>
                @endfor
                <td>TOTAL</td>
            </tr>
        </thead>
        <tbody>
            
            @foreach ($data['penilaian'] as $kategori)
                <tr class="text-center">
                    {{-- 2 => column no dan peleton,  --}}
                    {{-- $data['length'] => column juri,  --}}
                    {{-- 1=> column total --}}
                    <td class="head" colspan="{{ 2 + $data['length'] + 1 }}">{{ $kategori['kategori'] }}</td>
                </tr>
                @foreach ($kategori['subs'] as $key_sub => $sub)
                    @if (count($kategori['subs']) > 1)
                        <tr>
                            <td class="head text-center">{{ $key_sub }}</td>
                                {{-- $data['length'] => column juri,  --}}
                                {{-- 1=> column total --}}
                            <td class="head" colspan="{{ 1 + $data['length'] +1 }}"> &nbsp;{{ $sub['sub'] }}</td>
                        </tr>
                    @endif
                    @foreach ($sub['sub2s'] as $key_sub2 => $sub2)
                        <tr>
                            <td class="text-center">{{ $loop->index + 1 }}</td>
                            <td>&nbsp;{{ $key_sub2 }}</td>
                            @for ($i = 0; $i < $data['length']; $i++)
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
                    <td colspan="{{ $data['length'] + 1 }}">{{ $kategori['total'] }}</td>
                </tr>
                @endforeach
                <tr class="head text-center">
                    <td colspan="2">Jumlah Juara Utama</td>
                    <td colspan="{{ $data['length'] + 1 }}">{{ $data['utama'] }}</td>
                </tr>
                <tr class="head text-center">
                    <td colspan="2">Jumlah Juara Umum</td>
                    <td colspan="{{ $data['length'] + 1 }}">{{ $data['umum'] }}</td>
                </tr>
        </tbody>
    </table>
</body>
</html>