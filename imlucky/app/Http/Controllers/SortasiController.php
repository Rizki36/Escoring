<?php

namespace App\Http\Controllers;

use App\Kategori;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpKernel\DataCollector\DataCollector;

class SortasiController extends Controller
{
    public function index()
    {
        $juara = DataController::juara();
        $persetase_ballot = DB::table('config')
                                ->where('nama','=','ballot_umum')
                                ->orWhere('nama','=','ballot_utama')
                                ->get()
                                ->keyBy('nama');
        $kategoris = Kategori::all(['kode','nama'])->sortBy('kode')->toArray();        
        $sortasi  = DataController::list();

        return view('admin.sortasi.index')
                    ->with('kategoris',$kategoris)
                    ->with('sortasi',$sortasi)
                    ->with('persentase_ballot',$persetase_ballot)
                    ->with('juara',$juara);
    }
}
