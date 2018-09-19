<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="/struts-tags" prefix="s" %>
<!doctype html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="Cache-Control" content="no-transform" />
	<title>寻友</title>
	<meta property="wb:webmaster" content="c65b073df2ffe5a1" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css"></link>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style2.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!--<加载bootstrap.min.js之前先加载jquery.min.js-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/wow.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myjs-person.js"></script>
	
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
					<li><a href="${pageContext.request.contextPath }/interest_getAllInfos.action">社区</a></li>
					<li class="active"><a href="${pageContext.request.contextPath }/user_getMyCollections.do">个人中心</a></li>
					<li><a href="${pageContext.request.contextPath }/view/interestGroup_createInterestGroup.action">创建兴趣小组</a></li>
					<li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
				</ul>
				<div class="navbar-form navbar-right">
					<div class="input-group" style="float: left;">
						<input type="text" class="form-control" placeholder="请输入关键字" />
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-search"></span>
						</div>
					</div>
					<!-- 作者：756048962@qq.com 时间：2016-01-19 描述：登入后状态 -->
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
			描述：关于
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
    	时间：2016-01-21
    	描述：个人中心所关注的交流圈內容
    -->
	<div class="container" style="width: 1245px;margin-top:50px;">
		<div class="middle_left">
			<div class="middle_left_top">
				<img src="${pageContext.request.contextPath }/<s:property value="#session.user.head_pic"/>" />
				<div class="divspan1">
					<span><s:property value="#session.user.nickName"/></span>
				</div>
				<div class="divspan2">
					<span><marquee scrollamount="3" onmouseover=this.stop() onmouseout=this.start() ><s:property value="#session.user.signature"/></marquee></span>
				</div>
				<div style="margin-top: 0;margin-bottom: 10px;">
					<a href="#" style="margin-left: 10px;margin-right: 40px;">经验:<b id="js-user-credit"><s:property value="#session.user.experience"/></b></a>
					<a href="#" title="我的收藏"><span class="icon-heart icon-large"></span></a>
					<%-- <a href="${pageContext.request.contextPath }/view/myMessages.jsp" title="我的消息"><span class="icon-envelope-alt icon-large"></span></a> --%>
					<a href="${pageContext.request.contextPath }/user_seeMyAccountSetting.do" title="账户设置"><span class="icon-cog icon-large"></span></a>
				</div>
			</div>
			<div class="middle_left_bottom">
				<div class="bottom_div" style="background-color: #337AB7;">
					<p style="color: white;">
						<a href="#" style="color: white;"><span class="icon-heart">&nbsp;我的收藏</span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="icon-chevron-right"></span>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/user_seeMyGroups.do"><span class="icon-bookmark">&nbsp;&nbsp;我的吧台</span></a>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/userDynamtic_seeMyDynamtic.do"><span class="icon-tags">&nbsp;我的帖子</span></a>
					</p>
				</div>
				<%-- <div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/view/myMessages.jsp"><span class="icon-envelope">&nbsp;我的消息</span></a>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/view/myFriends.jsp"><span class="icon-comments">&nbsp;我的好友</span></a>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/view/myPhotos.jsp"><span class="icon-camera-retro">&nbsp;我的相册</span></a>
					</p>
				</div> --%>
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/user_seeMyAccountSetting.do"><span class="icon-cog">&nbsp;账号设置</span></a>
					</p>
				</div>
			</div>
		</div>

		<div class="middle_right">
			<div>
				<h3 style="color: #000000;margin-top: 0;">我的收藏</h3>
			</div>
			<hr class="middle_right_hr">
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
						<span title="收藏" id="<s:property value="#interestGroup.id"/>" class="icon-heart icon-large right_click right_span1 right_span2"  name="myColloectionId"></span>
					</div>
				</div>
			</s:iterator>
			
		</div>
	</div>

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：底部制作
		-->

	<br/>
	<br/>
	<footer  style="padding: 15px;margin-top: 20px;background-color: white;">
		<p align="center">@2015寻友团队</p>
	</footer>
	
	<!--
        	作者：756048962@qq.com
        	时间：2015-12-21
        	描述：右下角流动框
        -->
	<div id="getTop" class="fixed-btn" style="background: #d0d6d9;-webkit-border-radius: 50%;display: none;">
		<a id="toTop" style="margin-left: 6px;"><span class="glyphicon glyphicon-chevron-up"></span></a>
	</div>
</body>

</html>