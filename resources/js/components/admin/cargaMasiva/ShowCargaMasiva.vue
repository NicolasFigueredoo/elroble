<template>
    <div class="container">

        <div class="w-100 border-bottom">
            <h1>CARGAR CARGA MASIVA</h1>
        </div>

        <form class="mt-3">
            <div class="mt-3">
                <label class="form-label">Archivo</label>
                <input type="file" ref="fotoSlider" class="form-control" id="imgs" @change="guardarFoto()">
            </div>

            <div class="w-100 d-flex justify-content-end mt-3">
                <button @click="crearDescarga()" type="button" class="btn"
                    style="background-color: #7F7F7F; color: white;">Subir</button>
            </div>

        </form>



    </div>

</template>

<script>
import 'jquery';
import 'bootstrap';
import axios from 'axios';
export default {

    data() {
        return {
            jsonCodigoSlider: '',
            foto: null,
            orden: null,
        }

    },
    methods: {
        resetCampos(){
            $('#orden').val('');
            $('#titulo').val('');
        },
        guardarFoto() {
            const file = this.$refs.fotoSlider;
            this.foto = file.files[0]
        },
        crearDescarga() {
            let formData = new FormData();
            formData.append('file', this.foto);

            axios.post('/api/cargarCargaMasiva', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            })
                .then(response => {
                    this.$store.commit('setMostrarAlerta', true);
                    this.$store.commit('setClaseAlerta', 1);
                    this.$store.commit('setMensajeAlerta', 'Datos cargados con éxito');
                    this.$store.commit('mostrarComponente', 130);
                    this.resetCampos()

                })
                .catch(error => {
                    console.error(error);
                    this.$store.commit('setMostrarAlerta', true);
                    this.$store.commit('setClaseAlerta', 2);
                    this.$store.commit('setMensajeAlerta', error);
                });


        },
   

    }

}
</script>

<style scoped>

.form-check-input:checked {
    background-color: #7F7F7F;
    border-color: #7F7F7F;
}
.encabezado {
    background-color: rgb(52, 68, 127);
    color: white;
}

* {
    font-size: 16px;
    color: black;
    font-family: "Montserrat", sans-serif;
    font-weight: 600;
}

h1 {
    font-size: 28px;
    color: black;
    font-family: "Montserrat", sans-serif;
    font-weight: 700;
}
</style>
