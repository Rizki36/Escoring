<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePenilaianTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('penilaian', function (Blueprint $table) {
            $table->bigInteger('juri_id')->unsigned();
            $table->bigInteger('peleton_id')->unsigned();
            
            $table->bigInteger('kategori_id')->unsigned();
            $table->bigInteger('sub_id')->unsigned();
            $table->bigInteger('sub2_id')->unsigned();
            $table->float('nilai');

            $table->primary(['juri_id','peleton_id','kategori_id','sub_id','sub2_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('penilaian');
    }
}
