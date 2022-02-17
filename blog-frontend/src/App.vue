<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="/">
        <img
          src="./assets/logo-nav.svg"
          alt=""
          width="30"
          height="24"
          class="d-inline-block align-text-top"
        />
        Blogster
      </a>
      <div class="justify-content-end">
        <ul class="nav nav-pills">
          <li class="nav-item">
            <router-link class="nav-link" to="/">Articles</router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/article/new"
              >New Article</router-link
            >
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <router-view />
</template>

<script>
export default {
  name: "App",
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

.navbar {
  margin-bottom: 20px;
  padding: 10px;
}

.navbar a {
  font-weight: bold;
  color: #0091ad;
  text-decoration: none;
  border-radius: 4px;
}

.navbar a.router-link-exact-active {
  color: white;
  background: #5c4d7d;
}
</style>
