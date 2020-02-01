<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRelationPenilaianTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('penilaian', function (Blueprint $table) {
            
            $table->foreign('juri_id')
                    ->references('kode')
                    ->on('juris')
                    ->onDelete('cascade')
                    ->onUpdate('cascade');

            $table->foreign('sekolah_id')
                    ->references('id')
                    ->on('sekolahs')
                    ->onDelete('cascade')
                    ->onUpdate('cascade');
            
            $table->foreign('sub2_id')
                    ->references('id')
                    ->on('sub2s')
                    ->onDelete('cascade')
                    ->onUpdate('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('penilaian', function (Blueprint $table) {
            $table->dropForeign(['juri_id','sekolah_id','sub2_id']);
        });
    }
}
