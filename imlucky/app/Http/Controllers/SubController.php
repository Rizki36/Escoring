<?php

namespace App\Http\Controllers;

use App\Kategori;
use App\Sub;
use Illuminate\Http\Request;

class SubController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($kategori)
    {
        $action = route('sub.store',['kategori'=>$kategori]);
        return  view('admin.pralomba.kategori._form-sub',['kategori'=>$kategori,'action'=>$action]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request,$kategori)
    {
        $request->merge(['kategori_id'=>$kategori]);
        
        $model    = $this->transformModel($kategori);
        
        $kategori = $model->kategori;
        $sub      = $request->kode;

        $request->validate([
            'kode'          => 'required|string|max:1|min:1|unique:subs,kode,NULL,kode,kategori_id,'.$kategori->id,
            'kategori_id'   => 'string|unique:subs,kategori_id,NULL,kategori_id,kode,'.$sub,
            // 'nama'          => 'string',
            'kisaran_nilai' => 'required',
            ]);        
        $sub       = new Sub;
        $sub->kode = $request->kode;
        $sub->nama = $request->nama;
        $sub->kisaran_nilai = $request->kisaran_nilai;
        $kategori->sub()->save($sub);
        return 'berhasil';
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $sub
     * @return \Illuminate\Http\Response
     */
    public function show($sub)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $sub
     * @return \Illuminate\Http\Response
     */
    public function edit($kategori, $sub)
    {
        $action   = route('sub.update',['kategori'=>$kategori,'sub'=>$sub]);
        $model    = $this->transformModel($kategori,$sub);
        $kategori = $model->kategori;
        $sub      = $model->sub;

        return view('admin.pralomba.kategori._form-sub',['action'=>$action,'sub'=>$sub]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $sub
     * @return \Illuminate\Http\Response
     */
    
     public function update(Request $request, $kategori, $sub)
    {
        $model = $this->transformModel($kategori,$sub);
        $kategori = $model->kategori;
        $request->validate([
            'kode'          => 'required|string|max:1|min:1|unique:subs,kode,'.$sub.',kode,kategori_id,'.$kategori->id,
            'kategori_id'   => 'unique:subs,kategori_id,'.$kategori->id.',kategori_id,kode,'.$sub,
            // 'nama'          => 'string',
            'kisaran_nilai' => 'required|string',
        ]);
        
        $sub = $model->sub;
        $sub->kode = $request->kode;
        $sub->nama = $request->nama;
        $sub->kisaran_nilai = $request->kisaran_nilai;
        $sub->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $sub
     * @return \Illuminate\Http\Response
     */
    public function destroy($kategori,$sub)
    {
        $model = $this->transformModel($kategori,$sub);
        
        $sub = $model->sub;
        $sub->delete();
        return 'sukses';
    }

    private function transformModel($kategori,$sub=null)
    {
        // mencari id kategori dari kode kategori
        $kategori = Kategori::where('kode',$kategori)
                            ->first();
        if (!is_null($sub)) {
            // mencari id sub dari id kategori dan kode sub
            $sub = Sub::where('kode',$sub)
                        ->where('kategori_id',$kategori->id)
                        ->first();
        }
        return (object) [
            'kategori' => $kategori,
            'sub'      => $sub,
        ];
    }
}
