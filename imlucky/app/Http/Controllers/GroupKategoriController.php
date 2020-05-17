<?php

namespace App\Http\Controllers;

use App\GroupJuri;
use App\Kategori;
use Illuminate\Http\Request;

class GroupKategoriController extends Controller
{
    // response list group kategori
    public function list_group_kategori()
    {
        $group_juris = GroupJuri::with('kategoris')->withCount('kategoris')->get()->sortBy('kode');
        return view('admin.pralomba.group_kategori._list-group-kategori')
                ->with('group_juris',$group_juris);
    }

    public function index()
    {
        $list_group_kategori = $this->list_group_kategori();
        return view('admin.pralomba.group_kategori.index')
                ->with('list_group_kategori',$list_group_kategori);
    }

    public function create($group_juri)
    {
        $action      = route('group-kategori.store',['group_juri'=>$group_juri]);
        $group_juri  = GroupJuri::find($group_juri)->kategoris()->get();
        $kategori_id = $group_juri->pluck('id');
        $kategoris   = Kategori::all()->whereNotIn('id',$kategori_id);

        return view('admin.pralomba.group_kategori._form-group-kategori')
                ->with('action',$action)
                ->with('kategoris',$kategoris);
    }

    public function store(Request $request,$group_juri)
    {
        $group_juri = GroupJuri::find($group_juri);
        $kategori   = $request->kategori;
        $group_juri->kategoris()->attach($kategori);
        
        return 'sukses';
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($group_juri,$kategori)
    {
        $group_juri = GroupJuri::find($group_juri);
        $group_juri->kategoris()->detach($kategori);
        return 'sukses';
    }

}
