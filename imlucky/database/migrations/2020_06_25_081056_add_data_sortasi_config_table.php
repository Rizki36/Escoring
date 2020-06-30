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
            ['nama'=>'title_sortasi','value'=>'LEMBAR SORTASI <br> GARUDA 9.0 <br> GERAK KREATIVITAS GENERASI MUDA PASKIBRA'],
            ['nama'=>'title_juara','value'=>'LEMBAR JUARA <br> GARUDA 9.0 <br> GERAK KREATIVITAS GENERASI MUDA PASKIBRA'],
        ]); 
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::table('config')->where('nama','title_sortasi')->delete();
        DB::table('config')->where('nama','title_juara')->delete();
    }
}
