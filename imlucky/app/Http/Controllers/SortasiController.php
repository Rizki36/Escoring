<?php

namespace App\Http\Controllers;

use App\Kategori;
use Barryvdh\DomPDF\PDF as DomPDFPDF;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpKernel\DataCollector\DataCollector;
use PDF;

class SortasiController extends Controller
{
    public function index()
    {
        $config = DB::table('config')->get(['nama','value'])->keyBy('nama');

        $juara = DataController::juara();
        $utama = DataController::utama();
        $umum = DataController::umum();
        return
        $sortasi  = DataController::list();

        $kategoris = Kategori::all(['kode','nama'])->sortBy('kode')->toArray();
        return view('admin.sortasi.index')
                    ->with('kategoris',$kategoris)
                    ->with('config',$config)
                    ->with('umum',$umum)
                    ->with('utama',$utama)
                    ->with('juara',$juara)
                    ->with('sortasi',$sortasi);
    }

    public function cetak(Request $request)
    {
        $html = $request->input('html','data kosong');
        $title = $request->input('title','Judul');
        $nama_file = $request->input('nama_file','Document');
        $orientasi = $request->input('orientasi','portrait');
        $pdf = PDF::loadView('admin.sortasi.cetak',['html'=>$html,'title'=>$title])->setPaper('a4',$orientasi)->setWarnings(false);
        return $pdf->stream($nama_file.'.pdf');
    }
}
