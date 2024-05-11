<template>
    <div>

        <!-- CAROUSEL -->
        <div id="carouselExampleIndicators" class="carousel slide w-100" style="height: 586px;">
            <div class="container">
                <div class="carousel-indicators d-flex justify-content-start"
                    style="margin-left: 16.2%; margin-bottom: 60px;">
                    <button v-for="(slider, index) in sliders" :key="index" type="button"
                        :data-bs-target="'#carouselExampleIndicators'" :data-bs-slide-to="index"
                        :class="{ 'active': index === 0 }" :aria-current="index === 0 ? 'true' : null"
                        :aria-label="'Slide ' + (index + 1)"></button>
                </div>
            </div>
            <div class="carousel-inner">
                <div v-for="(slider, index) in sliders" :key="slider.id"
                    :class="['carousel-item', { 'active': index === 0 }]">

                    <template v-if="isImage(slider.imagen)">
                        <div :style="{
                        backgroundImage: `url(${getImagen(slider.imagen)})`,
                        backgroundSize: 'cover',
                        backgroundPosition: 'center',
                        backgroundRepeat: 'no-repeat',
                        width: '100%',
                        height: '586px'
                    }">
                            <div class="container">

                                <div class="d-flex flex-column">
                                    <div style="width: 400px;">
                                        <p id="tituloSlider" style="color: white; padding-top: 177px;">Espatula
                                            curva
                                            para balde</p>
                                    </div>
                                    <div style="margin-top: 124px;">
                                        <template v-if="slider.linkboton !== ''">
                                            <a :href="slider.linkboton">
                                                <button type="button" class="btn BverProductos">{{ slider.textoboton
                                                    }}</button>
                                            </a>

                                        </template>
                                        <template v-else>
                                            <button type="button" class="btn BverProductos">{{ slider.textoboton
                                                }}</button>
                                        </template>
                                    </div>


                                </div>



                            </div>

                        </div>
                    </template>
                    <template v-else>
                        <div class="container" style="position: absolute; z-index: 10; margin-left: 15.5%;">

                            <div class="d-flex flex-column">
                                <div style="width: 400px;">
                                    <p id="tituloSlider" style="color: white; padding-top: 177px;">Espatula
                                        curva
                                        para balde</p>
                                </div>
                                <div style="margin-top: 124px;">
                                    <template v-if="slider.linkboton !== ''">
                                        <a :href="slider.linkboton">
                                            <button type="button" class="btn BverProductos">{{ slider.textoboton
                                                }}</button>
                                        </a>

                                    </template>
                                    <template v-else>
                                        <button type="button" class="btn BverProductos">{{ slider.textoboton
                                            }}</button>
                                    </template>
                                </div>


                            </div>



                        </div>
                        <video class="d-block w-100" style="width: 100%; height: 586px; object-fit: cover;" controls
                            autoplay muted>
                            <source :src="getImagen(slider.imagen)" type="video/mp4">
                            Tu navegador no soporta la etiqueta de video.
                        </video>

                    </template>
                </div>
            </div>
        </div>

        <!-- PRODUCTOS DESTACADOS -->
        <div class="container"  style="margin-top: 80px;">
            <div class="d-flex justify-content-between">
                <div>
                    <p class="productosD">Productos destacados</p>
                </div>
                <div>
                    <button type="button" class="btn verTodosButton">Ver todos</button>
                </div>
            </div>

            <div class="row productos" style="margin-left: 0px; gap: 48px;">
                <div v-for="producto in productos" :key="producto.id" class="col-lg-3"
                    style="width: 288px; height: 400px; border: 1px solid black;">
                    <div :style="{
                        backgroundImage: `url(${getImagen(producto.imagenes[0].path)})`,
                        backgroundSize: 'cover',
                        backgroundPosition: 'center',
                        backgroundRepeat: 'no-repeat',
                        width: '100%',
                        height: '286px'
                    }">

                        <div class="d-flex justify-content-center" style="padding-top: 30px;">
                            <img v-if="showIcons" src="../../img/iconoVerProducto.png" alt="Icono">
                        </div>

                    </div>
                    <div class="d-flex flex-column justify-content-center align-items-center">
                        <div class="d-flex align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="27" height="2" viewBox="0 0 27 2"
                                fill="none">
                                <path d="M1 1H26" stroke="#E3202B" stroke-width="2" stroke-linecap="round" />
                            </svg>
                        </div>
                        <div class="ml-2">
                            <p class="titleProducto" style="margin-top: 23px;">{{ producto.nombre }}</p>
                        </div>
                    </div>


                </div>
                <div class="col-lg-3">

                </div>
                <div class="col-lg-3">

                </div>
                <div class="col-lg-3">

                </div>

            </div>

        </div>


    </div>

</template>

<script>

import axios from 'axios';
import { defineComponent } from 'vue';


export default defineComponent({

    name: 'Home',
    data() {
        return {
            currentSliderIndex: 0,
            sliders: [],
            productos: [],
            showIcons: false,
            hovered: false


        };

    },

    methods: {

        changeIcon() {
            this.hovered = true;
        },
        resetIcon() {
            this.hovered = false;
        },
        isImage(url) {
            if (url) {
                const extension = url.split('.').pop().toLowerCase();
                return ['jpg', 'jpeg', 'png', 'gif'].includes(extension);
            }
        },


        setCurrentSlider(texto, index) {
            $('.textoSlider').html(texto);
            $('.carousel-indicators button').removeClass('active');
            $('.carousel-indicators button[data-bs-slide-to="' + index + '"]').addClass('active');
        },

        isRouteActive(route) {
            return this.$route.path === route;
        },

        obtenerSlidersHome() {
            axios.get('/api/obtenerSliders')
                .then(response => {
                    console.log(response)
                    this.sliders = response.data;

                })
                .catch(error => {
                    console.error(error);
                });
        },

        obtenerProductos() {
            axios.get('/api/obtenerProductos')
                .then(response => {
                    console.log(response)
                    this.productos = response.data;
                    this.productos = this.productos.filter(producto => producto.destacado === 1);

                })
                .catch(error => {
                    console.error(error);
                });
        },



        getImagen(fileName) {
            if (fileName) {
                const filePath = fileName.split('/').pop();
                return '/api/getImage/' + filePath
            }
        }
    },

    mounted() {
        this.obtenerSlidersHome();
        this.obtenerProductos();
    }
});

</script>
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');

.BverProductos {
    padding: 11px 25px;
    justify-content: center;
    align-items: center;
    gap: 20px;
    border: 1px solid var(--Rojo, #E3202B);
    background: #FFF;
    color: var(--Rojo, #E3202B);
    font-family: Inter;
    font-size: 16px;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
    border-radius: 0%;
}

#tituloSlider {
    color: #FFF;
    font-family: Inter;
    font-size: 40px;
    font-style: normal;
    font-weight: 500;
    line-height: 49px;
}

.BverProductos:hover {
    background: #FFF;
    color: var(--Rojo, #E3202B);
}

.carousel-indicators button {
    width: 14px;
    height: 14px;
    margin: 0 2px;
    background-color: rgba(255, 255, 255, 0.5);
    border: none;
    border-radius: 50%;
}

.carousel-indicators button.active {
    background-color: rgba(255, 255, 255, 1);
}

.verTodosButton {
    padding: 11px 25px;
    justify-content: center;
    align-items: center;
    gap: 20px;
    border: 1px solid var(--Rojo, #E3202B);
    background: #FFF;
    color: var(--Rojo, #E3202B);
    font-family: Inter;
    font-size: 16px;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
    border-radius: 0%;
}

.verTodosButton:hover {
    border: 1px solid var(--Rojo, #E3202B);
    color: var(--Rojo, #E3202B);

}

.productosD {
    color: #000;
    font-family: Inter;
    font-size: 35px;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
}

.titleProducto {
    color: #000;
    text-align: center;
    font-family: Inter;
    font-size: 21px;
    font-style: normal;
    font-weight: 400;
    line-height: 25px;
}

.productos{
    gap: 40px;
}
</style>