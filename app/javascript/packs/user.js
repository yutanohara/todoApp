import Vue from 'vue/dist/vue.esm'
import Router from './router/router'
import SignIn from './components/sign_in.vue'
import SignUp from './components/sign_up'

document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        el: '#user',
        data: {
            message: "Can you say hello?"
        },
        Router,
        render: h => h(SignUp),
    })
})