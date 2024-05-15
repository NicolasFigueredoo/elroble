import { createRouter, createWebHashHistory } from 'vue-router';

import PanelAdmin from '../views/admin/panel/panelView.vue';
import LoginView from '../views/admin/login/LoginView.vue';
import HomeView from '../views/HomeView.vue';
import ProductosView from '../views/ProductosView.vue';
import EmpresaView from '../views/EmpresaView.vue';
import ServiciosView from '../views/ServiciosView.vue';
import DescargasView from '../views/DescargasView.vue';
import NovedadesView from '../views/NovedadesView.vue';
import FeriasView from '../views/FeriasView.vue';
import VideosView from '../views/VideosView.vue';
import ContactosView from '../views/ContactoView.vue';


const routes = [
    {
        path: '/',
        component: HomeView
    },
    {
        path: '/home',
        name: 'HomeView',
        component: HomeView
    },
    {
        path: '/empresa',
        name: 'EmpresaView',
        component: EmpresaView
    },
    {
        path: '/productos',
        name: 'ProductosView',
        component: ProductosView
    },
    {
        path: '/servicios',
        name: 'ServiciosView',
        component: ServiciosView
    },
    {
        path: '/descargas',
        name: 'DescargasView',
        component: DescargasView
    },
    {
        path: '/novedades',
        name: 'NovedadesView',
        component: NovedadesView
    },
    {
        path: '/ferias',
        name: 'FeriasView',
        component: FeriasView
    },
    {
        path: '/videos',
        name: 'VideosView',
        component: VideosView
    },
    {
        path: '/contactos',
        name: 'ContactosView',
        component: ContactosView
    },
    {
        path: '/admin/login',
        name: 'login',
        component: LoginView
    },
    {
        path: '/admin/panel',
        component: PanelAdmin
    },
];


const router = createRouter({
    history: createWebHashHistory(),
    routes,
    scrollBehavior(to, from, savedPosition) {
        return { left: 0, top: 0 };
    }
});


export default router;
