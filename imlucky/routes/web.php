<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Route;

// Route::get('/', function () {
//     return redirect('admin/pralomba');
// });
Route::group(['prefix'=>'admin'],function(){
    Route::get('pralomba/list-peleton','PralombaController@listPeleton')->name('pralomba.listPeleton');
    Route::get('pralomba/list-juri','PralombaController@listJuri')->name('pralomba.listJuri');
    Route::get('pralomba/list-kategori','PralombaController@listKategori')->name('pralomba.listKategori');

    Route::resource('peleton','PeletonController',['parameters' => ['peleton' => 'no']]);
    Route::resource('juri','JuriController',['parameters' => ['juri' => 'id']]);
    Route::resource('kategori','KategoriController',['parameters' => ['kategori' => 'id']]);      
    
    /**
     * Crud sub
     */
    Route::group(['prefix'=>'kategori/{kategori}'],function(){
        Route::get ('sub','SubController@index')->name('sub.index');
        Route::get('sub/create','SubController@create')->name('sub.create');
        Route::post('sub','SubController@store')->name('sub.store');
        Route::get('sub/{id}/edit','SubController@edit')->name('sub.edit');
        Route::put('sub/{id}','SubController@update')->name('sub.update');
        Route::delete('sub/{id}','SubController@destroy')->name('sub.destroy');
    });

});
Route::get('admin/pralomba','PralombaController@index');
