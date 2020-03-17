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
        $kategoris = Kategori::with('sub.sub2')->get();
     
        for ($i=0; $i < count($kategoris); $i++) { 
            $kategoris[$i]->rowspan = $kategoris[$i]->sub->sum(function($sub){
                return $sub->sub2->count() == 0 ? 1 : $sub->sub2->count();
            });
            for ($ii=0; $ii < count($kategoris[$i]->sub); $ii++) { 
                $kategoris[$i]->sub[$ii]->rowspan = $kategoris[$i]->sub[$ii]->sub2->count() == 0 ? 1 : $kategoris[$i]->sub[$ii]->sub2->count();            
                $kategoris[$i]->sub[$ii]->idsub2 = $kategoris[$i]->kode . $kategoris[$i]->sub[$ii]->kode;           
                for ($iii=0; $iii < count($kategoris[$i]->sub[$ii]->sub2); $iii++) { 
                    $kategoris[$i]->sub[$ii]->sub2[$iii]->idsub2 = $kategoris[$i]->kode . $kategoris[$i]->sub[$ii]->kode . $kategoris[$i]->sub[$ii]->sub2[$iii]->kode;           
                }
            }
        }
    
        return 
        // $kategoris;
        view('admin.pralomba._list-kategori',['kategoris'=>$kategoris]);
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
