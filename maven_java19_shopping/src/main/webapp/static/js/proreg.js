$(function(){
	// 添加属性信息
	var $div = $('.guige').eq(0).html();
    var a=0;
	function add(a){
		a=a+1;
		return a;
	}

	$('.xinzeng').click(function(){
		$(this).closest('div').prev().prev().append($div);
        $(this).closest('div').lastChild.closest('.shuzhi').val(1);
	})
	// 加载二级分类
	// $('#maincate').change(function(){
	//
	// 	//	发ajax请求加载二级分类
	// 	$.ajax({
	// 		url : '${pageContext.request.contextPath}/store/loadSonCate',
	// 		data : {
	// 			'maincate' : $(this).val()
	// 		},
	// 		type : 'get',
	// 		dataType : 'json',
	// 		async : true,
	// 		success : function (res) {
	// 			var json = {
	// 				'sonList' : res
	// 			}
	// 			// 渲染视图
	// 			var html = template('sonCate',json);
	// 			$('#seccate').append(html);
     //        },
	// 		error:function () {
	// 			alert('加载信息失败')
     //        }
	// 	})
	// })
})