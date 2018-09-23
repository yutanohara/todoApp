<template>
    <div>
        <h1>会員登録</h1>
        <form id="user-form" action="/sign_up" method="post">
            <p>ログインID: <input type="text" v-model="login_id" ></p>
            <p>パスワード: <input type="password" value= 'v-model="password"'></p>
            <p>パスワード確認: <input type="password" name="password_confirmation" v-model="password_confirmation"></p>
            <button type="submit">登録</button>
        </form>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        name: "sign_up",
        data() {
            return {
                login_id: '',
                password: '',
                password_confirmation: '',
                errors: '',
            }
        },
        methods: {
            signUp() {
                axios
                    .post('/sign_up', {
                        user: {
                            name: this.login_id,
                            password: this.password,
                            password_confirmation: this.password_confirmation
                        }
                    })
                    .then(req => {
                        console.log(req)
                        location.href = '/'
                    })
                    .catch(err => {
                        this.errors = err.response.data;
                        render('/sign_up');
                    })
            }
        }
    }
</script>

<style scoped>

</style>