<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\ImagenController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});


//VER IMAGENES
Route::get('/api/getImage/{fileName}', [ImagenController::class, 'getImage']);


//ADMIN


//LOGIN
Route::post('/api/verificarLogin', [UserController::class, 'verify']);
Route::get('/api/obtenerIdUsuario/{idUsuario}', [UserController::class, 'obtenerUsuario']);

//SLIDER
Route::get('/api/obtenerSliders', [AdminController::class, 'obtenerSliders']);
Route::post('/api/updateSlider', [AdminController::class, 'updateSlider']);
Route::get('/api/obtenerSliderHome/{idSlider}', [AdminController::class, 'obtenerSliderHome']);
Route::post('/api/crearSlider', [AdminController::class, 'crearSlider']);
Route::post('/api/deleteSlider', [AdminController::class, 'deleteSlider']);