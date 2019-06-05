<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>地址管理</title>
		<link rel="shortcut icon" type="image/x-icon" href="${ pageContext.request.contextPath }/static/img/index/bitbug_favicon.ico" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/bootstrap.css" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/user/set.css" />
		<script src="${ pageContext.request.contextPath }/static/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ pageContext.request.contextPath }/static/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ pageContext.request.contextPath }/static/js/pay.js" type="text/javascript" charset="utf-8"></script>
	<script>
		$(function () {
		    //是否选中默认
			$('#defaultadd').change(function () {
                if($('#defaultadd').attr('checked') == 'checked'){
                    $('#defaultadd').removeAttr('checked');
                    $('#defaultadd').val(0);
                    alert('取消')
                }else{
						$('#defaultadd').attr('checked','checked');
						$('#defaultadd').val(1);
						alert('选中')
				}
            })
			//新增地址
            $('#saveadress2').click(function () {
                // alert($(this).parent('p').next('p').children('textarea').val());
                $.ajax({
                    url:'${ pageContext.request.contextPath }/product/newaddinfo',
                    data:{'address':$('input[name=address1]').val(),
                        'mobile':$('input[name=mobile1]').val(),
                        'post':$('input[name=post1]').val(),
                        'username':$('input[name=username1]').val(),
                   		 'defaultadd':$('input[name=defaultadd1]').val()
                    },
                    dataType:'json',
                    type:'post',
                    async:true,
                    success:function (res) {
                        alert('新增成功');
                        window.location.href='${ pageContext.request.contextPath }/go/pay';
                    },
                    error:function () {
                        alert('新增失败')
                    }
                })
            })
			//修改地址
            $('#updateadress').click(function () {
                // alert($(this).parent('p').next('p').children('textarea').val());
                $.ajax({
                    url:'${ pageContext.request.contextPath }/product/updateaddinfo',
                    data:{'address':$('input[name=address]').val(),
                        'mobile':$('input[name=mobile]').val(),
                        'post':$('input[name=post]').val(),
                        'username':$('input[name=username]').val(),
                        'defaultadd':$('input[name=defaultadd]').val(),
						'id':$('input[name=id]').val()
                    },
                    dataType:'json',
                    type:'post',
                    async:true,
                    success:function (res) {
                        alert('修改成功');
                        window.location.href='${ pageContext.request.contextPath }/go/pay';
                    },
                    error:function () {
                        alert('修改失败')
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
						<a href="#">商城首页</a>
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
		<!--新增地址-->
		<div class="container" style="margin-top:70px;">
			<div class="panel panel-info">
				<div class="panel-heading">
					地址详情
				</div>
				<div class="panel-body">
					<c:if test="${adressmap!=null}">
					<form action="${ pageContext.request.contextPath }/product/updateaddinfo" method="post" class="col-lg-8">
						<div class="col-lg-3">
							<input type="button" class="btn btn-success form-control" value="地址信息">
							<br /><br />
							<input type="button" class="btn btn-success form-control" value="邮政编码">
							<br /><br />
							<input type="button" class="btn btn-success form-control" value="收货人姓名">
							<br /><br />
							<input type="button" class="btn btn-success form-control" value="手机电话">

						</div>
						<div class="col-lg-9">
							<input type="text" placeholder="地址信息" name="address" class="form-control" value="${adressmap.address}"/><br />
							<input type="text" placeholder="邮政编码" name="post" class="form-control" value="${adressmap.post}"/><br />
							<input type="text" placeholder="收货人姓名" name="username" class="form-control" value="${adressmap.username}"/><br />
							<input type="text" placeholder="手机电话" name="mobile" class="form-control" value="${adressmap.mobile}"/><br />
							<input type="hidden" value="${adressmap.id}" name="id">
							<br /><br />
							<button class="btn btn-primary" id="updateadress">修改</button>
						</div>
					</form>
					</c:if>
					<c:if test="${adressmap==null}">
						<form action="#" method="post" class="col-lg-8">
							<div class="col-lg-3">
								<input type="button" class="btn btn-success form-control" value="地址信息">
								<br /><br />
								<input type="button" class="btn btn-success form-control" value="邮政编码">
								<br /><br />
								<input type="button" class="btn btn-success form-control" value="收货人姓名">
								<br /><br />
								<input type="button" class="btn btn-success form-control" value="手机电话">

							</div>
							<div class="col-lg-9">
								<input type="text" placeholder="地址信息" name="address1" class="form-control"/><br />
								<input type="text" placeholder="邮政编码" name="post1" class="form-control"/><br />
								<input type="text" placeholder="收货人姓名" name="username1" class="form-control"/><br />
								<input type="text" placeholder="手机电话" name="mobile1" class="form-control"/><br />
								<input type="checkbox" name="defaultadd1" value="1" id="defaultadd" checked="checked"/> 设为默认地址
								<br /><br />
								<button type="button" class="btn btn-primary" id="saveadress2">保存</button>
							</div>


						</form>
					</c:if>

				</div>
			</div>
		</div>
		<hr />
		<!--地址管理-->

	</body>
</html>
