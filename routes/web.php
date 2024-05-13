<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\EmailsController;
use App\Http\Controllers\ImagenController;
use App\Http\Controllers\ProductosController;
use App\Http\Controllers\SuscripcionController;
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
Route::get('/api/obtenerSlider/{idSlider}', [AdminController::class, 'obtenerSlider']);
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
Route::post('/api/crearProducto', [ProductosController::class, 'crearProducto']);
Route::post('/api/deleteProducto', [ProductosController::class, 'deleteProducto']);
Route::post('/api/updateProducto', [ProductosController::class, 'updateProducto']);
Route::get('/api/obtenerProducto/{idProducto}', [ProductosController::class, 'obtenerProducto']);
Route::post('/api/guardarImagenProducto', [ProductosController::class, 'guardarImagenProducto']);
Route::post('/api/eliminarImagen', [ProductosController::class, 'eliminarImagen']);


//BANNERS
Route::get('/api/obtenerBanner', [AdminController::class, 'obtenerBanner']);
Route::post('/api/updateBanner', [AdminController::class, 'updateBanner']);

//NOVEDADES
Route::get('/api/obtenerNovedades', [AdminController::class, 'obtenerNovedades']);
Route::post('/api/crearNovedad', [AdminController::class, 'crearNovedad']);
Route::post('/api/updateNovedad', [AdminController::class, 'updateNovedad']);
Route::get('/api/obtenerNovedad/{idNovedad}', [AdminController::class, 'obtenerNovedad']);
Route::post('/api/deleteNovedad', [AdminController::class, 'deleteNovedad']);

//EMAILS
Route::post('/api/enviarMensajeSub', [EmailsController::class, 'enviarMensajeSub']);
Route::post('/api/agregarSuscripcion', [SuscripcionController::class, 'agregarSuscripcion']);
Route::get('/api/obtenerSuscripciones', [SuscripcionController::class, 'obtenerSuscripciones']);
Route::get('/api/deleteSuscripcion/{idSuscripcion}', [SuscripcionController::class, 'deleteSuscripcion']);

//VALORES
Route::get('/api/obtenerSecciones', [AdminController::class, 'obtenerSecciones']);
Route::post('/api/updateSeccion', [AdminController::class, 'updateSeccion']);
Route::get('/api/obtenerSeccion/{idSeccion}', [AdminController::class, 'obtenerSeccion']);
Route::post('/api/deleteValor', [AdminController::class, 'deleteSeccion']);
Route::post('/api/crearSeccion', [AdminController::class, 'crearSeccion']);