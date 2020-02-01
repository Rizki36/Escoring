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

Route::get('/', function () {
    return redirect('admin/pralomba');
});
Route::group(['prefix'=>'admin'],function(){
    Route::resource('sekolah','SekolahController',['parameters' => ['sekolah' => 'id']]);
    Route::resource('juri','JuriController',['parameters' => ['juri' => 'id']]);
    Route::resource('kategori','KategoriController',['parameters' => ['kategori' => 'id']]);
});
Route::get('admin/pralomba','PralombaController@index');
