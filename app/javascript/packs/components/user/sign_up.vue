<template>
    <div>
        <h1>会員登録</h1>
        <p>ログインID: <input type="text" v-model="login_id"></p>
        <p>パスワード: <input type="password" v-model="password"></p>
        <button @click="signUp">登録</button>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        name: "sign_up",
        data () {
            return {
                login_id: '',
                password: ''
            }
        },
        methods: {
            signUp() {
                axios
                    .post('/sign_up', {
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