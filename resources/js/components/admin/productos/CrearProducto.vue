<template>
    <div class="container">

        <div class="w-100 border-bottom">
            <h1>CREAR PRODUCTO</h1>
        </div>

        <form class="mt-3">
            <div class="row">
                <div class="col-md-8">
                    <label class="form-label">Nombre producto</label>
                    <input type="text" class="form-control" id="nombre">

                </div>
                <div class="col-md-2 d-flex flex-column align-items-center">
                        <label class="form-check-label" for="checkbox3">Destacado</label>
                        <input type="checkbox" class="form-check-input" id="destacado">
                </div>
                <div class="col-md-2">
                    <label class="form-label">Orden</label>
                    <input type="text" class="form-control" id="orden">
                </div>
            </div>

            <div class="mb-3 mt-3">
                <label for="exampleInputPassword1" class="form-label">Texto</label>
                <textarea class="summernote" id="editor"></textarea>
            </div>

            <div class="mensaje">

            </div>
            <div class="w-100 d-flex justify-content-end">
                <button @click="crearProducto()" type="button" class="btn mt-3"
                    style="background-color: rgb(52, 68, 127); color: white;">Crear</button>
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
            fotoProducto: null,
            fotoProducto2: null,
            productoDestacado: null,

        }

    },
    methods: {

        guardarFoto() {
            const file = this.$refs.fotoProduct;
            this.fotoProducto = file.files[0]
        },
        guardarFoto2() {
            const file = this.$refs.fotoProduct2;
            this.fotoProducto2 = file.files[0]
        },
        crearProducto() {


            let linea = $('#linea').prop("checked");
            let especial = $('#especial').prop("checked");
            let destacado = $('#destacado').prop("checked");

            if (linea === true) {
                this.productoLinea = 1;
            }
            if (especial === true) {
                this.productoEspecial = 1;
            }
            if (destacado === true) {
                this.productoDestacado = 1;
            }



            axios.post('/api/crearProducto', {
                orden: $('#orden').val(),
                nombre: $('#nombre').val(),
                material: $('#material').val(),
                tipo: $('#tipo').val(),
                linea: this.productoLinea,
                especial: this.productoEspecial,
                destacado: this.productoDestacado,
                color: $('#color').val(),
                medida: $('#medida').val(),
                imagen: this.fotoProducto,
                imagen2: this.fotoProducto2,
                unidad: $('#unidad').val(),
                aplicaciones: this.appSelect
            },
                {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                }

            )
                .then(response => {
                    console.log(response)
                    this.$store.commit('setMostrarAlerta', true);
                    this.$store.commit('setClaseAlerta', 1);
                    this.$store.commit('setMensajeAlerta', 'Producto creado con éxito');
                    this.$store.commit('mostrarComponente', 25);

                })
                .catch(error => {
                    $('.mensaje').html('<p class="text-danger">Faltan completar campos</p>')
                    console.error('Error ingresar Admin:', error);
                });

        },
        summerNote() {
            $('#editor').summernote({
                height: 300,
            });
            $('.summernote').summernote();
            var noteBar = $('.note-toolbar');
            noteBar.find('[data-toggle]').each(function () {
                $(this).attr('data-bs-toggle', $(this).attr('data-toggle')).removeAttr('data-toggle');
            });
        },
    },

    mounted() {

        this.summerNote();


    }
}
</script>


<style scoped>
.form-check-input:checked {
    background-color: #7F7F7F;
    border-color: #7F7F7F;
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