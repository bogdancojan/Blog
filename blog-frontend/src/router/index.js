import { createRouter, createWebHistory } from "vue-router";
import Home from "../components/Home.vue";
import NewArticle from "../views/NewArticle.vue";
import ArticleBody from "../components/ArticleBody.vue";
import NotFound from "../views/NotFound.vue";
import EditArticle from "../views/EditArticle.vue";

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/article/new",
    name: "NewArticle",
    component: NewArticle,
  },
  {
    path: "/article/:id",
    name: "ArticleBody",
    component: ArticleBody,
    props: true,
  },
  {
    path: "/article/:id/edit",
    name: "EditArticle",
    component: EditArticle,
    props: true,
  },
  {
    path: "/:catchAll(.*)",
    name: "NotFound",
    component: NotFound,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
