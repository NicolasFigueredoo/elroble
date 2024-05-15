<template>
    <div class="container">
        <div class="d-flex flex-wrap justify-content-between">
            <div v-for="(video, index) in videos" :key="index" class="row video-container">
                <div class="col-lg 4 video-wrapper"  @mouseover="hoverVideo(index, true)"
                    @mouseleave="hoverVideo(index, false)">
                    <div v-if="video.file !== null">
                        <video width="392" height="248" controls>
                            <source :src="getImagen(video.file)" type="video/mp4">
                            Tu navegador no soporta el formato de video.
                        </video>
                    </div>
                    <div class="col-lg 4" v-else-if="video.link !== null">
                        <iframe class="videoLink"  width="392" height="248" :src="getYouTubeEmbedUrl(video.link)" frameborder="0"
                            allowfullscreen></iframe>
                    </div>


                    <div v-show="hoverIndex === index" class="overlay"></div>
                    <svg v-show="hoverIndex === index" class="play-button" xmlns="http://www.w3.org/2000/svg" width="78" height="78" viewBox="0 0 78 78" fill="none">
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
                                <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_295_1478" />
                                <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_295_1478"
                                    result="shape" />
                            </filter>
                        </defs>
                    </svg>
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
            hoverIndex: null
        }
    },
    methods: {
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
    }
}
</script>

<style scoped>
.container {
    margin-top: 23px;
}

.col-lg-4 {
    margin-bottom: 20px;
}

.video-container {
    position: relative;
}

.video-wrapper {
    position: relative;
}

.videoLink:hover{
    background-color: rgba(0, 0, 0, 0.5);
}
.overlay:hover {
    cursor: pointer;
}

.play-button {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    cursor: pointer;
}
</style>