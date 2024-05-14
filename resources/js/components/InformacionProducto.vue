<template>
    <div class="container">
        <div class="row d-flex" style="padding-top: 39px;">
            <div class="col-lg-1 d-flex flex-column">
                <div v-for="(imagen, index) in imagenes.slice(0, 5)" :key="imagen.id" @click="seleccionarImagen(index)"
                    style="width: 80px; height: 80px; margin-top: 10px;">

                    <div :style="{
                        backgroundImage: `url(${getImagen(imagen.path)})`,
                        backgroundSize: 'contain',
                        backgroundPosition: 'center',
                        backgroundRepeat: 'no-repeat',
                        width: '100%',
                        height: '100%',
                        cursor: 'pointer',
                        border: imagenSeleccionada === index ? '2px solid #FF4D00' : '1px solid #E5E5E5',
                    }">

                    </div>
                </div>
            </div>

            <div class="col-lg-5 d-flex mt-2">

                <div class="contenedor-imagen" style="width: 454px; height: 448px;">
                    <div ref="imgenPrincipal" @click="mostrarImagenProducto()" v-if="this.producto" :style="{
                        backgroundImage: `url(${getImagen(imagenes[imagenSeleccionada].path)})`,
                        backgroundPosition: 'center',
                        backgroundRepeat: 'no-repeat',
                        border: '1px solid #E5E5E5',
                        width: '100%',
                        height: '100%',
                        cursor: 'pointer',
                    }">

                    </div>
                </div>
            </div>

            <div class="col-lg-6 row d-flex flex-column pt-4">
                <div>
                    <p class="titleProducto">{{ this.nombre }}</p>
                </div>
                <div>
                    <div class="textoInfo" v-html="this.texto">

                    </div>
                </div>

            </div>
        </div>
        <div class="table-responsive">

        <table class="table w-100" style="margin-top: 131px; margin-bottom: 170px;">
            <thead style="height: 74px">
                <tr>
                    <th scope="col" class="col-3 encabezado">Código</th>
                    <th scope="col" class="col-3 encabezado">Tamaño</th>
                    <th scope="col" class="col-3 encabezado">Pack</th>
                    <th scope="col" class="col-3 encabezado">Código de barras</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(subProducto, index) in subProductos" :key="index">
                    <td class="infoProducto col-3">
                        {{subProducto.codigo }}
                    </td>
                    <td class="infoProducto col-3">
                        {{subProducto.tamaño }}
                    </td>
                    <td class="infoProducto col-3">
                        {{subProducto.pack }}

                    </td>
                    <td class="infoProducto col-3">
                        {{subProducto.codigobarra }}

                    </td>
                </tr>



            </tbody>
        </table>
    </div>

        <div class="contenedorModal">

        </div>
    </div>
</template>

<script>
import axios from "axios";

export default {

    data() {
        return {
            productos: [],
            imagenes: [],
            imagenSeleccionada: 0,
            texto: null,
            nombre: null,
            subProductos: []
        }

    },
    computed: {
        idProducto() {
            const selectedProductId = this.$store.getters['getSelectedProductId'];
            return selectedProductId;
        }
    },
    methods: {
        mostrarImagenProducto(name) {


            let urlImage = this.$refs.imgenPrincipal.style.backgroundImage;
            const urlRegex = /url\(['"]?(.*?)['"]?\)/;
            const urlString = urlImage.match(urlRegex);

            $('.contenedorModal').html(`
        <div class="modal fade modal-md" tabindex="-1" id="myModal" ref="myModal">
            <div class="container-fluid modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">${this.nombre}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <img style="width: 100%; heigth: 100%" src="${urlString[1]}" ref="imgenPrincipal" alt="producto"  />
                    </div>
                </div>
            </div>
        </div>
    `);
            $('#myModal').modal('show');






        },
        seleccionarImagen(index) {
            this.imagenSeleccionada = index;
        },
        getImagen(fileName) {
            if (fileName) {
                const filePath = fileName.split('/').pop();
                return '/api/getImage/' + filePath
            }

        },
        obtenerInformacionProducto() {
            axios.get(`/api/obtenerProducto/${this.idProducto}`)
                .then((response) => {
                    this.producto = response.data
                    this.nombre = response.data.nombre,
                        this.texto = response.data.texto
                    this.imagenes = response.data.imagenes
                    this.subProductos = response.data.sub_productos

                })
                .catch((error) => {
                    console.error(
                        "Error al obtener informacion producto:",
                        error
                    );
                });
        },

    },
    mounted() {
        this.obtenerInformacionProducto();

    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');

.encabezado{
    padding: 25px;
    text-align: center;
    background: var(--Rojo, #E3202B);
    color: #FFF;
font-family: Inter;
font-size: 21px;
font-style: normal;
font-weight: 700;
line-height: 21px; 
}
.infoProducto{
    text-align: center;
    color: #000;
text-align: center;
font-family: Inter;
font-size: 20px;
font-style: normal;
font-weight: 400;
line-height: 55px; 
}
.titleProducto {
    color: #000;
    font-family: Inter;
    font-size: 35px;
    font-style: normal;
    font-weight: 400;
    line-height: 42px;
}
.textoInfo{
    color: #000;
font-family: Inter;
font-size: 18px;
font-style: normal;
font-weight: 400;
line-height: 28px; /* 155.556% */
}
</style>