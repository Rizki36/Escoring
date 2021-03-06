<?php

namespace App\Http\Controllers;

use App\Kategori;
use App\Sub;
use Illuminate\Http\Request;

class SubController extends Controller
{
    public function index()
    {
        // 
    }

    public function create($kategori)
    {
        $action = route('sub.store',['kategori'=>$kategori]);
        return  view('admin.pralomba.kategori._form-sub')
                ->with('kategori',$kategori)
                ->with('action',$action);
    }

    public function store(Request $request,$kategori)
    {
        $request->merge(['kategori_id'=>$kategori]);        
        $model    = $this->transformModel($kategori);
        $kategori = $model->kategori;
        $sub      = $request->kode;

        $request->validate([
            'kode'          => 'required|string|max:1|min:1|unique:subs,kode,NULL,kode,kategori_id,'.$kategori->id,
            'kategori_id'   => 'string|unique:subs,kategori_id,NULL,kategori_id,kode,'.$sub,
            'kisaran_nilai' => 'required',
            ]);        

        $sub       = new Sub;
        $sub->kode = $request->kode;
        $sub->nama = $request->nama;
        $sub->kisaran_nilai = $request->kisaran_nilai;
        $kategori->sub()->save($sub);

        return 'sukses';
    }

    public function show($sub)
    {
        //
    }

    public function edit($kategori, $sub)
    {
        $action   = route('sub.update',['kategori'=>$kategori,'sub'=>$sub]);
        $model    = $this->transformModel($kategori,$sub);
        $kategori = $model->kategori;
        $sub      = $model->sub;
        return view('admin.pralomba.kategori._form-sub')
                ->with('action',$action)
                ->with('sub',$sub);
    }
    
    public function update(Request $request, $kategori, $sub)
    {
        $model = $this->transformModel($kategori,$sub);
        $kategori = $model->kategori;
        $request->validate([
            'kode'          => 'required|string|max:1|min:1|unique:subs,kode,'.$sub.',kode,kategori_id,'.$kategori->id,
            'kategori_id'   => 'unique:subs,kategori_id,'.$kategori->id.',kategori_id,kode,'.$sub,
            'kisaran_nilai' => 'required|string',
        ]);
        
        $sub = $model->sub;
        $sub->kode = $request->kode;
        $sub->nama = $request->nama;
        $sub->kisaran_nilai = $request->kisaran_nilai;
        $sub->save();

        return 'sukses';
    }

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
