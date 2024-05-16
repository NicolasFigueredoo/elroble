<template>
    <div class="container">
        <p class="migaPan">Inicio <span class="negrita">> Videos</span></p>
        <div  class="d-flex flex-wrap justify-content-between" style="margin-bottom: 90px; row-gap: 100px;">
            <div v-for="(video, index) in videos" :key="index" class="row video-container" id="videoContainer">
                <div class="col-lg 4 video-wrapper" @mouseover="hoverVideo(index, true)"
                    @mouseleave="hoverVideo(index, false)">
                    <div class="video-content">
                        <div v-if="video.file !== null">
                            <video class="videoLink" width="392" height="248" controls>
                                <source :src="getImagen(video.file)" type="video/mp4">
                                Tu navegador no soporta el formato de video.
                            </video>
                            <button v-if="showVideoPlayer" @click="closeVideoPlayer">Cerrar</button>

                        </div>
                        <div class="col-lg 4" v-else-if="video.link !== null">
                            <iframe class="videoLink" width="392" height="248" :src="getYouTubeEmbedUrl(video.link)"
                                frameborder="0" allowfullscreen></iframe>
                        </div>
                        <div class="overlay" v-show="hoverIndex === index"></div>

                        <svg @click="openVideo(video)" v-show="hoverIndex === index" class="play-button"
                            xmlns="http://www.w3.org/2000/svg" width="78" height="78" viewBox="0 0 78 78" fill="none">
                            <g filter="url(#filter0_d_295_1478)">
                                <path
                                    d="M39 64C52.8071 64 64 52.8071 64 39C64 25.1929 52.8071 14 39 14C25.1929 14 14 25.1929 14 39C14 52.8071 25.1929 64 39 64Z"
                                    fill="#D9D9D9" />
                                <path
                                    d="M39 64C52.8071 64 64 52.8071 64 39C64 25.1929 52.8071 14 39 14C25.1929 14 14 25.1929 14 39C14 52.8071 25.1929 64 39 64Z"
                                    stroke="white" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" />
                            </g>
                            <path d="M34 29L49 39L34 49V29Z" stroke="white" stroke-width="3" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <defs>
                                <filter id="filter0_d_295_1478" x="8.5" y="12.5" width="61" height="61"
                                    filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                                    <feFlood flood-opacity="0" result="BackgroundImageFix" />
                                    <feColorMatrix in="SourceAlpha" type="matrix"
                                        values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha" />
                                    <feOffset dy="4" />
                                    <feGaussianBlur stdDeviation="2" />
                                    <feComposite in2="hardAlpha" operator="out" />
                                    <feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0" />
                                    <feBlend mode="normal" in2="BackgroundImageFix"
                                        result="effect1_dropShadow_295_1478" />
                                    <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_295_1478"
                                        result="shape" />
                                </filter>
                            </defs>
                        </svg>


                    </div>
                    <div class="video-title">{{ video.titulo }}</div>
                </div>
            </div>
        </div>
    </div>


</template>


<script>
import axios from 'axios';

export default {
    data() {
        return {
            videos: [],
            hoverIndex: null,
            showVideoPlayer: false,
            videoUrl: ''
        }
    },
    methods: {

        openVideo(video) {
            if (video && video.link && video.link.includes && video.link.includes('youtube.com')) {
                window.open(video.link, '_blank');
            } else if (video && video.file !== null) {
                const videoPlayer = document.createElement('video');
                videoPlayer.src = this.getImagen(video.file);
                videoPlayer.controls = true;
                videoPlayer.style.width = '100%';
                videoPlayer.style.height = '100%';
                videoPlayer.style.position = 'fixed';
                videoPlayer.style.top = '0';
                videoPlayer.style.left = '0';
                videoPlayer.style.zIndex = '9999';
                videoPlayer.style.backgroundColor = 'black'; // Opcional: agregar fondo negro para el reproductor de video
                document.body.appendChild(videoPlayer);
                videoPlayer.play();
            }
        },

        getImagen(fileName) {
            if (fileName) {
                const filePath = fileName.split('/').pop();
                return '/api/getImage/' + filePath
            }
        },
        getYouTubeEmbedUrl(link) {
            const videoId = link.split('v=')[1];
            return `https://www.youtube.com/embed/${videoId}`;
        },
        obtenerVideos() {
            axios.get('/api/obtenerVideos')
                .then(response => {
                    this.videos = response.data;
                })
                .catch(error => {
                    console.error(error);
                });
        },
        hoverVideo(index, isHovering) {
            this.hoverIndex = isHovering ? index : null;
        }
    },
    mounted() {
        this.obtenerVideos();
        $(document).on('click', (event) => {
            if (!$(event.target).closest('.video-wrapper').length) {
                window.location.reload();

            }
        });
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');

.container {
    margin-top: 23px;
}

.col-lg-4 {
    margin-bottom: 20px;
}

.video-container .video-content {
    position: relative;
}

.video-container .video-content::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 248px;
    background-color: rgba(0, 0, 0, 0);
    transition: background-color 0.3s ease;
    /* Transición suave */
}

.video-container:hover .video-content::after {
    background-color: rgba(0, 0, 0, 0.5);
    /* Fondo negro al hacer hover */
}

.video-container .play-button {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    cursor: pointer;
    z-index: 1;
    /* Asegurar que el icono esté sobre el fondo oscuro */
}

.video-wrapper {
    position: relative;
    max-height: 230px;
    /* Ajustar según sea necesario */
}

.migaPan {
    color: #000;
    font-family: Inter;
    font-size: 12px;
    font-style: normal;
    font-weight: 300;
    line-height: 60px;
    /* 500% */
}

.negrita {
    color: #000;
    font-family: Inter;
    font-size: 12px;
    font-style: normal;
    font-weight: 600;
    line-height: 60px;
    /* 500% */
}

.video-container:hover .video-title {
    color: #E3202B;
    /* Cambio de color al hacer hover en el video */
}

.video-title {
    color: var(--Negro, #000);
    font-family: "Inter";
    font-size: 18px;
    font-style: normal;
    font-weight: 700;
    line-height: 28px;
    /* 155.556% */
}


@media screen and (max-width: 460px) {
    .videoLink{

    width: 100%;
  
}

}
</style>