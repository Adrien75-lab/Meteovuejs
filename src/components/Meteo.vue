<template>
<div class="container">
    <h1 class="my-4">App météo avec Vue.js</h1>
    <div class="form-groupe mb-5">
        <label for="position">Entrez le nom d'une ville</label>
        <input 
        id="position" 
        text="text"
        class="form-control"
        v-model="requete"
        v-on:keypress="goMeteo"
        >
    </div>
    <div class="w-75 m-auto" v-if="temps">
        <h3 class="text-center mb-3">Position: {{temps.name}}</h3>
        <div class="card text-center p-5">
            <p class="texte-affichage">
                Temperature :20°
            </p>
            <p class="texte-affichage">
                Temps : Nuageux
            </p>
            </div>
        </div>
</div>
</template>
<script>
    import axios from 'axios'
    export default {
        name: 'Meteo',
        data(){
            return {
                requete: '',
                temps: undefined,
                api_code:'6698a9b78ebf8da6278b70c6f17cf878',
                url_recherche:'https://api.openweathermap.org/data/2.5/weather?'
            }
        },
        methods: {
            goMeteo(e){
                if(e.key == "Enter"){
                    axios
                    .get(`${this.url_recherche}q=${this.requete}&units=metric&APPID=${this.api_code}`)
                    .then(reponse => {
                        this.temps =reponse.data;
                        console.log(reponse);

                    })
                    this.requete = ''
                }
            }
        }
    }
</script>
<style>

</style>