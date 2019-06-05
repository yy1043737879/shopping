<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理店铺</title>
		<link rel="shortcut icon" type="image/x-icon" href="${ pageContext.request.contextPath }/static/img/index/bitbug_favicon.ico" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/bootstrap.css" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/index/serch.css" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/store/manage.css" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/store/build.css" />
		<script src="${ pageContext.request.contextPath }/static/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ pageContext.request.contextPath }/static/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
	<script>
		/*$(function(){
		    $('.grounding').click(function () {
				$.ajax({
					url:'${ pageContext.request.contextPath }/'
				})
            })
		})*/
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
					<li>
						<!--<a href="#" data-toggle="modal" data-target="#myModal">登录/注册</a>-->
						<a href="#">欢迎您  :${login_user.username}</a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/go/set/3">个人中心</a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/go/set/2">收藏夹</a>
					</li>
				</ul>
			</div>
		</nav>
		<!--店铺封面及描述-->
		<div class="container dpxx">
			<div class="thumbnail col-lg-6">
				<img src="${ pageContext.request.contextPath }/static/img/store_cover/${storeinfo.storecover}" alt="" />
				<div class="caption">
					<h3>${storeinfo.storename}</h3>
					<p>${storeinfo.info}</p>
				</div>
			</div>
			<div class="col-lg-6">
				<!--修改店铺信息-->
				<form action="#" method="post">
					<p class="text-primary">店铺名称</p>
					<input type="text" name="store_name" class="form-control" value="${storeinfo.storename}"/>
					<hr />
					<p class="text-primary">店铺简介</p>
					<textarea name="store_description" class="form-control">${storeinfo.info}</textarea>
					<hr />
					<p class="text-primary">店铺封面</p>
					<input type="file" name="store_img"/>
					<br />
					<input type="submit" class="btn btn-success" value="确认修改"/>
				</form>
			</div>
		</div>
		<hr />
		<!--商品列表信息-->
		<div class="container">
			<h3 class="text-info">商品列表</h3>

			<c:if test="${shopkeeper!=null}">
				<hr />
				<a href="${ pageContext.request.contextPath }/go/proreg/${storeinfo.id}" class="btn btn-block btn-warning">新增商品</a>
				<br />
				<c:forEach items="${productlist}" var="list">
					<div class="thumbnail col-lg-3">
						<c:if test="${list.status=='nosale'}">
							<img style="height: 40px;width: 40px;position: absolute" src="${ pageContext.request.contextPath }/static/img/index/products/index/nosale.jpg" alt="">
						</c:if>
						<c:if test="${list.status!='nosale'}">
							<img style="height: 40px;width: 40px;position: absolute" src="${ pageContext.request.contextPath }/static/img/index/products/index/salling.jpg" alt="">
						</c:if>
						<a href="${ pageContext.request.contextPath }/product/detail/${list.proid}"><img src="${ pageContext.request.contextPath }/static/img/products/${list.cover}" alt="..."></a>
						<!--商品-->
						<div class="caption">
							<a href="${ pageContext.request.contextPath }/product/detail/${list.proid}">
								<h3>${list.proname}</h3>
								<p>￥ <span>${list.newprice}</span></p>
							</a>
							<p class="product_op">
								<a href="#" class="text-danger">删除</a>
								<c:if test="${list.status=='nosale'}">
									<a href="${ pageContext.request.contextPath }/store/grounding/${list.proid}/${list.storeid}" >上架</a>
								</c:if>
								<c:if test="${list.status!='nosale'}">
									<a href="${ pageContext.request.contextPath }/store/grounding/${list.proid}/${list.storeid}">下架</a>
								</c:if>

							</p>
						</div>
					</div>
				</c:forEach>
			</c:if>


		</div>
	</body>
</html>
