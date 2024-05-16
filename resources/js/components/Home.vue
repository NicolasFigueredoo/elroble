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
                                    <div>
                                        <div id="tituloSlider" v-html="slider.texto"
                                            style="color: white; padding-top: 177px;"></div>
                                    </div>
                                    <div style="margin-top: 124px;">
                                        <template v-if="slider.linkboton !== null">
                                            <a :href="slider.linkboton">
                                                <button type="button" class="btn BverProductos">{{ slider.textoboton
                                                    }}</button>
                                            </a>

                                        </template>
                                        <template v-else>


                                            <router-link class="route" to="/productos">
                                                <button type="button" class="btn BverProductos">{{
                        slider.textoboton }}</button>

                                            </router-link>

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
                                    <div id="tituloSlider" style="color: white; padding-top: 177px;"
                                        v-html="slider.texto"></div>
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
        <div class="container" style="margin-top: 80px;">
            <div class="d-flex justify-content-between row">
                <div class="col-lg-8">
                    <p class="productosD">Productos destacados</p>
                </div>
                <div class="col-lg-4 d-flex justify-content-end">
                    <router-link class="route" to="/productos">

                    <button type="button" class="btn verTodosButton">Ver todos</button>
                    </router-link>
                </div>
            </div>

            <div class="row productos mt-3" style="margin-left: 0px;">
                <div v-for="producto in productos" :key="producto.id" class="col-lg-3 tapaCard"
                    style="height: 400px;" @mouseover="showIconsHover(producto.id)"
                    @mouseout="hiddenIconsHover(producto.id)">



                    <div class="imagenProducto" :style="{
                        backgroundImage: `url(${getImagen(producto.imagenes[0].path)})`,
                        backgroundSize: 'cover',
                        backgroundPosition: 'center',
                        backgroundRepeat: 'no-repeat',
                        width: '100%',
                        height: '286px'
                    }">

                        <div :id="'productoIcono' + producto.id" class="d-flex justify-content-center"
                            style="padding-top: 120px;" @click="verProducto(producto.id)">

                            <div class="containerIcono" v-show="showIcons[producto.id]" @mouseover="changeIcon()"
                                 @mouseout="changeIcon2()"
                                style="width: 50px; height: 50px; padding: 13px; cursor: pointer;">
                                <svg class="iconoSearch" xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                    viewBox="0 0 25 25" fill="none">
                                    <path
                                        d="M22.9937 22.0496C22.7731 21.8297 22.5525 21.6105 22.3326 21.3906C21.4396 20.4982 20.5459 19.6066 19.6491 18.7112L18.1327 17.1975L18.3646 16.9076C20.1175 14.7161 20.9246 12.0058 20.6362 9.27513C20.3554 6.61225 19.0814 4.18809 17.0492 2.44999C15.1488 0.824846 12.7033 -0.0442055 10.1711 0.00173228C7.63069 0.0484231 5.21526 1.01086 3.36829 2.71281C1.47916 4.45393 0.300809 6.80127 0.0500798 9.32333C-0.20065 11.8476 0.495821 14.3787 2.01074 16.4497C3.57912 18.5937 5.67681 19.9462 8.24509 20.4696C11.3728 21.1067 14.292 20.3943 16.9205 18.3505L17.2096 18.1253L17.9528 18.8739C18.2938 19.218 18.6319 19.5584 18.9707 19.8973C19.5068 20.4342 20.0437 20.9704 20.5798 21.5066C21.6346 22.5617 22.7257 23.6529 23.7971 24.7283C24.0938 25.0265 24.3181 25.022 24.4973 24.9783C24.7375 24.9196 24.9114 24.7584 24.9755 24.5347C25.044 24.296 24.9694 24.0354 24.7767 23.8389C24.1879 23.2379 23.581 22.6332 22.9937 22.0488V22.0496ZM16.7097 16.7396C15.0035 18.4363 12.7462 19.3694 10.3518 19.3694C10.3398 19.3694 10.3277 19.3694 10.3157 19.3694C5.35079 19.3498 1.31879 15.2922 1.32857 10.3234C1.33309 7.91582 2.27954 5.65132 3.99323 3.94711C5.6994 2.24967 7.95747 1.31661 10.3541 1.31661C10.3654 1.31661 10.3767 1.31661 10.388 1.31661C15.3536 1.33468 19.3856 5.39226 19.3758 10.3611C19.3713 12.7694 18.4241 15.0347 16.7089 16.7396H16.7097Z"
                                        :fill="iconoColor" />
                                </svg>
                            </div>
                        </div>

                    </div>

                    <div class="d-flex flex-column justify-content-center align-items-center"
                        :ref="'productoH' + producto.id">
                        <div class="d-flex align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="27" height="2" viewBox="0 0 27 2"
                                fill="none">
                                <path d="M1 1H26" stroke="#E3202B" stroke-width="2" stroke-linecap="round" />
                            </svg>
                        </div>
                        <div class="ml-2 col-lg-6">
                            <p class="titleProducto" style="margin-top: 23px;">{{ producto.nombre }}</p>
                        </div>
                    </div>
                </div>


            </div>
        </div>





        <!--- SECCION NOSOTROS-->

        <div class="container-fluid" style="margin-top: 80px;">

            <div class="row empresa">
                <div class="col-lg-6 imgEmpresa">
                    <div :style="{
                        backgroundImage: `url(${getImagen(this.imagenBanner)})`,
                        backgroundSize: 'cover',
                        backgroundPosition: 'center',
                        backgroundRepeat: 'no-repeat',
                        width: '100%',
                        height: '470px'
                    }">

                    </div>

                </div>
                <div class="col-lg-6 infoEmpresa">
                    <p class="titulo">{{ this.banner.titulo }}</p>
                    <div class="infotext" style="width: 100%;">
                        <div v-html="this.banner.texto" class="text"></div>
                    </div>
                    <div class="pb-5" v-if="this.banner.link !== null">
                        <router-link class="route" to="/empresa"
                            :style="{ fontWeight: isRouteActive('/empresa') ? '700' : '500' }">
                            <button type="button" class="btn masInformacion2">{{ this.banner.textoboton }}</button>
                        </router-link>
                    </div>
                    <div class="pb-5" v-else>
                        <a :href="this.banner.link" style="text-decoration: none;"
                            >
                            <button type="button" class="btn masInformacion2">{{ this.banner.textoboton }}</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!--- SECCION NOVEDADES-->

        <div class="container" style="margin-bottom: 98px;">
            <div class="d-flex justify-content-between row" style="margin-top: 80px;">
                <div class="col-lg-8">
                    <p class="productosD">Novedades</p>
                </div>
                <div class="col-lg-4 d-flex justify-content-end">

                    <router-link class="route" to="/novedades">
                        <button type="button" class="btn verTodosButton">Ver todos</button>

                    </router-link>


                </div>
            </div>

            <div class="row flex-wrap justify-content-between" style="margin-top: 20px;">
                <div class="card col-lg-4" style="height: 603px; border: none; cursor: pointer;"
                    v-for="novedad in novedades" :key="novedad.id" @click="verNovedad(novedad.id)">
                    <div style="height: 392px;">
                        <img :src="getImagen(novedad.imagen)" class="card-img-top" alt="..."
                            style="width: 100%; height: 100%; border-radius: 0%;">
                    </div>
                    <div class="card-body" @mouseover="changeIcono" @mouseout="changeIconoOut">
                        <h5 class="card-etiqueta">{{ novedad.etiqueta }}</h5>
                        <h5 class="card-title">{{ novedad.titulo }}</h5>
                        <p class="card-text" style="height: 40px;">{{ novedad.epigrafe }}</p>
                        <div id="Hov" class="d-flex justify-content-between mt-5">
                            <p class="card-link">Leer más</p>
                            <div class="icon-container">

                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none">
                                    <path d="M12 4L10.59 5.41L16.17 11H4V13H16.17L10.59 18.59L12 20L20 12L12 4Z"
                                        :fill="iconoColorN" />
                                </svg>
                            </div>
                        </div>
                    </div>
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
            banner: [],
            novedades: [],
            imagenBanner: '',
            showIcons: {},
            iconoColor: 'white',
            iconoColorN: '#414047'


        };

    },

    methods: {

        verNovedad(id) {
            this.$emit('ver-novedad', id);
            this.$store.commit('setNovedadId', id);
            this.$router.push("/novedades");
        },
        verProducto(id) {
            this.$store.commit('setSelectedProductId', id);
            this.$emit('ver-producto', id);
            this.$router.push("/productos");

        },
        changeIconoOut() {
            this.iconoColorN = '#414047'

        },
        changeIcono() {
            this.iconoColorN = '#E3202B'

        },
        changeIcon2() {
            this.iconoColor = 'white'
        },

        changeIcon() {
            this.iconoColor = 'red'
        },

        showIconsHover(productoId) {
            this.showIcons[productoId] = true;
        },
        hiddenIconsHover(productoId) {
            this.showIcons[productoId] = false;
        },

        obtenerNovedades() {
            axios.get(`/api/obtenerNovedades`)
                .then(response => {
                    console.log(response.data, '?')
                    this.novedades = response.data;
                    this.novedades = this.novedades.filter(novedad => novedad.destacado == 1);

                })
                .catch(error => {
                    console.error(error);
                });
        },

        obtenerBannerInformacion() {
            axios.get(`/api/obtenerBanner`)
                .then(response => {
                    this.banner = response.data[0];
                    this.imagenBanner = response.data[0].imagen;
                })
                .catch(error => {
                    console.error(error);
                });
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
                    this.sliders = response.data;

                })
                .catch(error => {
                    console.error(error);
                });
        },

        obtenerProductos() {
            axios.get('/api/obtenerProductos')
                .then(response => {
                    this.productos = response.data;
                    this.productos = this.productos.filter(producto => producto.destacado == 1);

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
        this.obtenerBannerInformacion();
        this.obtenerNovedades();
    }
});

</script>
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');



.card-body:hover {
    background: #FAFAF9;
    border-radius: 0%;
}

.card-body:hover .card-link {
    color: black;
}


.card-body:hover .card-link {
    color: black;
}

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
    height: 41px;
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

.text {
    color: #000;
    font-family: Inter;
    font-size: 18px;
    font-style: normal;
    font-weight: 400;
    line-height: 25px;

}


.infotext {
    margin-top: 40px;
    padding-right: 89px;
    width: 650px;
    color: black
}

.titulo {
    margin-top: 69px;
    color: #000;
    font-family: Inter;
    font-size: 35px;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
}

.masInformacion2 {
    margin-top: 40px;
    border-radius: 0%;
    display: inline-flex;
    padding: 11px 25px;
    justify-content: center;
    align-items: center;
    gap: 20px;
    background: var(--Rojo, #E3202B);
    color: #FFF;
    font-family: Inter;
    font-size: 16px;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
}

.masInformacion2:hover {
    background: var(--Rojo, white);
    color: #E3202B;
    border: 1px solid #E3202B
}

.infoEmpresa {
    padding-left: 89px;
    background-color: #F5F5F5;
    color: white;

}

.imgEmpresa img {
    width: 100%;
    height: 100%;

}

.imgEmpresa {
    height: 470px;
    padding: 0px;
}


.card-etiqueta {
    color: var(--Rojo, #E3202B);
    font-family: Inter;
    font-size: 14px;
    font-style: normal;
    font-weight: 700;
    line-height: 140%;
    /* 19.6px */
    text-transform: uppercase;
}

.card-title {
    color: #000;
    font-family: Inter;
    font-size: 23px;
    font-style: normal;
    font-weight: 400;
    line-height: 140%;
    /* 32.2px */
}

.card-text {
    color: #000;
    font-family: Inter;
    font-size: 16px;
    font-style: normal;
    font-weight: 300;
    line-height: normal;
}

.card-link {
    color: rgba(0, 0, 0, 0.50);
    font-family: Inter;
    font-size: 16px;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
}

.containerIcono {
    background: var(--Rojo, #E3202B);
}

.containerIcono:hover {
    background: #F2F2F2;

}

.containerIcono:hover .iconoSearch {
    color: #E3202B;
}

.tapaCard:hover {
    background: rgba(205, 202, 202, 0.25);
    mix-blend-mode: multiply;
}

.tapaCard:hover .imagenProducto {
    background: rgba(205, 202, 202, 0.25);
    mix-blend-mode: multiply;

}

.card-body:hover #Hov {
    transform: translateY(-5px);
}

.card-body:hover .card-link {
    color: black;
}

.card-body:hover .svgRow path {
    fill: #E3202B;
}

#Hov {
    transition: transform 0.3s;
}

.card-link,
.svgRow path {
    transition: color 0.3s, fill 0.3s;
}

.icon-container {
    display: inline-block;
    vertical-align: middle;
    margin-left: 5px;
    /* Ajustar según sea necesario */
}

@media screen and (max-width: 400px) {

    .card {
        width: 346px;
    }

    .titulo {
        font-size: 20px;
    }

    .masInformacion2 {
        width: 100px;
    }
}
</style>