<template>
    <div id="app">
        <input type="text" v-model="newTask">
        <button @click="createTask">作成</button>
        <ul>
            <li v-for="task in tasks">
                {{ task.name }}
                <button @click="deleteTask(task.id)">削除</button>
            </li>
        </ul>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data () {
            return {
                tasks: [],
                newTask: ''
            }
        },
        mounted: function() {
            this.getTasks();
        },
        methods: {
            getTasks() {
                axios
                    .get('/api/tasks')
                    .then(res => {
                        for( let task in res.data ) {
                            this.tasks.push(res.data[task])
                        }
                    })
                    .catch(err => { return err });
            },
            createTask() {
                axios
                    .post('/api/tasks',{
                        task: {
                            name: this.newTask
                        }
                    })
                    .then( req => {
                        console.log(req.data)
                        this.tasks.unshift(req.data);
                        this.newTask = '';
                    })
                    .catch( err => {console.log(err)})
            },
            deleteTask(id) {
                axios
                    .delete('/api/tasks/' + id)
                    .then( () => {
                        window.location.reload()
                    })
                    .catch( err => {console.log(err)})
            }
        },
    }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
