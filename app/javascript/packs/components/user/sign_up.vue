<template>
    <div>
        <h1>会員登録</h1>
        <div class="form-error" v-if="errors">
            <li v-if="errors.name">{{errors.name[0]}}</li>
            <li v-for="error in errors.password">{{error}}</li>
            <li v-if="errors.password_confirmation">{{errors.password_confirmation[0]}}</li>
        </div>
        <p>ログインID: <input type="text" v-model="login_id" required></p>
        <p>パスワード: <input type="password" v-model="password"></p>
        <p>パスワード確認: <input type="password" name="password_confirmation" v-model="password_confirmation"></p>
        <button @click="signUp">登録</button>
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