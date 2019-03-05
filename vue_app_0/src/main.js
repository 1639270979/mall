import Vue from 'vue'
import App from './App.vue'
import router from './router'

//1:引入mint-ui 样式文件
import'mint-ui/lib/style.css'
Vue.config.productionTip = false;
//2:引入图标
import './assets/icon/iconfont.css'
//2:引入 mui库样式文件
import './lib/mui/css/mui.css'
import './lib/mui/css/icons-extra.css'
import {Header,Swipe,SwipeItem,Button,Toast} from "mint-ui"
import { DatetimePicker } from 'mint-ui';

Vue.component(DatetimePicker.name, DatetimePicker);
//4:注册Header组件
Vue.component(Header.name,Header);
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
Vue.component(Button.name,Button);
//5:引入 axios库
import axios from "axios"
//6:配置跨域访问保存session
axios.defaults.withCredentials=true;
//7:将axios库配置Vue实例对象中
Vue.prototype.axios = axios;
//7.1:加载第三方模块  qs
import qs  from "qs";
//7.2:配置qs模块，qs成功Vue属性
Vue.prototype.qs = qs;
//8：引入vuex
import Vuex from 'vuex'
//注册vuex组件
Vue.use(Vuex);
//创建store
var store = new Vuex.Store({
  state:{
    cartCount:sessionStorage.getItem("cartCount")||0,  //共享数据：购物车中商品数量
    cartId:sessionStorage.getItem("cartId")||0
  },
  //修改共享数据的方法
  mutations:{
    increment(state){
      state.cartCount++;
    },
    //显示购物车列表时的方法
    updateCount(state,count){
      state.cartCount=count;
      sessionStorage.setItem("cartCount",count)
    },
    // 全局购物车的数量
    updateCart(state,count){
      state.cartId=count;
      sessionStorage.setItem("cartId",count)
    }
  },
  //获得共享数据的方法
  getters:{
    optCartCount:function(state){
      return state.cartCount;
    },
    optcartId:function(state){
      return state.cartId;
    }
  }
})
new Vue({
  router,
  render: h => h(App),
  store,
}).$mount('#app')
