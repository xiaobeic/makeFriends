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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css"></link>
	<link href="${pageContext.request.contextPath }/css/bootstrap-switch.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mybs.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/buttons.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/carousel.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style1.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!--<加载bootstrap.min.js之前先加载jquery.min.js-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap-switch.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/carousel.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/wow.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.pin.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myjs-home.js"></script>
		
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myAjax.js"></script>
	
	<script>
		new WOW().init();
		getTop();
		//初试化js的当前user对象
		var user = "${session.user}";
		var userId = "${session.user.id}";
	</script>

	<!--[if lt IE 9]>
	    <script src="http://static.sfcdn.org/dep/js/html5shiv.min.js "></script>
	    <script src="http://static.sfcdn.org/dep/js/respond.min.js "></script>
	    <link rel="respond-proxy " id="respond-proxy " href="http://static.sfcdn.org/cross-domain/respond-proxy.html "/>
	    <link rel="respond-redirect " id="respond-redirect " href="/assets/cross-domain/respond.proxy.gif "/>
	    <script src="/assets/cross-domain/respond.proxy.js "></script>
	<![endif]-->
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

	<br/>
	<br/>
	<!--
        	作者：1120551142@qq.com
        	时间：2015-12-24
        	描述：图片轮播
        -->
	<div class="container" style="width: 1245px;">
		<div class="container J_Poster poster-main">
			<div class="poster-btn poster-prev-btn">
				<a class="left carousel-control" style="width: 100%;"></a>
			</div>
			<div class="poster-btn poster-next-btn">
				<a class="right carousel-control" style="width: 100%;"></a>
			</div>
			<ul class="poster-list">
				<li class="poster-item">
					<a href="${pageContext.request.contextPath }/view/interestGroup.jsp"><img src="${pageContext.request.contextPath }/img/1.jpg" width="100%" height="100%"></a>
				</li>
				<li class="poster-item">
					<a href="${pageContext.request.contextPath }/view/interestGroup.jsp"><img src="${pageContext.request.contextPath }/img/2.jpg" width="100%" height="100%"></a>
				</li>
				<li class="poster-item">
					<a href="${pageContext.request.contextPath }/view/interestGroup.jsp"><img src="${pageContext.request.contextPath }/img/3.jpg" width="100%" height="100%"></a>
				</li>
				<li class="poster-item">
					<a href="${pageContext.request.contextPath }/view/interestGroup.jsp"><img src="${pageContext.request.contextPath }/img/4.jpg" width="100%" height="100%"></a>
				</li>
				<li class="poster-item">
					<a href="${pageContext.request.contextPath }/view/interestGroup.jsp"><img src="${pageContext.request.contextPath }/img/5.jpg" width="100%" height="100%"></a>
				</li>
				<li class="poster-item">
					<a href="${pageContext.request.contextPath }/view/interestGroup.jsp"><img src="${pageContext.request.contextPath }/img/2.jpg" width="100%" height="100%"></a>
				</li>
				<li class="poster-item">
					<a href="${pageContext.request.contextPath }/view/interestGroup.jsp"><img src="${pageContext.request.contextPath }/img/3.jpg" width="100%" height="100%"></a>
				</li>
				<li class="poster-item">
					<a href="${pageContext.request.contextPath }/view/interestGroup.jsp"><img src="${pageContext.request.contextPath }/img/4.jpg" width="100%" height="100%"></a>
				</li>
				<li class="poster-item">
					<a href="${pageContext.request.contextPath }/view/interestGroup.jsp"><img src="${pageContext.request.contextPath }/img/5.jpg" width="100%" height="100%"></a>
				</li>
			</ul>
		</div>
	</div>
	<script>
		$(function() {
			Carousel.init($(".J_Poster"));
		});
	</script>

	<!--
        	作者：1120551142@qq.com
        	时间：2015-12-27
        	描述：中间
        -->
	<div class="container" style="width: 1245px;">
		<div class="middle_left wow fadeIn">
			<div class="pinned panel panel-primary" style="border: #eee;">
				<div class="panel-heading middle_left_head">
					兴趣分类
				</div>
				<s:iterator id="interest" value="#request.list_interest">
					<s:if test="#request.currentInterestName == #interest.interestName">
						<span class="name"><a style="color: red;" href="${pageContext.request.contextPath }/interest_getAllInfos.action?interestId=<s:property value="#interest.id" />"><s:property value="#interest.interestName" /></a></span>
					</s:if>
					<s:else>
						<span class="name"><a href="${pageContext.request.contextPath }/interest_getAllInfos.action?interestId=<s:property value="#interest.id" />"><s:property value="#interest.interestName" /></a></span>
					</s:else>
				</s:iterator>
			</div>
		</div>

		<div class="middle_right">
			<s:iterator id="interestGroup" value="#request.list_interestGroup">
				<div class="right_div rounded wow fadeInUp">
					<h3 class="h3 right_h3"><s:property value="#interestGroup.groupName"/></h3>
					<hr class="right_hr" />
					<div class="right_imgdiv">
						<a href="${pageContext.request.contextPath }/interestGroup_seeInterestGroup.action?interestGroupId=<s:property value='#interestGroup.id'/>"><img class="right_img" src="${pageContext.request.contextPath }/<s:property value='#interestGroup.groupBg'/>" /></a>
					</div>
					<p class="right_p">
						<s:property value="#interestGroup.groupDesc"/>
					</p>
					<div class="right_indiv">
						<span class="glyphicon glyphicon-user right_span1" title="用户数量"><s:property value="#interestGroup.users.size()"/></span>
						<span class="glyphicon glyphicon-edit right_span1" title="帖子数量"><s:property value="#interestGroup.userDynamics.size()"/></span>
						<s:if test="#request.userLikedInterestGroupIds.contains(#interestGroup.id)">
							<span  title="收藏" id="<s:property value="#interestGroup.id"/>" class="icon-heart icon-large right_click right_span1 right_span2"></span>
						</s:if>
						<s:else>
						    <span  title="收藏" id="<s:property value="#interestGroup.id"/>" class="icon-heart icon-large right_click right_span1 right_span3"></span>
						</s:else>
					</div>
				</div>
			</s:iterator>
		</div>
	</div>
	<script>
		$(".pinned").pin({
			containerSelector: ".container",
			minWidth: 1250
		});
	</script>

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：底部制作
	-->
	<footer style="padding: 15px;margin-top: 20px;background-color: white;">
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
</body>

</html>