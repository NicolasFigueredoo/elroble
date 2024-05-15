<template>
    <div>
        <div class="container" style="margin-top: 23px;">
            <p class="migaPan">Inicio <span class="negrita">> Descargas</span></p>

            <div class="row flex-wrap" style="justify-content: space-between; margin-top: 42px; margin-bottom: 192px; row-gap: 30px;">
                <div v-for="descarga in descargas" :key="descarga.id" class="descarga col-lg-4 d-flex justify-content-between align-items-center">
                        <div>
                            <p style="margin-bottom: 0px;" class="titleD">{{ descarga.titulo }}</p>
                        </div>
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30"
                                fill="none" style="cursor: pointer;"
                                @click="descargarArchivo(descarga.id, descarga.titulo)">
                                <path
                                    d="M15 20L8.75 13.75L10.5 11.9375L13.75 15.1875V5H16.25V15.1875L19.5 11.9375L21.25 13.75L15 20ZM7.5 25C6.8125 25 6.22417 24.7554 5.735 24.2663C5.24583 23.7771 5.00083 23.1883 5 22.5V18.75H7.5V22.5H22.5V18.75H25V22.5C25 23.1875 24.7554 23.7763 24.2663 24.2663C23.7771 24.7563 23.1883 25.0008 22.5 25H7.5Z"
                                    fill="black" />
                            </svg>
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
            descargas: []
        }

    },
    methods: {
        descargarArchivo(id, nameArchive) {
            axios.get(`/api/descargarArchive/${id}`, { responseType: 'blob' })
                .then(response => {
                    const blob = new Blob([response.data], { type: response.data.type });
            const url = window.URL.createObjectURL(blob);
            const link = document.createElement('a');
            link.href = url;
            link.setAttribute('download', nameArchive);
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);

                })
                .catch(error => {
                    console.error(error);
                });

        },
        obtenerDescargas() {
            axios.get('/api/obtenerDescargas')
                .then(response => {

                    this.descargas = response.data

                })
                .catch(error => {
                    console.error(error);
                });
        }
    },
    mounted() {
        this.obtenerDescargas()
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');

.descarga {
    width: 387px;
    padding: 8px 30px;
    background: #F5F5F5;
}

.migaPan {
    color: #000;
    font-family: 'Inter';
    font-size: 12px;
    font-style: normal;
    font-weight: 300;
    line-height: 60px;
    /* 500% */
}

.negrita {
    color: #000;
    font-family: 'Inter';
    font-size: 12px;
    font-style: normal;
    font-weight: 600;
    line-height: 60px;
    /* 500% */
}

.titleD {
    color: #000;
    font-family: Inter;
    font-size: 20px;
    font-style: normal;
    font-weight: 400;
    line-height: 60px;
    /* 300% */
}
</style>