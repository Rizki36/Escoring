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

Route::group(['prefix'=>'admin'],function(){

    Route::group(['prefix'=>'pralomba'],function(){    
        Route::get('list-peleton','PeletonController@listPeleton')->name('pralomba.listPeleton');
        Route::get('list-juri','JuriController@listJuri')->name('pralomba.listJuri');
        Route::get('list-kategori','KategoriController@listKategori')->name('pralomba.listKategori');
        Route::get('pralomba','PralombaController@index')->name('pralomba.index');

        Route::resource('peleton','PeletonController',['parameters' => ['peleton' => 'no']]);
        Route::resource('juri','JuriController',['parameters' => ['juri' => 'id']]);
        Route::resource('kategori','KategoriController',['parameters' => []]);      
        Route::resource('form-penilaian','PenilaianController',['parameters' => []]);      

        Route::group(['prefix'=>'kategori/{kategori}'],function(){
            Route::get ('sub','SubController@index')->name('sub.index');
            Route::get('sub/create','SubController@create')->name('sub.create');
            Route::post('sub','SubController@store')->name('sub.store');
            Route::get('sub/{sub}/edit','SubController@edit')->name('sub.edit');
            Route::put('sub/{sub}','SubController@update')->name('sub.update');
            Route::delete('sub/{sub}','SubController@destroy')->name('sub.destroy');
            Route::group(['prefix'=>'sub/{sub}'],function(){
                Route::get ('sub2','Sub2Controller@index')->name('sub2.index');
                Route::get('sub2/create','Sub2Controller@create')->name('sub2.create');
                Route::post('sub2','Sub2Controller@store')->name('sub2.store');
                Route::get('sub2/{sub2}/edit','Sub2Controller@edit')->name('sub2.edit');
                Route::put('sub2/{sub2}','Sub2Controller@update')->name('sub2.update');
                Route::delete('sub2/{sub2}','Sub2Controller@destroy')->name('sub2.destroy');
            });
        });
    });

    Route::resource('laporan','LaporanController');
    // Route::group(['prefix'=>'laporan'],function(){

    // });

});