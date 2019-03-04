<template>
    <div class="register">
        <!-- 1：标题 -->
        <mt-header class="register-header" title="注册">
            <router-link to="/login" slot="left">
                <mt-button icon="back">返回</mt-button>
            </router-link>
        </mt-header>
        <!-- 2：form表单 -->
        <div class="register-wrap" id="vail">
            <ul>
                <li>
                    <span class="element-icons el-icon-yonghudengluicon"></span>
                    <input type="text" placeholder="请输入手机号" v-model="phone" @blur="blur">
                    <span class="element-icons el-icon-zhengque1" :class="p"></span>
                </li>
                <li>
                    <span class="element-icons el-icon-mima"></span>
                    <input type="password" placeholder="输入6~12位密码" v-model="upwd">
                    <span class="element-icons el-icon-zhengque1" :class="u"></span>
                </li>
                <li>
                    <span class="element-icons el-icon-mima"></span>
                    <input type="password" placeholder="确认密码" v-model="rUpwd">
                    <span class="element-icons el-icon-zhengque1" :class="ru"></span>
                </li>
                <li>
                    <span class="element-icons el-icon-icon_"></span>
                    <input type="text" placeholder="请输入邮箱，用于找回密码" v-model="email">
                    <span class="element-icons el-icon-zhengque1" :class="e"></span>
                </li>
            </ul>
        </div>
        <!-- 3:立即注册 -->
        <div class="register-button">
            <button @click="register">立即注册</button>
        </div>
        <!-- 4:其他登陆方式 -->
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
                        <span class="element-icons el-icon-weixin1"></span>
                    </div>
                    <span>微信</span>
                </a>
            </div>
        </div>
    </div>
</template>

<script>
import { Toast } from 'mint-ui';

export default {
    data(){
        return{
            phone:"",
            upwd:"",
            rUpwd:"",
            // 隐藏的密码
            hideu:"",
            email:"",
            // 电话验证
            p:{correct:true},
            // 密码验证
            u:{correct:true},
            ru:{correct:true},
            // 邮箱验证
            e:{correct:true},
            time:3
        }
    },
    watch:{
        // 电话验证
        phone(e){
            var phone=this.phone;
            var reg=/^1[3-8][0-9]{9}$/;
            if(reg.test(phone)){
                this.p.correct=false;
            }else{
                this.p.correct=true;
            }
        },
        // 密码验证
        upwd(){
            var upwd=this.upwd;
            var reg=/^[0-9a-zA-Z]{6,12}$/;
            if(reg.test(upwd)){
                this.u.correct=false;
            }else{
                this.u.correct=true;
            }
        },
        rUpwd(){
            var r=this.rUpwd;
            if(r==this.upwd){
                this.ru.correct=false;
                Toast({  
                    message: "密码一致", //提示内容分
                    position: "middle", //提示框位置
                    duration: 1500 , //持续时间（毫秒），若为 -1 则不会自动关闭
                    iconClass: "icon icon-success" , //icon 图标的类名
                    className:"addClass"   //Toast 的类名。可以为其添加样式
                }); 
            }else{
                this.ru.correct=true;
            }
        },
        // 邮箱验证
        email(){
            var email=this.email;
            var reg=/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
            if(reg.test(email)){
                this.e.correct=false;
            }else{
                this.e.correct=true;
            }
        }
    },
    methods:{
        blur(){
            var phone=this.phone;
            var url="http://127.0.0.1:3000/cart/verify?phone="+phone;
            this.axios.get(url).then(result=>{
                if(result.data.code== -1){
                    Toast({  
                        message: "账号可用", //提示内容分
                        position: "middle", //提示框位置
                        duration: 1500 , //持续时间（毫秒），若为 -1 则不会自动关闭
                        iconClass: "icon icon-success" , //icon 图标的类名
                        className:"addClass"   //Toast 的类名。可以为其添加样式
                    }); 
                }else{
                    Toast({  
                        message: "账号不可用", //提示内容分
                        position: "middle", //提示框位置
                        duration: 1500 , //持续时间（毫秒），若为 -1 则不会自动关闭
                        iconClass: "icon icon-success" , //icon 图标的类名
                        className:"addClass"   //Toast 的类名。可以为其添加样式
                    }); 
                }
            })
        },
        register(){
            var phone=this.phone;
            var upwd=this.upwd;
            var email=this.email;
            var url="http://127.0.0.1:3000/cart/register?phone="+phone+"&upwd="+upwd+"&email="+email;
            this.axios.get(url).then(result=>{
                if(result.data.code==1){
                    Toast({  
                        message: "注册成功", //提示内容分
                        position: "middle", //提示框位置
                        duration: 1500 , //持续时间（毫秒），若为 -1 则不会自动关闭
                        iconClass: "icon icon-success" , //icon 图标的类名
                        className:"addClass"   //Toast 的类名。可以为其添加样式
                    }); 
                    this.$router.push("/login");
                }else{
                    Toast({  
                        message: "注册失败", //提示内容分
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
    /* 1：头部 */
    .register .register-header{
        height:13vw;
        letter-spacing:3px;
        font-size:1.15rem;
        width:100%;
        background:#b0352f;
    }
    .register .register-header .mint-button-text{
        font-size: 1rem;
        vertical-align: baseline;
    }
    .register .register-header .mint-button-icon{
        vertical-align: baseline;
    }
    .register{
        width:100vw;
        height:100vh;
        background:#fff;
    }
    /* 2：主体 */
    .register .register-wrap{
        padding:0 7vw;
        margin-top:10vw;
    }
    .register .register-wrap ul{
        list-style:none;
    }
    .register .register-wrap ul li{
        height:15vw;
        line-height:15vw;
        border-bottom:1px solid #ddd;
    }
    .register .register-wrap ul li input{
        margin:0;
        border:0;
        width:75vw;
    }
    /* 正确按钮 */
    .correct{
        display:none !important;
    }
    /* placeholder的颜色 */
    .register .register-wrap ul li input::-webkit-input-placeholder {
         /* placeholder颜色  */
         color: #666;
         /* placeholder字体大小  */
         font-size: 0.9rem;
     }
    .register .register-wrap ul li :-moz-placeholder { /* Mozilla Firefox 4 to 18 */
        color:#666;
    }
    .register .register-wrap ul li::-moz-placeholder { /* Mozilla Firefox 19+ */
        color:#666;
    }
    .register .register-wrap ul li :-ms-input-placeholder { /* Internet Explorer 10-11 */
        color:#666;
    }
    .register .register-wrap ul li span{
        display:inline-block;
        transform: scale(1.3);
        color:#359ce7;
    }
    .register .register-wrap ul li .el-icon-yonghudengluicon{
        transform: scale(1);
    }
    /* 1：立即注册按钮 */
    .register .register-button{
        margin-top:7vw;
        padding:0 7vw;
    }
    .register .register-button button{
        width:100%;
        height:12vw;
        background:#b0352f;
        font-size: 1.05rem;
        letter-spacing: 2px;
        color:#fff;
    }
    /* 其他登陆方式 */
    .login .weixin-login {
        font-size:1rem;
        text-align:center;
        color:#359ce7;
        margin-top:7vw;
    }
    .login .weixin-login a{
        color:#359ce7;
    }
    /* 其他登录方式 */
    .register .other-login .title{
        color:#999;
        font-size:0.9rem;
        height:9.375vw;
        line-height:9.375vw;
        text-align:center;
        display:flex;
        justify-content:center;
        align-items: center;
        margin-top:7vw;
    }
    .register .other-login .title:before{
        content:'';
        display:block;
        width:25vw;
        height:0.3vw;
        background:#bbb;
        margin-right:3vw;
    }
    .register .other-login .title:after{
        content:'';
        display:block;
        width:25vw;
        height:0.3vw;
        background:#bbb;
        margin-left:3vw;
    }
    .register .other-login .methods{
        display:flex;
        justify-content: center;
        align-items: center;
        margin-top:10vw;
    }
    .register .other-login .methods div span{
        display:inline-block;
        transform: scale(3);
        margin-left:10vw;
        margin-right:10vw;
    }
    .register .other-login .methods a:first-child div span{
        color:#29b4e8;
    }
    .register .other-login .methods a:last-child div span{
        color:#09bb07;
    }
    .register .other-login .methods a>span{
        color:#666;
        display: inline-block;
        margin:4vw 0 0 8vw;
    }
    .register .other-login .methods a:first-child>span{
        margin-left:9vw;
    }
</style>