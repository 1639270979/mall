<template>
    <div class="pers">
        <!-- 1：头部 -->
        <mt-header title="用户资料">
            <router-link to="/" slot="left">
                <mt-button icon="back"></mt-button>
            </router-link>
            <mt-button slot="right">保存</mt-button>
        </mt-header>
        <!-- 头像 -->
        <div class="avatar">
            <router-link to="">
                <img src="../../assets/img/family/personal-avatar.png" alt="">
                <span>点击修改图像</span>
            </router-link>
        </div>
        <!-- 资料 -->
        <div class="data">
            <div class="nickname">
                <span>昵称</span>
                <span class="name-box">
                    <input type="text" placeholder="请输入昵称">
                </span>
            </div>
            <div>
                <span>性别</span>
                <div class="sex">
                    <span>
                        <input type="checkbox">
                        <span>男</span>
                    </span>
                    <span>
                        <input type="checkbox">
                        <span>女</span>
                    </span>
                </div>
            </div>
            <div>
                <span>生日</span>
                <!-- <template>
                    <mt-datetime-picker
                        ref="picker"
                        type="time"
                        v-model="pickerValue">
                    </mt-datetime-picker>
                </template> -->
            </div>
            <div>
                <span>收获地址</span>
                <span class="element-icons el-icon-arrow-right"></span>
            </div>
            <div>
                <span>修改密码</span>
                <span class="element-icons el-icon-arrow-right"></span>
            </div>
        </div>
        <Footer></Footer>
    </div>    
</template>

<script>
import Footer from '@/components/footer'

export default {
   components:{
    Footer
  }
}
</script>

<style>
    /* 1：头部 */
    .pers .mint-header{
        background-color:#b0352f;
    }
    .pers .mint-button--normal,.pers .mint-header-title{
        line-height:21px;;
        margin:0;
    }
    /* 主体 */
    .pers .avatar{
        background: #fff;
    }
    .pers .avatar a{
        display:block;
        width:25vw;
        margin:0 auto;
        padding-top:10vw;
        padding-bottom:5vw
    }
    .pers .avatar a img{
        width:100%;
    }
    .pers .avatar a span{
        font-size:0.9rem;
        color:#999;
    }
    /* 资料 */
    .pers .data>div{
        height:14.4vw;
        background:#fff;
        padding:0 4vw;
        font-size:0.9rem;
        color:#666;
        border-bottom:1px solid #ddd;
        display:flex;
        justify-content: space-between;
        align-items:center;
    }
    /* 昵称 */
    .pers .data .nickname{
        display:flex;
        justify-content: space-between;
        align-items:center;
    }
    .pers .data .nickname span{
        display:block;
        height:14.4vw;
        line-height: 14.4vw;
        font-size:1rem;
        color:#666;
    }
    .pers .data .nickname .name-box{
        width:85%;
    }
    .pers .data .nickname .name-box input{
        border:0;
        margin:0;
    }
     /* placeholder的颜色 */
    .pers .data .nickname .name-box input::-webkit-input-placeholder {
         /* placeholder颜色  */
         color: #666;
         /* placeholder字体大小  */
         font-size: 0.85rem;
     }
    .pers .data .nickname .name-box input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
        color:#666;
    }
    .pers .data .nickname .name-box input::-moz-placeholder { /* Mozilla Firefox 19+ */
        color:#666;
    }
    .pers .data .nickname .name-box input:-ms-input-placeholder { /* Internet Explorer 10-11 */
        color:#666;
    }
    /* 性别 */
    .pers .data .sex{
        width:80%;
    }
    .pers .data .sex span{
        margin-right:5vw;
        color:#333;
    }
    .pers .data .sex input{
        width:4vw;
        height:4vw;
    }
</style>
