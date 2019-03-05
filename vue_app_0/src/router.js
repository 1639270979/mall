import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Index from './views/index.vue'
import Login from './views/login.vue'
import Register from './views/register.vue'
import Search from './views/search.vue'
import Cart from './views/cart.vue'
import Family from './views/family.vue' 
import myAccount from './views/myAccount/myAccount.vue'
import Drink_tea from './views/tea/drink_tea.vue'
import Detail from './views/details/detail.vue'
import Personal from './views/myAccount/personal.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {path: '/',component: Home,children:[
      {path:'',component:Index},
      {path:'/family',component:Family},
      {path:'/drink_tea',component:Drink_tea},
      {path:'/cart',component:Cart},
      {path:'/detail',component:Detail}
    ]},
    {path:'/login',component:Login},
    {path:'/register',component:Register},
    {path:'/search',component:Search},
    {path:"/myAccount",component:myAccount},
    {path:'/personal',component:Personal}
  ]
})
