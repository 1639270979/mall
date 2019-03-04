<template>
  <div class="app-home">
    <!-- 1:头部-->
    <router-view></router-view>
    <Footer @click="change()"></Footer>
  </div>
</template>

<script>
// @ is an alias to /src
import Footer from '@/components/footer'

export default {
  data(){
    return {
      mui:0
    }
  },
  methods:{
      change(){
            console.log(1);
            var navs=document.getElementById("mui-bar").children();
            for(var item of navs){
                if(item==e.target){
                    item.setAttribute("class","mui-active");
                }else{
                    item.removeAttribute("mui-active");
                }
            }
        }
  },
  created() {
  },
  components:{
    Footer
  }
}
</script>

<style>
  /* 1:头部导航 */
  .app-home{
    font-size: 16px;
    font-family: Hiragino Sans GB, Arial, Helvetica, "\5B8B\4F53", sans-serif;
  }
  .app-home .content-wrap{
    /*  padding:0 2.5vw; */
  }
  
</style>