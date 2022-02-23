<template>
  <div class="card" style="width: 60vw; margin-bottom: 5px">
    <div class="card-body">
      <blockquote class="blockquote mb-0">
        <p>{{ comment.body }}</p>
        <footer class="blockquote-footer">
          {{ comment.commenter }}
        </footer>
      </blockquote>
      <button
        @click="deleteComment"
        class="btn btn-b-danger"
        style="margin: 5px"
        type="button"
      >
        Delete
      </button>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Comment",
  props: {
    comment: Object,
  },
  methods: {
    async deleteComment() {
      const res = await axios.delete(
        "http://localhost:3000/apis/comments/v1/articles/" +
          this.comment.article_id +
          "/comments/" +
          this.comment.id
      );
      if (res.status == 200) {
        this.$router.go(0);
      }
    },
  },
};
</script>

<style scoped>
.btn-b-danger {
  background: #0091ad;
  border: none;
  color: white;
}

.btn-b-danger:hover {
  background: #b7094c;
}
</style>
