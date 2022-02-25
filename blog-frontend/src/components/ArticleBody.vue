<template>
  <Content :article="article" />
</template>

<script>
import Content from "../views/Content";

export default {
  props: ["id"],
  components: {
    Content,
  },
  data() {
    return {
      article: {},
    };
  },
  methods: {
    async fetchArticle() {
      try {
        const res = await fetch(
          "http://localhost:3000/articles/" + this.id + ".json"
        );
        const data = await res.json();
        return data;
      } catch (error) {
        console.log(error);
      }
    },
  },
  async created() {
    this.article = await this.fetchArticle();
  },
};
</script>

<style scoped></style>
