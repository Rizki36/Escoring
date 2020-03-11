<?php

namespace App\Http\Controllers;

use App\Juri;
use App\Kategori;
use App\Peleton;
use App\Sekolah;
use App\Sub;
use App\Sub2;
use Illuminate\Http\Request;

class PralombaController extends Controller
{
    public function listPeleton()
    {
        // $peleton = route('peleton.index');
        $peleton = Peleton::all()->sortBy('no');
        return view('admin.pralomba._list-peleton',['peletons'=>$peleton]);
    }

    public function listJuri()
    {
        // $juri = route('juri.index');
        $juri = Juri::all()->sortBy('kode');
        return view('admin.pralomba._list-juri',['juris'=>$juri]);
    }

    public function listKategori()
    {
        return
        $kategoris = Kategori::with('sub.sub2')->get();

        // $subs = Sub::all();
        // $sub2s = Sub2::all();
        // $kategori = array();
        // foreach ($kategoris as $kat => $katValue) {
        //     foreach ($subs as $sb => $Subalue) {
        //         foreach ($sub2s as $sb2 => $sub2Value) {
        //             $kategori[]
        //         }
        //     }
        // }
        return view('admin.pralomba._list-kategori',['kategoris'=>$kategori]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   
        $listJuri = $this->listJuri();
        $listPeleton = $this->listPeleton();
        $listKategori = $this->listKategori();
        return view('admin.pralomba.index',['listPeleton'=>$listPeleton,'listJuri'=>$listJuri,'listKategori'=>$listKategori]);
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
        //
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
