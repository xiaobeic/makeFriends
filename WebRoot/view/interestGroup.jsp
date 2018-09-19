<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="Cache-Control" content="no-transform" />
	<title>寻友</title>
	<meta property="wb:webmaster" content="c65b073df2ffe5a1" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap-switch.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/buttons.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css"></link>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/wysiwyg-editor.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style3.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style2.css">
	<script src="${pageContext.request.contextPath }/js/wow.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-switch.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/wow.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/wysiwyg.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/wysiwyg-editor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myjs-bar.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myAjax.js"></script>
	
	<!-- ueditor配置文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.all.js"></script>
	<script>
		new WOW().init();
		getTop();
		//初试化js的当前user对象
        var user = "${session.user}";
        var userId = "${session.user.id}";
	</script>
</head>

<body style="background-color:#eee;">

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：导航栏
		-->
	<nav class="nav navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="#" class="navbar-brand">
					<img src="${pageContext.request.contextPath }/img/logo.png" style="height: 45px;margin-top: -10px;" />
				</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath }/view/index.jsp">首页</a></li>
					<li class="active"><a href="${pageContext.request.contextPath }/interest_getAllInfos.action">社区</a></li>
					<s:if test="#session.user!=null">
						<li><a href="${pageContext.request.contextPath }/user_getMyCollections.do">个人中心</a></li>
						<li><a href="${pageContext.request.contextPath }/view/interestGroup_createInterestGroup.action">创建兴趣小组</a></li>
					</s:if>
					<li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
				</ul>
				<div class="navbar-form navbar-right">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="请输入关键字" />
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-search"></span>
						</div>
					</div>
					<s:if test="#session.user!=null">
						<div id="login-area" style="height:20px; float: right;margin-left: 15px;">
						<ul class="clearfix logined">

							<li class="set_btn user-card-box">
								<a id="header-avator" class="user-card-item" href="${pageContext.request.contextPath }/user_getMyCollections.do">
									<img src='${pageContext.request.contextPath }/<s:property value="#session.user.head_pic"/>' width='35' height='35' />
									<i class="myspace_remind" style="display: none;"></i>
								</a>
								<div class="g-user-card">
									<div class="card-inner">
										<div class="card-top">
											<img src="${pageContext.request.contextPath }/<s:property value="#session.user.head_pic"/>" alt="<s:property value='#session.user.nickName'/>" class="l">
											<span class="name text-ellipsis"><s:property value="#session.user.nickName"/></span>
											<p class="meta">
												<a href="#">经验<b id="js-user-credit"><s:property value="#session.user.experience"/></b></a>
											</p>
										</div>
										<div class="card-links">
											<a href="${pageContext.request.contextPath }/userDynamtic_seeMyDynamtic.do" class="my-mooc l">我的帖子<i class="dot-update"></i></a>
											<span class="split l"></span>
											<a href="${pageContext.request.contextPath }/user_getMyCollections.do" class="my-sns l">个人中心</a>
										</div>
										<div class="card-sets clearfix">
											<a href="${pageContext.request.contextPath }/user_seeMyAccountSetting.do" class="l">账号设置</a>
											<a href="${pageContext.request.contextPath }/user_logOut.action" class="r">退出</a>
										</div>
									</div>
									<i class="card-arr"></i>
								</div>
							</li>
						</ul>
					</div>
					</s:if>
					<s:else>
						<div class="input-group" style="margin-left:10px;overflow:hidden;">
							<a href="#" id="my-login" class="navbar-link active login-a" data-toggle="modal" data-target="#login-modal">登入</a>
							<span style="color:white;">|</span>
							<a href="#" id="my-register" class="navbar-link login-a" data-toggle="modal" data-target="#login-modal">注册</a>
						</div>
					</s:else>

				</div>
			</div>

		</div>
	</nav>

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：关于模态框
		-->
	<div class="modal fade" id="about-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
						<span class="sr-only">关闭</span></button>
					<h4 class="modal-title" id="modal-label">关于</h4>
				</div>
				<div class="modal-body">
					<p>寻友介绍
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
				</div>
			</div>
		</div>
	</div>

	<!--
        	作者：756048962@qq.com
        	时间：2015-12-22
        	描述：登录注册模态框
       -->
	<div class="modal  fade" id="login-modal">
		<div class="modal-dialog" style="width:330px;">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true" style="font-size:large;" class="glyphicon glyphicon-remove"></span>
						<span class="sr-only">关闭</span>
					</button>
					<!--tab标签-->
					<ul id="mytab" class="nav nav-tabs">
						<li id="mytab_li1">
							<a id="login_a1" href='#xw1' data-toggle='tab'>登录</a>
						</li>
						<li id="mytab_li2">
							<a id="login_a2" href='#xw2' data-toggle='tab'>注册</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade" id="xw1">
							<br>
							<br>
							<div class="container">
								<form id="loginForm" class="form-horizontal" role="form" action="" method="post">
									<div class="form-group">
										<div class="has-feedback form-group-lg" style="width:300px;">
											<input id="loginUserName" name="userName" type="text" class="form-control" placeholder="用户名/email" />
											<span class="glyphicon glyphicon-ok form-control-feedback"></span>
										</div>
									</div>
									<div class="form-group">
										<div class="form-group-lg" style="width:300px;">
											<input id="loginPassword" name="password" type="password" class="form-control" placeholder="密码" />
										</div>
									</div>
									<div class="form-group" style="width: 300px;">
										<div class="switch switch-mini">
											<input id="loginRemberPwd" name="remberPwd" type="checkbox" />
										</div>&nbsp;
										<div style="float: right;width: 220px;">
											<span style="color: #555;float: left;">记住密码</span>
											<a href="#" class="forget-a">忘记密码</a> 
										</div>
									</div>
									<div class="form-group">
										<div style="width:300px;" align="center">
											<span class="button-dropdown  button-dropdown-primary  button-raised">
												    <button type="submit" id="loginSumbit" class="button button-primary button-rounded button-large">登录</button>
												</span>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="tab-pane fade" id="xw2">
							<br>
							<br>
							<div class="container">
								<form id="regForm" action="${pageContext.request.contextPath }/user_register.action" method="post" class="form-horizontal">
									<div class="form-group">
										<div class="has-feedback form-group-lg" style="width:300px;">
											<input id="regUserName" name="userName" type="text" class="form-control" placeholder="用户名/email" />
											<span class="glyphicon glyphicon-ok form-control-feedback"></span>
										</div>
									</div>
									<div class="form-group">
										<div class="form-group-lg" style="width:300px;">
											<input id="regPassword" name="password" type="password" class="form-control" placeholder="密码" />
										</div>
									</div>
									<div class="form-group">
										<div class="has-feedback form-group-lg" style="width:300px;">
											<input id="regNickName" name="nickName" type="text" class="form-control" placeholder="用户昵称" />
											<span class="glyphicon glyphicon-ok form-control-feedback"></span>
										</div>
									</div>
									<div class="form-group">
										<div class="form-group-lg">
											<div style="width:120px;float:left;padding-right:5px;">
												<input id="regVerifyCode" name="verifyCode" type="text" class="form-control" placeholder="验证码" />
											</div>

											<div style="width:70px;float:left;padding-right:40px;">
												<img id="verifyImg" src="${pageContext.request.contextPath }/securityCodeImageAction.action" alt="看不清，换一张" style="cursor:pointer;" alt="验证码" width="80px" height="40px" />
											</div>
											<div style="width:40px;float:left;padding:10px;padding-left:15px;">
												<a id="verify" href="#"><span class="glyphicon glyphicon-repeat"  style="font-size:larger;"></span></a>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div style="width:300px;" align="center">
											<span class="button-dropdown button-dropdown-primary button-raised">
												    <button id="regSumbit" class="button button-primary button-rounded button-large">注册</button>
												</span>
										</div>
									</div>
								</form>
							</div>
						</div>
						<script>
							$('#mytab a[href="#xw1"]').tab('show');
						</script>

					</div>

				</div>
			</div>
		</div>
	</div>
	
	<!--
        	作者：756048962@qq.com
        	时间：2015-12-22
        	描述：动态发表模态框
       -->
    <s:if test="#session.user!=null">
	    <form id="dynamticForm" action="${pageContext.request.contextPath }/userDynamtic_saveDynamtic.action?interestGroupId=<s:property value="#request.interestGroup.id" />" method="post">
			<div class="modal fade" id="edit-modal">
				<div class="modal-dialog modal-content" style="width: 890px;padding-bottom: 20px;">
					<div class="modal-header" style="background-color: #eee;border-radius: 5px;padding: 7px 10px;">
						<span style="font-size: 16px;font-weight: 800;">发表动态</span>
						<span data-dismiss="modal" class="icon-remove" style="float: right;"></span>
					</div>
					<div style="width:860px; margin: 30px auto;font-family: Arial, Verdana;">
						<input id="editorInput" name="dynamticTitle" type="text" class="form-control" placeholder="标题">
						<br/>
						<textarea id="putDynamtic" name="putDynamtic"  placeholder="编辑动态内容"></textarea>
						<a id="publishDynamtic" class="button button-rounded button-raised button-primary button-small" data-dismiss="modal" style="float: right;margin-left: 20px;">发表</a>
						<a href="#" class="button button-rounded button-raised  button-small" data-dismiss="modal" style="float: right;">取消</a>
						<!--上传操作查看myjs-bar.js-->
					</div>
				</div>
			</div>
	    </form>
    </s:if>

	<!--
    	作者：756048962@qq.com
    	时间：2016-03-03
    	描述：贴吧头部
    -->
	<div class="container bar-headdiv">
		<div class="home_imgs wow bounceIn" style="float: left;">
			<img src="${pageContext.request.contextPath }/<s:property value="#request.interestGroup.groupBg"/>" />
		</div>
		<div style="width: 530px;height: 150px;margin-left:290px;margin-top: 110px;">
			<p style="font-size: 35px;font-weight: 600;color: white;font-family: '新宋体';padding-top: 50px;"><s:property value="#request.interestGroup.groupName"/></p>
			<span class="bar-headspan1">
    			<marquee scrollamount="3" onmouseover=this.stop() onmouseout=this.start() >
	    			<s:property value="#request.interestGroup.groupDesc"/>
    			</marquee>
    		</span>
		</div>
		<div class="bar-headdiv2" style="color: #0888E6;margin-top: 40px;float: right;margin-right: 10px;font-size: 17px;">
		    <s:if test="#session.user!=null">
				<a href="#" data-toggle="modal" data-target="#edit-modal" class="button button-rounded button-raised button-primary" style="margin-right: 490px;margin-top: -10px;">
					<span  title="发表" class="icon-edit">&nbsp;发表</span>
				</a>
		    </s:if>
			<span class="glyphicon glyphicon-user right_span1" title="用户数量"><b style="color: #000000;font-size: 15px;"><s:property value="#request.interestGroup.users.size()"/></b></span>&nbsp;&nbsp;&nbsp;
			<span class="glyphicon glyphicon-edit right_span1" title="帖子数量"><b style="color: #000000;font-size: 15px;"><s:property value="#request.interestGroup.userDynamics.size()"/></b></span>&nbsp;&nbsp;&nbsp;
			<s:if test="#request.userLikedInterestGroupIds.contains(#request.interestGroup.id)">
				<span id="<s:property value="#request.interestGroup.id"/>" title="收藏" class="icon-heart icon-large head_span1 head_span2"></span>
			</s:if>
			<s:else>
                <span id="<s:property value="#request.interestGroup.id"/>" title="收藏" class="icon-heart icon-large head_span1 head_span3"></span>
            </s:else>
		</div>
	</div>

	<!--
    	作者：756048962@qq.com
    	时间：2016-03-03
    	描述：贴吧内容
    -->
	<div class="container" style="min-height:220px;width: 900px;margin-top:20px;background-color: white;padding: 0;border-radius: 4px;">
		<div class="post_head"></div>
		<%-- <div class="mypost_div1 wow fadeInUp">
			<a href="${pageContext.request.contextPath }/view/postHome.jsp">
				<span class="mypost_span1">
					<label class="mypost_label" style="background-color: #FF5C69;">置顶</label>
					<label class="mypost_label" style="background-color: #FEA502;">精</label>
					JAVA学习之路：不走弯路，就是捷径JAVA学习之路：不走弯路，就是捷径
				</span>
				<span class="mypost_span2 glyphicon glyphicon-user" title="用户">丨丶恨^y™ </span>
			</a>
		</div>
		<hr class="mymessage_hr1">
		<div class="mypost_div1 wow fadeInUp">
			<a href="${pageContext.request.contextPath }/view/postHome.jsp">
				<span class="mypost_span1">
					<label class="mypost_label" style="background-color: #FF5C69;">置顶</label>
					<label class="mypost_label" style="background-color: #FEA502;">精</label>
					Java企业应用开发框架Spring框架简介
				</span>
				<span class="mypost_span2 glyphicon glyphicon-user" title="用户">丶南木离风南木离风</span>
			</a>
		</div>
		<hr class="mymessage_hr1">
		<div class="mypost_div1 wow fadeInUp">
			<a href="${pageContext.request.contextPath }/view/postHome.jsp">
				<span class="mypost_span1">
					<label class="mypost_label" style="background-color: #FF5C69;">置顶</label>
					<label class="mypost_label" style="background-color: #FEA502;">精</label>
					Java 机器学习 工具 & 库
				</span>
				<span class="mypost_span2 glyphicon glyphicon-user" title="用户">斯人独憔悴!</span>
			</a>
		</div> --%>
		<hr class="mymessage_hr1">
		<s:iterator id="userDynamic" value="#request.userDynamics">
			<div class="mypost_div1  wow fadeInUp">
				<a href="${pageContext.request.contextPath }/userDynamtic_seeUserDynamtic.action?userDynamticId=<s:property value="#userDynamic.id"/>">
				    <s:if test="#userDynamic.Toped == 1">
						<label class="mypost_label" style="background-color: #FF5C69;">置顶</label>
				    </s:if>
				    <s:if test="#userDynamic.Picked == 1">
	                    <label class="mypost_label" style="background-color: #FEA502;">精</label>
				    </s:if>
					<div>
						<span class="mypost_span1"><s:property value="#userDynamic.title" />
						</span>
						<span class="mypost_span2 glyphicon glyphicon-user" title="用户"><s:property value="#userDynamic.user.nickName"/></span>
					</div>
					<!-- 
					<div class="mypost_div3">
						<s:property value="#userDynamic.content" escape="false"/>
					</div>
					 -->
				</a>
				<div class="mypost_div4">
					<span class="mypost_span3"><s:property value="#userDynamic.getPublishTime()"/></span>
					<span class="glyphicon glyphicon-eye-open" title="浏览量"><s:property value="#userDynamic.watchCount" /></span>&nbsp;&nbsp;
					<span class="glyphicon glyphicon-comment" title="帖子数量"><s:property value="#userDynamic.comments.size()" /></span>&nbsp;&nbsp;
				</div>
			</div>
			<hr class="mymessage_hr1">
		</s:iterator>
	</div>
	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：底部制作
		-->
	<br/>
	<br/>
	<footer style="padding: 15px;margin-top:20px;background-color: white;">
		<p align="center">@2015寻友团队</p>
	</footer>

	<!--
        	作者：756048962@qq.com
        	时间：2015-12-21
        	描述：右下角流动框
    -->
	<div id="getTop" class="fixed-btn" style="background: #d0d6d9;-webkit-border-radius: 50%;display: none;">
		<a id="toTop"><span class="glyphicon glyphicon-chevron-up"></span></a>
	</div>
	
	
	<!-- 实例化textArea -->
	<script type="text/javascript">
		var ue = UE.getEditor("putDynamtic");
	</script>
</body>

</html>