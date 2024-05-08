import { createRouter, createWebHashHistory } from 'vue-router';

import PanelAdmin from '../views/admin/panel/panelView.vue';
import LoginView from '../views/admin/login/LoginView.vue';


const routes = [
    {
        path: '/',
        component: PanelAdmin
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
