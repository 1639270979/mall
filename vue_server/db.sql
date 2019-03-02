
SET NAMES UTF8;
#删除数据库
DROP DATABASE IF EXISTS mall;
#创建数据库
CREATE DATABASE mall CHARSET UTF8;
#使用数据库
use mall;

#创建用户信息表
CREATE TABLE mall_user(
  id SMALLINT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(64),
  phone VARCHAR(64),
  upwd VARCHAR(64),
  email VARCHAR(128)
);
INSERT INTO mall_user VALUES
(null,'tom','18837190243','123456','tom@qq.com'),
(null,'jerry','15222222222','123456','jerry@qq.com');
#创建购物车列表数据
CREATE TABLE mall_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  url_img VARCHAR(255),
  details VARCHAR(255),
  price DECIMAL(10,2),
  num SMALLINT
);
INSERT INTO mall_cart VALUES
(null,'1','http://127.0.0.1:3000/img/cart/0093503_0.jpeg','简盒装 武夷山原产地 金骏眉口粮茶 1號250g','99.00',1),
(null,'1','http://127.0.0.1:3000/img/cart/0052219_1.jpeg','雨前太平猴魁125g-鲜爽甘甜','99.00',1);

#创建首页类型表
CREATE TABLE mall_style(
  sid SMALLINT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64)
);
INSERT INTO mall_style VALUES
(1,'轮播图'),
(2,'首页导航'),
(3,'推荐'),
(4,'爆款'),
(5,'拼团'),
(6,'精选女装'),
(7,'广告轮播'),
(8,'潮完数码'),
(9,'猜你喜欢');


#1创建轮播图数据
CREATE TABLE mall_slide(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title  VARCHAR(255),
  img_url  VARCHAR(255)
);
INSERT INTO mall_slide VALUES(null,'轮播图','http://127.0.0.1:3000/img/slide/0116092_0.jpeg');
INSERT INTO mall_slide VALUES(null,'轮播图','http://127.0.0.1:3000/img/slide/0012578_1.jpeg');
INSERT INTO mall_slide VALUES(null,'轮播图','http://127.0.0.1:3000/img/slide/0116318_2.jpeg');
INSERT INTO mall_slide VALUES(null,'轮播图','http://127.0.0.1:3000/img/slide/0017261_3.jpeg');
INSERT INTO mall_slide VALUES(null,'轮播图','http://127.0.0.1:3000/img/slide/0011938_4.jpeg');

#2 创建导航列表数据
CREATE TABLE mall_nav(
  nid SMALLINT PRIMARY KEY AUTO_INCREMENT,
  title  VARCHAR(32),
  url VARCHAR(128),
  img_url  VARCHAR(128)
);
INSERT INTO mall_nav VALUES
(NULL,'自饮茶','/drink_tea','http://127.0.0.1:3000/img/nav/63637438762004282635772061.png'),
(NULL,'茶具','/tool_tea','http://127.0.0.1:3000/img/nav/63637438761363644124488432.png'),
(NULL,'茶礼盒','/gift','http://127.0.0.1:3000/img/nav/63637438761644901642352243.png'),
(NULL,'领福利','/welfare','http://127.0.0.1:3000/img/nav/63637438761473036529496104.png'),
(NULL,'官方认证','/official','http://127.0.0.1:3000/img/nav/63660853243277066527709395.png');

#3:创建拼团数据库
CREATE TABLE mall_group(
  aid SMALLINT PRIMARY KEY AUTO_INCREMENT,
  sid INT, 
  title  VARCHAR(32),
  del DECIMAL(10,2),
  price DECIMAL(10,2),
  surplus VARCHAR(32),
  img VARCHAR(128)
);
INSERT INTO mall_group VALUES
(NULL,'5','黄山毛峰2号100g','138','49','50%','http://127.0.0.1:3000/img/sale/0096964_1.jpeg');

#4：创建商品数据表
CREATE TABLE mall_recommened(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  sid INT,
  title VARCHAR(128),
  price DECIMAL(10,2),
  url_img VARCHAR(128)
);
INSERT INTO mall_recommened VALUES
(null,'3','【新茶上市】2018春茶 明前龙井·飞花系列50g瓷罐装','99','http://127.0.0.1:3000/img/recommend/0103359_0.jpeg'),
(null,'3','云南滇红 凤庆高海拔古树红茶 极佳耐泡度 铁罐400g装','128','http://127.0.0.1:3000/img/recommend/0014005_1.jpeg'),
(null,'3','福鼎白毫银针 明前新茶 自饮铁罐装80g','128','http://127.0.0.1:3000/img/recommend/0098677_2.jpeg'),
(null,'3','第十四届春茶评比大赛-优质奖奇兰 96g','299','http://127.0.0.1:3000/img/recommend/0105756_3.jpeg');


CREATE TABLE mall_fashion(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  sid INT,
  title VARCHAR(128),
  details VARCHAR(128),
  price DECIMAL(10,2),
  url_img VARCHAR(128)
);
INSERT INTO mall_fashion VALUES
(null,'4','龙井1號铁罐250g','鲜爽甘醇 口粮首选','68.00','http://127.0.0.1:3000/img/fashion/0116095_0.jpeg'),
(null,'4','雨前太平猴魁125g','黄山原产 特种优茶','99.00','http://127.0.0.1:3000/img/fashion/0116097_1.jpeg'),
(null,'4','铁观音2號250g','核心产区滋味正 ','128.00','http://127.0.0.1:3000/img/fashion/0116106_2.jpeg'),
(null,'4','茉莉花茶200g','三窨一提花香雅','68.00','http://127.0.0.1:3000/img/fashion/0116100_3.jpeg'),
(null,'4','茶师亲制肉桂96g','岩茶老茶客必尝款','99.00','http://127.0.0.1:3000/img/fashion/0116104_4.jpeg'),
(null,'4','滇红蜜香金螺250g','它的醇甜，你喝过吗？','168.00','http://127.0.0.1:3000/img/fashion/0116101_5.jpeg'),
(null,'4','紫砂壶仙果壶310cc','一把好壶 享半世茗香','658.00','http://127.0.0.1:3000/img/fashion/0116103_6.jpeg'),
(null,'4','建盏银丝串葫芦盏','宋代茶具美学极致之作','128.00','http://127.0.0.1:3000/img/fashion/0116102_7.jpeg');

#创建自饮茶分类表
CREATE TABLE mall_classify(
  id SMALLINT PRIMARY KEY AUTO_INCREMENT,
  url VARCHAR(128),
  img_url VARCHAR(128)
);
INSERT INTO mall_classify VALUES
(null,'','http://127.0.0.1:3000/img/tea/classify/dhp.jpg'),
(null,'','http://127.0.0.1:3000/img/tea/classify/tgy.jpg'),
(null,'','http://127.0.0.1:3000/img/tea/classify/jjm.jpg'),
(null,'','http://127.0.0.1:3000/img/tea/classify/bc.jpg'),
(null,'','http://127.0.0.1:3000/img/tea/classify/lj.jpg'),
(null,'','http://127.0.0.1:3000/img/tea/classify/ml.jpg'),
(null,'','http://127.0.0.1:3000/img/tea/classify/pe.jpg'),
(null,'','http://127.0.0.1:3000/img/tea/classify/sx.jpg');

#创建热门推荐表
CREATE TABLE mall_hot(
  id SMALLINT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(54),
  details VARCHAR(54),
  price DECIMAL(10,2),
  url VARCHAR(128),
  img_url VARCHAR(128)
);
INSERT INTO mall_hot VALUES
(null,'铁观音1號500g','工作茶优选','128.00','/detail?tid=1','http://127.0.0.1:3000/img/tea/hot/0013244_0.jpeg'),
(null,'滇红铁罐装300g','靠谱经典','88.00','/detail?tid=2','http://127.0.0.1:3000/img/tea/hot/0015669_1.jpeg'),
(null,'简盒装 正山小种 1號250g（含提袋）','红茶鼻祖的香浓','88.00','/detail?tid=3','http://127.0.0.1:3000/img/tea/hot/0093509_2.jpeg'),
(null,'简盒装 武夷山原产地 金骏眉口粮茶 1號250g','耐泡度不错  工作茶首选','99.00','/detail?tid=4','http://127.0.0.1:3000/img/tea/hot/0093503_3.jpeg'),
(null,'PVC盒装-漳平水仙-1號','手工制作如兰气质的天然花香','99.00','/detail?tid=5','http://127.0.0.1:3000/img/tea/hot/0017170_4.jpeg'),
(null,'金骏眉3號 150g','全芽制作 花香浓郁','128.00','/detail?tid=6','http://127.0.0.1:3000/img/tea/hot/0012966_5.jpeg'),
(null,'大红袍1號256g ','纯正岩香','99.00','/detail?tid=7','http://127.0.0.1:3000/img/tea/hot/0012932_6.jpeg');

#创建自饮茶推荐
CREATE TABLE mall_rem(
  id SMALLINT PRIMARY KEY AUTO_INCREMENT,
  url VARCHAR(128),
  img_url VARCHAR(128)
);
INSERT INTO mall_rem VALUES
(null,'','http://127.0.0.1:3000/img/tea/rem/6361154322177064387242084.jpg'),
(null,'','http://127.0.0.1:3000/img/tea/rem/6361154518392991156086408.jpg'),
(null,'','http://127.0.0.1:3000/img/tea/rem/6361558084183983492743312.jpg');

#创建详情表
CREATE TABLE mall_teas(
  tid SMALLINT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128),
  details VARCHAR(128),
  price DECIMAL(10,2),
  coin SMALLINT           #茶币
);
INSERT INTO mall_teas VALUES
(null,'组合装 浓香 铁观音1號500g（含提袋）消青工艺 浓香','大分量 工作茶首选','128.00','32'),
(null,'滇红-靠谱经典300g-铁罐装','大分量 工作茶首选','88','22');

#创建详情表轮播图片
CREATE TABLE mall_teas_pic(
  id SMALLINT PRIMARY KEY AUTO_INCREMENT,
  tid SMALLINT,
  img_url VARCHAR(128)
);
INSERT INTO mall_teas_pic VALUES
(null,1,'http://127.0.0.1:3000/img/tea/slide/0012982_0.jpeg'),
(null,1,'http://127.0.0.1:3000/img/tea/slide/0012983_0.jpeg'),
(null,1,'http://127.0.0.1:3000/img/tea/slide/0012984_0.jpeg'),
(null,1,'http://127.0.0.1:3000/img/tea/slide/0012985_0.jpeg'),
(null,1,'http://127.0.0.1:3000/img/tea/slide/0012991_0.jpeg'),
(null,1,'http://127.0.0.1:3000/img/tea/slide/0013244_0.jpeg'),
(null,2,'http://127.0.0.1:3000/img/tea/slide/0015669_1.jpeg'),
(null,2,'http://127.0.0.1:3000/img/tea/slide/0015671_1.jpeg'),
(null,2,'http://127.0.0.1:3000/img/tea/slide/0015670_1.jpeg'),
(null,2,'http://127.0.0.1:3000/img/tea/slide/0015672_1.jpeg'),
(null,2,'http://127.0.0.1:3000/img/tea/slide/0015673_1.jpeg');

#创建详情表详情图片
CREATE TABLE mall_details_pic(
  id SMALLINT PRIMARY KEY AUTO_INCREMENT,
  tid SMALLINT,
  img_url VARCHAR(128)
);
INSERT INTO mall_details_pic VALUES
(null,1,'http://127.0.0.1:3000/img/tea/details/6363743808390388217816203.jpg'),
(null,1,'http://127.0.0.1:3000/img/tea/details/6363743808248198876815374.jpg'),
(null,1,'http://127.0.0.1:3000/img/tea/details/6363743808310699782172982.jpg'),
(null,1,'http://127.0.0.1:3000/img/tea/details/6363743808423199874616676.jpg'),
(null,1,'http://127.0.0.1:3000/img/tea/details/6363743808332574417472688.jpg'),
(null,2,'http://127.0.0.1:3000/img/tea/details/63644526838023153359008751.jpg'),
(null,2,'http://127.0.0.1:3000/img/tea/details/63644526838570035280988691.jpg'),
(null,2,'http://127.0.0.1:3000/img/tea/details/63644526837476284180010541.jpg'),
(null,2,'http://127.0.0.1:3000/img/tea/details/63644526838304415041144951.jpg'),
(null,2,'http://127.0.0.1:3000/img/tea/details/63644526840304433827701501.jpg');