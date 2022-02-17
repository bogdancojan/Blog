<template>
  <form>
    <div class="mb-3">
      <label class="form-label">Title</label>
      <input type="text" class="form-control" />
    </div>
    <div class="mb-3">
      <label class="form-label">Body</label>
      <textarea class="form-control" rows="3"></textarea>
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
</template>

<script>
export default {
  name: "NewArticle",
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
