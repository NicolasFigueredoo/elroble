<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Catalogo;
use App\Models\Categoria;
use App\Models\CategoriaHome;
use App\Models\Contacto;
use App\Models\Logo;
use App\Models\MetaDatos;
use App\Models\Seccion;
use App\Models\Servicio;
use App\Models\Slider;
use App\Models\Suscripcion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Storage;

class AdminController extends Controller
{
    //Sliders HOME
    public function obtenerSliders()
    {
        $sliders = Slider::orderBy('orden', 'asc')->get();

        return response()->json($sliders);
    }

    public function updateSlider(Request $request)
    {
        $slider = Slider::find($request->idSlider);
        $slider->orden = $request->orden;
        $slider->texto = $request->jsonCodigoSlider;
        $slider->textoboton = $request->textoboton;
        $slider->linkboton = $request->linkboton;

        if ($request->hasFile('foto')) {
          
            if (!Storage::exists('public/fotos')) {
                Storage::makeDirectory('public/fotos');
            }
        
            $photoPath = $request->file('foto')->store('fotos');
            $slider->imagen = $photoPath;
        }

        $slider->save();

        return response()->json(['message' => 'Datos subidos correctamente'], 200);

    }

    public function deleteSlider(Request $request){
        $slider = Slider::find($request->idSlider);
        $slider->delete();

        return response()->json(['message' => 'Producto Eliminada'], 200);
    }

    public function crearSlider(Request $request)
    {
        $slider = new Slider();
        $slider->orden = $request->orden;
        $slider->texto = $request->jsonCodigoSlider;
        $slider->textoboton = $request->textoboton;
        $slider->linkboton = $request->linkboton;

        if ($request->hasFile('foto')) {
          
            if (!Storage::exists('public/fotos')) {
                Storage::makeDirectory('public/fotos');
            }
        
            $photoPath = $request->file('foto')->store('fotos');
            $slider->imagen = $photoPath;
        }

        $slider->save();

        return response()->json(['message' => 'Datos subidos correctamente'], 200);

    }

    public function obtenerSlider($idSlider)
    {
        $slider = Slider::find($idSlider);
        return response()->json($slider);
    }


    //CONTACTO
    public function updateContacto(Request $request)
    {
        $contacto = Contacto::first();
        $contacto->direccion = $request->direccion;
        $contacto->email = $request->email;    
        $contacto->telefono = $request->telefono;
        $contacto->telefono_secundario = $request->telefono2;    
        $contacto->instagram = $request->instagram;    

        $contacto->save();

        return response()->json(['message' => 'Contacto actualizado con exito'], 200);
    }

    public function obtenerContacto(){
        $contacto = Contacto::all();

        return response()->json($contacto);
    }

    //LOGO
    public function obtenerLogos(){
        $logos = Logo::first();
        return response()->json($logos);
    }
  
      public function updateLogo(Request $request)
    {
        
        $logo = Logo::first();

        if ($request->hasFile('logoNav')) {
          
            if (!Storage::exists('public/fotos')) {
                Storage::makeDirectory('public/fotos');
            }
        
            $photoPath = $request->file('logoNav')->store('fotos');
            $logo->navbar = $photoPath;
        }

        if ($request->hasFile('logoFooter')) {
          
            if (!Storage::exists('public/fotos')) {
                Storage::makeDirectory('public/fotos');
            }
        
            $photoPath = $request->file('logoFooter')->store('fotos');
            $logo->footer = $photoPath;
        }
    
        $logo->save();

        return response()->json(['message' => 'Datos subidos correctamente'], 200);

    }


  

    



}
