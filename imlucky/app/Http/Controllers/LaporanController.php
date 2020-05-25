<?php

namespace App\Http\Controllers;


use App\Peleton;
use PDF;

class LaporanController extends Controller
{
    public function printout($no)
    {
        $array = DataController::list($no);
        $juri_lenght = DataController::juri_lenght($array);
        
        $pdf = PDF::loadView('admin.laporan.print-out',['data'=>$array,'juri_lenght'=>$juri_lenght])->setPaper('a4','landscape')->setWarnings(false);
        return $pdf->stream();

        return view('admin.laporan.print-out')
                ->with('data',$array)
                ->with('juri_lenght',$juri_lenght);
    }

    public function index()
    {
        $peletons = Peleton::all();
        

        return view('admin.laporan.index')
                ->with('peletons',$peletons);
    }
}
