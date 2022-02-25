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
      <div class="d-grid gap-2 d-md-flex justify-content-center">
        <router-link
          :to="{ name: 'EditArticle', params: { id_edit: article.id } }"
        >
          <button class="btn btn-primary" type="button">Edit</button>
        </router-link>
        <button @click="deleteArticle" class="btn btn-b-danger" type="button">
          Delete
        </button>
      </div>
    </div>
    <form>
      <h4>New Comment</h4>
      <div class="mb-3">
        <input
          type="text"
          class="form-control"
          placeholder="Commenter"
          v-model="commenter"
        />
        <span style="color: #b7094c" v-if="v$.commenter.$error">
          {{ v$.commenter.$errors[0].$message }}
        </span>
      </div>
      <div class="mb-3">
        <textarea
          class="form-control"
          rows="3"
          placeholder="Body"
          v-model="body"
        ></textarea>
        <span style="color: #b7094c" v-if="v$.body.$error">
          {{ v$.body.$errors[0].$message }}
        </span>
      </div>
      <div class="mb-3">
        <label class="form-label">Status</label>
        <select class="form-select" v-model="status">
          <option value="public">public</option>
          <option value="private">private</option>
          <option value="archived">archived</option>
        </select>
        <span style="color: #b7094c" v-if="v$.status.$error">
          {{ v$.status.$errors[0].$message }}
        </span>
      </div>
      <button @click="submitForm" type="button" class="btn btn-primary">
        Create
      </button>
    </form>
  </div>
  <div
    class="card justify-content-center container"
    style="margin-bottom: 20px; align-items: center"
  >
    <h2><b>Comments</b></h2>
    <div :key="comment.id" v-for="comment in article.comments">
      <div v-if="comment.status == 'public'">
        <Comment :comment="comment" />
      </div>
    </div>
  </div>
</template>

<script>
import Comment from "./Comment";
import useVuelidate from "@vuelidate/core";
import { required, minLength } from "@vuelidate/validators";
import axios from "axios";

export default {
  name: "Content",
  props: {
    article: Object,
  },
  components: {
    Comment,
  },
  setup() {
    return {
      v$: useVuelidate(),
    };
  },
  data() {
    return {
      commenter: "",
      body: "",
      status: "",
    };
  },
  validations() {
    return {
      commenter: { required },
      body: { required, minLength: minLength(10) },
      status: { required },
    };
  },
  methods: {
    async submitForm() {
      const isFormCorrect = await this.v$.$validate();
      if (!isFormCorrect) {
        return;
      } else {
        const res = await axios.post(
          "http://localhost:3000/apis/comments/v1/articles/" +
            this.article.id +
            "/comments",
          {
            commenter: this.commenter,
            body: this.body,
            status: this.status,
            headers: {
              origin: "http://localhost:3000",
            },
          }
        );
        if (res.status == 200) {
          this.$router.go(0);
        }
      }
    },

    async deleteArticle() {
      const res = await axios.delete(
        "http://localhost:3000/apis/articles/v1/articles/" + this.article.id
      );
      if (res.status == 200) {
        this.$router.replace({ name: "Home" });
      }
    },
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

.btn-b-danger {
  background: #0091ad;
  border: none;
  color: white;
}

.btn-b-danger:hover {
  background: #b7094c;
}
</style>
