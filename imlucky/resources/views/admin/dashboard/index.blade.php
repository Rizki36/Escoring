@extends('admin.layouts.master')

@section('title')
    
@endsection

@section('content')

    <div class="card mt-3">
        <div class="card-body">
            <canvas id="chart" height="50px" width="100%"></canvas>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-2">
            <div class="callout callout-info">
                <small class="text-muted">Kategori</small><br>
                <strong class="h4">{{ $dataHeader->kategori }}</strong>
            </div>
        </div>
        <div class="col-2">
            <div class="callout callout-info">
                <small class="text-muted">Penilaian</small><br>
                <strong class="h4">{{ $dataHeader->penilaian }}</strong>
            </div>
        </div>
        <div class="col-2">
            <div class="callout callout-info">
                <small class="text-muted">Juri</small><br>
                <strong class="h4">{{ $dataHeader->juri }}</strong>
            </div>
        </div>
        <div class="col-2">
            <div class="callout callout-info">
                <small class="text-muted">Peleton</small><br>
                <strong class="h4">{{ $dataHeader->peleton }}</strong>
            </div>
        </div>
    </div>

    <div class="card mt-3">
        <div class="card-body">
            @include('admin.sortasi._table-juara')
        </div>
    </div>
    <div class="card mt-3">
        <div class="card-body">
            @include('admin.sortasi._table-sortasi')
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        let label = @json($dataChart->label),
            utama = @json($dataChart->utama),
            umum  = @json($dataChart->umum),
            ctx   = document.getElementById('chart').getContext('2d');

        const data = 
        {
            labels: label,
            datasets: [{
                label: 'Nilai umum',
                backgroundColor: Chart.helpers.color(chartColors.red).alpha(0.5).rgbString(),
                borderColor: chartColors.red,
                borderWidth: 1,
                data: umum
            }, {
                label: 'Nilai Utama',
                backgroundColor: Chart.helpers.color(chartColors.blue).alpha(0.5).rgbString(),
                borderColor: chartColors.blue,
                data: utama
            }]
        };

        
        const option = 
        {
            indexAxis: 'y',
            elements: {
                rectangle: {
                    borderWidth: 2,
                }
            },
            responsive: true,
            legend: {
                position: 'top',
            },
            title: {
                display: false,
                text: 'Chart.js Horizontal Bar Chart'
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        };
        
        
        var myChart = new Chart(ctx, 
        {
            type: 'bar',
            data: data,
            options: option
        });
    </script>
@endpush