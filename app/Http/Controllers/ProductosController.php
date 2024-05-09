<?php

namespace App\Http\Controllers;

use App\Models\Producto;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Storage;

class ProductosController extends Controller
{

    public function index()
    {
        $productos = Producto::orderBy('orden', 'asc')->get();
        return response()->json($productos);


    }
}
