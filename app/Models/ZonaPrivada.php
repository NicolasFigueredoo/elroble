<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ZonaPrivada extends Model
{
    use HasFactory;
    protected $table = 'upload';

    protected $fillable = ['orden', 'numeropedido','formato','peso','file'];
}
