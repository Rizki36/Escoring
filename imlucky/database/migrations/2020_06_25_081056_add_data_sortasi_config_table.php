<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class AddDataSortasiConfigTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::table('config')->insert([
            ['nama'=>'title_sortasi_default','value'=>'LEMBAR SORTASI ~ GARUDA 9.0 ~ GERAK KREATIVITAS GENERASI MUDA PASKIBRA'],
            ['nama'=>'title_sortasi','value' => null],
            ['nama'=>'title_juara_default','value'=>'LEMBAR JUARA ~ GARUDA 9.0 ~ GERAK KREATIVITAS GENERASI MUDA PASKIBRA'],
            ['nama'=>'title_juara','value' => null],
        ]); 
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::table('config')->where('nama','title_sortasi_default')->delete();
        DB::table('config')->where('nama','title_sortasi')->delete();
        DB::table('config')->where('nama','title_juara_default')->delete();
        DB::table('config')->where('nama','title_juara')->delete();
    }
}
