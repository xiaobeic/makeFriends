/**
 * 页面Ajax
 */
//js获取项目根路径，如： http://localhost:8083/uimcardprj
function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    
    return(localhostPaht+projectName);
}
window.onload=function(){
	
	$("#loginSumbit").click(function(){
		var userName=$("#loginUserName").val();
		var password=$("#loginPassword").val();
		var remberPwd=$("#loginRemberPwd").is(':checked');
	 
		if(userName==""){
			alert("用户名不为空...");
			return false;
		}
		if(password==""){
			alert("密码不为空...");
			return false;
		}
		var url=getRootPath()+"/userAjax_userLogin.action";
		var args={"userName":userName,"password":password,"remberPwd":remberPwd,"time":new Date()};
		$.ajax({
			url:url,
			type:"post",
			data:args,
			dataType:"json",
			success:function(data){
				if(data!=null){
					var data = JSON.parse(data);
					//alert(data);
					window.location.href=window.document.location.href;
				}else{
					alert("用户名或密码错误...");
				}
			},
			error:function(){
				alert("服务器错误");
			}
		});
		return false;	
	});
	$("#regSumbit").click(function(){
		var userName=$("#regUserName").val();
		var password=$("#regPassword").val();
		var nickName=$("#regNickName").val();
		var verifyCode=$("#regVerifyCode").val();
		if (userName=="") {
			alert("用户名不为空...");
			return false;
		}
		if (password=="") {
			alert("密码不为空...");
			return false;
		}
		if (nickName=="") {
			alert("昵称不为空...");
			return false;
		}
		if (verifyCode=="") {
			alert("验证码不为空");
			return false;
		}
		var url=getRootPath()+"/userAjax_userRegister.action";
		var args={"userName":userName,"password":password,"nickName":nickName,"verifyCode":verifyCode};
		$.ajax({
			url:url,
			data:args,
			type:"post",
			dataType:"json",
			success:function(data){
				if (data!=null) {
					var data = JSON.parse(data);
					if (data=="ok") {
						window.location.href=getRootPath();
					}else
						alert(data);
					$("#verify").trigger("click");
				}
			},error:function(){
				
			}
		});
	});
	/**
	 * 保存个人信息
	 */
	$("#personalInforsSubmit").click(function() {
		var realName = $("input[name='realName']").val();
		var birth = $("input[name='birth']").val();
		var sex = $("input[name='sex']:checked").val();
		var signature = $("textarea[name='signature']").val();
		var url = "userAjax_saveUserPersonalInfors.do";
		var args={"realName":realName,"birth":birth,"sex":sex,"signature":signature};
		$.ajax({
			url:url,
			data:args,
			type:"post",
			dataType:"json",
			success:function(msg){
				alert(msg)
			},error:function(){
				
			}
		});
		return false;
	});
	/**
	 * 修改密码
	 */
	$("#changePasswordSubmit").click(function() {
		var oldPassword = $("input[name='oldPassword']").val();
		var newPassword = $("input[name='newPassword']").val();
		var confirmPassword = $("input[name='confirmPassword']").val();
		
		var url = "userAjax_changeUserPassword.do";
		var args={"oldPassword":oldPassword,"newPassword":newPassword,"confirmPassword":confirmPassword};
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
			},error:function(){
				
			}
		});
		return false;
	});
	
	/**
	 * 动态赞成
	 */
	$("#approveBtn").click(function() {
		if (user == "") {
			alert("请登录");
			return false;
		}
		var dynamticId = $(this).attr("href");
		var url = "userDynamticAjax_approveUserDynamtic.action";
		var count = $(this).children().text() - 0;
		count++;
		$(this).children().text(count);
		var type = "approve";
		var args={"dynamticId":dynamticId, "count":count, "type":type};
		saveApproveCount(url, args, type);
		return false;
	});
	/**
	 * 动态不赞成
	 */
	$("#notApproveBtn").click(function() {
		if (user == "") {
			alert("请登录");
			return false;
		}
		var dynamticId = $(this).attr("href");
		var url = "userDynamticAjax_approveUserDynamtic.action";
		var count = $(this).children().text() - 0;
		count++;
		$(this).children().text(count);
		var type = "notApprove";
		var args={"dynamticId":dynamticId, "count":count, "type":type};
		saveApproveCount(url, args);
		return false;
	});
	
	function saveApproveCount(url, args, type) {
		$.ajax({
			url:url,
			data:args,
			type:"post",
			dataType:"json",
			success:function(msg){
				alert(msg);
			},error:function(){
				alert("服务器错误");
			}
		});
	}
};
