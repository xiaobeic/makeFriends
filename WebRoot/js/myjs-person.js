/*登陆注册弹出框*/
$(function() {
	$("#my-login").click(function() {
		$('#login_a1').click();
	});
	$("#my-register").click(function() {
		$('#login_a2').click();
	});
})

/*我的收藏点击收藏颜色转换*/
$(function(){
	var changeSys = function(){
  		if($(this).hasClass('right_span2')){
  			$(this).parent().siblings().fadeOut(2000, function () {
  			});
  			$(this).parent().fadeOut(2000, function () {
  				$(this).parent().remove();
  			});
  			var interestGroupId = $(this).attr("id");
  			var deleted = true;
  			sendCollectInfors(userId, interestGroupId, deleted);
  			/*$(this).removeClass('right_span2');
			$(this).addClass("right_span3");*/
  		}
  		else{
  			$(this).removeClass('right_span3');
			$(this).addClass("right_span2");
  		}
	};
	function sendCollectInfors(userId, interestGroupId, deleted) {
		var url = "interestGroupAjax_addLikedInterestGroup.action";
		$.post(url,{"userId":userId, "interestGroupId":interestGroupId, "deleted":deleted},function(msg){
			alert(msg);
		});
	}
	$("span[name='myColloectionId']").each(
		function() {
			$(this).bind('click', changeSys);
	});
});
/* 吧台点击收藏颜色转换 */
$(function() {
	function changeLikedInterestGroup() {
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
	$("span[name='myInterestgroupId']").each(function() {
		$(this).bind('click', changeLikedInterestGroup);
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



$(function(){
	var changeSys = function(){
  		var posta=$(this).children('span:first-child').next().children('a');
  		var postdiv=$(this).next('div');
  		if(posta.hasClass('icon-chevron-down')){
  			posta.removeClass('icon-chevron-down');
  			posta.addClass('icon-chevron-up');
  			postdiv.removeClass('SysMess_div2');
  			postdiv.addClass('SysMess_div3');
  			postdiv.addClass('fadeInDown');
  		}
  		else{
  			posta.removeClass('icon-chevron-up');
  			posta.addClass('icon-chevron-down');
  			postdiv.removeClass('SysMess_div3');
  			postdiv.addClass('SysMess_div2');
  			postdiv.addClass('fadeIn');
  		}
	};
	$(".SysMess_div1").each(
		function() {
			$(this).bind('click', changeSys);
	});
});


/**
 * 我的回复div获得鼠标焦点按钮隐藏显示
 */
$(function() {
	$(".myme_div").each(function() {
		$(this).mouseenter(function() {
			$(this).children().last().addClass('mymessage_div5');
		});
		$(this).mouseleave(function() {
			$(this).children().last().removeClass('mymessage_div5');
		});
	});
});


/**
 * 我的好友列表及我的私信按钮隐藏显示
 */
$(function() {
	$(".myme_div1").each(function() {
		$(this).mouseenter(function() {
			$(this).children().last().css("display","block")
		});
		$(this).mouseleave(function() {
			$(this).children().last().css("display","none")
		});
	});
});


/*
 * 个人中心头像上传
 */
$(window).load(function() {
	var options = {
		thumbBox: '.thumbBox',
		spinner: '.spinner',
		imgSrc: 'img/avatar.png'
	}
	var cropper = $('.imageBox').cropbox(options);
	$('#file').on('change', function() {
		var reader = new FileReader();
		reader.onload = function(e) {
			options.imgSrc = e.target.result;
			cropper = $('.imageBox').cropbox(options);
		}
		reader.readAsDataURL(this.files[0]);
		this.files = [];
	})
	$('#btnCrop').on('click', function() {
		var img = cropper.getDataURL();
		$('.cropped').empty();
		$('.cropped').append('<img src="' + img + '">');
	})
	$('#btnZoomIn').on('click', function() {
		cropper.zoomIn();
	})
	$('#btnZoomOut').on('click', function() {
		cropper.zoomOut();
	})
	$('#uploadHeadImg').on('click', function() {
		/**
		 *头像上传 
		 */
		var img = cropper.getDataURL();
		
		var url = "userAjax_changeUserHeadPic.do";
		var args={"img":img};
		$.ajax({
			url:url,
			data:args,
			type:"post",
			dataType:"json",
			success:function(msg){
				alert(msg);
				$("input[name='oldPassword']").val("");
				$("input[name='newPassword']").val("");
				$("input[name='confirmPassword']").val("");
				window.location.href=window.document.location.href;
			},error:function(){
				
			}
		});
	})
});
/**
 * 删除userdynamtic
 */
$(function() {
	$(".icon-trash").each(function() {
		$(this).bind('click', deleteUserDynamtic);
	});
	function deleteUserDynamtic () {
		var userDynamticId = $(this).attr("id");
		var url = "userDynamticAjax_deleteUserDynamtic.action";
		var this_ = this;
		$.post(url,{"userDynamticId":userDynamticId},function(msg){
			if (msg != null) {
				alert(msg);
				$(this_).parent().parent().fadeOut(2000, function () {
					$(this).remove();
				});
			}
		});
	}
});
