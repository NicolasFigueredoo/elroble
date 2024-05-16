<template>
    <footer>
        <div class="footer">
            <div class="container d-flex">

                <div class="row w-100" style="padding-bottom: 20px;" id="containerF">

                    <div id="logoS" class="col-lg-2 d-flex flex-column justify-content-center align-items-center">
                        <img :src="getImagen(this.imagenLogo)" alt="" class="imagenDiv">
                        <div class="d-flex" style="gap:3px">
                            <p class="industria" style="margin-top: 6px;">Industrial Argentina</p>
                            <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36"
                                fill="none">
                                <path
                                    d="M36 27C36 28.0609 35.5786 29.0783 34.8284 29.8284C34.0783 30.5786 33.0609 31 32 31H4C2.93913 31 1.92172 30.5786 1.17157 29.8284C0.421427 29.0783 0 28.0609 0 27V9C0 7.93913 0.421427 6.92172 1.17157 6.17157C1.92172 5.42143 2.93913 5 4 5H32C33.0609 5 34.0783 5.42143 34.8284 6.17157C35.5786 6.92172 36 7.93913 36 9V27Z"
                                    fill="#75AADB" />
                                <path d="M0 13H36V23H0V13Z" fill="#EEEEEE" />
                                <path
                                    d="M18 13L18.488 15.548L19.914 13.381L19.389 15.921L21.535 14.464L20.078 16.611L22.619 16.087L20.452 17.512L23 18L20.452 18.488L22.619 19.914L20.078 19.389L21.535 21.535L19.389 20.078L19.914 22.619L18.488 20.452L18 23L17.512 20.452L16.087 22.619L16.611 20.078L14.464 21.535L15.921 19.389L13.381 19.914L15.548 18.488L13 18L15.548 17.512L13.381 16.087L15.921 16.611L14.464 14.464L16.611 15.921L16.087 13.381L17.512 15.548L18 13Z"
                                    fill="#FCBF49" />
                                <path
                                    d="M18 14.33L18.242 15.595L18.358 16.2L18.697 15.686L19.405 14.61L19.144 15.871L19.019 16.475L19.529 16.129L20.595 15.406L19.872 16.472L19.526 16.982L20.129 16.857L21.391 16.597L20.315 17.305L19.8 17.642L20.405 17.758L21.67 18L20.405 18.242L19.8 18.358L20.314 18.697L21.39 19.405L20.128 19.144L19.524 19.019L19.87 19.529L20.593 20.594L19.528 19.871L19.018 19.525L19.143 20.129L19.404 21.391L18.696 20.315L18.358 19.8L18.242 20.405L18 21.67L17.758 20.405L17.642 19.8L17.303 20.315L16.595 21.391L16.855 20.129L16.98 19.526L16.47 19.872L15.404 20.595L16.127 19.529L16.473 19.019L15.869 19.144L14.608 19.405L15.684 18.697L16.198 18.358L15.593 18.242L14.33 18L15.595 17.758L16.2 17.642L15.685 17.303L14.609 16.595L15.87 16.855L16.473 16.98L16.127 16.47L15.403 15.404L16.469 16.128L16.979 16.474L16.854 15.871L16.594 14.61L17.302 15.686L17.641 16.201L17.757 15.596L18 14.33ZM18 13L17.512 15.548L16.087 13.381L16.611 15.922L14.464 14.465L15.921 16.612L13.381 16.088L15.548 17.513L13 18L15.548 18.488L13.381 19.914L15.921 19.389L14.464 21.535L16.611 20.078L16.087 22.619L17.512 20.452L18 23L18.488 20.452L19.914 22.619L19.389 20.078L21.535 21.535L20.078 19.389L22.619 19.914L20.452 18.488L23 18L20.452 17.512L22.619 16.087L20.078 16.611L21.535 14.464L19.389 15.921L19.914 13.38L18.488 15.547L18 13Z"
                                    fill="#843511" />
                                <path
                                    d="M18 20C19.1046 20 20 19.1046 20 18C20 16.8954 19.1046 16 18 16C16.8954 16 16 16.8954 16 18C16 19.1046 16.8954 20 18 20Z"
                                    fill="#FCBF49" />
                                <path
                                    d="M18 20.125C16.828 20.125 15.875 19.172 15.875 18C15.875 16.828 16.828 15.875 18 15.875C19.172 15.875 20.125 16.828 20.125 18C20.125 19.172 19.172 20.125 18 20.125ZM18 16.125C16.966 16.125 16.125 16.966 16.125 18C16.125 19.034 16.966 19.875 18 19.875C19.034 19.875 19.875 19.034 19.875 18C19.875 16.966 19.034 16.125 18 16.125Z"
                                    fill="#843511" />
                                <path
                                    d="M17.8008 17.774C17.8008 17.929 17.5398 18.054 17.2178 18.054C16.8948 18.054 16.6338 17.929 16.6338 17.774C16.6338 17.619 16.8948 17.494 17.2178 17.494C17.5398 17.494 17.8008 17.619 17.8008 17.774ZM19.3538 17.75C19.3538 17.589 19.0878 17.458 18.7598 17.458C18.4318 17.458 18.1658 17.588 18.1658 17.75C18.1658 17.912 18.4318 18.042 18.7598 18.042C19.0888 18.042 19.3538 17.911 19.3538 17.75Z"
                                    fill="#C16540" />
                                <path
                                    d="M17.4629 18.874C17.4629 18.748 17.7089 18.645 18.0109 18.645C18.3139 18.645 18.5589 18.747 18.5589 18.874C18.5589 19 18.3129 19.103 18.0109 19.103C17.7079 19.103 17.4629 19 17.4629 18.874Z"
                                    fill="#ED8662" />
                            </svg>

                        </div>
                        <a :href="this.instagram" target="_blank"> 
                        <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 23 23" fill="none" style="cursor: pointer;">
                            <path
                                d="M22.02 6.492C22.0023 5.57635 21.8289 4.6704 21.507 3.813C21.2228 3.07934 20.7886 2.41305 20.2323 1.8567C19.676 1.30036 19.0097 0.866209 18.276 0.582001C17.4185 0.260641 16.5126 0.0871765 15.597 0.0690002C14.415 0.0130002 14.04 0 11.042 0C8.04399 0 7.669 0.0130024 6.491 0.0650024C5.5757 0.082924 4.67011 0.256398 3.81299 0.578003C3.0793 0.862157 2.41298 1.29628 1.85663 1.85263C1.30028 2.40898 0.866155 3.07531 0.582001 3.80901C0.260641 4.66654 0.0871765 5.57241 0.0690002 6.48801C0.0130002 7.67001 0 8.045 0 11.043C0 14.041 0.0130024 14.416 0.0650024 15.594C0.0828108 16.5096 0.256287 17.4156 0.578003 18.273C0.862157 19.0067 1.29628 19.673 1.85263 20.2294C2.40898 20.7857 3.0753 21.2198 3.80899 21.504C4.66651 21.8254 5.57238 21.9989 6.48798 22.017C7.66498 22.069 8.041 22.082 11.039 22.082C14.037 22.082 14.412 22.069 15.59 22.017C16.5053 21.9992 17.4109 21.8258 18.268 21.504C19.0019 21.2203 19.6685 20.7863 20.2249 20.2299C20.7813 19.6735 21.2153 19.0069 21.499 18.273C21.8203 17.4155 21.9938 16.5096 22.012 15.594C22.064 14.417 22.077 14.041 22.077 11.043C22.077 8.045 22.077 7.67 22.021 6.492H22.02ZM20.032 15.507C20.0247 16.2068 19.8961 16.9001 19.652 17.556C19.468 18.0333 19.1861 18.4668 18.8244 18.8284C18.4627 19.1901 18.0293 19.472 17.552 19.656C16.8959 19.8993 16.2027 20.0275 15.503 20.035C14.338 20.087 13.989 20.1 11.043 20.1C8.097 20.1 7.74298 20.087 6.58298 20.035C5.8832 20.0281 5.18995 19.8998 4.534 19.656C4.05483 19.48 3.62144 19.1984 3.26599 18.832C2.90049 18.4758 2.61899 18.0427 2.44199 17.564C2.19836 16.9079 2.0698 16.2148 2.06198 15.515C2.00998 14.35 1.99698 14.001 1.99698 11.055C1.99698 8.10899 2.00998 7.755 2.06198 6.595C2.06926 5.89517 2.19783 5.20191 2.44199 4.54601C2.61768 4.06573 2.9009 3.63199 3.26999 3.278C3.62605 2.91237 4.05926 2.63085 4.53799 2.45399C5.19405 2.21039 5.8872 2.08185 6.58698 2.07401C7.75198 2.02201 8.101 2.009 11.047 2.009C13.993 2.009 14.347 2.02201 15.507 2.07401C16.2068 2.0813 16.9001 2.20986 17.556 2.45399C18.0317 2.63687 18.4637 2.91757 18.8241 3.27794C19.1844 3.6383 19.4651 4.07031 19.648 4.54601C19.8917 5.20203 20.0202 5.89522 20.028 6.595C20.08 7.76 20.093 8.10899 20.093 11.055C20.093 14.001 20.08 14.346 20.028 15.511L20.032 15.507Z"
                                fill="white" />
                            <path
                                d="M11.0421 5.37085C9.92028 5.37085 8.82367 5.7035 7.89091 6.32675C6.95816 6.95 6.23116 7.83583 5.80186 8.87225C5.37256 9.90868 5.26025 11.0491 5.47911 12.1494C5.69796 13.2496 6.23817 14.2603 7.03142 15.0536C7.82466 15.8468 8.83527 16.387 9.93553 16.6059C11.0358 16.8247 12.1763 16.7124 13.2127 16.2831C14.2491 15.8538 15.135 15.1268 15.7582 14.194C16.3815 13.2613 16.7141 12.1647 16.7141 11.0428C16.7138 9.53862 16.1162 8.09607 15.0525 7.03242C13.9889 5.96878 12.5463 5.37111 11.0421 5.37085ZM11.0421 14.7218C10.3145 14.7218 9.60316 14.5061 8.99815 14.1018C8.39314 13.6976 7.92163 13.123 7.64317 12.4507C7.36472 11.7785 7.29187 11.0388 7.43382 10.3251C7.57578 9.61145 7.92614 8.95592 8.44066 8.44141C8.95517 7.92689 9.61073 7.57649 10.3244 7.43454C11.038 7.29258 11.7777 7.36544 12.45 7.64389C13.1222 7.92235 13.6968 8.39389 14.1011 8.9989C14.5053 9.60391 14.7211 10.3152 14.7211 11.0428C14.7208 12.0185 14.3331 12.9541 13.6432 13.644C12.9533 14.3339 12.0177 14.7216 11.0421 14.7218Z"
                                fill="white" />
                            <path
                                d="M18.2618 5.14601C18.2618 5.40787 18.1842 5.66386 18.0387 5.88159C17.8932 6.09932 17.6864 6.26902 17.4444 6.36923C17.2025 6.46944 16.9363 6.49567 16.6795 6.44458C16.4227 6.39349 16.1867 6.26739 16.0016 6.08223C15.8164 5.89706 15.6903 5.66114 15.6392 5.40431C15.5881 5.14748 15.6144 4.88127 15.7146 4.63934C15.8148 4.39741 15.9845 4.19063 16.2022 4.04515C16.4199 3.89967 16.6759 3.82202 16.9378 3.82202C17.2889 3.82202 17.6257 3.96151 17.874 4.20981C18.1223 4.45811 18.2618 4.79486 18.2618 5.14601Z"
                                fill="white" />
                        </svg>
                    </a>
                    </div>




                    <div class="col-lg-1 textoEmpresa" style="height: 196px; width: 140px;">
                        <p id="tituloSecciones">Secciones</p>
                        <p @click="this.$router.push('/productos');">Productos</p>
                        <p @click="this.$router.push('/empresa');">Quienes somos</p>

                    </div>
                    <div class="col-lg-1 textoEmpresa2" >
                        <p @click="this.$router.push('/novedades');">Novedades</p>
                        <p @click="this.$router.push('/contactos');">Contacto</p>

                    </div>
                    <div class="col-lg-3 d-flex flex-column textoEmpresa3" >
                        <div>
                            <p id="sub">Suscribite al Newsletter</p>
                        </div>
                        <div class="d-flex">
                            <input v-model="emailSuscripcion" type="email"
                                style="border: none;border-radius: 0%; color: white; background: rgba(217, 217, 217, 0.10);"
                                class="form-control" placeholder="Ingresa tu Email" id="inputSub"
                                aria-label="Recipient's username" aria-describedby="button-addon2">
                            <button style="border-radius:0px;" class="btn botonRow" type="button" id="button-addon2"
                                @click="agregarSuscripcion()">

                                <svg xmlns="http://www.w3.org/2000/svg" width="17" height="15" viewBox="0 0 17 15"
                                    fill="none">
                                    <path d="M16.3867 7.72974H1" stroke="white" stroke-linecap="round" />
                                    <path d="M9.65381 1L16.3872 7.89087L9.65381 14.0911" stroke="white"
                                        stroke-linecap="round" stroke-linejoin="round" />
                                </svg>


                            </button>
                        </div>
                    </div>
                    <div class="col-lg-3 textoEmpresa4">
                        <p class="title4">Contacto</p>
                        <div class="d-flex" style="cursor: pointer;">
                            <div style="width: 20px;">

                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20"
                                    fill="none" class="iconEnd">
                                    <path
                                        d="M16.6668 8.33335C16.6668 13.3334 10.0002 18.3334 10.0002 18.3334C10.0002 18.3334 3.3335 13.3334 3.3335 8.33335C3.3335 6.56524 4.03588 4.86955 5.28612 3.61931C6.53636 2.36907 8.23205 1.66669 10.0002 1.66669C11.7683 1.66669 13.464 2.36907 14.7142 3.61931C15.9645 4.86955 16.6668 6.56524 16.6668 8.33335Z"
                                        stroke="white" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" />
                                    <path
                                        d="M10 10.8333C11.3807 10.8333 12.5 9.71402 12.5 8.33331C12.5 6.9526 11.3807 5.83331 10 5.83331C8.61929 5.83331 7.5 6.9526 7.5 8.33331C7.5 9.71402 8.61929 10.8333 10 10.8333Z"
                                        stroke="white" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" />
                                </svg>
                            </div>
                            <a href="https://maps.app.goo.gl/1TA9NhHJafkaiDvGA" target="_blank" style="text-decoration: none; color: black;">
                                <p class="textoF">{{ direccion }}</p>
                            
                            </a>
                        </div>
                        <div class="d-flex" style="cursor: pointer;">
                            <div style="width: 20px;">

                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20"
                                    fill="none" class="iconEnd">
                                    <g clip-path="url(#clip0_3002_210)">
                                        <path
                                            d="M18.3332 14.1V16.6C18.3341 16.8321 18.2866 17.0618 18.1936 17.2744C18.1006 17.4871 17.9643 17.678 17.7933 17.8349C17.6222 17.9918 17.4203 18.1112 17.2005 18.1856C16.9806 18.2599 16.7477 18.2875 16.5165 18.2666C13.9522 17.988 11.489 17.1118 9.32486 15.7083C7.31139 14.4289 5.60431 12.7218 4.32486 10.7083C2.91651 8.53432 2.04007 6.05914 1.76653 3.48331C1.7457 3.25287 1.77309 3.02061 1.84695 2.80133C1.9208 2.58205 2.03951 2.38055 2.1955 2.20966C2.3515 2.03877 2.54137 1.90224 2.75302 1.80875C2.96468 1.71526 3.19348 1.66686 3.42486 1.66665H5.92486C6.32928 1.66267 6.72136 1.80588 7.028 2.06959C7.33464 2.3333 7.53493 2.69952 7.59153 3.09998C7.69705 3.90003 7.89274 4.68558 8.17486 5.44165C8.28698 5.73992 8.31125 6.06407 8.24478 6.37571C8.17832 6.68735 8.02392 6.9734 7.79986 7.19998L6.74153 8.25831C7.92783 10.3446 9.65524 12.072 11.7415 13.2583L12.7999 12.2C13.0264 11.9759 13.3125 11.8215 13.6241 11.7551C13.9358 11.6886 14.2599 11.7129 14.5582 11.825C15.3143 12.1071 16.0998 12.3028 16.8999 12.4083C17.3047 12.4654 17.6744 12.6693 17.9386 12.9812C18.2029 13.2931 18.3433 13.6913 18.3332 14.1Z"
                                            stroke="white" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" />
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_3002_210">
                                            <rect width="20" height="20" fill="white" />
                                        </clipPath>
                                    </defs>
                                </svg>
                            </div>

                            <p class="textoF">{{ telefono }}</p>
                        </div>
                        <div v-if="telefono_secundario" class="d-flex" style="cursor: pointer;">
                            <div style="width: 20px;">

                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20"
                                    fill="none" class="iconEnd">
                                    <g clip-path="url(#clip0_3002_210)">
                                        <path
                                            d="M18.3332 14.1V16.6C18.3341 16.8321 18.2866 17.0618 18.1936 17.2744C18.1006 17.4871 17.9643 17.678 17.7933 17.8349C17.6222 17.9918 17.4203 18.1112 17.2005 18.1856C16.9806 18.2599 16.7477 18.2875 16.5165 18.2666C13.9522 17.988 11.489 17.1118 9.32486 15.7083C7.31139 14.4289 5.60431 12.7218 4.32486 10.7083C2.91651 8.53432 2.04007 6.05914 1.76653 3.48331C1.7457 3.25287 1.77309 3.02061 1.84695 2.80133C1.9208 2.58205 2.03951 2.38055 2.1955 2.20966C2.3515 2.03877 2.54137 1.90224 2.75302 1.80875C2.96468 1.71526 3.19348 1.66686 3.42486 1.66665H5.92486C6.32928 1.66267 6.72136 1.80588 7.028 2.06959C7.33464 2.3333 7.53493 2.69952 7.59153 3.09998C7.69705 3.90003 7.89274 4.68558 8.17486 5.44165C8.28698 5.73992 8.31125 6.06407 8.24478 6.37571C8.17832 6.68735 8.02392 6.9734 7.79986 7.19998L6.74153 8.25831C7.92783 10.3446 9.65524 12.072 11.7415 13.2583L12.7999 12.2C13.0264 11.9759 13.3125 11.8215 13.6241 11.7551C13.9358 11.6886 14.2599 11.7129 14.5582 11.825C15.3143 12.1071 16.0998 12.3028 16.8999 12.4083C17.3047 12.4654 17.6744 12.6693 17.9386 12.9812C18.2029 13.2931 18.3433 13.6913 18.3332 14.1Z"
                                            stroke="white" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" />
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_3002_210">
                                            <rect width="20" height="20" fill="white" />
                                        </clipPath>
                                    </defs>
                                </svg>
                            </div>

                            <p class="textoF">{{ telefono_secundario }}</p>
                        </div>
                        <div class="d-flex" @click="abrirEmail()" style="cursor: pointer;">
                            <div style="width: 20px;">

                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="20" viewBox="0 0 24 20"
                                    fill="none" class="iconEnd">
                                    <path
                                        d="M20 3.33331H4C2.89543 3.33331 2 4.07951 2 4.99998V15C2 15.9205 2.89543 16.6666 4 16.6666H20C21.1046 16.6666 22 15.9205 22 15V4.99998C22 4.07951 21.1046 3.33331 20 3.33331Z"
                                        stroke="white" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" />
                                    <path
                                        d="M22 5.83331L13.03 10.5833C12.7213 10.7445 12.3643 10.83 12 10.83C11.6357 10.83 11.2787 10.7445 10.97 10.5833L2 5.83331"
                                        stroke="white" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" />
                                </svg>
                            </div>
                            <p class="textoF">{{ email }}</p>

                        </div>

                    </div>



                </div>

            </div>

        </div>

        <div style="background: var(--Rojo, #E3202B);">
            <div class="container d-flex textoEmpresa5"
                style="padding-top: 15px; border-top: 1px solid rgba(255, 255, 255, 0.3);">
                <p>© Copyright 2024 El Roble S.R.L. Todos los derechos reservados</p>
                <a class="osole" href="https://osole.com.ar/">
                    <p>By osole</p>
                </a>
            </div>

        </div>
    </footer>

</template>

<script>
import axios from "axios";

export default {
    data() {
        return {
            emailSuscripcion: null,
            telefono: null,
            whatsapp: null,
            email: null,
            facebook: null,
            instagram: null,
            whatsappLink: null,
            direccion: null,
            imagenLogo: null,
            telefono_secundario: null
        }
    },
    methods: {

        abrirWsp() {

            const url = 'https://wa.me/' + this.whatsappLink;
            const nuevaVentana = window.open(url, '_blank');
            nuevaVentana.focus();

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
                    console.log(response)
                    this.imagenLogo = response.data.footer
                })
                .catch(error => {
                    console.error('Error al traer los contactos:', error);
                });
        },
        obtenerContacto() {
            axios.get(`/api/obtenerContacto`)
                .then(response => {
                    this.telefono = response.data[0].telefono
                    this.whatsapp = response.data[0].whatsapp
                    this.email = response.data[0].email
                    this.facebook = response.data[0].facebook
                    this.instagram = response.data[0].instagram
                    this.direccion = response.data[0].direccion
                    this.telefono_secundario = response.data[0].telefono_secundario
                    const trimmedText = this.whatsapp.trim();
                    const textWithoutSpacesAndHyphens = trimmedText.replace(/[\s-]/g, '');
                    this.whatsappLink = textWithoutSpacesAndHyphens;

                })
                .catch(error => {
                    console.error('Error al traer los contactos:', error);
                });
        },
        agregarSuscripcion() {
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            let isMail = emailPattern.test(this.emailSuscripcion);


            if(isMail){
                axios.post(`/api/agregarSuscripcion`, {
                    email: this.emailSuscripcion,
    
                })
    
                    .then(response => {
                        $('#inputSub').val('suscripción exitosa')
                    })
                    .catch(error => {
                        console.error('Error al traer los productos:', error);
                    });
            }else{
                $('#inputSub').val('Email incorrecto')
            }


        }

    },
    mounted() {
        this.obtenerContacto();
        this.obtenerLogo();
    }

}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');



.textoF:hover {
    color: white;
}

.textoF {
    padding-left: 10px;
    font-size: 16px;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
    color: rgba(255, 255, 255, 0.8);
}

.textoEmpresa5 {
    justify-content: space-between;
    color: rgba(255, 255, 255, 0.8);
    font-family: "Montserrat", sans-serif;
    font-size: 14px;

}


.title4 {
    color: #FFF;
    font-family: 'Inter';
    font-size: 18px;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
}

.textoEmpresa4 {
    font-size: 16px;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
    color: rgba(255, 255, 255, 0.8);
    margin-top: 90px !important
}

.iconRow {
    background-color: white;
    color: #33447F;
    font-size: 30px;
}

input {
    width: 250px;
    height: 50px;
}



.textoEmpresa3 p {
    font-family: Inter;
    font-size: 16px;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
    color: rgba(255, 255, 255, 0.8);
    cursor: pointer;


}



.textoEmpresa2 {
    color: rgba(255, 255, 255, 0.8);
    font-family: Inter;
    font-size: 16px;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
    margin-top: 125px !important;
}

.textoEmpresa3{
    margin-top:92px !important;
}

#tituloSecciones {
    color: #FFF;
    font-family: Inter;
    font-size: 18px;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
}

.textoEmpresa {
    height: 250px;
    color: rgba(255, 255, 255, 0.8);
    font-family: Inter;
    font-size: 16px;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
    margin-top: 90px !important;
}

.textoEmpresa p:hover {
    color: white;
    cursor: pointer;
}

.textoEmpresa2 p:hover {
    color: white;
    cursor: pointer;
}

#sub {
    color: #FFF;
    font-family: Inter;
    font-size: 18px;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
}

.iconEnd:hover {
    transform: scale(1.2);

}

.iconos {
    display: flex;
    justify-content: center;
    font-size: 15px;
}

.iconFooter {
    color: white;
    font-size: 30px;
}

.imagenDiv {
    width: 206px;
    height: 50px;
}


.footer {
    background: var(--Rojo, #E3202B);
}


#inputSub::placeholder {
    color: white;
    font-family: Inter;
    font-size: 12px;
    font-style: normal;
    font-weight: 300;
    line-height: normal;
}

#inputSub:focus {
    outline: none !important;
    border: none;
}

#button-addon2 {
    background-color: rgba(217, 217, 217, 0.10);

}




.rowInput {
    color: #2F3F78;
}

.osole {
    text-decoration: none;
    color: white;
}

.industria {
    color: #FFF;
    font-family: Inter;
    font-size: 16px;
    font-style: normal;
    font-weight: 600;
    line-height: normal;
}

#containerF{
    gap: 30px;
}
@media screen and (max-width: 1000px) {
    #logoS{
        margin-top: 20px;
    }
.textoEmpresa{
    margin-top: 0px !important
}
.textoEmpresa2{
    margin-top: 0px !important
}
.textoEmpresa3{
    margin-top: 0px !important
}
.textoEmpresa4{
    margin-top: 20px !important
}

#containerF{
    gap: 0px;
}

}


@media only screen and (max-width: 400px) {
    .logoRedes img {
        width: 200px;
    }

    .textoF{
        font-size: 12px;
    }
}

@media only screen and (max-width: 200px) {
 

    .textoF{
        font-size: 8px;
    }
}
</style>