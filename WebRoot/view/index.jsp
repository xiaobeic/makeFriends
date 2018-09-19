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
	<link  rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap-switch.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/buttons.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrapValidator.css" />
	
	<script src="${pageContext.request.contextPath }/js/wow.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!--<加载bootstrap.min.js之前先加载jquery.min.js-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-switch.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myjs-home.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrapValidator.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myValidator.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myAjax.js"></script>
	<script type="text/javascript">
		new WOW().init();
		getTop();
	</script>
	<!--[if lt IE 9]>	
	    <script src="http://static.sfcdn.org/dep/js/html5shiv.min.js"></script>
	    <script src="http://static.sfcdn.org/dep/js/respond.min.js"></script>
	    <link rel="respond-proxy" id="respond-proxy" href="http://static.sfcdn.org/cross-domain/respond-proxy.html"/>
	    <link rel="respond-redirect" id="respond-redirect" href="/assets/cross-domain/respond.proxy.gif"/>
	    <script src="/assets/cross-domain/respond.proxy.js"></script>
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
					<ul class="nav navbar-nav">
						<li class="active"><a href="${pageContext.request.contextPath }/view/index.jsp">首页</a></li>
						<li><a href="${pageContext.request.contextPath }/interest_getAllInfos.action">社区</a></li>
						<s:if test="#session.user!=null">
							<li><a href="${pageContext.request.contextPath }/user_getMyCollections.do">个人中心</a></li>
							<li><a href="${pageContext.request.contextPath }/view/interestGroup_createInterestGroup.action">创建兴趣小组</a></li>
						</s:if>
						<li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
					</ul>
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
			时间：2015-12-20
			描述：照片墙
		-->
	<!--外围容器div-->
	<br/>
	<br/>
	<div style="background: url(img/background.png);background-position-x:385px;">

		<div class="container-fluid" id="out_nav">
			<!--下面有12个div-->
			<div class="in_div">
				<a href="#">
					<div class="img" style="background-image:url(${pageContext.request.contextPath }/img/life.jpg)"></div>
					<div class="mask">
						<div class="info">
							<h4>感受生活<br/>享受人生</h4>
						</div>
					</div>
					<div class="border"></div>
				</a>
			</div>
			<div class="in_div">
				<a href="#">
					<div class="img" style="background-image:url(${pageContext.request.contextPath }/img/travel.jpg)"></div>
					<div class="mask">
						<div class="info">
							<h4>旅行<br/>走遍天下</h4>
						</div>
					</div>
					<div class="border"></div>
				</a>
			</div>
			<div class="in_div">
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/food.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>美食<br/>小蛋糕</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/sushi.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>感受寿司的美味</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/pizza.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>披萨的美味</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/seafood.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>海鲜</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
			</div>
			<div class="in_div">
				<a href="#">
					<div class="img" style="background-image:url(${pageContext.request.contextPath }/img/literary.jpg)"></div>
					<div class="mask">
						<div class="info">
							<h5>变成一个文艺范</h5>
						</div>
					</div>
					<div class="border"></div>
				</a>
			</div>
			<div class="in_div">
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/christmas.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>圣诞节</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/cat.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>喵~</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/dog.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>汪~</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/cat2.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>唔~</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
			</div>
			<div class="in_div">
				<a href="#">
					<div class="img" style="background-image:url(${pageContext.request.contextPath }/img/fresh.jpg)"></div>
					<div class="mask">
						<div class="info">
							<h4>来点小清新</h4>
						</div>
					</div> 
					<div class="border"></div>
				</a>
			</div>
			
			<div class="in_div">
				<a href="#">
					<div class="img" style="background-image:url(${pageContext.request.contextPath }/img/program.jpg)"></div>
					<div class="mask">
						<div class="info">
							<h4>感受编程的乐趣</h4>
						</div>
					</div>
					<div class="border"></div>
				</a>
			</div>
			<div class="in_div">
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/sao.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>刀剑神域</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/shooter.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>黑岩射手</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/hatsune.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>初音</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/evil.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>罪恶王冠</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
			</div>
			<div class="in_div">
				<a href="#">
					<div class="img" style="background-image:url(${pageContext.request.contextPath }/img/book.jpg)"></div>
					<div class="mask">
						<div class="info">
							<h4>学习新知识</h4>
						</div>
					</div>
					<div class="border"></div>
				</a>
			</div>

			<div class="in_div">
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/crysis.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>孤岛危机</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/lol.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>英雄联盟</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/crisis.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>生化危机</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
				<div class="little_div">
					<a href="#">
						<div class="img_min" style="background-image:url(${pageContext.request.contextPath }/img/needspeed.jpg)"></div>
						<div class="mask_min">
							<div class="info_min">
								<h5>极品飞车</h5>
							</div>
						</div>
						<div class="border_min"></div>
					</a>
				</div>
			</div>
			<div class="in_div">
				<a href="#">
					<div class="img" style="background-image:url(${pageContext.request.contextPath }/img/threelife.jpg)"></div>
					<div class="mask">
						<div class="info">
							<h4>三生三世,十里桃花</h4>
						</div>
					</div>
					<div class="border"></div>
				</a>
			</div>
			<div class="in_div">
				<a href="#">
					<div class="img" style="background-image:url(${pageContext.request.contextPath }/img/tombnote.jpg)"></div>
					<div class="mask">
						<div class="info">
							<h4>南派三叔<br/>盗墓笔记</h4>
						</div>
					</div>
					<div class="border"></div>
				</a>
			</div>

		</div>
	</div>
	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：App下载模块
		-->
	<div class="wow swing" style="align-content:center;width: 99%;" align="center">
		<h2 class="app-text" style="color:#088EF0;font-family:'微软雅黑';font-style:normal;text-shadow:1px 1px 0 #444">手机App，让生活距离更近些</h2>
		<a href="${pageContext.request.contextPath }/app/makefriends.apk" class="button button-glow button-border button-rounded button-primary button-pill">App</a>
	</div>

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：热门兴趣类型
		-->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container-fluid" style="width:1245px;">

		<div class="wow bounceIn hot_div">
			<div class="thumbnail home_imgs">
				<img src="${pageContext.request.contextPath }/img/travel.jpg" class="img-rounded" />
				<div class="caption" align="center">
					<h3><a>旅游</a></h3>
					<p>感受生活</p>
				</div>
			</div>
		</div>

		<div class="wow bounceIn hot_div">
			<div class="thumbnail home_imgs">
				<img src="${pageContext.request.contextPath }/img/food.jpg" class="img-rounded" />
				<div class="caption" align="center">
					<h3><a>美食</a></h3>
					<p>享受美味</p>
				</div>
			</div>
		</div>

		<div class="wow bounceIn hot_div">
			<div class="thumbnail home_imgs">
				<img src="${pageContext.request.contextPath }/img/cat.jpg" class="img-rounded" />
				<div class="caption" align="center">
					<h3><a>萌宠 </a></h3>
					<p>喜欢小动物</p>
				</div>
			</div>
		</div>

		<div class="wow bounceIn hot_div">
			<div class="thumbnail home_imgs">
				<img src="${pageContext.request.contextPath }/img/acg.jpg" class="img-rounded" />
				<div class="caption" align="center">
					<h3><a>动漫</a></h3>
					<p>丰富的动漫角色</p>
				</div>
			</div>
		</div>

		<div class="wow bounceIn hot_div">
			<div class="thumbnail home_imgs">
				<img src="${pageContext.request.contextPath }/img/game.jpg" class="img-rounded" />
				<div class="caption" align="center">
					<h3><a>游戏</a></h3>
					<p>在游戏的世界畅游</p>
				</div>
			</div>
		</div>

		<div class="wow bounceIn hot_div">
			<div class="thumbnail home_imgs">
				<img src="${pageContext.request.contextPath }/img/program.jpg" class="img-rounded" />
				<div class="caption" align="center">
					<h3><a>编程</a></h3>
					<p>对代码的热爱</p>
				</div>
			</div>
		</div>

		<div class="wow bounceIn hot_div">
			<div class="thumbnail home_imgs">
				<img src="${pageContext.request.contextPath }/img/book.jpg" class="img-rounded" />
				<div class="caption" align="center">
					<h3><a>书籍</a></h3>
					<p>不断学习新知识</p>
				</div>
			</div>
		</div>

		<div class="wow bounceIn hot_div">
			<div class="thumbnail home_imgs">
				<img src="${pageContext.request.contextPath }/img/life.jpg" class="img-rounded" />
				<div class="caption" align="center">
					<h3><a>生活</a></h3>
					<p>发现生活新乐趣</p>
				</div>
			</div>
		</div>

	</div>

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：更多
		-->
	<div class="wow bounceInUp" style="align-content:center;" align="center">
		<a href="${pageContext.request.contextPath }/interest_getAllInfos.action" class="button button-glow button-raised button-caution button-pill">更多</a>
	</div>

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：底部制作
		-->
	<br/>
	<br/>
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
