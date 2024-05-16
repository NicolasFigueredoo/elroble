<template>
    <div class="ferias-view">
        <Feria v-if="!idNovedad" @ver-novedad="mostrarNovedad"/>
        <InformacionFeria v-else :id-novedad="idNovedad"  />

    </div>
  </template>
  
  <script>
  import Feria from "@/components/Ferias.vue";
  import InformacionFeria from "@/components/InformacionFeria.vue";

  export default {
    components: {
        Feria,
        InformacionFeria
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
  