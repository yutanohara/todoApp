import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router';
import SignUp from '../components/user/sign_up';
import SignIn from '../components/user/sign_in';

Vue.use(VueRouter)

const routes = [
    { path: '/sign_up', component: SignUp },
    { path: '/sign_in', component: SignIn }
];

export default new VueRouter({
    mode: 'history',
    routes: routes
});