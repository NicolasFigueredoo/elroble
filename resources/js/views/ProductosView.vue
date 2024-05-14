<template>
    <div class="productos-view">
        <Productos v-if="!idProducto" @ver-producto="mostrarProducto" />
        <InformacionProducto v-else :id-producto="idProducto"  />

    </div>
  </template>
  
  <script>
  import Productos from "@/components/Productos.vue";
  import InformacionProducto from "@/components/InformacionProducto.vue";

  
  export default {
    components: {
        Productos,
        InformacionProducto
    },
    data(){
      return{
        idProducto: null
      }
      
    },

    methods: {
    mostrarProducto(idProducto) {
      this.idProducto = idProducto;
      this.$store.commit('setSelectedProductId', idProducto);
    },
    created() {
    const selectedProductId = this.$store.getters['getSelectedProductId'];
    if (selectedProductId !== null) {
      this.idProducto = selectedProductId;
    }
    
  }
  },
   
   
  };
  </script>
  

  