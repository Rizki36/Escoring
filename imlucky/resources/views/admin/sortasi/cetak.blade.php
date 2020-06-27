<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>
        @page {
            margin: 0cm 0cm;
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
                        {!! $judul ?? 'test' !!}
                    </td>
                </tr>
            </thead>
        </table>
        {!! $html !!}
    </body>
</html>