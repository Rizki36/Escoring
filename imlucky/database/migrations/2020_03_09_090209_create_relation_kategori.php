<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRelationKategori extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        Schema::table('subs', function (Blueprint $table) {
            $table->foreign('kategori_id')
                    ->references('id')
                    ->on('kategoris')
                    ->onDelete('cascade')
                    ->onUpdate('cascade');
        });

        Schema::table('sub2s', function (Blueprint $table) {
            $table->foreign('sub_id')
                    ->references('id')
                    ->on('subs')
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
        Schema::dropIfExists('relation_kategori');
    }
}
