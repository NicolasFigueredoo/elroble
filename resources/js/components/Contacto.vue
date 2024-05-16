<template>
  <div>
    <div class="container contacto" style="margin-bottom: 80px; margin-top: 50px">
      <div>
        <p class="titulo">Contacto</p>
      </div>
      <div class="row">
        <div class="col-lg-4 informacion" style="margin-top: 40px">
          <div class="ubicacion" style="cursor: pointer">
            <div style="width: 20px">
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                <path
                  d="M15 7.5C15 12 9 16.5 9 16.5C9 16.5 3 12 3 7.5C3 5.9087 3.63214 4.38258 4.75736 3.25736C5.88258 2.13214 7.4087 1.5 9 1.5C10.5913 1.5 12.1174 2.13214 13.2426 3.25736C14.3679 4.38258 15 5.9087 15 7.5Z"
                  stroke="#E3202B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                <path
                  d="M9 9.75C10.2426 9.75 11.25 8.74264 11.25 7.5C11.25 6.25736 10.2426 5.25 9 5.25C7.75736 5.25 6.75 6.25736 6.75 7.5C6.75 8.74264 7.75736 9.75 9 9.75Z"
                  stroke="#E3202B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
              </svg>
            </div>
            <a href="https://maps.app.goo.gl/1TA9NhHJafkaiDvGA" target="_blank" style="text-decoration: none; color: black;">
              <p id="ubi" style="margin-left: 20px">
                {{ direccion }}
              </p>
            </a>
          </div>
          <div class="telefono" style="cursor: pointer">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
              <g clip-path="url(#clip0_1_262)">
                <path
                  d="M16.5001 12.69V14.94C16.5009 15.1489 16.4581 15.3556 16.3745 15.547C16.2908 15.7384 16.168 15.9102 16.0141 16.0514C15.8602 16.1926 15.6785 16.3001 15.4806 16.367C15.2828 16.434 15.0731 16.4588 14.8651 16.44C12.5572 16.1892 10.3403 15.4006 8.39257 14.1375C6.58044 12.986 5.04407 11.4496 3.89257 9.63751C2.62506 7.68092 1.83625 5.45326 1.59007 3.13501C1.57133 2.92761 1.59598 2.71858 1.66245 2.52123C1.72892 2.32388 1.83575 2.14253 1.97615 1.98873C2.11654 1.83493 2.28743 1.71204 2.47792 1.6279C2.6684 1.54376 2.87433 1.50021 3.08257 1.50001H5.33257C5.69655 1.49643 6.04942 1.62532 6.32539 1.86266C6.60137 2.1 6.78163 2.4296 6.83257 2.79001C6.92754 3.51006 7.10366 4.21706 7.35757 4.89751C7.45848 5.16595 7.48032 5.4577 7.4205 5.73817C7.36069 6.01865 7.22172 6.27609 7.02007 6.48001L6.06757 7.43251C7.13524 9.31017 8.68991 10.8648 10.5676 11.9325L11.5201 10.98C11.724 10.7784 11.9814 10.6394 12.2619 10.5796C12.5424 10.5198 12.8341 10.5416 13.1026 10.6425C13.783 10.8964 14.49 11.0725 15.2101 11.1675C15.5744 11.2189 15.9071 11.4024 16.145 11.6831C16.3828 11.9638 16.5092 12.3222 16.5001 12.69Z"
                  stroke="#E3202B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
              </g>
              <defs>
                <clipPath id="clip0_1_262">
                  <rect width="18" height="18" fill="white" />
                </clipPath>
              </defs>
            </svg>
            <p style="margin-left: 20px">{{ telefono }}</p>
          </div>
          <div class="telefono" style="cursor: pointer">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
              <g clip-path="url(#clip0_1_262)">
                <path
                  d="M16.5001 12.69V14.94C16.5009 15.1489 16.4581 15.3556 16.3745 15.547C16.2908 15.7384 16.168 15.9102 16.0141 16.0514C15.8602 16.1926 15.6785 16.3001 15.4806 16.367C15.2828 16.434 15.0731 16.4588 14.8651 16.44C12.5572 16.1892 10.3403 15.4006 8.39257 14.1375C6.58044 12.986 5.04407 11.4496 3.89257 9.63751C2.62506 7.68092 1.83625 5.45326 1.59007 3.13501C1.57133 2.92761 1.59598 2.71858 1.66245 2.52123C1.72892 2.32388 1.83575 2.14253 1.97615 1.98873C2.11654 1.83493 2.28743 1.71204 2.47792 1.6279C2.6684 1.54376 2.87433 1.50021 3.08257 1.50001H5.33257C5.69655 1.49643 6.04942 1.62532 6.32539 1.86266C6.60137 2.1 6.78163 2.4296 6.83257 2.79001C6.92754 3.51006 7.10366 4.21706 7.35757 4.89751C7.45848 5.16595 7.48032 5.4577 7.4205 5.73817C7.36069 6.01865 7.22172 6.27609 7.02007 6.48001L6.06757 7.43251C7.13524 9.31017 8.68991 10.8648 10.5676 11.9325L11.5201 10.98C11.724 10.7784 11.9814 10.6394 12.2619 10.5796C12.5424 10.5198 12.8341 10.5416 13.1026 10.6425C13.783 10.8964 14.49 11.0725 15.2101 11.1675C15.5744 11.2189 15.9071 11.4024 16.145 11.6831C16.3828 11.9638 16.5092 12.3222 16.5001 12.69Z"
                  stroke="#E3202B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
              </g>
              <defs>
                <clipPath id="clip0_1_262">
                  <rect width="18" height="18" fill="white" />
                </clipPath>
              </defs>
            </svg>
            <p style="margin-left: 20px">
              {{ telefono_secundario }}
            </p>
          </div>
          <div class="email mt-2" style="cursor: pointer">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none" @click="abrirEmail()">
  <path d="M15 3H3C2.17157 3 1.5 3.67157 1.5 4.5V13.5C1.5 14.3284 2.17157 15 3 15H15C15.8284 15 16.5 14.3284 16.5 13.5V4.5C16.5 3.67157 15.8284 3 15 3Z" stroke="#E3202B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
  <path d="M16.5 5.25L9.7725 9.525C9.54095 9.67007 9.27324 9.74701 9 9.74701C8.72676 9.74701 8.45905 9.67007 8.2275 9.525L1.5 5.25" stroke="#E3202B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
            <p style="margin-left: 20px" @click="abrirEmail()">{{ emailC }}</p>
          </div>
        </div>

        <form id="formularioI" class="col-lg-8">
          <p class="titleForm">
            Completá detalladamente el formulario y nos pondremos en
            contacto a la brevedad
          </p>
          <div class="row">
            <div class="col-lg-6">
              <input type="text" class="form-control" placeholder="Nombre y apellido*" v-model="nombre" />
            </div>
            <div class="col-lg-6">
              <input type="text" class="form-control" placeholder="E-mail*" v-model="email" />
            </div>
          </div>
          <div class="row" style="margin-top: 20px">
            <div class="col-lg-6">
              <input type="text" class="form-control" placeholder="Celular*" v-model="celular" />
            </div>
            <div class="col-lg-6">
              <input type="text" class="form-control" placeholder="Empresa" v-model="empresa" />
            </div>
          </div>

          <div class="row" style="margin-top: 20px">
            <div class="col-lg-12">
              <textarea class="form-control" placeholder="Mensaje*" id="mensajeInput" style="
                                    width: 100%;
                                    height: 150px;
                                    border-radius: 0%;
                                " v-model="mensaje"></textarea>
            </div>
            <div id="content" class="d-flex justify-content-between align-items-center col-lg-12 mt-3">
              <div style="margin-top: 20px">
                <p class="campoO">*Campos obligatorios</p>
              </div>
              <div>
                <button id="enviarContacto" type="button" style="border-radius: 0%" class="btn btn-primary"
                  @click="enviarCorreo()">
                  Enviar
                </button>
                <div id="mensajePresupuesto"></div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
    <div class="contenedorImg" >
      <iframe class="mapa" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3280.991207750189!2d-58.414601388421026!3d-34.68017137281398!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bccc8ea9fac319%3A0x836d49f4f562ea85!2sEl%20Roble!5e0!3m2!1ses!2sar!4v1715827924850!5m2!1ses!2sar" width="800" height="800" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      nombre: "",
      email: "",
      celular: "",
      mensaje: "",
      empresa: "",
      telefono: null,
      emailC: null,
      whatsappLink: null,
      direccion: null,
      telefono_secundario: null
    };
  },
  methods: {
    abrirEmail() {
      const destinatario = this.emailC;
      const asunto = "Contacto desde la web de el roble";
      const cuerpo = "Hola queria consultar";

      const mailtoLink = `mailto:${destinatario}?subject=${encodeURIComponent(
        asunto
      )}&body=${encodeURIComponent(cuerpo)}`;
      window.location.href = mailtoLink;
    },
    obtenerContacto() {
      axios
        .get(`/api/obtenerContacto`)
        .then((response) => {
          this.telefono = response.data[0].telefono;
          this.emailC = response.data[0].email;
          this.direccion = response.data[0].direccion;
          this.telefono_secundario = response.data[0].telefono_secundario;

        })
        .catch((error) => {
          console.error("Error al traer los contactos:", error);
        });
    },
    enviarCorreo() {
      let self = this;
      if (!this.nombre || !this.empresa || !this.email) {
        $("#mensajePresupuesto").html(
          '<p class="text-danger">Mensaje fallido faltan rellenar campos obligatorios</p>'
        );
        return;
      }

      grecaptcha.ready(function () {
        grecaptcha
          .execute("6LfXCt8pAAAAAJ988vWMQzCeZ6rm8hZOZk1u95KU", {
            action: "submit",
          })
          .then(function (token) {
            $("#mensajePresupuesto").html(
              '<p class="text-success">Enviando..</p>'
            );

            axios
              .post("/enviarCorreo", {
                nombre: self.nombre,
                empresa: self.empresa,
                email: self.email,
                celular: self.celular,
                mensaje: self.mensaje,
                recaptchaToken: token,
                recaptchaSecret:
                  "6LfXCt8pAAAAAOHrkdG2Htnz9omqRMAYSF_FpOlx",
              })
              .then((response) => {
                $("#mensajePresupuesto").html(
                  '<p class="text-success">Mensaje enviado correctamente</p>'
                );
              })
              .catch((error) => {
                $("#mensajePresupuesto").html(
                  '<p class="text-danger">Mensaje fallido revisar campos</p>'
                );
              });
          });
      });
    },
  },
  mounted() {
    this.obtenerContacto();
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap");


textarea::placeholder{
  color: rgba(0, 0, 0, 0.50);
font-family: Inter;
font-size: 16px;
font-style: normal;
font-weight: 300;
line-height: 50px; 
}
input::placeholder{
  color: rgba(0, 0, 0, 0.50);
font-family: Inter;
font-size: 16px;
font-style: normal;
font-weight: 300;
line-height: 50px;
}
.mapa {
  width: 100%;
}

.titleForm {
  color: #000;
  font-family: Inter;
  font-size: 18px;
  font-style: normal;
  font-weight: 300;
  line-height: normal;
  margin-bottom: 30px;
}

.campoO {
  color: #000;
  font-family: Inter;
  font-size: 16px;
  font-style: normal;
  font-weight: 300;
  line-height: 30px;
  /* 187.5% */
}

.contacto {
  background-color: white;
  margin-top: 50px;
}

.titulo {
  color: #000;
font-family: Inter;
font-size: 35px;
font-style: normal;
font-weight: 500;
line-height: normal;
}

.informacion {
  font-size: 18px;
  font-family: "Montserrat", sans-serif;
  font-weight: 400;
  line-height: 21.94px;
  margin-top: 18px;
}



.ubicacion {
  display: flex;
  width: 350px;

  color: #000;
font-family: Inter;
font-size: 16px;
font-style: normal;
font-weight: 400;
line-height: normal;
}

.telefono {
  display: flex;
  color: #000;
font-family: Inter;
font-size: 16px;
font-style: normal;
font-weight: 400;
line-height: normal;
}

.email {
  display: flex;
  font-size: 16px;
  color: #000;
font-family: Inter;
font-size: 16px;
font-style: normal;
font-weight: 400;
line-height: normal;
}

.iconContacto {
  align-items: center;
  font-size: 20px;
  color: #33447f;
}

.iconContacto:hover {
  transform: scale(1.2);
  transition: 0.5s;
}

.casilla span {
  font-size: 16px;
  font-family: "Montserrat";
  font-weight: 400;
}

#enviarContacto {
  display: flex;
  width: 392px;
  padding: 11px 25px;
  justify-content: center;
  align-items: center;
  gap: 20px;
  color: #fff;
  font-family: Inter;
  font-size: 16px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
  background: var(--Rojo, #e3202b);
  border: none;
}

.enviar {
  display: flex;
  flex-direction: column;
  margin-top: 20px;
}

.form-control {
  border-radius: 0%;
}

@media only screen and (max-width: 600px) {
  #content {
    flex-direction: column;
  }
  #enviarContacto{
    width: 100%;
  }
  .ubicacion{
    width: 100%;
  }
  #ubi{
    width: 100%;

  }
}

@media only screen and (max-width: 200px) {
  .email{
    font-size: 10px;
  }
  #ubi{
    width: 100px;
  }
}
</style>
