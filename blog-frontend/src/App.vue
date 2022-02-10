<template>
  <Articles :articles="articles" />
</template>

<script>
import Articles from "./components/Articles";

export default {
  name: "App",
  components: {
    Articles,
  },
  data() {
    return {
      articles: [],
    };
  },
  methods: {
    async fetchArticles() {
      const res = await fetch(
        "http://localhost:3000/apis/articles/v1/articles_json"
      );
      const data = await res.json();
      return data;
    },
  },
  async created() {
    this.articles = await this.fetchArticles();
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
