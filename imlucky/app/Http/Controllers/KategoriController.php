<?php

namespace App\Http\Controllers;

use App\Kategori;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class KategoriController extends Controller
{

    public function listKategori()
    {
        $kategoris = Kategori::with('sub.sub2')->get()->sortBy('kode');
        $kategoris = $this->addKode($kategoris);
        return 
        view('admin.pralomba.kategori._list-kategori',['kategoris'=>$kategoris]);
    }

    public function addKode($kategoris)
    {
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
        return $kategoris;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listKategori = $this->listKategori();
        return view('admin.pralomba.kategori.index',['listKategori'=>$listKategori]);
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
            'kode'=>'required|string|min:1|max:1|unique:kategoris,kode',
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
     * @param  int  $kategori
     * @return \Illuminate\Http\Response
     */
    public function show($kategori)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $kategori
     * @return \Illuminate\Http\Response
     */
    public function edit($kategori)
    {
        $action = route('kategori.update',['kategori'=>$kategori]);
        $kategori = Kategori::where('kode',$kategori)->first();

        return view('admin.pralomba.kategori._form-kategori')
                    ->with('kategori',$kategori)
                    ->with('action',$action);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $kategori
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $kategori)
    {
        $request->validate([
            'kode'=>'bail|required|string|min:1|max:1|unique:kategoris,kode,'.$kategori.',kode',
            'nama'=>'required|string'
        ]);
        $kategori= Kategori::where('kode',$kategori)->first();
        $kategori->kode = $request->kode;
        $kategori->nama = $request->nama;
        $kategori->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $kategori
     * @return \Illuminate\Http\Response
     */
    public function destroy($kategori)
    {
        Kategori::where('kode',$kategori)->delete();
    }

}
