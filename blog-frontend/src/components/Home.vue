<template>
  <Articles :articles="articles" />
</template>

<script>
import Articles from "./Articles";

export default {
  name: "Home",
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
        "http://localhost:3000/apis/articles/v1/articles"
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

<style scoped></style>
