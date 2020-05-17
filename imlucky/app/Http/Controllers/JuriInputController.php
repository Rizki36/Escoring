<?php

namespace App\Http\Controllers;

use App\GroupJuri;
use App\Juri;
use App\Kategori;
use App\Peleton;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JuriInputController extends Controller
{
    public function index($no)
    {
        // start dev
        $juri    = Juri::find(4);
        session(['juri'=>$juri]);
        // end dev

        $peleton = Peleton::where('no',$no)->first();
        $juri = session('juri');
        $kategoris = $this->refresh_kategori($peleton->id,$juri->id);
        $penilaian = DB::table('penilaian as pen')
                        ->where('juri_id',$juri->id)
                        ->where('peleton_id',$peleton->id)
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
                        ->get();
        $peletons = Peleton::all(['id','nama','no']);
        $penilaian_keyed = [];
        foreach ($penilaian as $pen) {
            $penilaian_keyed[$pen->kategori_id]['nama'] = $pen->kategori;
            $penilaian_keyed[$pen->kategori_id]['subs'][$pen->sub_id]['sub2s'][$pen->sub2_id]['nama'] = $pen->sub2;
            $penilaian_keyed[$pen->kategori_id]['subs'][$pen->sub_id]['sub2s'][$pen->sub2_id]['nilai'] = $pen->nilai;
            $penilaian_keyed[$pen->kategori_id]['subs'][$pen->sub_id]['kisaran_nilai'] = explode(',',$pen->kisaran_nilai);
        }

        return view('juri.index')
                ->with('peleton',$peleton)
                ->with('peletons',$peletons)
                ->with('kategoris',$kategoris)
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
        ->update(['nilai'=>$nilai,'is_complete' => 1]);
        return response('sukses');
    }

    // response kategori yang dinilai juri $juri_id dan peleton $peleton_id
    private function refresh_kategori($peleton_id,$juri_id)
    {
        return
        $kategoris = DB::table('penilaian as pen')
                        ->selectRaw('pen.kategori_id as id,kat.nama as nama,bit_and(pen.is_complete) as is_complete')
                        ->where('peleton_id',$peleton_id)
                        ->where('juri_id',$juri_id)
                        ->join('kategoris as kat','kat.id','=','pen.kategori_id')
                        ->groupBy('kategori_id')
                        ->get();
    }

    public function update_more(Request $request,$peleton_id)
    {
        $juri = session('juri');

        $nilai = $request->nilai ;
        $active_kategori = 0;
        foreach($nilai as $kategori_id => $sub){
            $active_kategori = $kategori_id;
            foreach($sub as $sub_id => $sub2){
                foreach($sub2 as $sub2_id => $nilai){
                    DB::table('penilaian')
                        ->where(['juri_id'=>$juri->id,'peleton_id'=>$peleton_id,'kategori_id'=>$kategori_id,'sub_id'=>$sub_id,'sub2_id'=>$sub2_id])
                        ->update(['nilai'=>$nilai,'is_complete' => 1]);
                }
            }
        }
        $kategoris = $this->refresh_kategori($peleton_id,$juri->id);
        return view('juri._kategori-items')
                    ->with('kategoris',$kategoris)
                    ->with('active_kategori',$active_kategori);
    }

    public function reset()
    {
        DB::table('penilaian')
            ->update(['nilai'=>null,'is_complete'=>0]);
        return redirect()->back();
    }
}
