<template>
    <div class="search">
        <!-- 1：头部搜索框 -->
        <header class="search-header">
            <form action="" id="search-form">
                <div>
                    <router-link to="/" class="back-index">
                        <span class="element-icons el-icon-jiantou6"></span>
                    </router-link>
                    <div>
                        <span class="mui-icon mui-icon-search"></span>
                        <input type="text" placeholder="商品/店铺搜索">
                    </div> 
                    <a href="javascript:;" type="button" onclick="document.getElementById('search-form').submit()">搜索</a>
                </div>
            </form>
        </header>
        <!-- 2:搜索主体 -->
        <div class="search-content">
            <!-- 2:1热门搜索 -->
            <div class="hot-search">
                <p>热门搜索</p>
                <div>
                    <a href="javascript:;">红茶</a>
                    <a href="javascript:;">绿茶</a>
                    <a href="javascript:;">乌龙</a>
                    <a href="javascript:;">白茶</a>
                </div>
            </div>
            <!-- 2:2最近搜索 -->
            <div class="recent-search">
                <p>最近搜索</p>
                <div>
                    暂无记录
                </div>
            </div>
        </div>
        <!-- 3:关闭搜索 -->
        <div class="close-search">
            <router-link to="/">点击关闭搜索</router-link>
        </div>
    </div>
</template>

<script>
export default {
    
}
</script>

<style>
    .search{
        width:100vw;
        height:100vh;
        background:#fff;
    }
    /* 1：头部 */
    .search .search-header{
        height:14vw;
        letter-spacing:3px;
        font-size:1.15rem;
        padding:0 4vw;
        border-bottom:1px solid #ddd;
    }
    .search .search-header form>div {
        font-size: 1rem;
        display:flex;
        justify-content:space-between;
        align-items:center;
        line-height:14vw;
    }
    .search .search-header form>div a{
        color: #1a232b;
    }
    .search .search-header form>div>div{
        height:10vw;
        width:72vw;
        line-height:8vw;
        background:#eee;
    }
    /* 搜索框 */
    .search .search-header form>div>div input{
        margin:0;
        padding:0;
        border:0;
        width:85%;
        height:10vw;
        background:#eee;
    }
    /* placeholder的颜色 */
    .search .search-header form>div>div input::-webkit-input-placeholder {
         /* placeholder颜色  */
         color: #999;
         /* placeholder字体大小  */
         font-size:0.9rem;
         letter-spacing:2px;
     }
    .search .search-header form>div>div input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
        color:#999;
    }
    .search .search-header form>div>div input::-moz-placeholder { /* Mozilla Firefox 19+ */
        color:#999;
    }
    .search .search-header form>div>div input:-ms-input-placeholder { /* Internet Explorer 10-11 */
        color:#999;
    }
    /* 搜索图标 */
    .search .search-header form>div>div span{
        display:inline-block;
        transform:scale(0.85);
        margin-left:2vw;
    }
    /* 2:搜索主体 */
    .search .search-content{
        margin-top:7vw;
        padding:0 4vw;
    }
    .search .search-content p{
        font-size:1rem;
        color:#999;
        height:13vw;
        line-height:13vw;
        border-bottom:1px solid #ddd;
    }
    .search .search-content .hot-search>div{
        display:flex;
        justify-content:space-between;
        align-items:center;
        flex-wrap:wrap;
        margin-bottom:4vw;
    }
    .search .search-content a{
        display:inline-block;
        width:29vw;
        height:10.5vw;
        font-size:0.9rem;
        text-align:center;
        line-height:11vw;
        color: #1b242c;
        background: #f2f2f2;
        margin:1.5vw 0;
    }
    .search .search-content .recent-search>div{
        text-align:center;
        margin-top:10vw;
        font-size:0.9rem;
        color:#999;
    }
    /* 3:关闭搜索 */
    .search .close-search{
        width:100%;
        position:fixed;
        bottom:10vw;
        text-align:center;
    }
    .search .close-search a{
        color:#999;
        font-size:0.9rem;
    }
</style>