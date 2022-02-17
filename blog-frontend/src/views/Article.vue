<template>
  <router-link :to="{ name: 'ArticleBody', params: { id: article.id } }">
    <h1>{{ article.title }}</h1>
  </router-link>
</template>

<script>
export default {
  name: "Article",
  props: {
    article: Object,
  },
};
</script>

<style scoped>
h1 {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 24px;
  font-weight: bold;
  background: #0091ad;
  padding: 15px;
  border-radius: 16px;
  margin: 10px auto;
  width: 50%;
  cursor: pointer;
  color: white;
}

h1:hover {
  background: #5c4d7d;
}

a {
  text-decoration: none;
}
</style>
