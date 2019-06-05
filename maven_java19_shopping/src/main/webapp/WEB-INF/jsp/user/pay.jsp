<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>订单支付</title>
		<link rel="shortcut icon" type="image/x-icon" href="${ pageContext.request.contextPath }/static/img/index/bitbug_favicon.ico" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/bootstrap.css" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/user/pay.css" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/user/set.css" />
		<script src="${ pageContext.request.contextPath }/static/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ pageContext.request.contextPath }/static/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ pageContext.request.contextPath }/static/js/pay.js" type="text/javascript" charset="utf-8"></script>
	<script>
		$(function () {
			$('.submitorder').click(function () {
			   // alert($(this).parent('p').next('p').children('textarea').val());
				$.ajax({
					url:'${ pageContext.request.contextPath }/product/submitorder',
					data:{'proid':$(this).next('input').val(),
                        'orderid':$(this).next('input').next('input').val(),
					'message':$(this).parent('p').next('p').children('textarea').val()
					},
					dataType:'json',
					type:'get',
					async:true,
					success:function (res) {
						alert('下单成功');
						window.location.reload();
                    },
					error:function () {
                        alert('下单失败')
                    }
				})
            })
            $('.updateadress').click(function () {
                $('.addresstr').attr('class','updateadress');
                $(this).attr('class','btn btn-danger btn-xs addresstr');
				//alert($(this).parent('td').attr('name'));
                $.ajax({
                    url:'${ pageContext.request.contextPath }/product/updateadress',
                    data:{'id':$(this).parent('td').attr('name')},
                    dataType:'json',
                    type:'get',
                    async:true,
                    success:function (res) {
						alert("更新成功");
                    },
                    error:function () {
                        alert('更新失败')
                    }
                })
            })
            $('.deleteadress').click(function () {
                //alert($(this).parent('td').attr('name'));
                $.ajax({
                    url:'${ pageContext.request.contextPath }/product/deleteadress',
                    data:{'id':$(this).parent('td').attr('name')},
                    dataType:'json',
                    type:'get',
                    async:true,
                    success:function (res) {
                        alert("删除成功");
                        window.location.reload();
                      //  window.location.href='${ pageContext.request.contextPath }/go/pay';

                    },
                    error:function () {
                        alert('删除失败')
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
		<%--<div class="container">
			<div class="panel panel-primary accept">
				<div class="panel-heading">
					<h5>收货地址</h5>
				</div>
				<div class="panel-body">
					<!--邮件地址:postid是自定义属性，用来记录id-->
					<div class="col-lg-3" postid="">
						<div class="panel panel-warning panel_active panel_address">
							<div class="panel-heading">
								<p>辽宁沈阳（大飞子收）</p>
							</div>
							<div class="panel-body">
								浑南白塔辽宁省沈阳市浑南新区浑南白塔辽宁省沈阳市浑南新区...
								<br /><br />
								<a href="${ pageContext.request.contextPath }/">修改</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3" postid="">
						<div class="panel panel-warning panel_address">
							<div class="panel-heading">
								<p>辽宁沈阳（大飞子收）</p>
							</div>
							<div class="panel-body">
								浑南白塔辽宁省沈阳市浑南新区浑南白塔辽宁省沈阳市浑南新区...
								<br /><br />
								<a href="#">修改</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3" postid="">
						<div class="panel panel-warning panel_address">
							<div class="panel-heading">
								<p>辽宁沈阳（大飞子收）</p>
							</div>
							<div class="panel-body">
								浑南白塔辽宁省沈阳市浑南新区浑南白塔辽宁省沈阳市浑南新区...
								<br /><br />
								<a href="#">修改</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3" postid="">
						<div class="panel panel-warning panel_address">
							<div class="panel-heading">
								<p>辽宁沈阳（大飞子收）</p>
							</div>
							<div class="panel-body">
								浑南白塔辽宁省沈阳市浑南新区浑南白塔辽宁省沈阳市浑南新区...
								<br /><br />
								<a href="#">修改</a>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<hr class="divider" />
					</div>
					<div class="col-lg-12">
						<a href="${ pageContext.request.contextPath }/go/addressmag">管理地址</a>
					</div>
				</div>
			</div>
		</div>--%>
		<div class="container" style="padding-top: 70px">
			<div class="panel panel-info">
				<div class="panel-heading">
					管理地址
				</div>
				<div class="panel-body">
					<table class="table table-bordered">

						<tr>
							<th>收货人</th>
							<th>地址</th>
							<th>邮编</th>
							<th>手机电话</th>
							<th>操作</th>
							<th>默认</th>
						</tr>
						<c:forEach items="${address}" var="list">
							<tr >
								<td class="username">${list.username}</td>
								<td class="address">${list.address}</td>
								<td class="adpost">${list.post}</td>
								<td class="mobile">${list.mobile}</td>
								<td name="${list.id}"><a href="${ pageContext.request.contextPath }/go/updateressmag/${list.id}">修改</a> |
									<a class="deleteadress" style="cursor: pointer" >删除</a></td>
								<c:if test="${list.defaultadd!='0'}">
									<td><a href="" class="btn btn-danger btn-xs addresstr">默认地址</a></td>
								</c:if>
								<c:if test="${list.defaultadd=='0'}">
									<td name="${list.id}"><a href="#" class="updateadress" >默认地址</a></td>
								</c:if>
							</tr>

						</c:forEach>
					</table>
					<a class="pull-right" href="${ pageContext.request.contextPath }/go/addressmag">新增地址</a>
				</div>
			</div>
		</div>


		<!--结算订单-->
		<div class="container">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h4>购物车</h4>
				</div>
				<div class="panel-body" orderid="">
					<c:forEach items="${paylist}" var="list"  varStatus="status">
						<div>
							<!--订单图片-->
							<img src="${ pageContext.request.contextPath }/static/img/products/${list.cover}" alt="" class="pull-left" />

							<!--订单商品名-->
							<p class="pull-left proname ">
								<a href="#">${list.proname}</a>
							</p>
							<p class="pull-left newprice pro_price">
								￥ <span>${list.newprice}</span>
							</p>
							<p class="pull-left counts ">
								数量 :<span>${list.counts}</span>
							</p>
							<p class="pull-left zongjia pro_price">
								总价 :<span>${list.zongjia}</span> 元
							</p>
							<%--<p class="pull-left message" >
								<input class="form-control" name="textarea" rows="3" cols="50" placeholder="买家留言"></input>
							</p>--%>
							<p class="pull-right" style="padding-top: 30px;padding-left: 10px">
								<%--<input class="form-control" name="textarea" rows="3" cols="50" placeholder="买家留言"></input>--%>
								<a class="btn btn-danger submitorder" >提交订单</a>
									<input type="hidden" class="proid" value="${list.proid}">
									<input type="hidden" class="proid" value="${list.orderid}">
							</p>
							<p class="pull-right message" >
								<textarea class="form-control" name="textarea" rows="3" cols="50" placeholder="买家留言"></textarea>
							</p>
							<div class="clearfix"></div>
						</div>
						</br>
					</c:forEach>
				</div>
			</div>

		</div>
	</body>

</html>