<?php

namespace App\Http\Controllers;

use App\Kategori;
use App\Sub;
use App\Sub2;
use Illuminate\Http\Request;

class Sub2Controller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($kategori,$sub)
    {
        $action = route('sub2.store',['kategori'=>$kategori,'sub'=>$sub]);
        return view('admin.pralomba.kategori._form-sub2',['action'=>$action]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
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
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $sub2
     * @return \Illuminate\Http\Response
     */
    public function show($sub2)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $sub2
     * @return \Illuminate\Http\Response
     */
    public function edit($kategori,$sub,$sub2)
    {
        $action = route('sub2.update',[
                        'kategori' => $kategori,
                        'sub'      => $sub,
                        'sub2'     => $sub2
                        ]);
        $model = $this->transformModel($kategori,$sub,$sub2);
        $sub2 = $model->sub2;
        return view('admin.pralomba.kategori._form-sub2',[
                    'action' => $action,
                    'sub2'   => $sub2
                    ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $sub2
     * @return \Illuminate\Http\Response
     */
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
        return 'validated';
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $sub2
     * @return \Illuminate\Http\Response
     */

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
