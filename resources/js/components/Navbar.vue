<template>
  <div>
    
    <nav class="navbar navbar-expand-lg"
      style="background-color: black; padding-bottom: 0px !important; height: 165px;">
      <div class="container-fluid">
        <a v-if="this.imagenLogo" class="navbar-brand d-block d-lg-none" href="#">
          <img class="logoNavbar" :src="getImagen(this.imagenLogo)" alt="">
        </a>

        <button @click="mostrarMobile()" style="background: white;" class="navbar-toggler" type="button"
          data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
          aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="container collapse navbar-collapse" id="navbarSupportedContent" style="padding-bottom: 0px;">
          <div class="d-flex flex-column w-100 d-none d-lg-block">
            <div class="d-flex justify-content-between">
              <div style="margin-top: 30px;">
                <div class="d-flex nav-item" @click="abrirEmail()" style="cursor: pointer;">
                  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                    <path
                      d="M15 3H3C2.17157 3 1.5 3.67157 1.5 4.5V13.5C1.5 14.3284 2.17157 15 3 15H15C15.8284 15 16.5 14.3284 16.5 13.5V4.5C16.5 3.67157 15.8284 3 15 3Z"
                      stroke="#E3202B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                    <path
                      d="M16.5 5.25L9.7725 9.525C9.54095 9.67007 9.27324 9.74701 9 9.74701C8.72676 9.74701 8.45905 9.67007 8.2275 9.525L1.5 5.25"
                      stroke="#E3202B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                  </svg>

                  <p class="textoNavbar">{{ this.email }}</p>
                </div>
                <div class="d-flex nav-item">
                  <svg xmlns="http://www.w3.org/2000/svg" width="17" height="18" viewBox="0 0 17 18" fill="none">
                    <path
                      d="M15.9161 12.6901V14.9401C15.9169 15.1489 15.8741 15.3557 15.7905 15.5471C15.7068 15.7385 15.5841 15.9103 15.4301 16.0515C15.2762 16.1927 15.0945 16.3002 14.8966 16.3671C14.6988 16.434 14.4891 16.4589 14.2811 16.4401C11.9732 16.1893 9.75634 15.4007 7.80859 14.1376C5.99646 12.9861 4.46009 11.4497 3.30859 9.63757C2.04107 7.68098 1.25227 5.45332 1.00609 3.13507C0.987345 2.92767 1.01199 2.71864 1.07846 2.52129C1.14493 2.32394 1.25177 2.14259 1.39216 1.98879C1.53256 1.83499 1.70344 1.7121 1.89393 1.62796C2.08442 1.54382 2.29034 1.50027 2.49859 1.50007H4.74859C5.11257 1.49649 5.46543 1.62538 5.74141 1.86272C6.01739 2.10006 6.19765 2.42966 6.24859 2.79007C6.34355 3.51012 6.51968 4.21712 6.77359 4.89757C6.8745 5.16602 6.89633 5.45776 6.83652 5.73823C6.7767 6.01871 6.63773 6.27616 6.43609 6.48007L5.48359 7.43257C6.55125 9.31023 8.10593 10.8649 9.98359 11.9326L10.9361 10.9801C11.14 10.7784 11.3975 10.6395 11.6779 10.5796C11.9584 10.5198 12.2501 10.5417 12.5186 10.6426C13.199 10.8965 13.906 11.0726 14.6261 11.1676C14.9904 11.219 15.3231 11.4025 15.561 11.6832C15.7988 11.9639 15.9252 12.3223 15.9161 12.6901Z"
                      stroke="#E3202B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                  </svg>
                  <a :href="'https://wa.me/' + whatsappLink" style="text-decoration: none;" target="_blank">
                    <p class="textoNavbar">{{ this.telefono }}</p>

                  </a>

                </div>
              </div>
              <div>
                <div>
                  <router-link to="/home" :style="{ fontWeight: isRouteActive('/home') ? 'bold' : '700' }">
                    <img class="logoNavbar" :src="getImagen(this.imagenLogo)" alt="">
                  </router-link>
                </div>
              </div>

              <div style="margin-top: 32px;">
                <div>
                  <button @click="abrirModal()" type="button" class="btn Bzona">Zona privada</button>
                </div>
              </div>

            </div>



          </div>

        </div>
      </div>
    </nav>

    <nav id="navbarSegundo" class="navbar navbar-expand-lg navbarSegundoM">
      <div class="container-fluid">

        <div class="container collapse navbar-collapse" id="navbarSupportedContent" style="padding-bottom: 0px;">
          <div class="d-flex flex-column w-100">
            <div id="datos" class="d-flex justify-content-between aling-items-center w-100"
              style="background: #E3202B;">

              <div>
                <router-link class="route" to="/empresa">
                  <p class="textoNavbar2" :style="{ fontWeight: isRouteActive('/empresa') ? '700' : '500' }">Empresa</p>
                </router-link>
              </div>
              <div>
                <router-link class="route" to="/productos">
                  <p class="textoNavbar2" @click="reloadProducto" :style="{ fontWeight: isRouteActive('/productos') ? '700' : '500' }">Productos</p>
                </router-link>
              </div>
              <div>
                <router-link class="route" to="/servicios">
                  <p class="textoNavbar2" :style="{ fontWeight: isRouteActive('/servicios') ? '700' : '500' }">Servicios</p>
                </router-link>
              </div>
              <div>
                <router-link class="route" to="/descargas">
                  <p class="textoNavbar2" :style="{ fontWeight: isRouteActive('/descargas') ? '700' : '500' }">Descargas</p>
                </router-link>
              </div>
              <div>
                <router-link class="route" to="/novedades">
                  <p class="textoNavbar2" @click="reloadNovedad" :style="{ fontWeight: isRouteActive('/novedades') ? '700' : '500' }">novedades</p>
                </router-link>
              </div>
              <div>
                <router-link class="route" to="/ferias">
                  <p class="textoNavbar2"  @click="reloadNovedad" :style="{ fontWeight: isRouteActive('/ferias') ? '700' : '500' }">ferias</p>
                </router-link>
              </div>
              <div>
                <router-link class="route" to="/videos">
                  <p class="textoNavbar2" :style="{ fontWeight: isRouteActive('/videos') ? '700' : '500' }">videos</p>
                </router-link>
              </div>
              <div>
                <router-link class="route" to="/contactos">
                  <p class="textoNavbar2" :style="{ fontWeight: isRouteActive('/contacto') ? '700' : '500' }">contacto</p>
                </router-link>
              </div>
              <div><a target="_blank" :href="this.instagram">
                <svg xmlns="http://www.w3.org/2000/svg" width="23" height="24" viewBox="0 0 23 24" fill="none"
                  style="margin-bottom: 6px;">
                  <path
                    d="M22.9428 7.45099C22.9252 6.53534 22.7517 5.62938 22.4298 4.77199C22.1456 4.03833 21.7115 3.37203 21.1552 2.81569C20.5988 2.25935 19.9325 1.82519 19.1989 1.54099C18.3413 1.21963 17.4354 1.04616 16.5198 1.02798C15.3378 0.971985 14.9628 0.958984 11.9648 0.958984C8.96684 0.958984 8.59185 0.971987 7.41385 1.02399C6.49855 1.04191 5.59296 1.21538 4.73584 1.53699C4.00215 1.82114 3.33583 2.25527 2.77948 2.81161C2.22313 3.36796 1.78901 4.0343 1.50485 4.76799C1.18349 5.62553 1.01003 6.5314 0.991852 7.44699C0.935852 8.62899 0.922852 9.00398 0.922852 12.002C0.922852 15 0.935854 15.375 0.987854 16.553C1.00566 17.4686 1.17914 18.3745 1.50085 19.232C1.78501 19.9657 2.21913 20.632 2.77548 21.1884C3.33183 21.7447 3.99815 22.1788 4.73184 22.463C5.58936 22.7844 6.49523 22.9579 7.41083 22.976C8.58783 23.028 8.96385 23.041 11.9619 23.041C14.9599 23.041 15.3348 23.028 16.5128 22.976C17.4282 22.9582 18.3337 22.7847 19.1908 22.463C19.9248 22.1793 20.5913 21.7453 21.1477 21.1889C21.7041 20.6325 22.1381 19.9659 22.4218 19.232C22.7432 18.3744 22.9166 17.4686 22.9348 16.553C22.9868 15.376 22.9998 15 22.9998 12.002C22.9998 9.00398 22.9998 8.62899 22.9438 7.45099H22.9428ZM20.9548 16.466C20.9476 17.1658 20.819 17.8591 20.5748 18.515C20.3909 18.9923 20.109 19.4257 19.7473 19.7874C19.3856 20.1491 18.9521 20.431 18.4749 20.615C17.8188 20.8583 17.1256 20.9865 16.4258 20.994C15.2608 21.046 14.9119 21.059 11.9659 21.059C9.01985 21.059 8.66583 21.046 7.50583 20.994C6.80606 20.9871 6.1128 20.8588 5.45685 20.615C4.97768 20.439 4.54429 20.1574 4.18884 19.791C3.82334 19.4348 3.54184 19.0016 3.36484 18.523C3.12121 17.8669 2.99265 17.1738 2.98483 16.474C2.93283 15.309 2.91983 14.96 2.91983 12.014C2.91983 9.06798 2.93283 8.71399 2.98483 7.55399C2.99211 6.85416 3.12069 6.16089 3.36484 5.50499C3.54053 5.02471 3.82375 4.59098 4.19284 4.23698C4.5489 3.87135 4.98211 3.58983 5.46085 3.41298C6.1169 3.16937 6.81005 3.04083 7.50983 3.03299C8.67483 2.98099 9.02385 2.96799 11.9698 2.96799C14.9158 2.96799 15.2698 2.98099 16.4298 3.03299C17.1297 3.04029 17.8229 3.16885 18.4789 3.41298C18.9545 3.59585 19.3866 3.87656 19.7469 4.23692C20.1073 4.59729 20.388 5.0293 20.5708 5.50499C20.8145 6.16101 20.9431 6.8542 20.9508 7.55399C21.0028 8.71899 21.0158 9.06798 21.0158 12.014C21.0158 14.96 21.0028 15.305 20.9508 16.47L20.9548 16.466Z"
                    fill="white" />
                  <path
                    d="M11.9649 6.3299C10.8431 6.3299 9.74652 6.66255 8.81377 7.2858C7.88101 7.90904 7.15402 8.79488 6.72472 9.8313C6.29541 10.8677 6.18311 12.0082 6.40196 13.1084C6.62082 14.2087 7.16102 15.2194 7.95427 16.0126C8.74751 16.8058 9.75812 17.3461 10.8584 17.5649C11.9586 17.7838 13.0991 17.6714 14.1355 17.2421C15.172 16.8128 16.0578 16.0858 16.6811 15.1531C17.3043 14.2203 17.6369 13.1237 17.6369 12.0019C17.6367 10.4977 17.039 9.05512 15.9754 7.99147C14.9117 6.92782 13.4692 6.33016 11.9649 6.3299ZM11.9649 15.6809C11.2373 15.6809 10.526 15.4651 9.921 15.0609C9.316 14.6566 8.84448 14.082 8.56602 13.4098C8.28757 12.7375 8.21472 11.9978 8.35667 11.2841C8.49863 10.5705 8.84899 9.91497 9.36351 9.40045C9.87803 8.88593 10.5336 8.53554 11.2472 8.39359C11.9609 8.25163 12.7006 8.32448 13.3728 8.60294C14.0451 8.88139 14.6197 9.35294 15.0239 9.95795C15.4282 10.563 15.644 11.2743 15.644 12.0019C15.6437 12.9775 15.256 13.9131 14.5661 14.603C13.8762 15.2929 12.9406 15.6806 11.9649 15.6809Z"
                    fill="white" />
                  <path
                    d="M19.1846 6.105C19.1846 6.36686 19.107 6.62285 18.9615 6.84058C18.816 7.05831 18.6092 7.22801 18.3673 7.32822C18.1254 7.42843 17.8592 7.45465 17.6023 7.40356C17.3455 7.35248 17.1096 7.22638 16.9244 7.04121C16.7393 6.85605 16.6131 6.62013 16.5621 6.3633C16.511 6.10647 16.5372 5.84026 16.6374 5.59833C16.7376 5.3564 16.9073 5.14962 17.125 5.00414C17.3428 4.85865 17.5988 4.78101 17.8606 4.78101C18.2118 4.78101 18.5486 4.92049 18.7969 5.16879C19.0452 5.41709 19.1846 5.75385 19.1846 6.105Z"
                    fill="white" />
                </svg>
              </a>

              </div>


            </div>





          </div>

        </div>
      </div>
    </nav>


    <div id="miModal" class="modal" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered" style="width: 400px;">
        <div class="modal-content" style="border-radius: 0%;">
          <div class="modal-header">
            <h5 class="modal-title">Zona privada</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form action="">
              <div class="mensajeCrear">
              </div>
              <div>
                <label class="form-label textZona">Usuario</label>
                <input type="text" class="form-control" id="Usuario" placeholder="Usuario" v-model="usuario">

              </div>

              <div class="mt-3">
                <label class="form-label textZona">Contraseña</label>
                <input type="password" class="form-control" id="Contraseña" placeholder="Contraseña" v-model="contraseña">

              </div>

              <div>

              </div>
            </form>
            <div class="d-flex flex-column mt-4">
              <div>
                <button type="button" id="botonLogin" class="btn btn-secondary" data-bs-dismiss="modal" @click="ingresarZona()">Ingresar</button>
              </div>
              <div class="mt-3">
                <button type="button" id="botonRegistrar" class="btn btn-primary" @click="crearAccountModal()">Crear cuenta</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div id="miModalAccount" class="modal" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered" style="width: 400px;">
        <div class="modal-content" style="border-radius: 0%;">
          <div class="modal-header">
            <h5 class="modal-title">Zona privada</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form action="">
          
              <div>
                <label class="form-label textZona">Usuario</label>
                <input type="text" class="form-control" id="name" placeholder="Usuario">

              </div>

              <div class="mt-3">
                <label class="form-label textZona">Email</label>
                <input type="text" class="form-control" id="mail" placeholder="Email">

              </div>

              <div class="mt-3">
                <label class="form-label textZona">Contraseña</label>
                <input type="password" class="form-control" id="pass" placeholder="Contraseña">

              </div>

              <div>

              </div>
            </form>
            <div class="d-flex flex-column mt-4">
              <div class="mt-3">
                <button type="button" id="botonRegistrar" class="btn btn-primary" @click="crearAccount()">Crear cuenta</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <div class="whatsapp-container">
      <a :href="'https://wa.me/' + whatsappLink" target="_blank" class="whatsapp-link">
        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 32 32" fill="none" style="margin-bottom: 5px;">
  <path fill-rule="evenodd" clip-rule="evenodd" d="M23.3317 19.176C22.9325 18.9774 20.9751 18.02 20.6107 17.8867C20.2463 17.7547 19.981 17.6894 19.7144 18.0867C19.4491 18.4814 18.6868 19.3747 18.4551 19.6387C18.2219 19.904 17.9902 19.936 17.5923 19.7387C17.1943 19.5387 15.9109 19.1214 14.3903 17.772C13.2073 16.7214 12.4074 15.424 12.1756 15.0267C11.9439 14.6307 12.1502 14.416 12.3498 14.2187C12.5293 14.0414 12.7477 13.756 12.9473 13.5254C13.147 13.2934 13.2126 13.128 13.3452 12.8627C13.4792 12.5987 13.4122 12.368 13.3118 12.1694C13.2126 11.9707 12.4168 10.02 12.0845 9.22671C11.7617 8.45471 11.4334 8.56004 11.1896 8.54671C10.9565 8.53604 10.6912 8.53337 10.4259 8.53337C10.1607 8.53337 9.72926 8.63204 9.36485 9.02937C8.9991 9.42537 7.97151 10.384 7.97151 12.3347C7.97151 14.284 9.39701 16.168 9.59663 16.4334C9.79625 16.6974 12.4034 20.7 16.3972 22.416C17.3484 22.824 18.0893 23.068 18.6667 23.2493C19.6206 23.552 20.4888 23.5093 21.1747 23.4067C21.9384 23.2933 23.53 22.448 23.8623 21.5227C24.1932 20.5974 24.1932 19.804 24.0941 19.6387C23.9949 19.4734 23.7296 19.3747 23.3304 19.176H23.3317ZM16.0676 29.0467H16.0623C13.6901 29.0471 11.3616 28.4125 9.32064 27.2093L8.83833 26.924L3.82499 28.2333L5.1634 23.3693L4.84855 22.8707C3.52239 20.7698 2.82057 18.3384 2.82419 15.8574C2.82687 8.59071 8.76732 2.67872 16.073 2.67872C19.6099 2.67872 22.9352 4.05205 25.4352 6.54271C26.6682 7.76482 27.6456 9.21813 28.3106 10.8186C28.9757 12.419 29.3153 14.1348 29.3097 15.8667C29.307 23.1333 23.3666 29.0467 16.0676 29.0467ZM27.3376 4.65071C25.8614 3.17195 24.1051 1.99943 22.1703 1.20112C20.2355 0.402806 18.1608 -0.00543499 16.0663 5.46366e-05C7.28556 5.46366e-05 0.136654 7.11338 0.133975 15.856C0.129906 18.6384 0.863301 21.3725 2.26016 23.7827L0 32L8.44578 29.7947C10.7821 31.0615 13.4003 31.7253 16.0609 31.7253H16.0676C24.8483 31.7253 31.9972 24.612 31.9999 15.868C32.0064 13.7844 31.5977 11.7202 30.7974 9.79475C29.9971 7.86933 28.8212 6.12094 27.3376 4.65071Z" fill="white"/>
</svg>      </a>
    </div>


  </div>

</template>

<script>
import axios from 'axios';
import 'jquery';


export default {
  data() {
    return {
      telefono: null,
      email: null,
      instagram: null,
      telefonoSecundario: null,
      whatsappLink: null,
      usuario: null,
      contraseña: null,
      imagenLogo: null


    }
  },
  computed:{
    idNovedad() {
            const selectedNovedadId = this.$store.getters['getIdNovedad'];
            return selectedNovedadId;
        },
        idProducto() {
            const selectedProductId = this.$store.getters['getSelectedProductId'];
            return selectedProductId;
        }
  },
  methods: {

    reloadNovedad(){
      if(this.idNovedad !== null){
        location.reload();

      }

    },
    reloadProducto(){
      if(this.idProducto !== null){
        location.reload();
      }

    },

    ingresarZona() {
      if (this.usuario && this.contraseña) {
        axios
          .post("/api/verificarLoginZona", {
            nombre: this.usuario,
            contraseña: this.contraseña,
          })
          .then((response) => {

            if (typeof response.data === "number") {  
              this.$store.commit("setLoginId", response.data);
              this.$router.push("/zonaPrivada");
            } else {
              $(".mensajeCrear").html(
                `<p class="text-danger ">${response.data}</p>`
              );
            }
          })
          .catch((error) => {
            $(".mensajeCrear").html(`<p class="text-danger ">${response.data}</p>`);
            console.error("Error ingresar Zona:", error);
          });
      } else {
        $(".mensajeCrear").html(
          `<p class="text-danger ">Faltan rellenar campos</p>`
        );
      }
     },
    crearAccount(){
      axios.post('/api/crearUsuarioZona', {
                usuario: $('#name').val(),
                email: $('#mail').val(),
                contraseña: $('#pass').val(),
            })
                .then(response => {

                  $('#miModalAccount').modal('hide');
                  $('.mensajeCrear').html('<p class="text-success"> Usuario creado con éxito </p>')

                  
   
                })
                .catch(error => {
                    console.error('Error ingresar Admin:', error);
                });

    },
    crearAccountModal(){

      $('#miModalAccount').modal('show');
      $('.mensajeCrear').html('')


    },
    abrirModal() {
      $('#miModal').modal('show');
    },
    mostrarMobile() {

      $('#navbarSegundo').toggleClass('visible');

    },
    abrirEmail() {
      const destinatario = this.email;
      const asunto = 'Contacto desde la web de el roble';
      const cuerpo = 'Hola queria consultar';

      const mailtoLink = `mailto:${destinatario}?subject=${encodeURIComponent(asunto)}&body=${encodeURIComponent(cuerpo)}`;
      window.location.href = mailtoLink;

    },
    getImagen(fileName) {
      if (fileName) {
        const filePath = fileName.split('/').pop();
        return '/api/getImage/' + filePath
      }

    },
    obtenerLogo() {
      axios.get(`/api/obtenerLogos`)
        .then(response => {
          this.imagenLogo = response.data.navbar
        })
        .catch(error => {
          console.error('Error al traer los contactos:', error);
        });
    },
    obtenerContacto() {
      axios.get(`/api/obtenerContacto`)
        .then(response => {
          this.telefono = response.data[0].telefono
          this.telefonoSecundario = response.data[0].telefono_Secundario
          this.email = response.data[0].email
          this.instagram = response.data[0].instagram
          this.whatsappLink = response.data[0].telefono

        })
        .catch(error => {
          console.error('Error al traer los contactos:', error);
        });
    },
    
    isRouteActive(route) {
      return this.$route.path === route;
    }
  },
  mounted() {
    this.obtenerLogo();
    this.obtenerContacto();
    this.$store.commit('setNovedadId', null);

  }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');


.logoNavbar {
  width: 100%;
  height: 100%;
}

.textoNavbar {
  color: #FFF;
  font-family: 'Inter';
  font-size: 13px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
  margin-left: 10px;
}

.textoNavbar2 {
  color: #FFF;
  text-align: center;
  font-family: Inter;
  font-size: 16px;
  font-style: normal;
  font-weight: 500;
  line-height: normal;
  text-transform: uppercase;
  cursor: pointer;
  margin: auto;
}

.Bzona {
  border-radius: 0%;
  width: 221px;
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
  text-transform: uppercase;
}

.Bzona:hover {
  background: white;
  color: #E3202B;
  border: 1px solid #E3202B
}

.datos {
  flex-direction: column;
  align-items: center;
}

#navbarSegundo {
  background-color: black;
  padding-bottom: 0px !important;
  background: #E3202B;
  height: 46px;
}

#botonLogin {
  width: 100%;
  padding: 11px 25px;
  justify-content: center;
  align-items: center;
  gap: 20px;
  background: var(--Rojo, #E3202B);
  border: none;
}

#botonLogin:hover{
  background: #FFF;
  border: 1px solid var(--Rojo, #E3202B);
  color: #E3202B;

}

#botonRegistrar{
  width: 100%;
padding: 11px 25px;
justify-content: center;
align-items: center;
gap: 20px;
border: 1px solid var(--Rojo, #E3202B);
color: #E3202B;
background: #FFF;
}
.modal-title{
  color: var(--Rojo, #E31E24);
font-family: Inter;
font-size: 30px;
font-style: normal;
font-weight: 400;
line-height: normal;
}

.modal-header{
  border: none;

}

.modal{
  padding-left: 60%;
  padding-bottom: 13%;
}

button{
  color: #FFF;
font-family: Inter;
font-size: 16px;
font-style: normal;
font-weight: 400;
line-height: normal;
border-radius: 0%;
}

.textZona{
  color: #000;
font-family: Inter;
font-size: 16px;
font-style: normal;
font-weight: 400;
line-height: normal;
}

input{
  border-radius: 0%;
}



.whatsapp-container {
  position: fixed;
  bottom: 20px;
  right: 20px;
  z-index: 1000;
}

.whatsapp-link {
  display: block;
  width: 60px;
  height: 60px;
  background-color: #00C820;
  border-radius: 50%;
  text-align: center;
  line-height: 60px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
  transition: transform 0.3s ease;
}

.whatsapp-link:hover {
  transform: scale(1.1);
}

.contactoWhat {
  font-size: 30px;
  color: white;
  padding-top: 15px;
}


.route {
  text-decoration: none;
  font-weight: 500;
}


@media (max-width: 1000px) {

  .navbarSegundoM {
    display: none;
  }

  #datos {
    flex-direction: column;
    align-items: center;

  }

  .visible {
    display: block !important;
    height: 200px !important;
    transition: height 0.3s ease !important;

  }

}
</style>