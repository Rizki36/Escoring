<?php

namespace App\Http\Controllers;

use App\Peleton;
use Illuminate\Http\Request;

class PeletonController extends Controller
{
    public function listPeleton()
    {
        $peleton = Peleton::all()->sortBy('no');
        return view('admin.pralomba.peleton._list-peleton',['peletons'=>$peleton]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listPeleton = $this->listPeleton();
        return view('admin.pralomba.peleton.index',['listPeleton'=>$listPeleton]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $action = route('peleton.store');
        return view('admin.pralomba.peleton._form-peleton',['action'=>$action]);
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
            'no'=>'bail|required|unique:peletons|integer',
            'nama' =>'required|string'
        ]);
        $peleton = new Peleton;
        $peleton->no = $request->no;
        $peleton->nama = $request->nama;
        $peleton->ballot = 0;
        $peleton->pinalti = 0;
        $peleton->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $no
     * @return \Illuminate\Http\Response
     */
    public function show($no)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $no
     * @return \Illuminate\Http\Response
     */
    public function edit($no)
    {
        $action = route('peleton.update',['no'=>$no]);
        $peleton = Peleton::where('no',$no)->first();
        return view('admin.pralomba.peleton._form-peleton',['peleton'=>$peleton,'action'=>$action]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $no
     * @return \Illuminate\Http\Response
     */
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
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $no
     * @return \Illuminate\Http\Response
     */
    public function destroy($no)
    {
        Peleton::where('no',$no)->first()->delete();
    }
}
