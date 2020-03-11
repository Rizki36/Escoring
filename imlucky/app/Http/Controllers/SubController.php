<?php

namespace App\Http\Controllers;

use App\Kategori;
use App\Sub;
use Illuminate\Http\Request;

class SubController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // return 'halo';
        // $request = new Request;
        // $request->kode=1;
        // $request->nama='test';
        // return $this->create(1);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($kategori)
    {
        $action = route('sub.store',['kategori'=>1]);
        return  view('admin.pralomba.kategori._form-sub',['kategori'=>$kategori,'action'=>$action]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request,$kategori)
    {
        $kategori  = Kategori::find($kategori);
        $request->validate([
            'kode'     => 'bail|required|string|max:2|min:2',
            'nama'     => 'string'
            ]);
            $sub       = new Sub;
        $sub->kode = $request->kode;
        $sub->nama = $request->nama;
        $kategori->sub()->save($sub);
        return 'berhasil';
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
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
