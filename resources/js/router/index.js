import { createRouter, createWebHashHistory } from 'vue-router';

import PanelAdmin from '../views/admin/panel/panelView.vue';
import LoginView from '../views/admin/login/LoginView.vue';
import HomeView from '../views/HomeView.vue';
import ProductosView from '../views/ProductosView.vue';
import EmpresaView from '../views/EmpresaView.vue';


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
