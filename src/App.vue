<template>
  <div id="app">
    <img src="./assets/logo.png" width="200">
    <highlightable-input
            class="myinput"
            :highlight-style="defaultStyle"
            :highlight-enabled="highlightEnabled"
            :highlight="highlights"
            v-model="msg"
    />
    <br/>
    <button @click="getSymptoms">Submit</button>
  </div>
</template>
/*BACK ipsum dolor sit amet, BACK ache adipiscing elit. Suspendisse dignissim leo massa, sed aliquet leo posuere ut.
 *Curabitur malesuada accumsan erat, id varius eros tincidunt quis.
*Vivamus lobortis, odio at fermentum efficitur, risus est tincidunt nisl, eget condimentum tellus dui vitae nibh.
*/
<script>
  import HighlightableInput from "vue-highlightable-input";
  import axios from "axios";

  export default {
    name: 'app',
    components: {
      HighlightableInput,
    },
    data() {
      return {
        msg: "",
        defaultStyle: { 'background-color' : 'yellow' },
        symptoms: [],
        highlights: [""],
        highlightEnabled: true
      }
    },
    methods: {
      async getSymptoms () {
        axios
                .get("http://localhost:3000")
                .then(response => {
               // todo remove
                  console.log(response.data)
                  this.symptoms = response.data
                  this.highlight();
                })
                .catch(e => {
                    console.log('Error: ', e)
                })
      },
      highlight() {
      this.highlights.splice(0);
        this.symptoms.forEach(q => {
          this.highlights.push(q);
        })
      }
    }
  }
</script>

<style>
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
  }
  .myinput {
    min-height: 40px;
    width: auto;
    margin: 30px;
    background-color: #e2e1ee
  }
</style>