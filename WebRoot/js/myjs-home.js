/*登陆注册弹出框*/
$(function() {
	$("#my-login").click(function() {
		$('#login_a1').click();
	});
	$("#my-register").click(function() {
		$('#login_a2').click();
	});
})

/* 点击收藏颜色转换 */
$(function() {
	var changeSys = function() {
		if(user == "") {
			alert("请登录");
			return;
		}
		var interestGroupId = $(this).attr("id");
		if ($(this).hasClass('right_span2')) {
			var deleted = true;
			$(this).removeClass('right_span2');
			$(this).addClass("right_span3");
			sendCollectInfors(userId, interestGroupId, deleted);
		} else {
			var deleted = false;
			$(this).removeClass('right_span3');
			$(this).addClass("right_span2");
			sendCollectInfors(userId, interestGroupId, deleted);
		}
	};
	function sendCollectInfors(userId, interestGroupId, deleted) {
		var url = "interestGroupAjax_addLikedInterestGroup.action";
		$.post(url,{"userId":userId, "interestGroupId":interestGroupId, "deleted":deleted},function(msg){
			alert(msg);
		});
	}
	$(".right_click").each(function() {
		$(this).bind('click', changeSys);
	});
});

/*
 * 右下角回到顶部
 */
$(function() {
	var speed = 800;
	var h = document.body.clientHeight;
	$("#toTop").click(function() {
		$('html,body').animate({
			scrollTop : '0px'
		}, speed);
	});
});
function getTop() {
	if ($(document).scrollTop() > 600) {
		$("#getTop").css({
			'display' : 'block',
		});
	} else {
		$("#getTop").css('display', 'none');
	}
	setTimeout(getTop);
}
$(function() {
	// 点击图片更换验证码
	$("#verify").click(
			function() {
				$("#verifyImg").attr(
						"src",
						"/makeFriends/securityCodeImageAction.action?timestamp="
								+ new Date().getTime());
			});
});