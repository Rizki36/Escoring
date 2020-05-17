<?php

namespace App\Http\Controllers;

use App\Peleton;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BallotController extends Controller
{

    public function indexPralomba()
    {
        $config = DB::table('config')->get()->keyBy('nama');
        $ballot = (object)[
            'umum'  => $config['ballot_umum']->value,
            'utama' => $config['ballot_utama']->value,
        ];
        return view('admin.pralomba.ballot.index')
                ->with('ballot',$ballot);
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

    // response list peleton dengan nilai ballot
    public static function listBallot()
    {
        $peletons = Peleton::all();
        return view('admin.ballot._list-ballot')
                ->with('peletons',$peletons);
    }

    public function index()
    {
        $peletons = $this->listBallot();
        return view('admin.ballot.index')
                ->with('peletons',$peletons);
    }

    public function edit($id)
    {
        $action = route('ballot.update',['id'=>$id]);
        $peleton = Peleton::find($id);
        return view('admin.ballot._form')
                    ->with('action',$action)
                    ->with('peleton',$peleton);   
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'ballot'=>'required|integer|min:0'
        ]);
        $peleton = Peleton::find($id);
        $peleton->ballot = $request->ballot;
        $peleton->save();
    }
}
