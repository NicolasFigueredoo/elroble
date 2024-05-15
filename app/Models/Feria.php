<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Feria extends Model
{
    use HasFactory;
    protected $table = 'ferias';

    protected $fillable = ['orden', 'titulo','epigrafe', 'etiqueta','texto','destacado'];

    public function imagenes()
    {
        return $this->hasMany(ImagenesFeria::class, 'id_feria', 'id');
    }
}
