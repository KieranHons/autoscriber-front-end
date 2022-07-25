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

<script>
import HighlightableInput from "vue-highlightable-input";
import axios from "axios";

export default {
  name: 'app',
  components: {
    HighlightableInput,
  },
  props: {
    SymptomModel: {
      title: String,
      link: String
    }
  },
  data() {
    return {
      msg: "",
      defaultStyle: { 'background-color' : 'yellow' },
      symptoms: this.SymptomModel,
      highlights: [""],
      highlightEnabled: true
    }
  },
  methods: {
    async getSymptoms () {
      axios
          .get("http://localhost:3000")
          .then(response => {
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
        this.highlights.push(q.title);
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
