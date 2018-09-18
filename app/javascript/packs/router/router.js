import VueRouter from 'vue-router';
import SignUp from '../components/sign_up';
import SignIn from '../components/sign_in';

const routes = [
    { path: '/sign_up', component: SignUp },
    { path: '/sign_in', component: SignIn }
];

export default new VueRouter({ routes });