<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class AddDataTitleConfigTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::table('config')->insert([
            ['nama'=>'title_laporan','value' => 'LEMBAR PENILAIAN <br> GARUDA 9.0 <br> GERAK KREATIVITAS GENERASI MUDA PASKIBRA']
        ]); 
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::table('config')->where('nama','title_laporan')->delete();
    }
}
