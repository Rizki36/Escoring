<?php

namespace App\Http\Controllers;

use App\Kategori;
use Illuminate\Http\Request;

class KategoriController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->store(new Request);
        // $this->destroy('a');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $action = route('kategori.store');
        return view('admin.pralomba.kategori._form-kategori',['action'=>$action]);
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
            'kode'=>'bail|unique:kategoris|required|string|min:1|max:1',
            'nama'=>'required|string'
        ]);
        $kategori = new Kategori;

        $kategori->kode = $request->kode;
        $kategori->nama = $request->nama;
        $kategori->save();
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
        $kategori = Kategori::find($id);
        // dd($kategori);
        $action = route('kategori.update',['id'=>$id]);
        return view('admin.pralomba.kategori._form-kategori')
            ->with('kategori',$kategori)
            ->with('action',$action);
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
            'kode'=>'bail|required|string|min:1|max:1|unique:kategoris,id,'.$id.',id',
            'nama'=>'required|string'
        ]);
        $kategori = Kategori::find($id);
        $kategori->nama = $request->nama;
        $kategori->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Kategori::destroy($id);
    }

    public function attachSub()
    {   
        
    }
}
