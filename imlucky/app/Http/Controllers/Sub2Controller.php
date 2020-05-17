<?php

namespace App\Http\Controllers;

use App\Kategori;
use App\Sub;
use App\Sub2;
use Illuminate\Http\Request;

class Sub2Controller extends Controller
{
    
    public function index()
    {
        //
    }

    public function create($kategori,$sub)
    {
        $action = route('sub2.store',['kategori'=>$kategori,'sub'=>$sub]);
        
        return view('admin.pralomba.kategori._form-sub2')
                ->with('action',$action);
    }

    public function store(Request $request,$kategori,$sub)
    {
        $model = $this->transformModel($kategori,$sub);  
        
        $sub = $model->sub;
        $sub2 = $request->kode;
        $request->validate([
            'kode'          => 'required|min:2|max:2|string|unique:sub2s,kode,NULL,kode,sub_id,'.$sub->id,
            'sub_id'        => 'string|unique:sub2s,sub_id,NULL,sub_id,kode,'.$sub2,
            'nama'          => 'required|string',    
        ]);
        $sub2      = new Sub2;
        $sub2->kode = $request->kode;
        $sub2->nama = $request->nama;
        $sub->sub2()->save($sub2);

        return 'sukses';
    }

    public function show($sub2)
    {
        //
    }

    public function edit($kategori,$sub,$sub2)
    {
        $action = route('sub2.update',[
                        'kategori' => $kategori,
                        'sub'      => $sub,
                        'sub2'     => $sub2
                        ]);
        $model = $this->transformModel($kategori,$sub,$sub2);
        $sub2 = $model->sub2;
        return view('admin.pralomba.kategori._form-sub2')
                ->with('action',$action)
                ->with('sub2',$sub2);
    }

    public function update(Request $request, $kategori, $sub, $sub2)
    {
        $model = $this->transformModel($kategori,$sub,$sub2);
        $sub = $model->sub;
        $request->validate([
            'kode'          => 'required|min:2|max:2|string|unique:sub2s,kode,'.$sub2.',kode,sub_id,'.$sub->id,
            'sub_id'        => 'string|unique:sub2s,sub_id,'.$sub->id.',sub_id,kode,'.$sub2,
            'nama'          => 'required|string',
        ]);
        $sub2 = $model->sub2;
        $sub2->kode = $request->kode;
        $sub2->nama = $request->nama;
        $sub2->save();
        return 'sukses';
    }

    public function destroy($kategori,$sub,$sub2)
    {
        $model = $this->transformModel($kategori,$sub,$sub2);
        $sub2 = $model->sub2;
        $sub2->delete();
        return 'sukses';
    }

    private function transformModel($kategori,$sub,$sub2=null)
    {
        $kategori = Kategori::where('kode',$kategori)
                            ->first();
        $sub = Sub::where('kode',$sub)
                    ->where('kategori_id',$kategori->id)
                    ->first();
        if (!is_null($sub2)) {
            $sub2 = Sub2::where('kode',$sub2)
                        ->where('sub_id',$sub->id)
                        ->first();
        }
        return (object) [
            'kategori' => $kategori,
            'sub'      => $sub,
            'sub2'     => $sub2
        ];
    }

}
