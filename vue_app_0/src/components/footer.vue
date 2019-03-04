<template>
    <div class="footer">
        <!-- 3:添加公共组件 Home.vue/tabbar-->
        <nav class="mui-bar mui-bar-tab" id="mui-bar">
            <router-link class="mui-tab-item mui-active" to="/" @click="change()">
                <span class="mui-icon mui-icon-home"></span>
                <span class="mui-tab-label">首页</span>
            </router-link>
            <router-link class="mui-tab-item" to="/search" @click="change()">
                <span class="mui-icon mui-icon-search"></span>
                <span class="mui-tab-label">搜索</span>
            </router-link>
            <router-link class="mui-tab-item" to="/cart" @click="change()">
                <span class="mui-icon mui-icon-extra mui-icon-extra-cart">
                    <span class="mui-badge">{{$store.getters.optCartCount}}</span>
                </span>
                <span class="mui-tab-label">购物车</span>
            </router-link>
            <router-link class="mui-tab-item" to="/myAccount" @click="change()">
                <span class="mui-icon mui-icon-contact"></span>
                <span class="mui-tab-label">我的</span>
            </router-link>
        </nav>
    </div>
</template>

<script>
export default {
    data(){
        return {
            mui:0
        }
    },
    methods:{
        change(){
            this.$emit("change",1);
            // var navs=document.getElementById("mui-bar").children();
            // for(var item of navs){
            //     if(item==e.target){
            //         item.setAttribute("class","mui-active");
            //     }else{
            //         item.removeAttribute("mui-active");
            //     }
            // }
        }
    }
}
</script>

<style>
    /* 3：底部tab-bar #007aff*/
  .footer #mui-bar .mui-tab-item.mui-active {
    color: #929292;
  }
  .mui-bar-tab .mui-tab-item-tao {
      display: table-cell;
      overflow: hidden;
      width: 1%;
      height: 50px;
      text-align: center;
      vertical-align: middle;
      white-space: nowrap;
      text-overflow: ellipsis;
      color: #929292;
  }
  .mui-bar-tab .mui-tab-item-tao .mui-icon {
      top: 3px;
      width: 24px;
      height: 24px;
      padding-top: 0;
      padding-bottom: 0;
  }
  .mui-bar-tab .mui-tab-item-tao .mui-icon~.mui-tab-label {
    font-size:11px;
    display:block;
    overflow:hidden;
    text-overflow:ellipsis;
  }
</style>