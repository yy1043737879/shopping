<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品首页</title>
    <link rel="shortcut icon" type="image/x-icon" href="${ pageContext.request.contextPath }/static/img/index/bitbug_favicon.ico" />
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/bootstrap.css" />
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/index/serch.css" />
    <script src="${ pageContext.request.contextPath }/static/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="${ pageContext.request.contextPath }/static/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
    <script src="${ pageContext.request.contextPath }/static/js/detail.js" type="text/javascript" charset="utf-8"></script>
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
<div class="container" style="padding-top: 70px">
    <div class="row">
        <div class="col-lg-2 text-center bg-danger" style="padding:11px">${cname}</div>
        <div class="col-lg-10 text-center" style="border:1px solid #F5F5F5;padding:0;">

            <c:forEach items="${secondlist}" var="son">
                <div class="col-lg-4 pro_class_son" style="background:#c9e2b3;border:#4cae4c solid 1px">
                    <a href="${ pageContext.request.contextPath }/product/index/${son.id}">${son.cname}</a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<hr />
<div class="container">
    <div class="panel panel-info">
        <div class="panel-heading">
            <c:if test="${startrecond==null&&recomendlist!=null}">
                <h4>匹配商品</h4>
            </c:if>
            <c:if test="${startrecond!=null||recomendlist==null}">
                <h4>为您推荐</h4>
            </c:if>

        </div>
        <div class="panel-body">
            <c:if test="${recomendlist!=null}">
                <c:forEach items="${recomendlist}" var="list">
                    <div class="thumbnail col-lg-3">
                        <a href="${ pageContext.request.contextPath }/product/detail/${list.proid}" class="text-info">
                            <img src="${ pageContext.request.contextPath }/static/img/products/${list.cover}" alt="...">
                            <div class="caption">
                                <h3>${list.proname}</h3>
                                <p>￥ ${list.newprice}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${startrecond!=null||recomendlist==null}">
                <c:forEach items="${mohushoplist}" var="list">
                    <div class="thumbnail col-lg-3">
                        <a href="${ pageContext.request.contextPath }/product/detail/${list.proid}" class="text-info">
                            <img src="${ pageContext.request.contextPath }/static/img/products/${list.cover}" alt="...">
                            <div class="caption">
                                <h3>${list.proname}</h3>
                                <p>￥ ${list.newprice}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>