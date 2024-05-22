<template>
    <div>
        <div class="container" style="margin-top: 23px;">
            <p class="migaPan">Inicio <span class="negrita">> Ferias</span></p>

            <div class="row d-flex flex-column justify-content-center align-items-center" style="margin-bottom: 110px; margin-top: 15px;">
               <div class="col-lg-12 d-flex justify-content-center">

                <div style="width: 703px; height: 572px;">
                    <div :style="{
                        backgroundImage: `url(${getImagen(this.imagen1)})`,
                        backgroundSize: 'cover',
                        backgroundPosition: 'center',
                        backgroundRepeat: 'no-repeat',
                        width: '100%',
                        height: '100%'
                    }">
                    </div>
                </div>

                <div class="d-flex flex-column" style="margin-left: 20px;">
                    <div style="width: 288px; height: 274px;">
                    <div :style="{
                        backgroundImage: `url(${getImagen(this.imagen2)})`,
                        backgroundSize: 'cover',
                        backgroundPosition: 'center',
                        backgroundRepeat: 'no-repeat',
                        width: '100%',
                        height: '100%'
                    }">
                    </div>
                </div>

                <div style="width: 288px; height: 274px; margin-top: 24px;">
                    <div :style="{
                        backgroundImage: `url(${getImagen(this.imagen3)})`,
                        backgroundSize: 'cover',
                        backgroundPosition: 'center',
                        backgroundRepeat: 'no-repeat',
                        width: '100%',
                        height: '100%'
                    }">
                    </div>
                </div>

                </div>

               </div>
               <div style="width: 78%;">
                   <div class="d-flex flex-column">
                       <div style="margin-top: 30px">
                           <p class="titleN">{{ this.titulo }}</p>
                       </div>
                       <div style="margin-top: 24px;">
                           <p class="epigrafeN">{{ this.epigrafe }}</p>
                       </div>
                       <div>
                           <div class="textoN" v-html="this.texto">
       
                           </div>
                       </div>
                       <div class="mt-4">
                            <button @click="volverFeria" type="button" class="btn botonVolver">Volver</button>

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
        return {
            imagen: null,
            titulo: null,
            epigrafe: null,
            texto: null,
            imagen1: null,
            imagen2: null,
            imagen3: null,
            imagenes: []

        }

    },
    computed: {
        idNovedad() {
            const selectedNovedadId = this.$store.getters['getIdNovedad'];
            return selectedNovedadId;
        }
    },
    methods: {

        volverFeria(){
            this.$store.commit('setNovedadId', null);
            location.reload();
        },
        getImagen(fileName) {
            if (fileName) {
                const filePath = fileName.split('/').pop();
                return '/api/getImage/' + filePath
            }

        },

        obtenerNovedadInformacion() {
            axios.get(`/api/obtenerFeria/${this.idNovedad}`)
                .then(response => {
                    this.imagen1 = response.data.imagenes[0].path
                    this.imagen2 = response.data.imagenes[1].path
                    this.imagen3 = response.data.imagenes[2].path

                    this.imagenes = response.data.imagenes
                    this.novedad = response.data;
                    this.imagen = response.data.imagen
                    this.titulo = response.data.titulo
                    this.texto = response.data.texto
                    this.epigrafe = response.data.epigrafe
                })
                .catch(error => {
                    console.error(error);
                });
        }


    },
    mounted() {
        this.obtenerNovedadInformacion();
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');


.botonVolver{
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
border-radius: 0%;
}
.textoN {
    color: var(--tipografia, #1E1E1E);
    font-family: Inter;
    font-size: 20px;
    font-style: normal;
    font-weight: 300;
    line-height: normal;
}

.epigrafeN {
    color: var(--tipografia, #1E1E1E);
    font-family: Inter;
    font-size: 20px;
    font-style: normal;
    font-weight: 300;
    line-height: normal;
}

.titleN {
    color: var(--tipografia, #1E1E1E);
    font-family: Inter;
    font-size: 36px;
    font-style: normal;
    font-weight: 400;
    line-height: 140%;
    /* 50.4px */
}

.migaPan {
    color: #000;
    font-family: Inter;
    font-size: 12px;
    font-style: normal;
    font-weight: 300;
    line-height: 60px;
    /* 500% */
}

.negrita {
    color: #000;
    font-family: Inter;
    font-size: 12px;
    font-style: normal;
    font-weight: 600;
    line-height: 60px;
    /* 500% */
}
</style>