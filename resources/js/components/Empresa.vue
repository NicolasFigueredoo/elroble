<template>

    <div>
        <div class="container">
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
                    <div class="col-lg-6 infoEmpresa" style="padding-left: 80px; padding-top: 80px;">
                        <p class="titulo" >{{ this.banner.titulo }}</p>
                        <div class="infotext" style="width: 100%;">
                            <div v-html="this.banner.texto" class="text"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="w-100" style="background: #F5F5F5; height: 637px; margin-top: 80px;">
            <div class="container" style="padding-top: 70px;">
                <div>
                    <p class="title">¿Por qué elegirnos?</p>
                </div>

                <div class="row d-flex">
                    <div v-for="seccion in secciones" :key="seccion.id" class="col-lg-3 m-2 tarjeta">
                        <!-- <div class="iconNosotros" v-html="seccion.imagen"></div> -->
                        <p class="textoIcon">{{ seccion.titulo }}</p>
                        <div class="infoIcon w-100" v-html="seccion.texto"> </div>
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

    name: 'Empresa',
    data() {
        return {
            banner: [],
            imagenBanner: '',
            secciones: []



        };

    },

    methods: {
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

        obtenerSecciones() {
            axios.get('/api/obtenerSecciones')
                .then(response => {
                    this.secciones = response.data;
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
        this.obtenerBannerInformacion();
        this.obtenerSecciones()

    }
});

</script>


<style scoped>
.titulo{
    color: #000;
font-family: Inter;
font-size: 32px;
font-style: normal;
font-weight: 500;
line-height: normal;
}

.infotext{
    color: #000;
font-family: Inter;
font-size: 18px;
font-style: normal;
font-weight: 400;
line-height: 25px; /* 138.889% */
}

.title{
    color: #000;
font-family: Inter;
font-size: 35px;
font-style: normal;
font-weight: 500;
line-height: normal;
}

.tarjeta {
    width: 392px;
    height: 410px;
    background-color: white;
    text-align: center;
    padding-left: 20px;
    padding-right: 20px;
}
</style>