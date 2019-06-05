<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人中心</title>
		<link rel="shortcut icon" type="image/x-icon" href="${ pageContext.request.contextPath }/static/img/index/bitbug_favicon.ico" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/bootstrap.css" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/index/serch.css" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/user/set.css" />
		<script src="${ pageContext.request.contextPath }/static/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ pageContext.request.contextPath }/static/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
	<script>
		$(function () {
            $('.receiveshop').click(function () {
                // alert($(this).parent('p').next('p').children('textarea').val());
                $.ajax({
                    url:'${ pageContext.request.contextPath }/product/receiveshop',
                    data:{'orderid':$(this).prev('input').val()},
                    dataType:'json',
                    type:'get',
                    async:true,
                    success:function (res) {
                        alert('收货成功');
                        window.location.reload();
                    },
                    error:function () {
                        alert('收货失败')
                    }
                })
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
						<a href="#">欢迎您 : 大飞子</a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/go/logout">登出</a>
					</li>
				</ul>
			</div>
		</nav>
		<!--个人信息选项-->
		<div class="container infoop">
			<!--用户设置选项:纵向导航栏-->
            <ul class="nav nav-tabs nav-pills nav-stacked col-lg-3">
                <li class="text-center ${orderinfo}">
                    <a href="#order" data-toggle="tab">订单信息</a>
                </li>
                <li class="text-center ${collinfo}">
                    <a href="#coll" data-toggle="tab">收藏信息</a>
                </li>
                <li class="text-center ${manageshops}">
                    <a href="#mdp" data-toggle="tab">管理店铺</a>
                </li>
            </ul>
            <!--表单内容或跳转页面-->
            <ul class="tab-content col-lg-9">
                <!--默认不显示，需有active类-->
                <li id="order" class="tab-pane fade ${orderinfo} in">
                    <ul class="nav nav-tabs nav-top">
                        <!--data-toggle="tab"选项卡可以切换-->
                        <li class="active">
                            <a href="#dfk" data-toggle="tab">待付款</a>
                        </li>
                        <li>
                            <a href="#yfk" data-toggle="tab">已付款</a>
                        </li>
                        <li>
                            <a href="#ysh" data-toggle="tab">已收货</a>
                        </li>
                    </ul>
                    <ul class="tab-content ">
                    	<br />
                        <li id="dfk" class="active tab-pane ${orderinfo}  fade in">
                            <!--待付款订单-->
							<c:forEach items="${paylist}" var="list">
								<div class="panel panel-info">
									<div class="panel-heading">
										<!--订单时间，订单号-->
										<p>
											<span class="pull-right">订单号 : #${list.orderid}</span>
										</p>
									</div>
									<div class="panel-body">
										<!--订单图片-->
										<img src="${ pageContext.request.contextPath }/static/img/products/${list.cover}" alt="" class="pull-left"/>
										<!--订单商品名-->
										<p class="pull-left pro_name">
											<a href="#">${list.proname}</a>
										</p>
										<p class="pull-left pro_price">
											￥ <span>${list.newprice}</span>
										</p>
										<p class="pull-left">
											数量 :<span>${list.counts}</span>
										</p>
										<p class="pull-left pro_price">
											总价 :<span>${list.zongjia}</span> 元
										</p>
										<p class="pull-left">
											<a href="${ pageContext.request.contextPath }/go/pay/${list.orderid}" class="btn btn-success">支付</a>
											<br /><br />
											<a href="#" class="btn btn-danger">取消</a>
										</p>
									</div>
								</div>
							</c:forEach>
                        </li>
                        <li id="yfk" class="tab-pane fade">
                            <!--已付款订单-->
							<c:forEach items="${paidlist}" var="list">
								<div class="panel panel-info">
									<div class="panel-heading">
										<!--订单时间，订单号-->
										<p>
											<span>${list.paydate}</span>
											<span class="pull-right">订单号 : #${list.orderid}</span>
										</p>
									</div>
									<div class="panel-body">
										<!--订单图片-->
										<img src="${ pageContext.request.contextPath }/static/img/products/${list.cover}" alt="" class="pull-left"/>
										<!--订单商品名-->
										<p class="pull-left pro_name">
											<a href="#">${list.proname}</a>
										</p>
										<p class="pull-left pro_price">
											￥ <span>${list.newprice}</span>
										</p>
										<p class="pull-left">
											数量 :<span>${list.counts}</span>
										</p>
										<p class="pull-left pro_price">
											总价 :<span>${list.zongjia}</span> 元
										</p>
										<p class="pull-left">
											<input type="hidden" value="${list.orderid}">
											<a href="#" class="btn btn-success receiveshop">收货</a>
											<br /><br />
											<a href="#" class="btn btn-danger">退货</a>
										</p>
									</div>
								</div>
							</c:forEach>
                        </li>
                        <li id="ysh" class="tab-pane fade">
                            <!--待已收货订单-->
                            <!--已付款订单-->
							<c:forEach items="${donelist}" var="list">
							<div class="panel panel-info">
								<div class="panel-heading">
									<!--订单时间，订单号-->
									<p>
										<span>${list.paydate}</span>
										<span class="pull-right">订单号 : #${list.orderid}</span>
									</p>
								</div>
								<div class="panel-body">
									<!--订单图片-->
									<img src="${ pageContext.request.contextPath }/static/img/products/${list.cover}" alt="" class="pull-left"/>
									<!--订单商品名-->
									<p class="pull-left pro_name">
										<a href="#">${list.proname}</a>
									</p>
									<p class="pull-left pro_price">
										￥ <span>${list.newprice}</span>
									</p>
									<p class="pull-left">
										数量 :<span>${list.counts}</span>
									</p>
									<p class="pull-left pro_price">
										总价 :<span>${list.zongjia}</span> 元
									</p>
									<p class="pull-left">
										<a href="#" class="btn btn-success">评价</a>
									</p>
								</div>
							</div>
							</c:forEach>

                        </li>
                    </ul>
                </li>
                <!--收藏信息：店铺和商品-->
                <li id="coll" class="tab-pane fade in ${collinfo}">
                    <!--收藏信息-->
                    <ul class="nav nav-tabs nav-top">
                        <!--data-toggle="tab"选项卡可以切换-->
                        <li >
                            <a href="#scdp" data-toggle="tab">收藏店铺</a>
                        </li>
                        <li class="active">
                            <a href="#scsp" data-toggle="tab">收藏商品</a>
                        </li>
                    </ul>
                    <ul class="tab-content">
                        <!--收藏店铺-->
                        <li id="scdp" class="tab-pane ">
                        	<br />
							<c:forEach items="${collstoreist}" var="list">
								<div class="thumbnail col-lg-4">
									<img src="${ pageContext.request.contextPath }/static/img/store_cover/${list.storecover}" alt="" />
									<div class="caption">
										<h3>${list.storename}</h3>
										<p>
											<a href="#" class="btn btn-block btn-default">取消收藏</a>
										</p>
									</div>
								</div>
							</c:forEach>
                        </li>
                        <!--收藏的商品-->
                        <li id="scsp" class="tab-pane active fade in">
                        	<br />
							<c:forEach items="${colllist}" var="list">
								<div class="panel panel-warning">
									<div class="panel-heading">
										<div class="panel-body">
											<!--订单图片-->
											<img src="${ pageContext.request.contextPath }/static/img/products/${list.cover}" alt="" class="pull-left"/>
											<!--订单商品名-->
											<p class="pull-left pro_name">
												<a href="#">${list.proname}</a>
											</p>
											<p class="pull-left pro_price">
												￥ <span>${list.newprice}</span>
											</p>
											<p class="pull-left">
												<a href="#" class="btn btn-success">查看类似</a>
												<br /><br />
												<a href="#" class="btn btn-default">取消收藏</a>
											</p>
										</div>
									</div>
								</div>
							</c:forEach>
                        </li>
                    </ul>
                </li>
                <!--管理店铺-->
                <li id="mdp" class="tab-pane ${manageshops} fade in ">
                    <!--开店，关店-->
                    <ul class="nav nav-tabs nav-top ">
                        <li class="active">
                            <a href="#wddp" data-toggle="tab">我的店铺</a>
                        </li>
                    </ul>
                    <ul class="tab-content">
                    	<br />
                    	<li id="#wddp" class="active fade in">
                    		<!--新增店铺按钮-->
                    		<div><a href="${ pageContext.request.contextPath }/go/build" class="btn btn-default btn-block">新增店铺</a></div>
                    		<br />
                    		<c:if test="${ storelist != null }">
                    			<c:forEach items="${ storelist }" var="store">
	                    			<div class="thumbnail col-lg-4" style="height: 300px">
		                    			<img style="height: 180px" src="${ pageContext.request.contextPath }/static/img/store_cover/${store.storecover}" alt="" />
		                    			<div class="caption">
		                    				<h3>${store.storename}</h3>
		                    				<c:if test="${store.status eq 'close'}">
		                    					<a href="#" class="btn btn-danger">营业</a>
		                    				</c:if>
		                    				<c:if test="${store.status eq 'open'}">
		                    					<a href="#" class="btn btn-primary">关店</a>
		                    				</c:if>
		                    				<a href="${ pageContext.request.contextPath }/go/storemanage/${store.id}" class="btn btn-warning">进入店铺</a>
		                    			</div>
	                    			</div>
                    			</c:forEach>
                    		</c:if>
                    	</li>
                    </ul>
                </li>
            </ul>
		</div>
	</body>
</html>