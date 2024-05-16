import { createApp } from 'vue';
import App from './app.vue';
import router from './router/index.js';
import store from './store/store.js';
import VueRecaptcha from 'vue-recaptcha-v3';

//bootstrap
import 'bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css'; 


const app = createApp(App);
app.use(router);
app.use(store);
app.use(VueRecaptcha, {
    siteKey: '6LfXCt8pAAAAAJ988vWMQzCeZ6rm8hZOZk1u95KU',
    loaderOptions: {
      useRecaptchaNet: true,
      autoHideBadge: true
    }
  });
app.mount('#app'); 

