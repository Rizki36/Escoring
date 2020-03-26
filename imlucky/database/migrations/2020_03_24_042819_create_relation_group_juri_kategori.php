<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRelationGroupJuriKategori extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('group_juri_kategori', function (Blueprint $table) {
            $table->foreign('kategori_id')
                ->references('id')
                ->on('kategoris')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->foreign('group_juri_id')
                ->references('id')
                ->on('group_Juris')
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
        Schema::table('group_juri_kategori', function (Blueprint $table) {
            $table->dropForeign(['kategori_id','group_juri_id']);
        });
    }
}
