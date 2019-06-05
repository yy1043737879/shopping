<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>店铺首页</title>
		<link rel="shortcut icon" type="image/x-icon" href="${ pageContext.request.contextPath }/static/img/index/bitbug_favicon.ico" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/bootstrap.css" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/index/serch.css" />
		<script src="${ pageContext.request.contextPath }/static/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ pageContext.request.contextPath }/static/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
	<script>
		$(function () {
            $('#collstore').click(function () {
                if(${login_user==null}){
                    var bool=confirm('您还没有登录,是否前去登录');
                    if(bool){
                        window.location.href='${ pageContext.request.contextPath }/go/index'
                    }
                }else{
                    $.ajax({
                        url:'${ pageContext.request.contextPath }/store/collstore',
                        data:{'storeid':'${storeinfo.id}'
                           },
                        dataType:'json',
                        async:true,
                        type:'get',
                        success:function (res) {
                            if(res==0){
                                alert('收藏成功')
								$('collstore').val('已收藏')
                            }
                            if(res==1){
                                alert('已收藏')
                            }
                        },
                        error:function () {
                            alert('收藏失败')
                        }
                    })
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
					<li>
						<!--<a href="#" data-toggle="modal" data-target="#myModal">登录/注册</a>-->
						<a href="#">欢迎您  : 大飞子</a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/go/set/1">订单中心</a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/go/set/2">收藏夹</a>
					</li>
				</ul>
			</div>
		</nav>
		<!--店铺头-->
		<nav class="nav navbar navbar-default store_head">
			<%--<div class="container">
				<div class="navbar-header">
					<a href="#" class="navbar-brand">
						${storeinfo.storename}
					</a>
					<button class="navbar-btn btn btn-info">收藏店铺</button>
				</div>

			</div>--%>
			<div class="thumbnail col-lg-4" style="padding-left: 50px">
				<img  src="${ pageContext.request.contextPath }/static/img/store_cover/${storeinfo.storecover}" alt="" />
				<%--<div class="caption">
					<h3>${storeinfo.storename}</h3>
					<p>${storeinfo.info}</p>
				</div>--%>
			</div>
			<div class="thumbnail col-lg-8">
				<p class="bg-primary text-center ">店铺名称</p>
				<div class="alert alert-warning ">${storeinfo.storename}</div>
				<p class="bg-primary text-center ">店铺描述</p>
				<div class="alert alert-warning">${storeinfo.info}</div>
				<c:if test="${collected!=null}">
					<button class="navbar-btn btn btn-info" style="margin-top: 0px">已收藏</button>
				</c:if>
				<c:if test="${collected==null}">
					<button id="collstore" class="navbar-btn btn btn-info" style="margin-top: 0px">收藏店铺.</button>
				</c:if>
			</div>
		</nav>
		<!--店铺商品信息-->
		<!--产品信息部分-->
		<div class="container">
			<!--1-->
			<div class="panel panel-danger">
				<div class="panel-heading">
					热销
				</div>
				<div class="panel-body">

					<c:forEach items="${storehotlist}" var="list">
						<c:if test="${list.status!='nosale'}">
							<div class="thumbnail col-lg-3">
								<a href="${ pageContext.request.contextPath }/product/detail/${list.proid}"><img src="${ pageContext.request.contextPath }/static/img/products/${list.cover}" alt="..."></a>
								<!--商品-->
								<div class="caption">
									<a href="${ pageContext.request.contextPath }/product/detail/${list.proid}">
										<h3>${list.proname}</h3>
										<p>￥ <span>${list.newprice}</span></p>
									</a>
								</div>
							</div>
						</c:if>
					</c:forEach>

				</div>
			</div>
			<!--2-->
			<div class="panel panel-info">
				<div class="panel-heading">
					所有商品
				</div>
				<div class="panel-body">

						<c:forEach items="${productlist}" var="list">
							<c:if test="${list.status!='nosale'}">
								<div class="thumbnail col-lg-3">
									<a href="${ pageContext.request.contextPath }/product/detail/${list.proid}"><img src="${ pageContext.request.contextPath }/static/img/products/${list.cover}" alt="..."></a>
									<!--商品-->
									<div class="caption">
										<a href="${ pageContext.request.contextPath }/product/detail/${list.proid}">
											<h3>${list.proname}</h3>
											<p>￥ <span>${list.newprice}</span></p>
										</a>
									</div>
								</div>
							</c:if>
						</c:forEach>
				</div>
			</div>
		</div>
	</body>
</html>
