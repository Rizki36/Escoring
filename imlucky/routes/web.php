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

Route::redirect('juri','/juri/peleton/1');
Route::redirect('juri/peleton','/juri/peleton/1');

Route::group(['prefix'=>'admin','middleware'=>['web','login_admin']],function(){
    Route::get('/','DashboardController@index')->name('dashboard.index');
    // Route::redirect('/','/admin/pralomba');

    Route::group(['prefix'=>'pralomba'],function(){    
        Route::redirect('/','pralomba/kategori');
        Route::get('preferences','PreferencesController@index')->name('preferences.index');
        Route::post('preferences','PreferencesController@post')->name('preferences.post');

        Route::get('list-peleton','PeletonController@listPeleton')->name('pralomba.listPeleton');
        Route::get('list-juri','JuriController@listJuri')->name('pralomba.listJuri');
        Route::get('list-group-juri','GroupJuriController@listGroupJuri')->name('pralomba.listGroupJuri');
        Route::get('list-kategori','KategoriController@listKategori')->name('pralomba.listKategori');
        Route::get('list-group-kategori','GroupKategoriController@list_group_kategori')->name('pralomba.list_group_kategori');
        
        Route::get('pinalti' ,'PinaltiController@indexPralomba')->name('pinalti.indexPralomba');
        Route::post('pinalti','PinaltiController@updatePralomba')->name('pinalti.updatePralomba');

        Route::get('ballot' ,'BallotController@indexPralomba')->name('ballot.indexPralomba');
        Route::post('ballot','BallotController@updatePralomba')->name('ballot.updatePralomba');

        Route::get('peleton/export-excel','PeletonController@export')->name('peleton.export');
        Route::get('peleton/import-excel','PeletonController@formImport')->name('peleton.import');
        Route::post('peleton/import-excel/post','PeletonController@postFormImport')->name('peleton.import.post');
        Route::resource('peleton','PeletonController',['parameters' => ['peleton' => 'no']]);
        Route::resource('juri','JuriController',['parameters' => ['juri' => 'id']]);
        Route::resource('group-juri-juri','GroupJuriController',['parameters' => ['group-juri-juri'=>'id']])->names('group-juri');
        Route::resource('kategori','KategoriController',['parameters' => []]);      
        
        Route::group(['prefix'=>'group-juri-kategori'],function(){
            Route::get   ('/','GroupKategoriController@index')->name('group-kategori.index');
            Route::get   ('/group-juri/{group_juri}/create','GroupKategoriController@create')->name('group-kategori.create');
            Route::post  ('/group-juri/{group_juri}/','GroupKategoriController@store')->name('group-kategori.store');
            Route::get   ('/group-juri/{group_juri}/kategori/{kategori}/edit','GroupKategoriController@edit')->name('group-kategori.edit');
            Route::put   ('/group-juri/{group_juri}/kategori/{kategori}','GroupKategoriController@update')->name('group-kategori.update');
            Route::delete('/group-juri/{group_juri}/kategori/{kategori}','GroupKategoriController@destroy')->name('group-kategori.destroy');
        }); 
        
        Route::redirect('form-penilaian','form-penilaian/peleton');

        Route::get('form-penilaian/generate','PenilaianController@generatePenilaian')->name('form-penilaian.generate');
        Route::get('form-penilaian/truncate','PenilaianController@truncate')->name('form-penilaian.truncate');
        
        Route::get('form-penilaian/peleton/','PenilaianController@indexPeleton')->name('form-penilaian.indexPeleton');
        Route::get('form-penilaian/peleton/{peleton}/juri','PenilaianController@indexJuri')->name('form-penilaian.indexJuri');
        Route::get('form-penilaian/peleton/{peleton}/juri/{juri}','PenilaianController@indexPenilaian')->name('form-penilaian.indexPenilaian');
        Route::get('form-penilaian/peleton/{peleton}/juri/{juri}/table','PenilaianController@table')->name('form-penilaian.table');
        Route::get('form-penilaian/peleton/{peleton}/juri/{juri}/kategori/{kategori}/sub/{sub}/sub2/{sub2}/edit','PenilaianController@edit')->name('form-penilaian.edit');
        Route::put('form-penilaian/peleton/{peleton}/juri/{juri}/kategori/{kategori}/sub/{sub}/sub2/{sub2}','PenilaianController@update')->name('form-penilaian.update');

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

    Route::get('ballot/listBallot','BallotController@listBallot')->name('ballot.listBallot');
    Route::get('ballot','BallotController@index')->name('ballot.index');
    Route::get('ballot/{id}','BallotController@edit')->name('ballot.edit');
    Route::put('ballot/{id}','BallotController@update')->name('ballot.update');

    Route::get('sortasi','SortasiController@index')->name('sortasi.index');
    Route::post('sortasi/cetak','SortasiController@cetak')->name('sortasi.cetak');

    Route::get('pinalti/listPinalti','PinaltiController@listPinalti')->name('pinalti.listPinalti');
    Route::get('pinalti','PinaltiController@index')->name('pinalti.index');
    Route::get('pinalti/{id}','PinaltiController@edit')->name('pinalti.edit');
    Route::put('pinalti/{id}','PinaltiController@update')->name('pinalti.update');

    Route::group(['prefix'=>'laporan'],function(){
        Route::get('print-out/{no}','LaporanController@printout')->name('laporan.printout');
    });
    Route::resource('laporan','LaporanController');
});

Route::group(['prefix'=>'juri','middleware'=>['web','login_juri']],function(){
    Route::get('peleton/{no}','JuriInputController@index')->name('juriInput');
    Route::put('peleton/{peleton_id}','JuriInputController@update_one')->name('juriInput.update_one');
    Route::put('peleton/{peleton_id}/more','JuriInputController@update_more')->name('juriInput.update_more');
});

Route::redirect('/','/login');

Route::get('login','LoginController@index')->name('login.index');
Route::post('login','LoginController@post')->name('login.post');

Route::get('login/admin','LoginController@indexAdmin')->name('login.index.admin');
Route::post('login/admin','LoginController@postAdmin')->name('login.post.admin');

Route::get('logout','LoginController@logout')->name('logout');
Route::get('logout/juri','LoginController@logout_juri')->name('logout.juri');
Route::get('logout/admin','LoginController@logout_admin')->name('logout.admin');
