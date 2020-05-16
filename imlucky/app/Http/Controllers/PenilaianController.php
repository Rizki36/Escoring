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
    

    public function listPeleton()
    {
        $Peletons = DB::table('penilaian')
            ->select([
                    'peletons.id as id',
                    'peletons.no as no',
                    'peletons.nama as nama',
                    DB::raw('count(penilaian.sub2_id) as sub2')
                ])
            ->join('peletons','peletons.id','=','penilaian.peleton_id')
            ->groupBy('peletons.id')
            ->get();
        return $Peletons;
    }

    public function listJuri($peleton)
    {
        $juris = DB::table('penilaian')
                        ->where('peleton_id',$peleton)
                        ->join('juris','juris.id','=','penilaian.juri_id')
                        ->groupBy('juri_id')
                        ->select([
                            'juri_id as id',
                            'juris.kode as kode',
                            'juris.nama as nama',
                            DB::raw('count(penilaian.sub2_id) as sub2')
                            ])
                        ->get();
        return $juris;
    }

    public function listPenilaian($peleton,$juri)
    {
        $data = collect(DB::table('penilaian AS pen')
                        ->where('peleton_id','=',$peleton)
                        ->where('juri_id','=',$juri)
                        ->join('juris as jur','jur.id','=','pen.juri_id')
                        ->join('peletons as pel','pel.id','=','pen.peleton_id')
                        ->select([
                            'pel.no as no',
                            'pel.nama as peleton',
                            'jur.kode',
                            'pen.peleton_id',
                            'pen.juri_id',
                            ])
                        ->get())->first();
        
        $penilaians = DB::table('penilaian AS pen')
                        ->where('peleton_id','=',$peleton)
                        ->where('juri_id','=',$juri)
                        ->join('kategoris as kat','kat.id','=','pen.kategori_id')
                        ->join('subs as sub','sub.id','=','pen.sub_id')
                        ->join('sub2s as sub2','sub2.id','=','pen.sub2_id')
                        ->select([
                            'kat.nama as kategori',
                            'sub.nama as sub',
                            'sub2.nama as sub2',
                            'pen.kategori_id',
                            'pen.sub_id',
                            'pen.sub2_id',
                            'pen.nilai',
                            ])
                        ->get();

        // $penilaians = $penilaians->groupBy(['kategori_id'],true);
        
        $data->penilaian = $penilaians;
        return $data;
    }

    
    private function validateData(Collection $peleton,Collection $sub2,Collection $juri)
    {
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
        return $data;
    }

    public function generatePenilaian()
    {
        $peletons = Peleton::all(['id']);
        $juris = Juri::with('group_juri.kategoris.sub.sub2')->get();

        $data = $this->getIds($peletons,$juris);
        DB::table('penilaian')->insert($data);
        // DB::table('penilaian')->insertOrIgnore($data);
        return back()->with('status','Generate form penilaian berhasil');
    }

    public function truncate()
    {
        DB::table('penilaian')->truncate();
        // return back()->with('status','Hapus semua form penilaian berhasil');
        return 'sukses';
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function indexPeleton()
    {
        $juri    = Juri::all();
        $sub2    = Sub2::all();
        $peleton = Peleton::all();

        $data    = $this->validateData($peleton,$sub2,$juri);
        $peletons = $this->listPeleton();
        return view('admin.pralomba.form_penilaian.indexPeleton',['data'=>$data,'peletons'=>$peletons]);
    }

    public function indexJuri($peleton)
    {
        $juris = $this->listJuri($peleton);
        $peleton = Peleton::find($peleton);
        return view('admin.pralomba.form_penilaian.indexJuri',['juris'=>$juris,'peleton'=>$peleton]);
    }

    public function indexPenilaian($peleton,$juri)
    {
        $data = $this->listPenilaian($peleton,$juri);
        return view('admin.pralomba.form_penilaian.indexPenilaian',['data'=> $data]);
        return dd($data);
    }

    public function table($peleton,$juri)
    {
        $data = $this->listPenilaian($peleton,$juri);
        return view('admin.pralomba.form_penilaian._listPenilaian',['data'=>$data,'penilaians'=>$data->penilaian]);
    }

    public function getIds(Collection $peletons,Collection $juris)
    {
        $penilaian = array();
        
        foreach($peletons as $peleton){
            foreach ($juris as $juri) {
                foreach ($juri->group_juri->kategoris as $kategori) {
                    foreach ($kategori->sub as $sub) {
                        foreach ($sub->sub2 as $sub2) {
                            array_push($penilaian,['juri_id'=>$juri->id,'peleton_id'=>$peleton->id,'kategori_id'=>$kategori->id,'sub_id'=>$sub->id,'sub2_id'=>$sub2->id,'nilai'=>0]);
                        }
                    }
                }   
            }
        }

        return $penilaian;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($peleton,$juri,$kategori,$sub,$sub2)
    {
        $penilaian = DB::table('penilaian')
                        ->where('peleton_id','=',$peleton)
                        ->where('juri_id','=',$juri)
                        ->where('kategori_id','=',$kategori)
                        ->where('sub_id','=',$sub)
                        ->where('sub2_id','=',$sub2)
                        ->select('nilai')
                        ->first();
        $action = route('form-penilaian.update',['peleton'=>$peleton,'juri'=>$juri,'kategori'=>$kategori,'sub'=>$sub,'sub2'=>$sub2]);
        return view('admin.pralomba.form_penilaian._form',['action'=>$action,'penilaian'=>$penilaian]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $peleton,$juri,$kategori,$sub,$sub2)
    {
        $request->validate([
            'nilai'=>'required'
        ]);
        
        $nilai = $request->nilai;
        DB::table('penilaian')
            ->where('peleton_id','=',$peleton)
            ->where('juri_id','=',$juri)
            ->where('kategori_id','=',$kategori)
            ->where('sub_id','=',$sub)
            ->where('sub2_id','=',$sub2)
            ->update(['nilai'=>$nilai]);
    }
}
