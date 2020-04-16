<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BallotController extends Controller
{
    public function indexPralomba()
    {
        $config = DB::table('config')->get()->keyBy('nama');
        $ballot = [
            'umum'  => $config['ballot_umum']->value,
            'utama' => $config['ballot_utama']->value,
        ];

        return view('admin.pralomba.ballot.index',['ballot'=> (object) $ballot]);
    }

    public function updatePralomba(Request $request)
    {
        $request->validate([
            'ballot_umum'=>'required|integer|min:0',
            'ballot_utama'=>'required|integer|min:0'
        ]);
        DB::table('config')
            ->where('nama','ballot_umum')
            ->update(['value'=>$request->ballot_umum]);
        DB::table('config')
            ->where('nama','ballot_utama')
            ->update(['value'=>$request->ballot_utama]);
        return redirect()->back()->with('status','Update data berhasil');
    }

    public function index()
    {
        return 'test';
    }

}
