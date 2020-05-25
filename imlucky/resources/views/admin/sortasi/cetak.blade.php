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
        
        /* #logo{
            width:auto;
            height:90;
        } */
    </style>
    </head>
    <body>
        {!! $html !!}
    </body>
</html>