<?php

namespace App\Http\Controllers;

use App\GroupJuri;
use App\Juri;
use Illuminate\Http\Request;

class GroupJuriController extends Controller
{
    // response list group juri
    public function listGroupJuri()
    {
        $groupJuris = GroupJuri::all()->sortBy('kategori');
        return view('admin.pralomba.group_juri._list-group-juri')
                    ->with('groupJuris',$groupJuris);
    }

    public function index()
    {
        $groupJuris = $this->listGroupJuri();
        return view('admin.pralomba.group_juri.index')
                ->with('listGroupJuri',$groupJuris);   
    }

    public function create()
    {
        $action = route('group-juri.store');
        return view('admin.pralomba.group_juri._form-group-juri')
                ->with('action',$action);
    }

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

    // belum digunakan
    public function show($group_juri)
    {
        $groupJuri = Juri::where('group_juri_id',$group_juri)->get();
        return (array) $groupJuri;
    }

    public function edit($group_juri)
    {
        $action = route('group-juri.update',['id'=>$group_juri]);
        $groupJuri = GroupJuri::find($group_juri);
        return view('admin.pralomba.group_juri._form-group-juri')
                ->with('action',$action)
                ->with('groupJuri',$groupJuri);
    }

    public function update(Request $request, $group_juri)
    {
        $groupJuri = GroupJuri::find($group_juri);
        $groupJuri->kategori = $request->kategori;
        $groupJuri->save();
        return 'sukses';
    }

    public function destroy($group_juri)
    {
        GroupJuri::destroy($group_juri);
        return 'sukses';
    }
}
