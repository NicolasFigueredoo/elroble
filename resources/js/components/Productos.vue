<template>
    <div>

        <div class="container">
            <div class="row" style="justify-content: space-around; margin-top: 42px;">
                <div v-for="producto in productosMostrados" :key="producto.id" class="col-lg-3 tapaCard" style="height: 400px;"
                @mouseover="showIconsHover(producto.id)" @mouseout="hiddenIconsHover(producto.id)">



                    <div class="imagenProducto" :style="{
                        backgroundImage: `url(${getImagen(producto.imagenes[0].path)})`,
                        backgroundSize: 'cover',
                        backgroundPosition: 'center',
                        backgroundRepeat: 'no-repeat',
                        width: '100%',
                        height: '286px'
                    }">

                        <div :id="'productoIcono' + producto.id" class="d-flex justify-content-center"
                            style="padding-top: 120px;">

                            <div class="containerIcono" v-show="showIcons[producto.id]" @mouseover="changeIcon()" @click="verProducto(producto.id)"
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
                        <div class="col-lg-6">
                            <p class="titleProducto" style="margin-top: 23px;">{{ producto.nombre }}</p>
                        </div>
                    </div>
                </div>


            </div>
            <div class="d-flex justify-content-center" style="margin-top: 85px; margin-bottom: 138px;">
                <button @click="cargarMasProductos" type="button" class="btn buttonMasProductos">Cargar más productos</button>
            </div>

        </div>
    </div>
</template>


<script>
import axios from 'axios';

export default {
    data() {
        return {
            productos: [],
            productosMostrados: [], 
      cantidadAMostrar: 16, 
      cargados: 0,
            showIcons: {},
            iconoColor: 'white',


        }
    },
    computed: {
    hayMasProductos() {
      return this.cargados < this.productos.length;
    }
  },
    methods: {
        verProducto(id) {
            this.$emit('ver-producto', id);
        },
        cargarMasProductos() {
            const restantes = this.productos.length - this.cargados;
            const cantidadACargar = Math.min(this.cantidadAMostrar, restantes);
            this.productosMostrados.push(...this.productos.slice(this.cargados, this.cargados + cantidadACargar));
            this.cargados += cantidadACargar;
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
        obtenerProductos() {
            axios.get('/api/obtenerProductos')
                .then(response => {
                    this.productos = response.data;
                    this.cargarMasProductos()
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
        this.obtenerProductos();

    }


}
</script>
<style scoped>
.tapaCard:hover {
    background: rgba(205, 202, 202, 0.25);
    mix-blend-mode: multiply;
}

.tapaCard:hover .imagenProducto {
    background: rgba(205, 202, 202, 0.25);
    mix-blend-mode: multiply;

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

.titleProducto {
    text-align: center;
    color: #000;
    text-align: center;
    font-family: Inter;
    font-size: 21px;
    font-style: normal;
    font-weight: 400;
    line-height: 25px;
}

.buttonMasProductos {
    border-radius: 0%;
    display: flex;
    width: 391px;
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
}

.buttonMasProductos:hover {

    border: 1px solid var(--Rojo, #E3202B);
    color: var(--Rojo, #E3202B);

}
</style>