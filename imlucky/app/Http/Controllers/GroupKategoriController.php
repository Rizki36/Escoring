<?php

namespace App\Http\Controllers;

use App\GroupJuri;
use App\Kategori;
use Illuminate\Http\Request;

class GroupKategoriController extends Controller
{
    public function list_group_kategori()
    {
        // return
        $group_juris = GroupJuri::with('kategoris')->withCount('kategoris')->get()->sortBy('kode');
        return view('admin.pralomba.group_kategori._list-group-kategori',['group_juris'=>$group_juris]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $list_group_kategori = $this->list_group_kategori();
        return view('admin.pralomba.group_kategori.index',['list_group_kategori'=>$list_group_kategori]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($group_juri)
    {
        $action      = route('group-kategori.store',['group_juri'=>$group_juri]);
        $group_juri  = GroupJuri::find($group_juri)->kategoris()->get();
        $kategori_id = $group_juri->pluck('id');
        $kategoris   = Kategori::all()->whereNotIn('id',$kategori_id);
        return view('admin.pralomba.group_kategori._form-group-kategori',['action'=>$action,'kategoris'=>$kategoris]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request,$group_juri)
    {
        $group_juri = GroupJuri::find($group_juri);
        $kategori   = $request->kategori;
        $group_juri->kategoris()->attach($kategori);
        return 'sukses';
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
    public function destroy($group_juri,$kategori)
    {
        $group_juri = GroupJuri::find($group_juri);
        $group_juri->kategoris()->detach($kategori);
        return 'sukses';
    }
}
