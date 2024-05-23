<template>
    <div>

        <div class="container" style="margin-top: 23px;">
            <p class="migaPan">Inicio <span class="negrita">> Ferias</span></p>

               <div class="row flex-wrap justify-content-between" style="margin-top: 25px; margin-bottom: 176px;">
                   <div class="card col-lg-4" style="height: 603px; border: none; cursor: pointer;"
                       v-for="novedad in novedades" :key="novedad.id" @click="verNovedad(novedad.id)">
                           <div style="height: 392px;">
                            <div v-if="novedad.imagenes && novedad.imagenes.length > 0" :style="{
                            backgroundImage: `url(${getImagen(novedad.imagenes[0].path)})`,
                            backgroundSize: 'cover',
                            backgroundPosition: 'center',
                            backgroundRepeat: 'no-repeat',
                            width: '100%',
                            height: '100%'
                        }"></div>
                           </div>
                           <div class="card-body" @mouseover="changeIcono" @mouseout="changeIconoOut">
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

export default {
    
    data() {
        return{
            novedades: [],
            iconoColorN: '#414047',

        }
        
    },
    methods:{
        changeIconoOut(){
            this.iconoColorN = '#414047'

        },
        changeIcono(){
            this.iconoColorN = '#E3202B'

        },
        verNovedad(id) {
            this.$emit('ver-novedad', id);
        },
        getImagen(fileName) {
            if (fileName) {
                const filePath = fileName.split('/').pop();
                return '/api/getImage/' + filePath
            }
        },
        obtenerNovedades() {
            axios.get(`/api/obtenerFerias`)
                .then(response => {
                    this.novedades = response.data;
                })
                .catch(error => {
                    console.error(error);
                });
        },
        
    },
    mounted(){
        this.obtenerNovedades();

    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');

.card-body:hover{
    background: #FAFAF9;
    border-radius: 0%;
}

.card-body:hover .card-link{
    color: black;
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

.migaPan{
    color: #000;
font-family: Inter;
font-size: 12px;
font-style: normal;
font-weight: 300;
line-height: 60px; /* 500% */
}
.negrita{
    color: #000;
font-family: Inter;
font-size: 12px;
font-style: normal;
font-weight: 600;
line-height: 60px; /* 500% */
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

.card-link, .svgRow path {
    transition: color 0.3s, fill 0.3s;
}

.icon-container {
    display: inline-block;
    vertical-align: middle;
    margin-left: 5px; /* Ajustar según sea necesario */
}

</style>