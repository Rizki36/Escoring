<?php

namespace App\Http\Controllers;


use App\Peleton;

class LaporanController extends Controller
{
    public function printout($no)
    {
        $array = DataController::list($no);
        $juri_lenght = DataController::juri_lenght($array);

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
