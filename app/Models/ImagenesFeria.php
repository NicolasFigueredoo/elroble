<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImagenesFeria extends Model
{
    use HasFactory;
    protected $table = 'imagenes_feria';

    protected $fillable = ['orden','id_feria', 'path'];

    public function Feria()
    {
        return $this->belongsTo(Feria::class);
    }
}
