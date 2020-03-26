<?php

namespace App\Http\Controllers;

use App\GroupJuri;
use App\Juri;
use Illuminate\Http\Request;

class GroupJuriController extends Controller
{
    public function listGroupJuri()
    {
        $groupJuris = GroupJuri::all()->sortBy('kategori');
        // return $groupJuris;
        return view('admin.pralomba.group_juri._list-group-juri',['groupJuris'=>$groupJuris]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $groupJuris = $this->listGroupJuri();
        return view('admin.pralomba.group_juri.index',['listGroupJuri'=>$groupJuris]);   
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $action = route('group-juri.store');
        return view('admin.pralomba.group_juri._form-group-juri',['action'=>$action]);
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
            'kategori'=>'required|string'
        ]);
        $groupJuri           = new GroupJuri;
        $groupJuri->kategori = $request->kategori;
        $groupJuri->save();
        return 'sukses';
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\GroupJuri  $groupJuri
     * @return \Illuminate\Http\Response
     */
    public function show($group_juri)
    {
        $groupJuri = Juri::where('group_juri_id',$group_juri);
        return print_r($groupJuri);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\GroupJuri  $groupJuri
     * @return \Illuminate\Http\Response
     */
    public function edit($group_juri)
    {
        $action = route('group-juri.update',['id'=>$group_juri]);
        $groupJuri = GroupJuri::find($group_juri);
        return view('admin.pralomba.group_juri._form-group-juri',['action'=>$action,'groupJuri'=>$groupJuri]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\GroupJuri  $groupJuri
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $group_juri)
    {
        $groupJuri = GroupJuri::find($group_juri);
        $groupJuri->kategori = $request->kategori;
        $groupJuri->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\GroupJuri  $groupJuri
     * @return \Illuminate\Http\Response
     */
    public function destroy($group_juri)
    {
        GroupJuri::destroy($group_juri);
        return 'sukses';
    }
}
