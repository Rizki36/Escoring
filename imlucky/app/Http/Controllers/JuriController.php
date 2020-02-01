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
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $juri = new Juri;
        $juri->kode = 'juri1';
        $juri->nama = 'rizki fitra rahman';
        $juri->password = 'juri1';
        $juri->save();
        return 'halooo';
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
        $juri = Juri::find('juri3');
        $juri->kode = 'juri10';
        $juri->nama = 'rizki rahman rahman';
        $juri->password = '00';
        $juri->save();
        return 'halooo';
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Juri::destroy('juri10');
    }
}
