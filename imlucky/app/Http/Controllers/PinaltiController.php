<?php

namespace App\Http\Controllers;

use App\Peleton;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PinaltiController extends Controller
{
    // return peleton dengan nilai pinalti
    public function listPinalti()
    {
        $peletons = Peleton::all();
    
        return view('admin.pinalti._list-pinalti')
                ->with('peletons',$peletons);
    }

    public function index()
    {
        $peletons = $this->listPinalti();
    
        return view('admin.pinalti.index')
                ->with('peletons',$peletons);    
    }

    public function indexPralomba()
    {
        $config = DB::table('config')->get()->keyBy('nama');
        $pinalti = (object) [
            'umum' =>$config['pinalti_umum']->value,
            'utama'=>$config['pinalti_utama']->value,
        ];
    
        return view('admin.pralomba.pinalti.index')
                ->with('pinalti',$pinalti);
    }

    public function updatePralomba(Request $request)
    {
        $request->validate([
            'pinalti_umum'=>'required|integer|min:0',
            'pinalti_utama'=>'required|integer|min:0'
        ]);

        DB::table('config')
            ->where('nama','pinalti_umum')
            ->update(['value'=>$request->pinalti_umum]);
        DB::table('config')
            ->where('nama','pinalti_utama')
            ->update(['value'=>$request->pinalti_utama]);

        return redirect()->back()->with('status','Update data berhasil');
    }

    public function edit($id)
    {
        $action = route('pinalti.update',['id'=>$id]);   
        $peleton = Peleton::find($id);

        return view('admin.pinalti._form',['peleton'=>$peleton,'action'=>$action]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'pinalti'=>'required|integer'
        ]);
        $peleton = Peleton::find($id);
        $peleton->pinalti = $request->pinalti;
        $peleton->save();
        
        return 'sukses';
    }

}
