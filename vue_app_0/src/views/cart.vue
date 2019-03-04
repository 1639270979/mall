<template>
    <div class="cart">
        <!-- 1：购物车头部 -->
        <header class="cart-header">
            <div>
                <router-link class="address" to="">
                    <span class="element-icons el-icon-place"></span>
                    <span>定位</span>
                </router-link> 
                <a class="top-right" href="javascript:;">编辑</a>
            </div>
        </header>
        <!-- 2:购物车主体 -->
        <div class="cart-content">
            <!-- 2:1头部 --> 
            <div class="shop-header">
                <i :class="selectAll" @click="selected"></i>
                <div>
                    <span class="element-icons el-icon-libao"></span>
                    <span>商创自营</span>
                </div>
                <a href="javascript:;">领取优惠券</a>
            </div>
            <!-- 2:2购物列表 -->
            <div class="shop-list" id="select">
                <div v-for="(item,i) of shops" :key="item.id">
                    <div class="select-btn">
                        <i :class="select" @click="modifySelect" :data-id="i" data-select="select"></i>
                    </div>
                    <div class="product">
                        <div class="product-img">
                            <a href="javascript:;">
                                <img :src="item.url_img" alt="图片加载出错">
                            </a>
                        </div>
                        <div class="product-details">
                            <a>{{item.details}}</a>
                            <div>
                                <span class="price">￥{{item.price.toFixed(2)}}</span>
                                <div class="num">
                                    <button class="left" :data-i="i" @click="change">-</button>
                                    <span>{{item.num}}</span>
                                    <button class="right" :data-i="i" @click="change">+</button>
                                </div>
                            </div>
                            <p>
                                <span>收藏</span>
                                <span :data-d="i" @click="del" id="confirm">删除</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 未登录 -->
        <div class="not-login">
            <button type="button" class="mui-btn mui-btn-danger" @click="notLog" :style="logToggle">登录</button>
        </div>
        <!-- 3:猜你喜欢 -->
        <div>
            <div class="like-title">猜你喜欢</div>
            <div class="like-list">
                <div>
                    <div>
                        <a href="javascript:;">
                            <img src="../assets/img/cart/like1.jpeg" alt="">
                        </a>
                    </div>
                    <p>
                        <a href="javascript:;">2017春装新款男士卫衣套头圆领韩版潮流时尚男生休闲外套</a>
                        <span>￥200.00</span>
                    </p>
                    
                </div>
                <div>
                    <div>
                        <a href="javascript:;">
                            <img src="../assets/img/cart/like2.jpeg" alt="">
                        </a>
                    </div>
                    <p>
                        <a href="javascript:;">马克华菲长袖T恤男 冬季新品纯棉圆领黑白潮款印花休闲t恤</a>
                        <span>￥89.00</span>
                    </p>
                </div>
            </div>
        </div>
        <!-- 4:商品总计 -->
        <div class="total">
            <div>
                <div>
                    <i :class="selectAll" @click="selected"></i>
                    <span>全选</span>
                </div>
                <div class="total-wrap">
                    <div>
                        <p>
                            <span>总计：</span>
                            <span>￥{{total.toFixed(2)}}</span>
                        </p>
                        <p>
                            (不含运费：已节省￥{{carriage.toFixed(2)}})
                        </p>
                    </div>
                    <div class="Settlement-button">
                        去结算 ({{totalNum}})
                    </div>
                </div>
            </div>
        </div>
        <!-- 购物车底部 -->
    </div>
</template>

<script>
import Footer from '@/components/footer'
import { Toast } from 'mint-ui';

export default {
    data(){
        return {
            shops:[],
            //单选按钮
            select:{
                isSelected:true
            },
            //全选按钮
            selectAll:{
                isSelected:true
            },
            // 商品数量
            num:1,
            // 总计
            total:0,
            //运费
            carriage:0,
            // 总数量
            totalNum:0,
            // 登录显示与隐藏
            logToggle:{
                display:"block"
            }
        }
    },
    methods:{
        // 1:购物车数量的加减
        change(e){
            var i=e.target.dataset.i;
            // 初始化商品价格
            for(var item of this.shops){
                item.price=item.price/item.num;
            }
            // 更改商品的数量
            if(e.target.innerHTML=="+"){
                this.shops[i].num+=this.num;
            }else{
                this.shops[i].num+= -this.num;
                if(this.shops[i].num<=0){
                    this.shops[i].num=1;
                    Toast({  
                        message: "最小不能小于数量1", //提示内容分
                        position: "middle", //提示框位置
                        duration: 1500 , //持续时间（毫秒），若为 -1 则不会自动关闭
                        iconClass: "icon icon-success" , //icon 图标的类名
                        className:"addClass"   //Toast 的类名。可以为其添加样式
                    }); 
                }
            }
            // 计算总价格v
            this.total=0;
            this.totalNum=0;
            for(var item of this.shops){
                if(item.select){
                    this.total+=item.price*item.num;
                    this.totalNum+=item.num;
                }
                item.price=item.price*item.num;
            }
            // 商品价格
            // 
        },
        // 2:修改购物车状态
        modifySelect(e){
            // 1:获取当前元素id
            var idx=e.target.dataset.id;  
            // 2:获取当前class属性
            var st = e.target.className;
            // 3:判断是否包含isSelected属性
            var state="";
            if(st!="isSelected"){
                e.target.className="isSelected";
                state=true;
            }else{
                e.target.className="";
                state=false;
            }
            // 4:将该元素的属性值传给数组
            // 计算总价格
            this.total=0;
            this.totalNum=0;
            this.shops[idx].select=state;
            var count=0;
            for(var item of this.shops){
                // 初始化商品价格
                item.price = item.price/item.num;
                if(item.select){
                    count++;
                    this.total+=item.price*item.num;
                    this.totalNum+=item.num;
                }
                item.price=item.price*item.num;
            }
            // console.log(count);
            // 5:切换全选的状态
            if(count==this.shops.length){
                this.selectAll.isSelected=true;
                this.select.isSelected=true;
            }else{
                this.selectAll.isSelected=false;
            }
            
        },
        // 3:购物车全选状态  ?????????
        selected(e){
            var select = document.getElementById("select");
            // 找到所有的i标签 用于判断isSelected的有无
            var selectA=select.querySelectorAll("[data-select=select]");
            if(e.target.className){
                this.selectAll.isSelected=false;
                this.select.isSelected=false;
                for(var s of selectA){
                    s.className=""
                }
            }else{
                this.selectAll.isSelected=true;
                this.select.isSelected=true;
                for(var s of selectA){
                    s.className="isSelected"
                }
            }
            for(var item of this.shops){
                item.select=this.selectAll.isSelected;
            }
            // 计算总价格
            this.total=0;
            this.totalNum=0;
            for(var item of this.shops){
                item.price = item.price/item.num;
                if(item.select){
                    // 初始化商品价格
                    this.total+=item.price*item.num;
                    this.totalNum+=item.num;
                }
                item.price = item.price*item.num;
            }
        },
        // 4:删除商品
        del(e){
            var d=e.target.dataset.d;
            this.shops.splice(d,1);
            Toast({  
                message: "删除成功", //提示内容分
                position: "middle", //提示框位置
                duration: 1500 , //持续时间（毫秒），若为 -1 则不会自动关闭
                iconClass: "icon icon-success" , //icon 图标的类名
                className:"addClass"   //Toast 的类名。可以为其添加样式
            }); 
            // Toast({
            //     message: '删除成功',
            //     iconClass: 'icon icon-success'
            // });
            // 计算总价格
            this.total=0;
            this.totalNum=0;
            for(var item of this.shops){
                if(item.select){
                    this.total+=item.price*item.num;
                    this.totalNum+=item.num;
                }
            }
        },
        // 未登录
        notLog(){
            this.$router.push("/login");
        }
    },
    created(){
        // 1:发送ajax请求获得购物车数据
        var id = this.$store.getters.optcartId;
        var url="http://127.0.0.1:3000/cart/cartList?id="+id;
        this.axios.get(url).then(result=>{
            if(result.data.code == -1){
                Toast({  
                    message: "请登录", //提示内容分
                    position: "middle", //提示框位置
                    duration: 1500 , //持续时间（毫秒），若为 -1 则不会自动关闭
                    iconClass: "icon icon-success" , //icon 图标的类名
                    className:"addClass"   //Toast 的类名。可以为其添加样式
                }); 
                // 未登录
                this.logToggle.display="block";
                return;
            }
            this.logToggle.display="none";
            var rows = result.data.data;
            //修改全局购物车的数量
            this.$store.commit("updateCount",rows.length);
            //总计
            for(var item of rows){
                //初始化 shops中select的状态 为true
                item.select=this.select;
                if(item.select){
                    this.total+=item.price*item.num;
                    this.totalNum+=item.num;
                }
            }
            this.shops=rows;
        })
    },
    components:{
        Footer
    }
}
</script>

<style>
    /* 头部 */
    .cart{
        padding-bottom:24vw;
    }
    .cart .cart-header{
        height:14vw;
        letter-spacing:3px;
        font-size:1.15rem;
        background:#fafafa;
        color:#999;
        padding:0 3.5vw;
        border-bottom:1px solid #eee;
    }
    .cart .cart-header>div{
        height:13vw;
        display:flex;
        justify-content:space-between;
        align-items:center;
    }
    .cart .cart-header>div span{
        font-size:0.9rem;
        color:#666;
    }
    .cart .cart-header>div .top-right{
        color:#333;
        font-size:1rem;
    }
    /* 2:购物车主体 */
    .cart .cart-content{
        background:#fff;
    }
    /* 2:1购物车 top */
    .cart .cart-content>div.shop-header{
        height:14vw;
        padding: 0 3.5vw;
        display:flex;
        justify-content:space-between;
        align-items:center;
        border-bottom:1px solid #eee;
    }
    .cart .cart-content>div.shop-header div{
        width:64vw;
    }
    /* 选择按钮 */
    .cart .cart-content>div.shop-header i{
        display:inline-block;
        width:6vw;
        height:6vw;
        border:1px solid #ccc;
        border-radius:50%;
    }
    /* 选中状态 */
    .isSelected{
        border:1px solid #ec5151;
        color:#fff;
        background:#ec5151 url("../assets/img/xuanzhong.png") no-repeat;
        background-position:50% 50%;
        background-size:70%;
    }
    .cart .cart-content>div.shop-header a{
        font-size:0.8rem;
        color: #ec5151;
        font-weight:700;
    }
    .cart .cart-content>div.shop-header .el-icon-libao{
        color: #ec5151;
        margin-right:2vw;
    }
    .cart .cart-content>div.shop-header span{
        font-size:0.9rem;
        font-weight:700;
    }
    /* 2:2购物列表 */
    .cart .cart-content .shop-list{
        padding:0 3.5vw;
        
    }
    .cart .cart-content .shop-list>div{
        display:flex;
        justify-content:space-between;
        border-bottom:1px solid #ddd;
    }
    .cart .cart-content .select-btn{
        padding-top:10vw;
    }
    .cart .cart-content .select-btn i{
        display:inline-block;
        width:6vw;
        height:6vw;
        border:1px solid #ccc;
        border-radius:50%;
    }
    
    /* 2:3商品详情 */
    .cart .cart-content .shop-list .product{
        padding:4vw 0 2vw 2vw;
        width:92%;
        display:flex;
        justify-content:space-between;
    }
    /* 商品图片 */
    .cart .cart-content .shop-list .product-img {
        width:39vw;
        height:22.4vw;
    }
    .cart .cart-content .shop-list .product-img img{
        width:22.4vw;
        height:22.4vw;
    }
    .cart .cart-content .shop-list .product-details{
        margin-left:3vw;
    }
    /* 商品详情 */
    .cart .cart-content .shop-list .product-details a{
        display:block;
        height:11vw;
        font-size:0.9rem;
        color:#333;
        overflow:hidden;
    }
    .cart .cart-content .shop-list .product-details>div{
        display:flex;
        justify-content:space-between;
        align-items:center;
        height:8vw;
        margin-top:5vw;
    }
    /* 购物数量按钮 */
    .cart .cart-content .product-details .num{
        border:1px solid #bdbdbd;
    }
    .cart .cart-content .product-details .num span{
        display:inline-block;
        width:8vw;
        text-align:center;
        padding-top:1vw;
    }
    .cart .cart-content .product-details .num button{
        width:9vw;
        height:7vw;
        border:0;
        background:#efeff4;
    }
    .cart .cart-content .product-details .num .left{
        border-right:1px solid #bdbdbd;
    }
    .cart .cart-content .product-details .num .right{
        border-left:1px solid #bdbdbd;
    }
    .cart .cart-content .product-details .price{
        color: #ec5151;
        font-size:1rem;
    }
    /* 搜藏 删除 */
    .cart .cart-content .product-details p{
        text-align:right;
        margin:0;
        padding:0;
        margin-top:2vw;
    }
    .cart .cart-content .product-details p span{
        color:#666;
        font-size:0.8rem;
        margin:0 2vw;
    }
    /* 未登录 */
    .cart .not-login{
        text-align:center;
        margin-top:10vw;
    }
    .cart .not-login .mui-btn{
        margin:0 auto;
        padding:5px 12px;
    }
    /* 3：猜你喜欢 */
    .cart .like-title{
        color:#999;
        font-size:1rem;
        height:9.375vw;
        line-height:9.375vw;
        text-align:center;
        display:flex;
        justify-content:center;
        align-items: center;
        margin-top:5vw;
        margin-top:20vw;
    }
    .cart .like-title:before{
        content:'';
        display:block;
        width:25vw;
        height:0.3vw;
        background:#bbb;
        margin-right:3vw;
    }
    .cart .like-title:after{
        content:'';
        display:block;
        width:25vw;
        height:0.3vw;
        background:#bbb;
        margin-left:3vw;
    }
    /* 3:1猜你喜欢列表 */
    .cart .like-list{
        display:flex;
        justify-content:space-between;
    }
    .cart .like-list>div{
        width:48%;
    }
    .cart .like-list>div>div{
        border:1px solid #eee;
    }
    .cart .like-list>div img{
        width:100%;
        height:50vw;
    }
    .cart .like-list>div p{
        height:30vw;
        background:#fff;
        padding-left:3vw;
        padding-top:3vw;
    }
    .cart .like-list>div p a{
        display:inline-block;
        font-size:0.85rem;
        color:#333;
        height:11vw;
        overflow:hidden;
        margin-bottom:2vw;
    }
    .cart .like-list>div p span{
        font-size:1.2rem;
        color:#ec5151;
    }
    /* 4:底部全选按钮 */
    .cart .total i{
        display:inline-block;
        width:6vw;
        height:6vw;
        border:1px solid #ccc;
        border-radius:50%;
        vertical-align:middle;
        margin-right:2vw;
    }
    .cart .total{
        width:100%;
        height:15vw;
        background:#eee;
        position:fixed;
        bottom:50px;
        padding:0 3vw;
    }
    .cart .total>div>div:first-child{
        height:8vw;
        line-height:8vw;
    }
    .cart .total>div{
        display:flex;
        justify-content:space-between;
        align-items:center;
    }
    .cart .total>div .total-wrap{
        display:flex;
        justify-content:space-between;
        align-items:center;
    }
    .cart .total>div .total-wrap p{
        margin:0;
        padding:0;
        margin-top:2vw;
        color:#666;
    }
    .cart .total>div .total-wrap p:first-child span{
        font-size:1.1rem;
        font-weight:600;
        color:#666;
    }
    .cart .total>div .total-wrap p:first-child span:last-child{
        color: #ec5151;
    }
    /* 运费 */
    .cart .total>div .total-wrap p:last-child{
        font-size:0.8rem;
        margin-top:1vw;
        color:#999;
    }
    /* 结算按钮 */
    .cart .total>div .Settlement-button{
        background:#ec5151;
        margin-left:2vw;
        text-align:center;
        line-height:15vw;
        padding:0 2vw;
        color:#fff;
        font-weight:700;
    }
</style>