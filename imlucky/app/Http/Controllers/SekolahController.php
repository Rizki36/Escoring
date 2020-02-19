<?php

namespace App\Http\Controllers;

use App\Sekolah;
use Illuminate\Http\Request;

class SekolahController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $this->store(new Request);   
        // $this->update(new Request,1);   
        // $this->destroy(2);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $action = route('sekolah.store');
        return view('admin.pralomba._form-sekolah',['action'=>$action]);
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
            'id'=>'bail|required|unique:sekolahs|integer',
            'nama' =>'required|string'
        ]);
        $sekolah = new Sekolah;
        $sekolah->id = $request->id;
        $sekolah->nama = $request->nama;
        $sekolah->ballot = 0;
        $sekolah->pinalti = 0;
        $sekolah->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // return view('pralomba._form-sekolah');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $action = route('sekolah.update',['id'=>$id]);
        $sekolah = Sekolah::find($id);
        return view('admin.pralomba._form-sekolah',['sekolah'=>$sekolah,'action'=>$action]);
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
        $request->validate([
            'id'=>'bail|required|integer|unique:sekolahs,id,'.$id,
            'nama' =>'required|string'
        ]);
        $sekolah = Sekolah::find($id);
        $sekolah->id = $request->id;
        $sekolah->nama = $request->nama;
        $sekolah->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Sekolah::destroy($id);
    }
}
