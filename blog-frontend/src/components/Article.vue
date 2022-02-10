<template>
  <h1>{{ article.title }}</h1>
  <p>{{ article.body }}</p>
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
  font-size: 15px;
}

p {
  font-family: "Times New Roman", Times, serif;
}
</style>
