<template>
    <div>
        <div class="container" style="margin-top: 23px;">
            <p class="migaPan">Inicio <span class="negrita">> Novedades</span></p>

            <div class="d-flex flex-column justify-content-center align-items-center"
                style="margin-bottom: 110px; margin-top: 15px;">
                <div class="imgNovedadP">
                    <div :style="{
                        backgroundImage: `url(${getImagen(this.imagen)})`,
                        backgroundSize: 'cover',
                        backgroundPosition: 'center',
                        backgroundRepeat: 'no-repeat',
                        width: '100%',
                        height: '100%'
                    }">
                    </div>
                </div>

                <div class="d-flex flex-column infoNovedadP">

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
                            <button @click="volverNovedad" type="button" class="btn botonVolver">Volver</button>



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
            texto: null

        }

    },
    computed: {
        idNovedad() {
            const selectedNovedadId = this.$store.getters['getIdNovedad'];
            return selectedNovedadId;
        }
    },
    methods: {
        volverNovedad(){
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
            axios.get(`/api/obtenerNovedad/${this.idNovedad}`)
                .then(response => {
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

.imgNovedadP {
    width: 809px;
    height: 572px;
}

.infoNovedadP {
    width: 809px;
}

.botonVolver {
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

.botonVolver:hover {
    background: var(--Rojo, #FFF);
    color: #E3202B;
    border: 1px solid #E3202B;
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

@media screen and (max-width: 1000px) {
    .imgNovedadP {
        width: 100%;
    }

    .infoNovedadP {
        width: 100%;
    }
}
</style>