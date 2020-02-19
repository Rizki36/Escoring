<?php

namespace App\Http\Controllers;

use App\Juri;
use Illuminate\Http\Request;

class JuriController extends Controller
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
        // $this->destroy(1);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $action = route('juri.store');
        return view('admin.pralomba._form-juri',['action'=>$action]);
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
            'password' =>'required|string'
        ]);
        $juri = new Juri;
        $juri->kode = $request->kode;
        $juri->nama = $request->nama;
        $juri->password = $request->password;
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
        $action = route('juri.update');
        $juri = Juri::find($id);

        return view('admin.pralomba._form-juri',['action'=>$action,'juri'=>$juri]);
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
            'kode'=>'bail|required|string|unique:juris,kode,'.$id,
            'nama' =>'required|string',
            'password' =>'required|string'
        ]);
        $juri = Juri::find($id);
        $juri->kode = $request->id;
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
