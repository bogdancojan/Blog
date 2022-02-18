<template>
  <div class="container" id="container-article">
    <div
      class="card text-center"
      style="width: 40rem; max-height: fit-content; padding: 20px"
    >
      <div class="card-body">
        <h5 class="card-title">
          <b>{{ article.title }}</b>
        </h5>
        <p class="card-text">
          {{ article.body }}
        </p>
      </div>
    </div>
    <form>
      <h4>New Comment</h4>
      <div class="mb-3">
        <input type="text" class="form-control" placeholder="Commenter" />
      </div>
      <div class="mb-3">
        <textarea class="form-control" rows="3" placeholder="Body"></textarea>
      </div>
      <div class="mb-3">
        <select class="form-select">
          <option value="1">public</option>
          <option value="2">private</option>
          <option value="3">archived</option>
        </select>
      </div>
      <button type="submit" class="btn btn-primary">Create</button>
    </form>
  </div>
  <div
    class="card justify-content-center container"
    style="margin-bottom: 20px; align-items: center"
  >
    <h2><b>Comments</b></h2>
    <div :key="comment.id" v-for="comment in article.comments">
      <div class="card" style="width: 60vw; margin-bottom: 5px">
        <div class="card-body">
          <blockquote class="blockquote mb-0">
            <p>{{ comment.body }}</p>
            <footer class="blockquote-footer">
              {{ comment.commenter }}
            </footer>
          </blockquote>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Content",
  props: {
    article: Object,
  },
};
</script>

<style scoped>
#container-article {
  margin-bottom: 20px;
  height: fit-content;
  display: flex;
  justify-content: space-evenly;
}

.btn-primary {
  background: #0091ad;
  border: none;
}

.btn-primary:hover {
  background: #5c4d7d;
}
</style>
