<template>

    <div>
        <div class="container" style="margin-top: 23px;">
            <p class="migaPan">Inicio <span class="negrita">> Servicios</span></p>

    <div v-for="(servicio, index) in servicios" :key="servicio.id" class="row" style="margin-bottom: 89px; margin-top: 41px;">
        <!-- Si el índice es par, imagen a la izquierda -->
        <div v-if="index % 2 === 0" class="col-lg-12">
            <div class="d-flex justify-content-between service">
                <div class="serviceImg">

                <div class="col-lg-6" :style="{
                    backgroundImage: `url(${getImagen(servicio.imagen)})`,
                    backgroundSize: 'cover',
                    backgroundPosition: 'center',
                    backgroundRepeat: 'no-repeat',
                    width: '100%',
                    height: '100%'
                }"></div>
                </div>
                <div class="col-lg-5 d-flex flex-column" style="margin-left: 20px;">
                    <div>
                        <p class="tituloS">{{ servicio.titulo }}</p>
                    </div>
                    <div class="textoS mt-3" v-html="servicio.texto"></div>
                </div>
            </div>
        </div>
        <!-- Si el índice es impar, imagen a la derecha -->
        <div v-else class="col-lg-12">
            <div class="d-flex justify-content-between service">
                <div class="col-lg-5 d-flex flex-column ">
                    <div>
                        <p class="tituloS">{{ servicio.titulo }}</p>
                    </div>
                    <div class="textoS mt-3" v-html="servicio.texto"></div>
                </div>
                <div class="serviceImg">
                <div class="col-lg-6" :style="{
                    backgroundImage: `url(${getImagen(servicio.imagen)})`,
                    backgroundSize: 'cover',
                    backgroundPosition: 'center',
                    backgroundRepeat: 'no-repeat',
                    width: '100%',
                    height: '100%'
                }"></div>
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
            servicios: []
        }
    },
    methods:{
        getImagen(fileName) {
            if (fileName) {
                const filePath = fileName.split('/').pop();
                return '/api/getImage/' + filePath
            }
        },
        obtenerServicios() {
            axios.get('/api/obtenerServicios')
                .then(response => {
                    this.servicios = response.data
                    
                })
                .catch(error => {
                    console.error(error);
                });
        }
    },
    mounted() {
        this.obtenerServicios();
    },
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');

.tituloS{
    color: #111;
font-family: Inter;
font-size: 19px;
font-style: normal;
font-weight: 600;
line-height: normal;
text-transform: uppercase;
}

.textoS{
    color: #000;
font-family: Inter;
font-size: 19.636px;
font-style: normal;
font-weight: 400;
line-height: normal;
width: 100%;
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

.serviceImg{
    width: 100%; 
    height: 360px;
}

@media screen and (max-width: 1000px) {

.service {
    flex-direction: column;
}
.tituloS{
        margin-top: 20px;
    }
}

@media screen and (max-width: 700px) {

    .serviceImg{
    width: 100%;
}
   
}




</style>