<?php

namespace App\Http\Controllers;


use App\Peleton;
use Illuminate\Support\Facades\DB;
use PDF;

class LaporanController extends Controller
{
    public function printout($no)
    {
        $data = DataController::list($no);
        $juri_lenght = DataController::juri_lenght($data);

        $judul_default = DB::table('config')->where('nama','title_laporan_default')->first()->value;
        $judul = DB::table('config')->where('nama','title_laporan')->first()->value;
        $judul === '' ? $judul=$judul_default : '';

        $pdf = PDF::loadView('admin.laporan.print-out',['judul'=>$judul,'data'=>$data,'juri_lenght'=>$juri_lenght])->setPaper('a4','portrait')->setWarnings(false);
        return $pdf->stream('Lembar Nilai No.'.$data['no'] . ' ' . $data['peleton'].'.pdf');

        return view('admin.laporan.print-out')
        ->with('judul',$judul)
                ->with('data',$data)
                ->with('juri_lenght',$juri_lenght);
    }

    public function index()
    {
        $peletons = Peleton::all();
        

        return view('admin.laporan.index')
                ->with('peletons',$peletons);
    }
}
