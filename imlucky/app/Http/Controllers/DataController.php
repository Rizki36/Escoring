<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Kategori;
use App\Peleton;

class DataController extends Controller
{
    // 
    public static function list($no = null)
    {
        $persetase_pinalti = DB::table('config')
            ->where('nama','=','pinalti_umum')
            ->orWhere('nama','=','pinalti_utama')
            ->get()
            ->keyBy('nama');
        $array = array();
        // response semua data
        if($no == null){
            $data = DB::table('penilaian as pen')
            ->join('juris as jur','jur.id','=','pen.juri_id')
            ->join('peletons as pel','pel.id','=','pen.peleton_id')
            ->join('kategoris as kat','kat.id','=','pen.kategori_id')
            ->join('subs as sub','sub.id','=','pen.sub_id')
            ->join('sub2s as sub2','sub2.id','=','pen.sub2_id')
            ->select([
                'pel.no AS no',
                'pel.pinalti AS pinalti',
                'pel.nama AS peleton',
                'pel.ballot AS ballot',
                'kat.kode as kategori_kode',
                'sub.kode as sub_kode',
                'sub2.kode as sub2_kode',
                'pen.juri_id AS juri_id',
                'kat.nama as kategori',
                'sub.nama as sub',
                'sub2.nama as sub2',
                'kat.bobot_umum AS bobot_umum',
                'kat.bobot_utama AS bobot_utama',
                'pen.nilai AS nilai',
                ])
            ->orderBy('no')
            ->orderBy('kategori_kode')
            ->orderBy('sub_kode')
            ->orderBy('sub2_kode')
            ->orderBy('juri_id')
            ->get();
        }
        // retrieve satu data
        else{
            $peleton = Peleton::where('no','=',$no)->first();
            $data = DB::table('penilaian as pen')
            ->join('juris as jur','jur.id','=','pen.juri_id')
            ->join('peletons as pel','pel.id','=','pen.peleton_id')
            ->join('kategoris as kat','kat.id','=','pen.kategori_id')
            ->join('subs as sub','sub.id','=','pen.sub_id')
            ->join('sub2s as sub2','sub2.id','=','pen.sub2_id')
            ->select([
                'pel.no AS no',
                'pel.pinalti AS pinalti',
                'pel.nama AS peleton',
                'pel.ballot AS ballot',
                'kat.kode as kategori_kode',
                'sub.kode as sub_kode',
                'sub2.kode as sub2_kode',
                'pen.juri_id AS juri_id',
                'kat.nama as kategori',
                'sub.nama as sub',
                'sub2.nama as sub2',
                'kat.bobot_umum AS bobot_umum',
                'kat.bobot_utama AS bobot_utama',
                'pen.nilai AS nilai',
                ])
            ->where('pen.peleton_id','=',$peleton->id)
            ->orderBy('no')
            ->orderBy('kategori_kode')
            ->orderBy('sub_kode')
            ->orderBy('sub2_kode')
            ->orderBy('juri_id')
            ->get();
        }

        foreach ($data as $dt) {
            $array[$dt->no]['no'] = $dt->no;
            $array[$dt->no]['peleton'] = $dt->peleton;
            $array[$dt->no]['pinalti'] = $dt->pinalti;
            $array[$dt->no]['ballot'] = $dt->ballot;
            $array[$dt->no]['penilaian'][$dt->kategori_kode]["kategori"] = $dt->kategori;
            $array[$dt->no]['penilaian'][$dt->kategori_kode]["bobot_umum"] = $dt->bobot_umum;
            $array[$dt->no]['penilaian'][$dt->kategori_kode]["bobot_utama"] = $dt->bobot_utama;
            $array[$dt->no]['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['sub'] = $dt->sub;
            $array[$dt->no]['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['sub2s'][$dt->sub2][] = $dt->nilai;
            $array[$dt->no]['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['total'] = 
                array_key_exists("total",$array[$dt->no]['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]) ? 
                $array[$dt->no]['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['total'] + $dt->nilai : 
                $dt->nilai;
            $array[$dt->no]['penilaian'][$dt->kategori_kode]["total"] = 
                array_key_exists("total",$array[$dt->no]['penilaian'][$dt->kategori_kode]) ?
                $array[$dt->no]['penilaian'][$dt->kategori_kode]["total"] + $dt->nilai : 
                $dt->nilai;
            
            $array[$dt->no]['penilaian'][$dt->kategori_kode]["umum"]  = 
                array_key_exists("umum",$array[$dt->no]['penilaian'][$dt->kategori_kode])  ? 
                $array[$dt->no]['penilaian'][$dt->kategori_kode]["umum"]  + ($dt->nilai * $dt->bobot_umum / 100): 
                $dt->nilai * $dt->bobot_umum / 100;

            $array[$dt->no]['penilaian'][$dt->kategori_kode]["utama"] = 
                array_key_exists("utama",$array[$dt->no]['penilaian'][$dt->kategori_kode]) ? 
                $array[$dt->no]['penilaian'][$dt->kategori_kode]["utama"] + ($dt->nilai * $dt->bobot_utama / 100) : 
                $dt->nilai * $dt->bobot_utama / 100;
            
            $array[$dt->no]['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['rowspan'] = 
                array_key_exists("rowspan",$array[$dt->no]['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]) ? 
                $array[$dt->no]['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['rowspan'] + 1 :
                1;

            
            $array[$dt->no]['total'] = array_key_exists('total',$array[$dt->no]) ? $array[$dt->no]['total'] + $dt->nilai : $dt->nilai;
            $array[$dt->no]['umum']  = array_key_exists('umum',$array[$dt->no])  ? $array[$dt->no]['umum']  + ($dt->nilai * $dt->bobot_umum / 100)  : $dt->nilai * $dt->bobot_umum / 100;  // belum dikurangi dengan pinalti
            $array[$dt->no]['utama'] = array_key_exists('utama',$array[$dt->no]) ? $array[$dt->no]['utama'] + ($dt->nilai * $dt->bobot_utama / 100) : $dt->nilai * $dt->bobot_utama / 100; // belum dikurangi dengan pinalti
        }
        
        // pengurangi nilai dengan pinalti
        foreach ($array as $key => $value) {
            $array[$key]['umum'] = $array[$key]['umum']  - $array[$key]['pinalti']  * $persetase_pinalti['pinalti_umum']->value / 100;
            $array[$key]['utama']= $array[$key]['utama'] - $array[$key]['pinalti']  * $persetase_pinalti['pinalti_utama']->value / 100;
        }
        // response semua data
        if($no == null){
            return collect($array);
        }
        // response satu data
        else{
            return collect($array[$no]);
        }
    }

    // Menghitung juri paling banyak pada sub2
    public static function juri_lenght($array)
    {
        $max_length = 0;

        // kategori
        foreach ($array['penilaian'] as $ket_kategori => $kategori) {
            // sub
            foreach ($kategori['subs'] as $key_sub => $sub) {
                // sub2
                foreach($sub['sub2s'] as $key_subs => $sub2){
                    $length     = count($sub2);
                    $max_length = $length > $max_length ? $length : $max_length;
                }
            }
        }
        return $max_length;
    }

    // Mencari juara tiap kategori 
    public static function juara($juara_per_kategori = 3)
    {
        $kategoris = Kategori::all(['kode','nama']);
        $juara = [];

        foreach ($kategoris as $kategori) {
            $data = DB::table('penilaian as pen')
                        ->select([
                            'pel.nama AS peleton',
                            'kat.nama as kategori',
                            DB::raw('IFNULL(sum(pen.nilai),0) as nilai')
                            ])
                        ->where('kat.kode',$kategori->kode)
                        ->join('peletons as pel','pel.id','=','pen.peleton_id')
                        ->join('kategoris as kat','kat.id','=','pen.kategori_id')
                        ->groupBy('pel.id','kat.kode')
                        ->orderByDesc('nilai')
                        ->limit($juara_per_kategori)
                        ->get();
                $juara[$kategori->kode] = $data;
        }
        return $juara;
    }

    public static function utama()
    {
        return
        $utama = self::list()->sortByDesc('utama')->values()->take(3);        
    }
    
    public static function umum()
    {
        return
        $umum = self::list()->sortByDesc('umum')->values()->first();
    }

}
