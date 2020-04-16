<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateConfigTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('config', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nama')->unique();
            $table->string('value');
            $table->timestamps();
        });

        DB::table('config')->insert([
                ['nama'=>'pinalti_umum','value'=>100],
                ['nama'=>'pinalti_utama','value'=>100],
                ['nama'=>'ballot_umum','value'=>0],
                ['nama'=>'ballot_utama','value'=>0],
            ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('config');
    }
}
