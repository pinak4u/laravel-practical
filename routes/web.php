<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

//Route::get('/home', 'HomeController@index')->name('home');
Route::group(['prefix'=>'/user','middleware'=>['auth','statusCheck']],function(){
    Route::get('/home','UserController@index')->name('user.home');
    Route::get('/profile','UserController@profile')->name('user.profile');
    Route::patch('/profile/{user}','UserController@updateProfile')->name('user.profile.update');
});
Route::group(['prefix'=>'admin','middleware'=>['auth', 'admin']],function(){
    Route::get('/home','AdminController@index')->name('admin.home');
});

