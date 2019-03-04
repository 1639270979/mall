<template>
    <div class="login">
        <mt-header class="login-header" title="登录">
            <router-link to="/" slot="left">
                <mt-button icon="back">返回</mt-button>
            </router-link>
            <router-link to="register" slot="right">
                <mt-button>注册</mt-button>
            </router-link>
        </mt-header>
        <!-- 1:头像 -->
        <div class="avatar">
            <div>
                <img src="../assets/img/get_avatar.png" alt="">
            </div>
        </div>
        <!-- 2:form表单 -->
        <form action="">
            <div class="login-form">
                <div class="login-box">
                    <div>
                        <span class="element-icons el-icon-yonghudengluicon"></span>
                        <input type="text" placeholder="请输入您的手机号/密码" v-model="phone">
                        <span class="element-icons el-icon-zhengque1" :class="opt"></span>
                    </div>
                    <div>
                        <span class="element-icons el-icon-mima"></span>
                        <input type="password" placeholder="请输入您的密码" v-model="upwd">
                    </div>
                </div>
                <!-- 登录按钮 -->
                <div class="button">
                    <span @click="btnLogin">登录</span>
                </div>
            </div>
            <!-- 2.1：下次自动登录  和 忘记密码 -->
            <div class="form-control">
                <label for="auto-login">
                    <input type="checkbox">
                    <span></span>下次自动登录
                </label>
                <a href="javascript:;">忘记密码?</a>
            </div>
            <!-- 2.2短信快捷登录 -->
            <div class="weixin-login">
                <a href="javascript:;">短信快捷登录</a>
            </div>
        </form>
        <!-- 3:其他登录方式 -->
        <div class="other-login">
            <div class="title">
                其他登录方式
            </div>
            <div class="methods">
                <a href="javascript:;">
                    <div>
                        <span class="element-icons el-icon-qq"></span>
                    </div>
                    <span>QQ</span>
                </a>
                <a href="javascript:;">
                    <div>
                        <span class="element-icons el-icon-weibo2"></span>
                    </div>
                    <span>微博</span>
                </a>
            </div>
        </div>
    </div>
</template>

<script>
import { Toast } from 'mint-ui';

export default {
    data(){
        return {
            opt:{ correct:true },
            phone:"",
            upwd:""
        }
    },
    watch:{
        // 1:获取实时用户名和密码
        phone(){
            // console.log(this.uname);
            var u = this.phone;
            var reg=/^1[3-8][0-9]{9}$/;
            if(reg.test(u)){
                this.opt.correct=false;
            }else{
                this.opt.correct=true;
            }
        }
    },
    methods:{
        btnLogin(){
            //1：获取手机号和密码
            var u = this.phone;
            var p = this.upwd;
            //2：发送ajax请求
            var url="http://127.0.0.1:3000/cart/login?phone="+u+"&upwd="+p;
            this.axios.get(url).then(result=>{
                if(result.data.code==1){
                    var id = result.data.data[0].id;
                    this.$store.commit("updateCart",id);
                    Toast({  
                        message: "登录成功", //提示内容分
                        position: "middle", //提示框位置
                        duration: 1500 , //持续时间（毫秒），若为 -1 则不会自动关闭
                        iconClass: "icon icon-success" , //icon 图标的类名
                        className:"addClass"   //Toast 的类名。可以为其添加样式
                    }); 
                    var url="http://127.0.0.1:3000/cart/cartList?id="+id;
                    this.axios.get(url).then(result=>{
                        var rows = result.data.data;
                        this.$store.commit("updateCount",rows.length);
                    })
                    this.$router.push("/")
                }else{
                    Toast({  
                        message: "登录失败", //提示内容分
                        position: "middle", //提示框位置
                        duration: 1500 , //持续时间（毫秒），若为 -1 则不会自动关闭
                        iconClass: "icon icon-success" , //icon 图标的类名
                        className:"addClass"   //Toast 的类名。可以为其添加样式
                    }); 
                }
            })
        }
    }
}
</script>

<style>
    .login{
        width:100vw;
        height:100vh;
        background:#fff;
    }
    .login .login-header{
        height:13vw;
        letter-spacing:3px;
        font-size:1.15rem;
        background:#b0352f;
    }
    .login .login-header .mint-button-text{
        font-size: 1rem;
        vertical-align: baseline;
    }
    .login .login-header .mint-button-icon{
        vertical-align: baseline;
    }
    /* 头像 */
    .login .avatar div{
        width:25vw;
        height:25vw;
        border-radius:50%;
        margin:0 auto;
        margin-top:6vw;
        overflow:hidden;
    }
    .login .avatar div img{
        width:100%;
        height:100%;
    }
    /* 主体登陆 */
    .login .login-form{
        padding:0 3vw;
    }
    .login .login-form .login-box>div{
        height:50px;
        background:#fff;
        padding:0 3vw;
        border:1px solid #ddd;
        margin-top:2vw;
        display:flex;
        justify-content:space-between;
        align-items:center;
        position:relative;
    }
    .login .login-form .login-box>div .el-icon-mima{
        display:inline-block;
        transform:scale(1.3);
    }
    .login .login-form .login-box>div:first-child{
        margin-top:5vw;
    }
    .login .login-form .login-box>div input{
        height:40px;
        width:70vw;
        margin:0;
        padding:0;
        border:0;
        position:absolute;
        left:10vw;
    }
    .login .login-form .login-box>div .el-icon-zhengque1{
        display:inline-block;
        transform:scale(1.2);
        color:#fc355d;
    }
    /* 密码是否正确状态 */
    .login .login-form .login-box .correct{
        display:none;
    }
    /* placeholder的颜色 */
    .login .login-form .login-box>div input::-webkit-input-placeholder {
         /* placeholder颜色  */
         color: #666;
         /* placeholder字体大小  */
         font-size: 0.9rem;
     }
    .login .login-form .login-box>div input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
        color:#666;
    }
    .login .login-form .login-box>div input::-moz-placeholder { /* Mozilla Firefox 19+ */
        color:#666;
    }
    .login .login-form .login-box>div input:-ms-input-placeholder { /* Internet Explorer 10-11 */
        color:#666;
    }
    .login .login-form .button{
        height:13vw;
        margin-top:7vw;

    }
    .login .login-form .button span{
        display:block;
        width:100%;
        height:100%;
        line-height:13vw;
        text-align:center;
        background:#b0352f;
        letter-spacing:2px;
        font-size:1.2rem;
        color:#eee;
        border-radius:5px;
    }
    /* 忘记密码和自动登录 */
    .login .form-control{
        height:40px;
        font-size:0.9rem;
        display:flex;
        justify-content:space-between;
        align-items:center;
        padding:0 4vw;
        margin-top:3vw;
    }
    .login .form-control input{
        display:none;
    }
    .login .form-control span{
        display:inline-block;
        width:15px;
        height:15px;
        background:#bbb;
        margin:2px 5px -1px 0px;
        border-radius:50%;
        vertical-align: baseline;
    }
    /* 短信登陆 */
    .login .weixin-login {
        font-size:1rem;
        text-align:center;
        color:#b0352f;
        margin-top:7vw;
    }
    .login .weixin-login a{
        color:#b0352f;
    }
    /* 其他登录方式 */
    .login .other-login .title{
        color:#999;
        font-size:1rem;
        height:9.375vw;
        line-height:9.375vw;
        text-align:center;
        display:flex;
        justify-content:center;
        align-items: center;
        margin-top:5vw;
    }
    .login .other-login .title:before{
        content:'';
        display:block;
        width:25vw;
        height:0.3vw;
        background:#bbb;
        margin-right:3vw;
    }
    .login .other-login .title:after{
        content:'';
        display:block;
        width:25vw;
        height:0.3vw;
        background:#bbb;
        margin-left:3vw;
    }
    .login .other-login .methods{
            display:flex;
            justify-content: center;
            align-items: center;
            margin-top:10vw;
    }
    .login .other-login .methods div span{
        display:inline-block;
        transform: scale(3);
        margin-left:10vw;
        margin-right:10vw;
    }
    .login .other-login .methods a:first-child div span{
        color:#29b4e8;
    }
    .login .other-login .methods a:last-child div span{
        color:#09bb07;
    }
    .login .other-login .methods a>span{
        color:#666;
        font-size: 1rem;
        display: inline-block;
        margin:4vw 0 0 8vw;
    }
    .login .other-login .methods a:first-child>span{
        margin-left:9vw;
    }
</style>