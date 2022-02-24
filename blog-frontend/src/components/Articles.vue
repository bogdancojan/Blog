<template>
  <div :key="article.id" v-for="article in articles">
    <div v-if="article.status == 'public'">
      <Article :article="article" />
    </div>
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
