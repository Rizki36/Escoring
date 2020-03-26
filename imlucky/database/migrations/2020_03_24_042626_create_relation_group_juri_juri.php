<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRelationGroupJuriJuri extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('juris', function (Blueprint $table) {
            $table->bigInteger('group_juri_id')->unsigned()->nullable();
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
        Schema::table('juris', function (Blueprint $table) {
            $table->dropForeign(['group_juri_id']);
            $table->dropColumn('group_juri_id');
        });
    }
}
