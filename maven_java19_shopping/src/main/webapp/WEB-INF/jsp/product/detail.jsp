<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>商品明细</title>
		<link rel="shortcut icon" type="image/x-icon" href="${ pageContext.request.contextPath }/static/img/index/bitbug_favicon.ico" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/index/serch.css" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/bootstrap.css" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/detail/detail.css" />
		<script src="${ pageContext.request.contextPath }/static/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ pageContext.request.contextPath }/static/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ pageContext.request.contextPath }/static/js/detail.js" type="text/javascript" charset="utf-8"></script>
		<script>
			$(function () {
				$('#collinfo').click(function () {
				    if(${login_user==null}){
				        var bool=confirm('您还没有登录,是否前去登录');
				        if(bool){
				            window.location.href='${ pageContext.request.contextPath }/go/index'
						}
					}else{
                        $.ajax({
                            url:'${ pageContext.request.contextPath }/product/collshop',
                            data:{'proid':'${shopmap.proid}',
							'typeid':1},
                            dataType:'json',
                            async:true,
                            type:'get',
                            success:function (res) {
                                if(res==1){
                                    alert('收藏成功')
                                    $('#star').attr('class','glyphicon glyphicon-star');
                                }
                                if(res==0){
                                    alert('已收藏')
                                    $('#star').attr('class','glyphicon glyphicon-star');
                                }
                            },
                            error:function () {
                                alert('收藏失败')
                            }
                        })
					}

                })
				$('#addorder').click(function () {
					alert('加入订单')
                    if(${login_user==null}){
                        var bool=confirm('您还没有登录,是否前去登录');
                        if(bool){
                            window.location.href='${ pageContext.request.contextPath }/go/index'
                        }
                    }else{
                        if($('#addorder').val()=='加入订单'){
                            $.ajax({
                                url:'${ pageContext.request.contextPath }/product/orderitem',
                                data:{'proid':'${shopmap.proid}',
                                    'storeid':'${shopmap.storeid}',
                                    'counts':$('#counts').val()
                                },
                                dataType:'json',
                                async:true,
                                type:'get',
                                success:function (res) {
                                        $('#addorder').val('移出购物车')
										$('#storeid').val(res);
                                },
                                error:function () {
                                    alert('加入失败')
                                }
                            })
						}else {
                            $.ajax({
                                url:'${ pageContext.request.contextPath }/product/moveitem',
                                data:{'proid':'${shopmap.proid}',
                                    'orderid':$('#storeid').val(),
                                    'storeid':'${shopmap.storeid}',
                                    'counts':$('#counts').val()
                                },
                                dataType:'json',
                                async:true,
                                type:'get',
                                success:function (res) {
                                    if(res==1){
                                        $('#addorder').val('加入购物车')
                                    }

                                },
                                error:function () {
                                    alert('移出失败')
                                }
                            })
						}

                    }
                })
                $('#gopay').click(function () {
                    if(${login_user==null}){
                        var bool=confirm('您还没有登录,是否前去登录');
                        if(bool){
                            window.location.href='${ pageContext.request.contextPath }/go/index'
                        }
                    }else{
                            window.location.href='${ pageContext.request.contextPath }/go/set/1';
                    }

                })
            })
		</script>
	</head>

	<body>
		<!--首页头部-->
		<nav class="navbar navbar-default navbar-inverse navbar-fixed-top">
			<div class="container">
				<ul class="nav navbar-nav">
					<li>
						<a href="${ pageContext.request.contextPath }/go/index">商城首页</a>
					</li>
					<c:if test="${login_user == null }">
						<li>
							<a href="#" data-toggle="modal" data-target="#myModal1">登录</a>
						</li>
						<li>
							<a href="#" data-toggle="modal" data-target="#myModal2">注册</a>
						</li>
					</c:if>
					<c:if test="${login_user != null }">
						<li>
							<a href="#">欢迎您  : ${ login_user.username }</a>
						</li>
					</c:if>
					<!--搜索框部分-->

						<form action="#" method="get" class="navbar-left navbar-form">
							<input type="text" class="form-control" style="width: 300px;" placeholder="请输入要搜索的内容${ pageContext.request.contextPath }/res" />
							<button class="btn btn-primary">搜索</button>
						</form>

					<li>
						<a href="${ pageContext.request.contextPath }/go/set/3">个人中心</a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/go/set/2">收藏夹</a>
					</li>
				</ul>
			</div>
		</nav>

		<hr class="divider" />
		<!--商品明细-->
		<div class="container" style="padding-top: 50px">
			<div class="row">
				<!--轮播图片-->
				<div class="col-lg-5">
					<div id="myCarousel" class="carousel slide">
						<!-- 轮播（Carousel）指标 -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<%--<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
							<li data-target="#myCarousel" data-slide-to="3"></li>--%>
						</ol>
						<!-- 轮播（Carousel）项目 -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="${ pageContext.request.contextPath }/static/img/products/${shopmap.cover}" alt="First slide">
								<p class="pull-left"><span id="star" class="glyphicon glyphicon-star-empty "></span><span ></span><span id="collinfo" style="cursor: pointer">收藏商品</span></p>
								<span class="glyphicon glyphicon-zoom-in pull-right" title="放大图片" data-toggle="modal" data-target="#big"></span>
							</div>

						<%--	<div class="item">
								<img src="${ pageContext.request.contextPath }/static/img/index/lunbo/2.jpg" alt="Second slide">
							</div>
							<div class="item">
								<img src="${ pageContext.request.contextPath }/static/img/index/lunbo/3.jpg" alt="Third slide">
							</div>
							<div class="item">
								<img src="${ pageContext.request.contextPath }/static/img/index/lunbo/4.jpg" alt="Third slide">
							</div>--%>
						</div>
						<!-- 轮播（Carousel）导航 -->
						<%--<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>--%>
					</div>
				</div>
				<!--商品信息-->
				<div class="col-lg-7">
					<h4>${shopmap.proname}</h4>
					<p class="alert alert-info">价格<span class="price">¥ <span>${shopmap.newprice}</span></span> 原价 : <strong class="old_price">${shopmap.oldprice} </strong></p>
					<p class="text-primary">运费 : <span>${shopmap.freight}</span>元  ; 库存 : <span >${shopmap.stock}</span>   <span class="pull-right">销量: ${shopmap.prosales}</span></p>
					<hr />
					<!--<p class="text-primary text-center col-lg-6">累计评价</p>
					<p class="text-primary text-center col-lg-6">送积分</p>-->
					<!--规格：不同类型商品，不同规格-->
					<div>
						<p class="text-info">
							尺码 : <span class="size">S</span> <span class="size">M</span> <span class="size">XL</span> <span class="size">XXL</span>
						</p>
						<br />
						<p class="text-info">
							颜色分类 : <span class="color">正红</span> <span class="color">黑</span> <span class="color">灰白</span> <span class="color">卡其</span>
						</p>
						<br />
						<p class="text-info">
							数量 : <input id="counts" type="text" style="width: 30px;" value="1"/>
						</p>
						<br />
						<p>
							<%--<button  class="btn btn-warning" id="addorder">加入订单</button>--%>
								<input type="hidden" id="storeid" value="">
								<input type="button" name="" class="btn btn-warning" id="addorder" value="加入订单">
								<input type="button" name="" class="btn bg-success" id="gopay" value="去购物车">
								<a href="${ pageContext.request.contextPath }/go/store/${shopmap.storeid}" class="btn btn-danger">进入店铺</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<!--商品详情-->
		<div class="container">
			<div class="panel panel-warning">
				<div class="panel-heading">
					品牌名称 : <span>Java19</span>
				</div>
				<div class="panel-body">
					<p class="text-primary">产品参数  : </p>
					<!--明细-->
					<div>
						<p class="col-lg-4">品牌: 织乎</p>
						<p class="col-lg-4">图案: 纯色</p>
						<p class="col-lg-4">领子: 高领</p>
						<p class="col-lg-4">上市年份/季节: 2017年秋季</p>
						<p class="col-lg-4">厚薄: 常规</p>
						<p class="col-lg-4">流行元素/工艺: 螺纹</p>
						<p class="col-lg-4">适用年龄: 25-29周岁</p>
						<p class="col-lg-4">风格: 通勤</p>
						<p class="col-lg-4">衣门襟: 套头</p>
						<p class="col-lg-4">组合形式: 单件</p>
						<p class="col-lg-4">材质成分: 山羊绒(羊绒)100%</p>
						<p class="col-lg-4">流行元素/工艺: 螺纹</p>
						<p class="col-lg-4">尺码: S M L XL XXL</p>
						<p class="col-lg-4">通勤: 简约</p>
						<p class="col-lg-4">颜色分类: 驼色 雾蓝色 车厘子红 藏青色 </p>
						<p class="col-lg-4">货号: 232172</p>
						<p class="col-lg-4">袖长: 长袖款式: 套头</p>
						<p class="col-lg-4">服装版型: 修身</p>
					</div>
					<!--明细图片展示-->
					<%--<div class="text-center">
						<img src="${ pageContext.request.contextPath }/static/img/index/products/detail/prodetail1.jpg" alt="" />
					</div>--%>
				</div>
			</div>
		</div>
		<!--弹出框-->
		<div class="modal fade" id="big" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document" style="width: 830px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 style="color: red;" class="modal-title text-center" id="myModalLabel">${shopmap.proname}</h4>
					</div>
					<div class="modal-body">
						<img src="${ pageContext.request.contextPath }/static/img/products/${shopmap.cover}" style="background: repeat-x;width: 800px"/>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
	</body>
</html>