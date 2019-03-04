<template>
    <div class="drink">
        <!-- 1：购物车头部 -->
        <mt-header class="drink-header" title="自饮茶">
            <router-link to="/" slot="left">
                <mt-button icon="back"></mt-button>
            </router-link>
            <router-link to="" slot="right">
                <mt-button></mt-button>
            </router-link>
        </mt-header>
        <!-- 2:主体部分 -->
        <div class="content-wrap">
            <!-- 2.1:分类 -->
            <section class="classify-wrap">
                <div v-if="classify">
                    <router-link to="" v-for="item of classify" :key="item.id">
                        <img :src="item.img_url" alt="">
                    </router-link>
                </div>
            </section>
            <!-- 2:2 热门作品 -->
            <div class="hot-wrap" v-if="hot">
                <div class="title">热门推荐</div>
                <!-- 推荐内容 -->
                <div class="hot-box">
                    <div v-for="item of hot" :key="item.id">
                        <router-link :to="item.url">
                            <img :src="item.img_url" alt="">
                        </router-link>
                        <h3>{{item.title}}</h3>
                        <p>{{item.details}}</p>
                        <span>￥{{item.price.toFixed(2)}}</span>
                        <div>
                            <router-link :to="item.url">查看详情</router-link>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 3.3 为您推荐 -->
            <div class="rem-wrap">
                <div class="title">为您推荐</div>
                <div>
                    <div v-for="item of rem" :key="item.id">
                        <router-link :to="item.url">
                            <img :src="item.img_url" alt="">
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
        <!-- 底部 -->
    </div>
</template>

<script>
import Footer from '../../components/footer' 
export default {
    data(){
        return {
            classify:[],
            hot:[],
            rem:[]
        }
    },
    methods: {
        getData(){
            var url="http://127.0.0.1:3000/index/getData";
            this.axios.get(url).then(result=>{
                if(result.data.data){
                    this.classify=result.data.data.classify;
                    this.hot=result.data.data.hot;
                    this.rem=result.data.data.rem;
                }else{
                    console.log("查询失败");
                }
            })
        }
    },
    created() {
        this.getData();
    },

    components:{Footer}
}
</script>

<style scoped>
    /* 1:头部 */ 
    .drink-header{
        height:12vw;
        background:#b0352f;
        font-size:1.1rem;
        font-weight:700;
        position:fixed;
        top:0;
        z-index:999;
        width:100%;
    }
    .drink .content-wrap{
        padding-bottom:15vw;
        padding-top:11vw;
    }
    .drink .classify-wrap{
        padding:2vw 2.5vw;
        background:#fff;
    }
    .drink .classify-wrap>div{
        display:flex;
        justify-content:space-between;
        flex-wrap:wrap;
    }
    .drink .classify-wrap>div a{
        display:block;
        width:49%;
        overflow:hidden;
        border-radius:5px;
    }
    .drink .classify-wrap>div a img{
        width:100%;
    }
    /* 热门推荐标题 */
    .drink .title{
        color:#b54f4a;
        font-size:1rem;
        height:9.375vw;
        line-height:9.375vw;
        text-align:center;
        display:flex;
        justify-content:center;
        align-items: center;
        margin-top:3vw;
    }
    .drink .title:before{
        content:'';
        display:block;
        width:20vw;
        height:0.3vw;
        background:#b54f4a;
        margin-right:3vw;
    }
    .drink .title:after{
        content:'';
        display:block;
        width:20vw;
        height:0.3vw;
        background:#b54f4a;
        margin-left:3vw;
    }
    /* 2:2热门作品 */
    .drink .hot-wrap .hot-box{
        padding:2vw 2.5vw;
        background:#fff;
        display:flex;
        justify-content:space-between;
        flex-wrap:wrap;
    }
    .drink .hot-wrap .hot-box>div{
        width:49%;
        border-bottom:1px solid #ddd;
        text-align:center;
        margin-top:2vw;
    }
    .drink .hot-wrap .hot-box>div>a{
        display:block;
        width:100%;
    }
    .drink .hot-wrap .hot-box>div>a img{
        width:100%;
    }
    .drink .hot-wrap .hot-box>div h3{
        font-size:0.96rem;
        color:#333;
        height:18px;
        line-height:18px;
        letter-spacing:1px;
        overflow:hidden;
    }
    .drink .hot-wrap .hot-box>div p{
        font-size:0.9rem;
        color:#666;
        margin-bottom:2vw;
        overflow:hidden;
    }
    .drink .hot-wrap .hot-box>div span{
        color:#b54f4a;
        font-size:0.9rem;
    }
    .drink .hot-wrap .hot-box>div>div{
        padding-bottom:2vw;
    }
    .drink .hot-wrap .hot-box>div>div a{
        display:inline-block;
        width:70%;
        height:21px;
        line-height:21px;
        text-align:center;
        background: #cc9900;
        color: #fff;
        border-radius: 5px;
    }
    /* 为您推荐 */
    .drink .rem-wrap{
        
    }
    .drink .rem-wrap>div:last-child{
        background:#fff;
        padding:2.5vw;
        display:flex;
        justify-content:space-between;
        flex-wrap:wrap;
    }
    .drink .rem-wrap>div:last-child>div{
        width:100%;
        border-bottom:1px solid #ddd;
    }
    .drink .rem-wrap>div:last-child>div a{
        display:block;
        border-radius:15px;
        overflow:hidden;
        width:100%;
        margin-top:1.5vw;
    }
    .drink .rem-wrap>div a img{
        width:100%;
        border-radius:15px;
    }
</style>