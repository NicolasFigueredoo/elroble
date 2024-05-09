<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\ImagenController;
use App\Http\Controllers\ProductosController;
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

//CONTACTO
Route::post('/api/updateContacto', [AdminController::class, 'updateContacto']);
Route::get('/api/obtenerContacto', [AdminController::class, 'obtenerContacto']);


//LOGO
Route::post('/api/updateLogo', [AdminController::class, 'updateLogo']);
Route::get('/api/obtenerLogos', [AdminController::class, 'obtenerLogos']);
Route::get('/api/obtenerLogo/{idLogo}', [AdminController::class, 'obtenerLogo']);

//PRODUCTOS
Route::get('/api/obtenerProductos', [ProductosController::class, 'index']);
