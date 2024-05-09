<template>
    <div>
      <Navbar v-if="!isAdminRoute && !isAdminPanel"></Navbar>
      <router-view></router-view>
    </div>
  </template>
  
  <script>
import Navbar from './components/Navbar.vue';

  export default {
    name: 'App',
    components: {
    Navbar,
  },
  data() {
    return {
      isAdminRoute: false,
      isAdminPanel: false,
    };
  },
  created() {
    this.checkAdminRoute();
  },
  watch: {
    '$route'(to, from) {
      this.checkAdminRoute();
    }
  },
  methods: {
    checkAdminRoute() {
      this.isAdminRoute = this.$route.path.startsWith('/admin/login');
      this.isAdminPanel = this.$route.path.startsWith('/admin/panel');

    }
  }


   
  };
  </script>
  
 