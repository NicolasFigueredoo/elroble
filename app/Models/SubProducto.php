<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubProducto extends Model
{
    use HasFactory;
    protected $table = 'subProductos';

    protected $fillable = ['producto_id', 'codigo', 'tamaño', 'pack', 'codigobarra'];


    public function Producto()
    {
        return $this->belongsTo(Producto::class);
    }
}
