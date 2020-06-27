<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Imports\PeletonsImport;
use App\Peleton;
use Excel;

class PeletonController extends Controller
{
    public function formImport()
    {

        return view('admin.pralomba.peleton._form-import');
    }

    public function postFormImport(Request $request)
    {
        $data['peletons'] = Excel::toArray(new PeletonsImport, request()->file('excel'))[0];
        $messages = [
            'peletons.*.NO.required' => 'Kolom NO perlu diisi.',
            'peletons.*.NO.unique' => 'NO peleton suda dipakai.',
            'peletons.*.NAMA.required' => 'Kolom NAMA perlu diisi.',
        ];
        $validator = Validator::make($data,[
            'peletons.*.NO' => 'required|unique:peletons,no'
        ],$messages);
        
        if ($validator->fails()) {
            
            // dd($validator->errors());
        }
        return 'sukses';
    }

    // return list peleton
    public function listPeleton()
    {
        $peleton = Peleton::all()->sortBy('no');
        return view('admin.pralomba.peleton._list-peleton')
                ->with('peletons',$peleton);
    }

    public function index()
    {
        $listPeleton = $this->listPeleton();
        return view('admin.pralomba.peleton.index')
                ->with('listPeleton',$listPeleton);
    }

    public function create()
    {
        $action = route('peleton.store');
        return view('admin.pralomba.peleton._form-peleton')
                ->with('action',$action);
    }

    public function store(Request $request)
    {
        $request->validate([
            'no'=>'bail|required|unique:peletons|integer',
            'nama' =>'required|string'
        ]);
        $peleton = new Peleton;
        $peleton->no = $request->no;
        $peleton->nama = $request->nama;
        $peleton->ballot = 0;
        $peleton->pinalti = 0;
        $peleton->save();
        return 'sukses';
    }

    public function show($no)
    {
        //
    }

    public function edit($no)
    {
        $action = route('peleton.update',['no'=>$no]);
        $peleton = Peleton::where('no',$no)->first();
        return view('admin.pralomba.peleton._form-peleton',['peleton'=>$peleton,'action'=>$action]);
    }

    public function update(Request $request, $no)
    {
        $request->validate([
            'no'=>'bail|required|integer|unique:peletons,no,'.$no.',no',
            'nama' =>'required|string'
        ]);
        $peleton = peleton::where('no',$no)->first();
        $peleton->no = $request->no;
        $peleton->nama = $request->nama;
        $peleton->save();
        return 'sukses';
    }

    public function destroy($no)
    {
        Peleton::where('no',$no)->first()->delete();
        return 'sukses';
    }
}
