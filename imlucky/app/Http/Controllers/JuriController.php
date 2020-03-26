<?php

namespace App\Http\Controllers;

use App\GroupJuri;
use App\Juri;
use Illuminate\Http\Request;

class JuriController extends Controller
{
    public function listJuri()
    {
        // return
        $juri = Juri::with('group_juri')->get()->sortBy('kode');
        return view('admin.pralomba.juri._list-juri',['juris'=>$juri]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listJuri = $this->listJuri();
        return view('admin.pralomba.juri.index',['listJuri'=>$listJuri]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $action      = route('juri.store');
        $group_juris = GroupJuri::all();
        return view('admin.pralomba.juri._form-juri',['action'=>$action,'group_juris'=>$group_juris]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
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
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $action = route('juri.update',['id'=>$id]);
        $juri = Juri::find($id);

        return view('admin.pralomba.juri._form-juri',['action'=>$action,'juri'=>$juri]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
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
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Juri::destroy($id);
    }
}
