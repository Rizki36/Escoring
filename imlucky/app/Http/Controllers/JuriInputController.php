<?php

namespace App\Http\Controllers;

use App\GroupJuri;
use App\Juri;
use App\Peleton;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JuriInputController extends Controller
{
    
    public function index($no)
    {
        // return
        $peleton = Peleton::where('no',$no)->first();
        $juri    = Juri::find(1);
        session(['juri'=>$juri]);
        $juri = session('juri');
        $kategoris = GroupJuri::where('id',$juri->group_juri_id)->with('kategoris')->first();

        $penilaian = DB::table('penilaian as pen')
                        ->where('juri_id',$juri->id)
                        ->where('peleton_id',$no)
                        ->select([
                            'pen.kategori_id',
                            'pen.sub_id',
                            'pen.sub2_id',
                            'sub.kisaran_nilai',
                            'pen.nilai',
                            'kat.nama as kategori',
                            'sub2.nama as sub2'
                            ])
                        ->join('kategoris as kat','kat.id','=','pen.kategori_id')
                        ->join('subs as sub','sub.id','=','pen.sub_id')
                        ->join('sub2s as sub2','sub2.id','=','pen.sub2_id')
                        ->orderBy('kategori_id')
                        ->orderBy('sub_id')
                        ->orderBy('sub2_id')
                        ->get()
                        ;
        // return
        $peletons = Peleton::all(['id','nama']);
        $penilaian_keyed = [];
        foreach ($penilaian as $pen) {
            $penilaian_keyed[$pen->kategori_id]['nama'] = $pen->kategori;
            $penilaian_keyed[$pen->kategori_id]['subs'][$pen->sub_id]['sub2s'][$pen->sub2_id]['nama'] = $pen->sub2;
            $penilaian_keyed[$pen->kategori_id]['subs'][$pen->sub_id]['sub2s'][$pen->sub2_id]['nilai'] = $pen->nilai;
            $penilaian_keyed[$pen->kategori_id]['subs'][$pen->sub_id]['kisaran_nilai'] = explode(',',$pen->kisaran_nilai);
        }

        // return
        $penilaian_keyed;
        
        return view('juri.index')
                ->with('peleton',$peleton)
                ->with('peletons',$peletons)
                ->with('kategoris',$kategoris->kategoris)
                ->with('penilaian',$penilaian_keyed);
    }

    public function update_one(Request $request,$peleton_id)
    {
        $juri = session('juri');
        $nilai = $request->value;
        $id_penilaian = explode(',',$request->id);
        DB::table('penilaian')
        ->where('peleton_id','=',$peleton_id)
        ->where('juri_id','=',$juri->id)
        ->where('kategori_id','=',$id_penilaian[0])
        ->where('sub_id','=',$id_penilaian[1])
        ->where('sub2_id','=',$id_penilaian[2])
        ->update(['nilai'=>$nilai]);
        return response('sukses');
    }

    public function update_more(Request $request,$peleton_id)
    {
        $juri = session('juri');
        return
        $nilai = $request->nilai ;
        foreach($nilai as $kategori_id => $sub){
            foreach($sub as $sub_id => $sub2){
                foreach($sub2 as $sub2_id => $nilai){
                    DB::table('penilaian')
                        ->where(['juri_id'=>$juri->id,'peleton_id'=>$peleton_id,'kategori_id'=>$kategori_id,'sub_id'=>$sub_id,'sub2_id'=>$sub2_id])
                        ->update(['nilai'=>$nilai,'is_complete' => true]);
                }
            }
        }
        $penilaian = DB::table('penilaian')
                    ->where(['juri_id'=>$juri->id,'peleton_id'=>$peleton_id])
                    ->distinct(['kategori_id','is_complete'])
                    ->get(['kategori_id','is_complete']);
        return $penilaian;
    }

    public function reset()
    {
        DB::table('penilaian')
            ->update(['nilai'=>null,'is_complete'=>false]);
        // return redirect()->back();
    }
}
