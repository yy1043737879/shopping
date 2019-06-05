<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>商品管理</title>
	<link rel="shortcut icon" type="image/x-icon" href="${ pageContext.request.contextPath }/static/img/index/bitbug_favicon.ico" />
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/bootstrap.css" />
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/index/serch.css" />
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/pro_reg.css" />
	<script src="${ pageContext.request.contextPath }/static/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
	<script src="${ pageContext.request.contextPath }/static/js/template-web.js" type="text/javascript" charset="utf-8"></script>
	<script src="${ pageContext.request.contextPath }/static/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
	<script src="${ pageContext.request.contextPath }/static/js/proreg.js" type="text/javascript" charset="utf-8"></script>
	<script>
        $(function(){
            // 加载二级分类
            $('#maincate').change(function(){
                //	发ajax请求加载二级分类
                $.ajax({
                    url : '${pageContext.request.contextPath}/store/loadSonCate',
                    data : {
                        'maincate' : $(this).val()
                    },
                    type : 'get',
                    dataType : 'json',
                    async : true,
                    success : function (res) {
                        var json = {
                            'sonList' : res.sonlist,
                            'proList' : res.prolist
                        }
                        // 渲染视图
                        var html = template('sonCate',json);
                        $('#seccate').html('');
                        $('#seccate').append(html);

                       /* var html2 = template('proCate',json);
                        $('#propertyinfo').html('');*/

                        var html2 = template('proinfo',json);
                        $('#procate').html('');
                        $('#procate').append(html2);

                    },
                    error:function () {
                        alert('加载信息失败')
                    }
                })
            })
			//确认登记
			$('#makesure').click(function(){
			    var sendData=new FormData($('#proreg_from')[0]);
			    $('#category33').val($('3maincate').html());
			    $.ajax({
					url:'${pageContext.request.contextPath}/product/reg',
					data:sendData,
					type:'post',
					dataType:'json',
					processData:false,
					contentType:false,
					async:true,
					success:function(res){

					        window.location.href='${pageContext.request.contextPath}/go/storemanage/${storeid}';

					},
					error:function(){
					    alert('注册失败!')
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
<!--
    商品具体信息
        名字
        原价
        单价
        运费
        库存
        销售属性（与商品类别有关）
                男装 /女装			—— 规格，颜色
                女鞋 /男鞋 			—— 规格，颜色
                美妆 /个人护理		—— 规格，颜色
                腕表 /眼镜 /珠宝饰品	—— 规格
                手机 /数码 /电脑办公	—— 规格，颜色
                母婴玩具			—— 规格，颜色
                零食 /茶酒 /进口食品	—— 无
                生鲜水果			—— 无
                大家电 /生活电器		—— 规格，颜色
                家具建材			—— 规格，颜色
                汽车 /配件 /用品		—— 规格
                家纺 /家饰 			—— 规格，颜色
                医药保健			—— 无
                厨具 /收纳 			—— 规格，颜色
                图书音像			—— 规格
        产品参数（与商品类别有关）
            男装 /女装：品牌，尺码，厚薄，版型，季节，图案，分类，面料，颜色
            女鞋 /男鞋 ：品牌，尺码，款式，季节
            美妆 /个人护理 ：品牌，适合肤质，净含量，保质期，分类
            腕表 /眼镜 /珠宝饰品 ：材质，颜色，风格
            手机 /数码 /电脑办公 ：品牌，型号，企业，保修期
            母婴玩具 ：品牌，产地，类型
            零食 /茶酒 /进口食品：包装方式，品牌，厂址，净含量，厂家联系方式
            生鲜水果：保质期，品牌，产品标准号，储藏方法
            大家电 /生活电器：证书编号，品牌，能效等级，款式
            家具建材：品牌，风格，材质，产地，包装体积，适用人数，尺寸
            车 /配件 /用品：品牌，型号，表层材质，颜色分类
            家纺 /家饰：是否进口，计价单位，图案
            医药保健：生产许可证编号，厂名，厂址，保质期，品牌，适用对象
            厨具 /收纳 ：品牌，容量
            图书音像：作者，出版时间
-->
<div class="container">
	<div class="panel panel-warning promanage">
		<div class="panel-heading">
			<h4>商品管理</h4>
		</div>
		<div class="panel-body">
			<!--商品注册表单-->
			<!--主要信息部分-->
			<form id="proreg_from" action="#" method="post" enctype="multipart/form-data">
				<h5 class="alert alert-danger">基本信息</h5>
				<div class="col-lg-6">
					<!--商品名称-->
					<input type="text" class="form-control" name="proname" placeholder="商品名称"/><br />
					<!--商品原价-->
					<input type="text" class="form-control" name="oldprice" placeholder="原价：元"/><br />
					<!--促销价-->
					<input type="text" class="form-control" name="newprice" placeholder="促销价：元"/> <br />
					<!--运费-->
					<input type="text" class="form-control" name="freight" placeholder="运费：元"/> <br />
					<input type="hidden" name="storeid" value="${storeid}">

				</div>
				<!--产品封面图片-->
				<div class="col-lg-6">
					<div class="thumbnail">
						<img src="${ pageContext.request.contextPath }/static/img/index/lunbo/4.jpg" alt="" />
					</div>
					<input type="file" name="file" id="coverfile" />
				</div>
				<div class="col-lg-12">
					<hr class="divider"/>
				</div>
				<div class="col-lg-12">
					<h5 class="alert alert-danger">属性信息</h5>
				</div>
				<!--产品属性部分（detail.jsp能看见的部分）-->
				<div class="col-lg-6">
					<select id="maincate" name="category" class="form-control">
						<option value="">产品类别</option>
						<c:if test="${ catelist != null }">
							<c:forEach items="${ catelist }" var="cateinfo">
								<c:if test="${ cateinfo.parentid == 0 }">
									<option value="${ cateinfo.id }">${ cateinfo.cname }</option>
								</c:if>
							</c:forEach>
						</c:if>

					</select>
					<br />
					<select id="seccate" name="category_son" class="form-control">
						<%--<option value="0">子集分类</option>--%>
						<%--<option value="10">卫衣</option>--%>
						<%--<option value="11">夹克</option>--%>
						<%--<option value="12">西装</option>--%>
						<%--<option value="13">短裙</option>--%>
					</select>
					<script type="text/html" id="sonCate">
						{{ each sonList as value i}}
							<option value="{{value.id}}">{{value.cname}}</option>
						{{ /each }}
					</script>
					<br />
				</div>
				<div class="col-lg-12"></div>
				<!--规格信息-->
				<div class="guige">
					<div class="col-lg-4">
						<!--规格-->
						<input type="text" class="form-control" name="standard" placeholder="规格"/>
					</div>
					<div class="col-lg-4">
						<!--颜色-->
						<input type="text" class="form-control" name="color" placeholder="颜色"/>
					</div>
					<div class="col-lg-4">
						<!--库存-->
						<input type="text" class="form-control" name="stock" placeholder="库存：个/件"/>
					</div>
					<input type="hidden" value="0" class="shuzhi">
				</div>
				<div class="col-lg-12">
					<hr class="divider"/>
				</div>
				<div class="col-lg-12 text-center">
					<a href="javascript:;" class="btn btn-success xinzeng">新增</a>
				</div>
				<div class="col-lg-12">
					<hr class="divider"/>
				</div>
				<div class="col-lg-12">
					<h5 class="alert alert-danger">参数信息</h5>
				</div>
				<!--参数信息-->

		<!--参数信息-->

				<div  id="procate">
					<%--<input type="text" class="form-control" placeholder="品牌" name="brand"/>--%>
				</div>
				<script type="text/html" id="proinfo">
					{{ each proList as value i }}
					<div class="col-lg-3">
						<input type="text" class="form-control" placeholder="{{value.proname}}" name="provalues" />
					</div>
					{{ /each }}
				</script>

				<div class="col-lg-12">
					<hr class="divider"/>
				</div>
				<div class="col-lg-12 text-center">
					<button type="button" id="makesure" class="btn btn-success">确认登记</button>
					<button class="btn btn-info" type="reset">重置</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>