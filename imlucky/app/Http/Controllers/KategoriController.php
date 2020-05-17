<?php

namespace App\Http\Controllers;

use App\Kategori;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class KategoriController extends Controller
{
    // return list kategori
    public function listKategori()
    {
        $kategoris = Kategori::with('sub.sub2')->get()->sortBy('kode');
        $kategoris = $this->addKode($kategoris);

        return view('admin.pralomba.kategori._list-kategori')
                ->with('kategoris',$kategoris);
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

    public function index()
    {
        $listKategori = $this->listKategori();
        return view('admin.pralomba.kategori.index')
                ->with('listKategori',$listKategori);
    }

    public function create()
    {
        $action = route('kategori.store');        
        return view('admin.pralomba.kategori._form-kategori')
                ->with('action',$action);
    }

    public function store(Request $request)
    {
        $request->validate([
            'kode'=>'required|string|min:1|max:1|unique:kategoris,kode',
            'nama'=>'required|string',
            'bobot_umum' =>'required|integer|min:0',
            'bobot_utama'=>'required|integer|min:0',
        ]);
        $kategori = new Kategori;

        $kategori->kode = $request->kode;
        $kategori->nama = $request->nama;
        $kategori->bobot_umum  = $request->bobot_umum;
        $kategori->bobot_utama = $request->bobot_utama;
        
        $kategori->save();
        return 'sukses';
    }

    public function show($kategori)
    {
        //
    }

    public function edit($kategori)
    {
        $action = route('kategori.update',['kategori'=>$kategori]);
        $kategori = Kategori::where('kode',$kategori)->first();

        return view('admin.pralomba.kategori._form-kategori')
                    ->with('kategori',$kategori)
                    ->with('action',$action);
    }

    public function update(Request $request, $kategori)
    {
        $request->validate([
            'kode'=>'bail|required|string|min:1|max:1|unique:kategoris,kode,'.$kategori.',kode',
            'nama'=>'required|string',
            'bobot_umum' =>'required|integer|min:0',
            'bobot_utama'=>'required|integer|min:0',
        ]);
        $kategori= Kategori::where('kode',$kategori)->first();
        $kategori->kode = $request->kode;
        $kategori->nama = $request->nama;
        $kategori->bobot_umum  = $request->bobot_umum;
        $kategori->bobot_utama = $request->bobot_utama;
        $kategori->save();
        return 'sukses';
    }

    public function destroy($kategori)
    {
        Kategori::where('kode',$kategori)->delete();
        return 'sukses';
    }

}
