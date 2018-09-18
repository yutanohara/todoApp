<template>
    <div>
        <h1>ログイン</h1>
        <p>ログインID: <input type="text" v-model="login_id"></p>
        <p>パスワード: <input type="password" v-model="password"></p>
        <button @click="signIn">ログイン</button>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        name: "sign_in",
        data () {
            return {
                login_id: '',
                password: ''
            }
        },
        methods: {
            signIn() {
                axios
                    .post('/sign_in', {
                        user: {
                            name: this.login_id,
                            password: this.password
                        }
                    })
                    .then( req => {
                        console.log(req)
                        // window.location.reload()
                    })
                    .catch( err => { console.log(err) })
            }
        }
    }
</script>

<style scoped>

</style>