<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Catalogo;
use App\Models\Categoria;
use App\Models\CategoriaHome;
use App\Models\Contacto;
use App\Models\Logo;
use App\Models\MetaDatos;
use App\Models\Novedad;
use App\Models\Seccion;
use App\Models\Servicio;
use App\Models\Slider;
use App\Models\Suscripcion;
use App\Models\Valores;
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

    //OBTENER BANNER
    public function obtenerBanner()
    {
        $banners = Banner::all();
        return response()->json($banners);
    }

    public function updateBanner(Request $request)
    {
        $banner = Banner::find($request->idBanner);
        $banner->titulo = $request->bannerTitulo;
        $banner->texto = $request->bannerTexto;
        $banner->link = $request->linkBoton;
        $banner->textoboton = $request->txtBoton;

        if ($request->hasFile('foto')) {
          
            if (!Storage::exists('public/fotos')) {
                Storage::makeDirectory('public/fotos');
            }
        
            $photoPath = $request->file('foto')->store('fotos');
            $banner->imagen = $photoPath;
        }

        $banner->save();

        return response()->json(['message' => 'Datos subidos correctamente'], 200);

    }


    //NOVEDADES
    public function obtenerNovedades()
    {
        $novedades = Novedad::orderBy('orden', 'asc')->get();
        return response()->json($novedades);
    }

    public function obtenerNovedad($idNovedad)
    {
        $novedad = Novedad::find($idNovedad);
        return response()->json($novedad);
    }

    public function crearNovedad(Request $request)
    {
        $novedad = new Novedad();
        $novedad->orden = $request->orden;
        $novedad->titulo = $request->titulo;
        $novedad->epigrafe = $request->epigrafe;
        $novedad->etiqueta = $request->etiqueta;
        $novedad->destacado = $request->destacado;
        
        $novedad->texto = $request->texto;
        if ($request->hasFile('foto')) {
          
            if (!Storage::exists('public/fotos')) {
                Storage::makeDirectory('public/fotos');
            }
        
            $photoPath = $request->file('foto')->store('fotos');
            $novedad->imagen = $photoPath;
        }

        $novedad->save();


        return response()->json($novedad);
    }

    public function updateNovedad(Request $request)
    {
        $novedad = Novedad::find($request->idNovedad);
        $novedad->orden = $request->orden;
        $novedad->titulo = $request->titulo;
        $novedad->epigrafe = $request->epigrafe;
        $novedad->etiqueta = $request->etiqueta;
        $novedad->destacado = $request->destacado;
        
        $novedad->texto = $request->texto;
        if ($request->hasFile('foto')) {
          
            if (!Storage::exists('public/fotos')) {
                Storage::makeDirectory('public/fotos');
            }
        
            $photoPath = $request->file('foto')->store('fotos');
            $novedad->imagen = $photoPath;
        }

        $novedad->save();


        return response()->json($novedad);
    }

    public function deleteNovedad(Request $request)
    {
        $novedad = Novedad::find($request->idNovedad);
        $novedad->delete();
        return response()->json($novedad);
    }


    //VALORES
    public function obtenerSecciones()
    {
        $secciones = Valores::orderBy('orden', 'asc')->get();
        return response()->json($secciones);
    }

    public function obtenerSeccion($idSeccion)
    {
        $seccion = Valores::find($idSeccion);
        return response()->json($seccion);
    }

    public function updateSeccion(Request $request)
    {
        $seccion = Valores::find($request->idSeccion);
        $seccion->orden = $request->orden;
        $seccion->titulo = $request->titulo;
        $seccion->texto = $request->texto;
        $seccion->icono = $request->icono;
        $seccion->save();

        return response()->json(['message' => 'Datos subidos correctamente'], 200);

    }

    public function deleteSeccion(Request $request){
        $seccion = Valores::find($request->idValor);
        $seccion->delete();

        return response()->json(['message' => 'Valor Eliminado'], 200);
    }

    public function crearSeccion(Request $request)
    {
        $seccion = new Valores();
        $seccion->orden = $request->orden;
        $seccion->titulo = $request->titulo;
        $seccion->texto = $request->texto;
        $seccion->icono = $request->icono;
        $seccion->save();

        return response()->json(['message' => 'Datos subidos correctamente'], 200);

    }

  

    



}
