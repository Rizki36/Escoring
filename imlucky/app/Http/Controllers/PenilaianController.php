<?php

namespace App\Http\Controllers;

use App\Juri;
use App\Kategori;
use App\Peleton;
use App\Sub2;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PenilaianController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $juri    = Juri::all();
        $sub2    = Sub2::all();
        $peleton = Peleton::all();
        
        $data = (object)[
            'validated' => true,
            'message' => 'halo'
        ];

        if($peleton->isEmpty()){
            $data->validated = false;
            $data->message   = 'Input Peleton Terlebih Dahulu';
        }

        if($sub2->isEmpty()){
            $data->validated = false;
            $data->message   = 'Input Kategori Terlebih Dahulu';
        }

        if($juri->isEmpty()){
            $data->validated = false;
            $data->message   = 'Input Juri Terlebih Dahulu';
        }
        return 
        $this->getIds();
    
        return view('admin.pralomba.form_penilaian.index',['data'=>$data]);
    }

    public function getIds()
    {
        $array = array();
        return
        $peleton = Peleton::all(['id'])
                        ->sortBy('no');
        $juri = Juri::all(['id'])
                        ->sortBy('kode');
        $kategoris = DB::table('sub2s')
                        ->join('subs','subs.id','=','sub2s.sub_id')
                        ->join('kategoris','kategoris.id','=','subs.kategori_id')
                        ->select([
                            'kategoris.id AS kategori',
                            'subs.id AS sub',
                            'sub2s.id AS sub2',
                            // 'kategoris.kode AS kategoriKode',
                            // 'subs.kode AS subKode',
                            // 'sub2s.kode AS sub2Kode',
                            ])
                        ->orderBy('kategoris.kode')
                        ->orderBy('subs.kode')
                        ->orderBy('sub2s.kode')
                        ->get();
            $array = $peleton->map(function($pel){
                // return $pel->juri = 
            });
        return $kategoris;
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
