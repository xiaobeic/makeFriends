/*登陆注册弹出框*/
$(function() {
	$("#my-login").click(function() {
		$('#login_a1').click();
	});
	$("#my-register").click(function() {
		$('#login_a2').click();
	});
})


/*
 * 右下角回到顶部
 */
$(function() {
	var speed = 800;
	var h = document.body.clientHeight;
	$("#toTop").click(function() {
		$('html,body').animate({
				scrollTop: '0px'
			},
			speed);
	});
});
function getTop() {
	if ($(document).scrollTop() > 600) {
		$("#getTop").css({
			'display': 'block',
		});
	} else {
		$("#getTop").css('display', 'none');
	}
	setTimeout(getTop);
}


/* 点击收藏颜色转换 */
$(function() {
	var changeSys = function() {
		if(user == "") {
			alert("请登录");
			return;
		}
		var interestGroupId = $(this).attr("id");
		console.log($(this));
		if ($(this).hasClass('head_span2')) {
			var deleted = true;
			$(this).removeClass('head_span2');
			$(this).addClass("head_span3");
			sendCollectInfors(userId, interestGroupId, deleted);
		} else {
			var deleted = false;
			$(this).removeClass('head_span3');
			$(this).addClass("head_span2");
			sendCollectInfors(userId, interestGroupId, deleted);
		}
	};
	function sendCollectInfors(userId, interestGroupId, deleted) {
		var url = "interestGroupAjax_addLikedInterestGroup.action";
		$.post(url,{"userId":userId, "interestGroupId":interestGroupId, "deleted":deleted},function(msg){
			alert(msg);
		});
	}
	$(".head_span1").each(function() {
		$(this).bind('click', changeSys);
	});
});
/*帖子回复隐藏展示效果*/
$(function(){
	var changeA = function(){
  		var posta=$(this).children('span:last-child');
  		var aval=$(this).children('span:first-child');
  		var postdiv=$(this).parent().parent().next('div');
  		if(posta.hasClass('icon-chevron-down')&&aval.html()>=0){
  			posta.removeClass('icon-chevron-down');
  			posta.addClass('icon-chevron-up');
  			postdiv.removeClass('post_div4');
  			postdiv.addClass('post_div5');
  		}
  		else{
  			posta.removeClass('icon-chevron-up');
  			posta.addClass('icon-chevron-down');
  			postdiv.removeClass('post_div5');
  			postdiv.addClass('post_div4');
  		}
	};
	$(".post_spana").each(
		function() {
			$(this).bind('click', changeA);
	});
});
/*帖子发表*/
$(function(){
	$("#publishDynamtic").off("click").click(function() {
		$("#dynamticForm").submit();
	});
	$("#publishComment").off("click").click(function() {
		$("#commentForm").submit();
	});
});
/*二级回复*/
$(function(){
	$("span a[id='replylink']").off("click").on("click", function() {
		var replyUserId = $(this).siblings("#reply_user_id").val();
		var replyUserName = $(this).siblings("#reply_user_name").val();
		$("form input[id='replyUserId']").val(replyUserId);
		$("form span span[id='replyContent']").text(replyUserName);
		console.log(replyUserId);
		console.log(replyUserName);
	});
});