<template>
    <div class="novedades-view">
        <Novedades v-if="!idNovedad" @ver-novedad="mostrarNovedad"/>
        <InformacionNovedad v-else :id-novedad="idNovedad"  />

    </div>
  </template>
  
  <script>
  import Novedades from "@/components/Novedades.vue";
  import InformacionNovedad from "@/components/InformacionNovedad.vue";

  
  export default {
    components: {
        Novedades,
        InformacionNovedad
    },
    data(){
      return{
        idNovedad: null
      }
      
    },

    methods: {
      mostrarNovedad(idNovedad) {
      this.idNovedad = idNovedad;
      this.$store.commit('setNovedadId', idNovedad);
    },
  },

   
   
  };
  </script>
  