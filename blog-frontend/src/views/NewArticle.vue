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
      <select class="form-select">
        <option value="1">public</option>
        <option value="2">private</option>
        <option value="3">archived</option>
      </select>
    </div>
    <button @click="submitForm" type="button" class="btn btn-primary">
      Create
    </button>
  </form>
</template>

<script>
import useVuelidate from "@vuelidate/core";
import { required, minLength } from "@vuelidate/validators";

export default {
  name: "NewArticle",
  setup() {
    return {
      v$: useVuelidate(),
    };
  },
  data() {
    return {
      title: "",
      body: "",
    };
  },
  validations() {
    return {
      title: { required },
      body: { required, minLength: minLength(10) },
    };
  },
  methods: {
    async submitForm() {
      const isFormCorrect = await this.v$.$validate();
      if (!isFormCorrect) {
        return;
      } else {
        alert("Success !");
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
