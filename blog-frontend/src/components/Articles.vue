<template>
  <div :key="article.id" v-for="article in articles">
    <Article :article="article" />
  </div>
</template>

<script>
import Article from "../views/Article";

export default {
  name: "Articles",
  props: {
    articles: Array,
  },
  components: {
    Article,
  },
};
</script>
