<?php

namespace App\Http\Controllers;

use App\Kategori;
use App\Peleton;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LaporanController extends Controller
{
    public function printout($id)
    {
        // return
        $mapper_kategori = Kategori::with('sub.sub2')->get();
        $array = array();
        $peleton = $id;
        $data = DB::table('penilaian as pen')
                ->join('juris as jur','jur.id','=','pen.juri_id')
                ->join('peletons as pel','pel.id','=','pen.peleton_id')
                ->join('kategoris as kat','kat.id','=','pen.kategori_id')
                ->join('subs as sub','sub.id','=','pen.sub_id')
                ->join('sub2s as sub2','sub2.id','=','pen.sub2_id')
                ->select([
                    'pel.no AS no',
                    'pel.nama AS peleton',
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
                ->where('pen.peleton_id','=',$peleton)
                ->orderBy('kategori_kode')
                ->orderBy('sub_kode')
                ->orderBy('sub2_kode')
                ->orderBy('juri_id')
                ->get();
        foreach ($data as $dt) {
            $array['no'] = $dt->no;
            $array['peleton'] = $dt->peleton;
            $array['penilaian'][$dt->kategori_kode]["kategori"] = $dt->kategori;
            $array['penilaian'][$dt->kategori_kode]["bobot_umum"] = $dt->bobot_umum;
            $array['penilaian'][$dt->kategori_kode]["bobot_utama"] = $dt->bobot_utama;
            $array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['sub'] = $dt->sub;
            $array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['sub2s'][$dt->sub2][] = $dt->nilai;
            
            $array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['total'] = 
                array_key_exists("total",$array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]) ? 
                $array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['total'] + $dt->nilai : 
                $dt->nilai;
            $array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['umum']  = 
                array_key_exists("umum",$array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]) ?
                $array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['umum'] + ($dt->nilai * $dt->bobot_umum / 100) : 
                $dt->nilai * $dt->bobot_umum / 100;
            $array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['utama'] = 
                array_key_exists("utama",$array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]) ? 
                $array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['utama'] + ($dt->nilai * $dt->bobot_utama / 100) :
                $dt->nilai * $dt->bobot_utama / 100;
            
            $array['penilaian'][$dt->kategori_kode]["total"] = 
                array_key_exists("total",$array['penilaian'][$dt->kategori_kode]) ?
                $array['penilaian'][$dt->kategori_kode]["total"] + $dt->nilai : 
                $dt->nilai;
            $array['penilaian'][$dt->kategori_kode]["umum"]  = 
                array_key_exists("umum",$array['penilaian'][$dt->kategori_kode])  ? 
                $array['penilaian'][$dt->kategori_kode]["umum"]  + ($dt->nilai * $dt->bobot_umum / 100): 
                $dt->nilai * $dt->bobot_umum / 100;
            $array['penilaian'][$dt->kategori_kode]["utama"] = 
                array_key_exists("utama",$array['penilaian'][$dt->kategori_kode]) ? 
                $array['penilaian'][$dt->kategori_kode]["utama"] + ($dt->nilai * $dt->bobot_utama / 100) : 
                $dt->nilai * $dt->bobot_utama / 100;
            
            $array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['rowspan'] = 
                array_key_exists("rowspan",$array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]) ? 
                $array['penilaian'][$dt->kategori_kode]["subs"][$dt->sub_kode]['rowspan'] + 1 :
                1;

            // $array['penilaian'][$dt->kategori_kode]["rowspan"] =
            //     array_key_exists('rowspan',$array['penilaian'][$dt->kategori_kode]) ?
            //     $array['penilaian'][$dt->kategori_kode]['rowspan'] + 1 :
            //     1;

            $array['total'] = array_key_exists('total',$array) ? $array['total'] + $dt->nilai : $dt->nilai;
            $array['umum']  = array_key_exists('umum',$array)  ? $array['umum']  + ($dt->nilai * $dt->bobot_umum / 100)  : $dt->nilai * $dt->bobot_umum / 100;
            $array['utama'] = array_key_exists('utama',$array) ? $array['utama'] + ($dt->nilai * $dt->bobot_utama / 100) : $dt->nilai * $dt->bobot_utama / 100;
        }

        $array['length'] = $this->countLength($array);

        // return $array;
        return view('admin.laporan.print-out')
                ->with('data',$array);
    }

    private function countLength(array $array)
    {
        // Mencari jumlah juri paling banyak pada sub2

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

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $peletons = Peleton::all();
        return view('admin.laporan.index',compact('peletons'));
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
