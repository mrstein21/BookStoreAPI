<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});


Route::post("/register","AuthController@Register");
Route::post("/login","AuthController@Login");

Route::post("/book/create","BookController@create");
Route::get("/book/image/{name}","BookController@getFoto");
Route::get("/book","BookController@getBooks");
Route::get("/book/search/{keyword}","BookController@getSearchBooks");
Route::post("/transaction","TransactionController@save");
Route::get("/transaction_list/{id}","TransactionController@getTransaction");
Route::get("/transaction_detail/{id}","TransactionController@getDetailTransaction");







