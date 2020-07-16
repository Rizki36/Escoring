<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Juri;
use App\Kategori;
use App\Peleton;
use App\Sub2;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $dataHeader = [
            'kategori' => Kategori::all(['id'])->count(),
            'penilaian' => Sub2::all(['id'])->count(),
            'juri' => Juri::all(['id'])->count(),
            'peleton' => Peleton::all(['no'])->count(),
        ];

        $kategoris = Kategori::all(['kode','nama'])->sortBy('kode')->toArray();
        $juara = DataController::juara();
        $utama = DataController::utama();
        $umum = DataController::umum();
        $sortasi = DataController::list();
        $config = DB::table('config')->get(['nama','value'])->keyBy('nama');

        $dataChart = [
            'utama' => DataController::list()->pluck('utama')->toArray(),
            'umum' => DataController::list()->pluck('umum')->toArray(),
            'label' => DataController::list()->pluck('peleton')->toArray()
        ];


        return view('admin.dashboard.index')
                ->with('kategoris',$kategoris)
                ->with('utama',$utama)
                ->with('umum',$umum)
                ->with('config',$config)
                ->with('juara',$juara)
                ->with('sortasi',$sortasi)
                ->with('dataChart',(object) $dataChart)
                ->with('dataHeader',(object) $dataHeader);

        }

}
