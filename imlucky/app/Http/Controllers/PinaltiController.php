<?php

namespace App\Http\Controllers;

use App\Peleton;
use Illuminate\Http\Request;

class PinaltiController extends Controller
{
    public function listPinalti()
    {
        $peletons = Peleton::all();
        return view('admin.pinalti._list-pinalti',['peletons'=>$peletons]);
    }

    public function index()
    {
        $peletons = $this->listPinalti();
        return view('admin.pinalti.pinalti',['peletons'=>$peletons]);    
    }

    public function edit($id)
    {
        $action = route('pinalti.update',['id'=>$id]);   
        $peleton = Peleton::find($id);
        return view('admin.pinalti._form',['peleton'=>$peleton,'action'=>$action]);
    }

    public function update(Request $request, $id)
    {
        $peleton = Peleton::find($id);
        $peleton->pinalti = $request->pinalti;
        $peleton->save();
        
    }

}
