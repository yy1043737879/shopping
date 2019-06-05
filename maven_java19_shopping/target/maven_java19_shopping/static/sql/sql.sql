-- 建表sql
-- 用户表
create table userinfo(
id int(11) PRIMARY KEY not null auto_increment COMMENT '主键',
username varchar(200) default '' not null COMMENT '用户名，登录名',
password varchar(500) default '' not null COMMENT '密码',
authority int(1) default 0 not null COMMENT '权限,0-普通用户,1-管理员',
regtime datetime COMMENT '注册时间'
)

-- 类别表
CREATE table category(
id int(11) PRIMARY KEY not null auto_increment COMMENT '主键,类别id',
parentid int(11) default 0 not null COMMENT 'parentid，从属类别id',
cname varchar(500) default '' not null COMMENT '类别名'
)auto_increment = 100

-- 商品表
create table product(
id int(11) PRIMARY KEY not null auto_increment COMMENT '主键,商品id',
proname varchar(500) default '' not null COMMENT '商品名称',
cateid int(11) default 0 not null COMMENT '类别id，对应category表的id列',
storeid int(11) default 0 not null COMMENT '商铺id，对应store表的id列',
status varchar(20) default 'nosale' COMMENT '商品状态,nosale-未上架,salling-上架',
cover varchar(1000) default '' COMMENT '商品封面'
)auto_increment = 1000

-- 商品规格表
create table prostandard(
id int(11) PRIMARY KEY not null auto_increment COMMENT '主键',
proid int(11) default 0 not null COMMENT '商品id',
standard varchar(500) default '' COMMENT '规格',
oldprice DECIMAL(10,2) COMMENT '原价',
newprice DECIMAL(10,2) COMMENT '现价',
stock int(11) default 0 not null COMMENT '库存'
)auto_increment = 500

-- 商品属性值表（产品+属性名）
create table propertyvalue(
id int(11) PRIMARY KEY not null auto_increment COMMENT '主键',
proid int(11) default 0 not null COMMENT '商品id',
valueid int(11) default 0 not null COMMENT '值id，对应property表的id',
provalue varchar(500) default '' COMMENT '属性值'
) auto_increment = 900

-- 类别属性表（类别+属性名）
create table property(
id int(11) PRIMARY KEY not null auto_increment COMMENT '主键',
cateid int(11) default 0 not null COMMENT '类别id',
proname varchar(500) default '' COMMENT '属性名'
)
-- 类别属性表样例信息
insert into property (cateid,proname) values ()

-- 店铺表
CREATE TABLE store(
id int(11) PRIMARY KEY not null auto_increment COMMENT '主键,店铺id',
storename varchar(500) default '' not null COMMENT '店铺名称',
userid int(11) default 0 not null COMMENT '店主id',
info varchar(500) default '' not null COMMENT '店铺简介',
storecover varchar(1000) default '' COMMENT '店铺封面',
buildtime datetime COMMENT '创建时间',
status varchar(50) default 'close' not null COMMENT '店铺状态，close-关店，open-营业'
)

-- 收藏信息
CREATE TABLE collectioninfo(
id int(11) PRIMARY KEY not null auto_increment COMMENT '主键,店铺id',
userid int(11) default 0 not null COMMENT '收藏者id',
typeid int(11) default 0 not null COMMENT '收藏类型id,0代表店铺，1代表商品',
sidorpid int(11) default 0 not null COMMENT '收藏的店铺id或商品id'
)

-- 订单表
CREATE table orderinfo(
id int(11) PRIMARY KEY not null auto_increment COMMENT '主键,订单id',
ordercode varchar(200) default '' not null COMMENT '订单号',
username varchar(200) default '' not null COMMENT '收件人姓名',
address varchar(200) default '' not null COMMENT '收件人地址',
post varchar(200) default '' not null COMMENT '邮编',
mobile varchar(200) default '' not null COMMENT '电话',
creatdate datetime COMMENT '创建时间',
paydate datetime COMMENT '付款时间',
delivrytime datetime COMMENT '发货时间',
confirmtime datetime COMMENT '收货时间',
status varchar(50) default 'nopay' not null COMMENT '订单状态,nopay-未付款，piad-已付款,done-确认收货时间'
)

-- 订单项表
CREATE table orderitem(
id int(11) PRIMARY KEY not null auto_increment COMMENT '主键',
orderid int(11) default 0 not null COMMENT '订单id',
standarid int(11) default 0 not null COMMENT '商品规格id',
counts int(11) default 0 not null COMMENT '商品数量',
storeid int(11) default 0 not null COMMENT '店铺id'
)

-- 地址信息表
CREATE table addressinfo(
id int(11) PRIMARY KEY not null auto_increment COMMENT '主键',
userid int(11) default 0 not null COMMENT '用户id',
address varchar(1000) default '' not null COMMENT '地址',
post varchar(200) default '' not null COMMENT '邮编',
mobile varchar(200) default '' not null COMMENT '电话',
defaultadd bit default 0 not null COMMENT '是否是默认地址，0代表不是，1代表是'
)
select *
		from category
-- 商品图片表（detail中的表）
-- 评论表
-- ==================
-- 类别表样例数据
INSERT INTO `category` VALUES ('100', '0', '女装/内衣');
INSERT INTO `category` VALUES ('101', '0', '男装 /运动户外');
INSERT INTO `category` VALUES ('102', '0', '女鞋 /男鞋/箱包');
INSERT INTO `category` VALUES ('103', '0', '美妆 /个人护理');
INSERT INTO `category` VALUES ('104', '0', '腕表 /眼镜 /珠宝饰品');
INSERT INTO `category` VALUES ('105', '0', '手机 /数码 /电脑办公');
INSERT INTO `category` VALUES ('106', '0', '母婴玩具');
INSERT INTO `category` VALUES ('107', '0', '零食 /茶酒 /进口食品');
INSERT INTO `category` VALUES ('108', '0', '生鲜水果');
INSERT INTO `category` VALUES ('109', '0', '大家电 /生活电器');
INSERT INTO `category` VALUES ('110', '0', '家具建材');
INSERT INTO `category` VALUES ('111', '0', '汽车 /配件 /用品');
INSERT INTO `category` VALUES ('112', '0', '家纺 /家饰 /鲜花');
INSERT INTO `category` VALUES ('113', '0', '医药保健');
INSERT INTO `category` VALUES ('114', '0', '厨具 /收纳 /宠物');
INSERT INTO `category` VALUES ('115', '0', '图书音像');
INSERT INTO `category` VALUES ('116', '100', '长裙');
INSERT INTO `category` VALUES ('117', '100', '短群');
INSERT INTO `category` VALUES ('118', '100', '内衣');
INSERT INTO `category` VALUES ('119', '100', '热裤');
INSERT INTO `category` VALUES ('120', '100', '连衣裙');
INSERT INTO `category` VALUES ('121', '101', 'T恤');
INSERT INTO `category` VALUES ('122', '101', '短袖、短裤');
INSERT INTO `category` VALUES ('123', '101', '内裤');
INSERT INTO `category` VALUES ('124', '101', '夹克');
INSERT INTO `category` VALUES ('125', '102', '皮鞋');
INSERT INTO `category` VALUES ('126', '102', '运动鞋');
INSERT INTO `category` VALUES ('127', '102', '手提箱');
INSERT INTO `category` VALUES ('128', '102', '行李箱');
INSERT INTO `category` VALUES ('129', '103', '眼影');
INSERT INTO `category` VALUES ('130', '103', '指甲油');
INSERT INTO `category` VALUES ('131', '103', '粉底');
INSERT INTO `category` VALUES ('132', '103', '口红');
INSERT INTO `category` VALUES ('133', '104', '手表');
INSERT INTO `category` VALUES ('134', '104', '戒指');
INSERT INTO `category` VALUES ('135', '104', '防蓝光眼镜');
INSERT INTO `category` VALUES ('136', '104', '项链');
INSERT INTO `category` VALUES ('137', '104', '耳环');
INSERT INTO `category` VALUES ('138', '105', '智能手机');
INSERT INTO `category` VALUES ('139', '105', '笔记本电脑');
INSERT INTO `category` VALUES ('140', '106', '毛绒玩具');
INSERT INTO `category` VALUES ('141', '107', '白酒');
INSERT INTO `category` VALUES ('142', '107', '红茶');
INSERT INTO `category` VALUES ('143', '108', '苹果');
INSERT INTO `category` VALUES ('144', '108', '油菜');
INSERT INTO `category` VALUES ('145', '109', '彩电');
INSERT INTO `category` VALUES ('146', '109', '空调');
INSERT INTO `category` VALUES ('147', '109', '洗衣机');
INSERT INTO `category` VALUES ('148', '110', '沙发');
INSERT INTO `category` VALUES ('149', '110', '电视柜');
INSERT INTO `category` VALUES ('150', '110', '餐桌');
INSERT INTO `category` VALUES ('151', '111', '车垫');
INSERT INTO `category` VALUES ('152', '112', '窗帘');
INSERT INTO `category` VALUES ('153', '112', '桌布');
INSERT INTO `category` VALUES ('154', '112', '沙发垫');
INSERT INTO `category` VALUES ('155', '112', '鲜花摆件');
INSERT INTO `category` VALUES ('156', '113', '保健品');
INSERT INTO `category` VALUES ('157', '113', '营养品');
INSERT INTO `category` VALUES ('158', '113', '眼药水');
INSERT INTO `category` VALUES ('159', '114', '收纳箱');
INSERT INTO `category` VALUES ('160', '114', '电饭锅');
INSERT INTO `category` VALUES ('161', '114', '刀具');
INSERT INTO `category` VALUES ('162', '115', '少儿读物');
INSERT INTO `category` VALUES ('163', '115', '名著经典');
INSERT INTO `category` VALUES ('164', '115', '明星专辑');
-- ==================






