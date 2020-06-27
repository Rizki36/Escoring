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
        $juara = DataController::juara();
        $persetase_ballot = DB::table('config')
                                ->where('nama','=','ballot_umum')
                                ->orWhere('nama','=','ballot_utama')
                                ->get()
                                ->keyBy('nama');
        $kategoris = Kategori::all(['kode','nama'])->sortBy('kode')->toArray();        
        $sortasi  = DataController::list();
        $umum = $sortasi->sortByDesc('umum')->values()->first();
        // dd($umum);
        $utama = $sortasi->sortByDesc('utama')->values()->take(3);
        return view('admin.sortasi.index')
                    ->with('kategoris',$kategoris)
                    ->with('sortasi',$sortasi)
                    ->with('persentase_ballot',$persetase_ballot)
                    ->with('umum',$umum)
                    ->with('utama',$utama)
                    ->with('juara',$juara);
    }
    public function cetak(Request $request)
    {
        // $pdf = App::make('dompdf.wrapper');
        $html = $request->input('html','data kosong');
        $title = $request->input('title','download.pdf');
        $orientasi = $request->input('orientasi','portrait');
        $pdf = PDF::loadView('admin.sortasi.cetak',['html'=>$html])->setPaper('a4',$orientasi)->setWarnings(false);
        return $pdf->stream($title);
        // $pdf->loadHTML($html)->setPaper('a4')->setWarnings(false)->save('myfile.pdf');
        // return $pdf->stream();
    }
}
