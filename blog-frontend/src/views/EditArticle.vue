<template>
  <form>
    <div class="mb-3">
      <label class="form-label">Title</label>
      <input type="text" class="form-control" v-model="title" />
      <span style="color: #b7094c" v-if="v$.title.$error">
        {{ v$.title.$errors[0].$message }}
      </span>
    </div>
    <div class="mb-3">
      <label class="form-label">Body</label>
      <textarea class="form-control" rows="3" v-model="body"></textarea>
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
      Edit
    </button>
  </form>
</template>

<script>
import useVuelidate from "@vuelidate/core";
import { required, minLength } from "@vuelidate/validators";
import axios from "axios";

export default {
  name: "EditArticle",
  props: ["id_edit"],
  setup() {
    return {
      v$: useVuelidate(),
    };
  },
  data() {
    return {
      title: "",
      body: "",
      status: "",
    };
  },
  validations() {
    return {
      title: { required },
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
        const res = await axios.put(
          "http://localhost:3000/apis/articles/v1/articles/" + this.id_edit,
          {
            title: this.title,
            body: this.body,
            status: this.status,
            headers: {
              origin: "http://localhost:3000",
            },
          }
        );
        if (res.status == 200) {
          this.$router.replace({
            name: "ArticleBody",
            params: { id: this.id_edit },
          });
        }
      }
    },
  },
};
</script>

<style scoped>
form {
  text-align: center;
  margin-left: 25%;
  width: 50vw;
  align-items: center;
  display: flex;
  flex-direction: column;
}

.btn-primary {
  background: #0091ad;
  border: none;
}

.btn-primary:hover {
  background: #5c4d7d;
}
</style>
