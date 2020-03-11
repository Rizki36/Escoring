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
                    ->references('id')
                    ->on('juris')
                    ->onDelete('cascade')
                    ->onUpdate('cascade');

            $table->foreign('peleton_id')
                    ->references('id')
                    ->on('peletons')
                    ->onDelete('cascade')
                    ->onUpdate('cascade');
            
                    
            $table->foreign('kategori_id')
                    ->references('id')
                    ->on('kategoris')
                    ->onDelete('cascade')
                    ->onUpdate('cascade');

            $table->foreign('sub_id')
                    ->references('id')
                    ->on('subs')
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
            $table->dropForeign(['juri_id','peleton_id','kategori_id','sub_id','sub2_id']);
        });
    }
}
