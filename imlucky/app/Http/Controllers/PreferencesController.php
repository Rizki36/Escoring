<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Alert;

class PreferencesController extends Controller
{
    public function index()
    {
        $config = DB::table('config')->get(['nama','value'])->keyBy('nama');
        return view('admin.pralomba.preferences.index')
                    ->with('config',$config);
    }

    public function post(Request $request)
    {
        DB::table('config')->where('nama','title_laporan')->update(['value'=>$request->lembar_laporan]);
        DB::table('config')->where('nama','title_sortasi')->update(['value'=>$request->lembar_sortasi]);
        DB::table('config')->where('nama','title_juara')->update(['value'=>$request->lembar_juara]);
        Alert::success('Berhasil','Pengaturan berhasil diterapkan');
        return redirect()->back();
    }
}
