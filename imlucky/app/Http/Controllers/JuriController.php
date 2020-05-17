<?php

namespace App\Http\Controllers;

use App\GroupJuri;
use App\Juri;
use App\Peleton;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JuriController extends Controller
{
    // response list juri
    public function listJuri()
    {
        $juri = Juri::with('group_juri')->get()->sortBy('kode');
        return view('admin.pralomba.juri._list-juri')
                ->with('juris',$juri);
    }

    public function index()
    {
        $listJuri = $this->listJuri();
        return view('admin.pralomba.juri.index',['listJuri'=>$listJuri]);
    }

    public function create()
    {
        $action      = route('juri.store');
        $group_juris = GroupJuri::all();
        return view('admin.pralomba.juri._form-juri')
                ->with('action',$action)
                ->with('group_juris',$group_juris);
    }

    public function store(Request $request)
    {
        $request->validate([
            'kode'=>'bail|required|string|unique:juris',
            'nama' =>'required|string',
            'password' =>'required|string',
            'group_juri'=>'required|integer'
        ]);
        $juri                = new Juri;
        $juri->kode          = $request->kode;
        $juri->nama          = $request->nama;
        $juri->password      = $request->password;
        $juri->group_juri_id = $request->group_juri;
        $juri->save();
        return 'sukses';
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $action = route('juri.update',['id'=>$id]);
        $juri = Juri::find($id);

        return view('admin.pralomba.juri._form-juri')
                ->with('action',$action)
                ->with('juri',$juri);
    }

    public function update(Request $request, $id)
    {
        $juri = Juri::find($id);
        $request->validate([
            'id'=>'unique:juris,id,'.$id.',id',
            'kode'=>'required|string|unique:juris,kode,'.$juri->kode.',kode',
            'nama' =>'required|string',
            'password' =>'required|string'
        ]);
        $juri = Juri::find($id);
        $juri->kode = $request->kode;
        $juri->nama = $request->nama;
        $juri->password = $request->password;
        $juri->save();
        return 'sukses';
    }

    public function destroy($id)
    {
        Juri::destroy($id);
        return 'sukses';
    }

}
