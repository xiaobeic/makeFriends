<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/buttons.css" />
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
					<li class="active"><a href="${pageContext.request.contextPath }/view/index.jsp">首页</a></li>
					<li><a href="${pageContext.request.contextPath }/interest_getAllInfos.action">社区</a></li>
					<li class="active"><a href="${pageContext.request.contextPath }/view/personaCenter.jsp">个人中心</a></li>
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
					<a href="${pageContext.request.contextPath }/user_getMyCollections.do" title="我的收藏"><span class="icon-heart icon-large"></span></a>
					<a href="${pageContext.request.contextPath }/view/myMessages.jsp" title="我的消息"><span class="icon-envelope-alt icon-large"></span></a>
					<a href="${pageContext.request.contextPath }/user_seeMyAccountSetting.do" title="账号设置"><span class="icon-cog icon-large"></span></a>
				</div>
			</div>
			<div class="middle_left_bottom">
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/user_getMyCollections.do"><span class="icon-heart">&nbsp;我的收藏</span></a>
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
				<div class="bottom_div" style="background-color: #337AB7;">
					<p style="color: white;">
						<a href="#" style="color: white;"><span class="icon-envelope">&nbsp;我的消息</span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="icon-chevron-right"></span>
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
				</div>
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/user_seeMyAccountSetting.do"><span class="icon-cog">&nbsp;账号设置</span></a>
					</p>
				</div>
			</div>
		</div>

		<div class="middle_right">
			<div class="row col-md-10">
				<ul id="mytab" class="nav nav-tabs">
					<li class="active">
						<a href='#xw1' data-toggle='tab'>我的回复</a>
					</li>
					<li>
						<a href='#xw2' data-toggle='tab'>我的私信</a>
					</li>
					<li>
						<a href='#xw3' data-toggle='tab'>系统消息</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade in active middleDiv" id="xw1">
						<div class="mymessage_div1 myme_div">
							<div class="mymessage_div2">
								<a href="#">
									<span class="mymessage_span1">
										一个人的世界:
									</span>
									<span class="mymessage_span2">
										我试过好几次四五点打，但大家貌似都知道要这个点打，结果匹配的全是玩家没有机器人我感觉中午或者下午，大家都在上课上学那会反而机器人多点。
									</span>
								</a>
							</div>
							<div class="mymessage_div3">
								<span class="mymessage_span3">回复帖子:</span>
								<span class="mymessage_span5">
									&nbsp;飞车什么时候匹配好飞车什
									<i class="icon-angle-right">&nbsp;&nbsp;飞车网游吧</i>
								</span>
								<span class="mymessage_span4">2016-01-10 12:25:45</span>
							</div>
							<div class="mymessage_div4">
								<button class="button button-primary button-rounded button-tiny">回复</button>
								<button class="button button-rounded button-primary button-tiny">忽略</button>
							</div>
						</div>
						<hr class="mymessage_hr1">
						<div class="mymessage_div1 myme_div">
							<div class="mymessage_div2">
								<a href="#">
									<span class="mymessage_span1">
										谁是谁的谁:
									</span>
									<span class="mymessage_span2">
										额 那个时间段我还在梦游吧 我又是安卓系统
									</span>
								</a>
							</div>
							<div class="mymessage_div3">
								<span class="mymessage_span3">回复帖子:</span>
								<span class="mymessage_span5">
									&nbsp;再也受不了千层塔了，玩法本身就是BUG
									<i class="icon-angle-right">&nbsp;&nbsp;花千骨手游吧</i>
								</span>
								<span class="mymessage_span4">2015-12-10 05:55:44</span>
							</div>
							<div class="mymessage_div4">
								<button class="button button-primary button-rounded button-tiny">回复</button>
								<button class="button button-rounded button-primary button-tiny">忽略</button>
							</div>
						</div>
						<hr class="mymessage_hr1">
							<div class="mymessage_div1 myme_div">
							<div class="mymessage_div2">
								<a href="#">
									<span class="mymessage_span1">
										拽不住的年华:
									</span>
									<span class="mymessage_span2">
										我说的机器是死人，那你运气太差
									</span>
								</a>
							</div>
							<div class="mymessage_div3">
								<span class="mymessage_span3">回复帖子:</span>
								<span class="mymessage_span5">
									&nbsp;再也受不了千层塔了，玩法本身就是BUG
									<i class="icon-angle-right">&nbsp;&nbsp;飞车网游吧</i>
								</span>
								<span class="mymessage_span4">2006-11-05 10:20:24</span>
							</div>
							<div class="mymessage_div4">
								<button class="button button-primary button-rounded button-tiny">回复</button>
								<button class="button button-rounded button-primary button-tiny">忽略</button>
							</div>
						</div>
						<hr class="mymessage_hr1">
					</div>
					<div class="tab-pane fade middleDiv" id="xw2">
						<div class="middle_right_div5 myme_div1">
							<div class="middle_right_div7">
								<a href="#"><img src="${pageContext.request.contextPath }/img/e.jpg" class="middle_right_img" /></a>
							</div>
							<div class="middle_right_div6">
								<a href="#">
									<span class="middle_right_span6">一个人的世界</span>
								</a>
								<span class="nav-counter">99</span>
								<br />
								<br />
								<span class="middle_right_span">你在干嘛哪！吃饭了某？约不约？电影看电影去吧？听说那啥不错</span>
							</div>
							<div class="middle_right_di8">
								<a href="#" title="忽略"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="回复"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">
						<div class="middle_right_div5  myme_div1">
							<div  class="middle_right_div7">
								<a href="#"><img src="${pageContext.request.contextPath }/img/a.jpg" class="middle_right_img" /></a>
							</div>
							<div class="middle_right_div6">
								<a href="#">
									<span class="middle_right_span6">ั 夜深了ޓ 。</span>
								</a>
								<span class="nav-counter">22</span>
								<br />
								<br />
								<span class="middle_right_span">吃饭了某？约不约？</span>
							</div>
							<div class="middle_right_di8">
								<a href="#" title="忽略"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="回复"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">
						<div class="middle_right_div5  myme_div1">
							<div  class="middle_right_div7">
								<a href="#"><img src="${pageContext.request.contextPath }/<s:property value="#session.user.head_pic"/>" class="middle_right_img" /></a>
							</div>
							<div class="middle_right_div6">
								<a href="#">
									<span class="middle_right_span6">拽不住的年华</span>
								</a>
								<span class="nav-counter">9</span>
								<br />
								<br />
								<span class="middle_right_span">电影看电影去吧？听说那啥不错</span>
							</div>
							<div class="middle_right_di8">
								<a href="#" title="忽略"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="回复"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">
						<div class="middle_right_div5  myme_div1">
							<div  class="middle_right_div7">
								<a href="#"><img src="${pageContext.request.contextPath }/img/h.jpg" class="middle_right_img" /></a>
							</div>
							<div class="middle_right_div6">
								<a href="#">
									<span class="middle_right_span6">♚李家ぃ相公</span>
								</a>
								<span class="nav-counter">59</span>
								<br />
								<br />
								<span class="middle_right_span">你在干嘛哪！听说那啥不错</span>
							</div>
							<div class="middle_right_di8">
								<a href="#" title="忽略"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="回复"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">
					</div>
					<div class="tab-pane fade middleDiv" id="xw3">
						<div>
							<div  class="SysMess_div1">
								<span><a class="icon-bell-alt"></a>&nbsp;系统通知</span>
								<span><a href="#" class="icon-chevron-down" style="margin:5px 10px;float: right;"></a></span>
								<span class="SysMess_span1">2015-10-30 10:58:55</span>
							</div>
							<div  class="SysMess_div2 wow">
								新处罚：您被吧务封禁，封禁理由为：发布广告帖、交易帖、等违规信息，给予封禁处罚。
								<br />
								<br />
								<a class="icon-trash icon-large" style="margin: 10px;float: right;"></a>
							</div>
						</div>
						<div>
							<div  class="SysMess_div1">
								<span><a class="icon-bell-alt"></a>&nbsp;系统通知</span>
								<span><a href="#"  class="icon-chevron-down" style="margin:5px 10px;float: right;"></a></span>
								<span class="SysMess_span1">2014-10-20 09:48:25</span>
							</div>
							<div  class="SysMess_div2 wow">
								新处罚：您被吧务封禁，封禁理由为：发布广告帖、交易帖、等违规信息，给予封禁处罚。
								<br />
								<br />
								<a class="icon-trash icon-large" style="margin: 10px;float: right;"></a>
							</div>
						</div>
						<div>
							<div class="SysMess_div1">
								<span><a class="icon-bell-alt"></a>&nbsp;系统通知</span>
								<span><a href="#"  class="icon-chevron-down" style="margin:5px 10px;float: right;"></a></span>
								<span class="SysMess_span1">2015-03-30 10:58:55</span>
							</div>
							<div class="SysMess_div2 wow">
								新处罚：您被吧务封禁，封禁理由为：发布广告帖、交易帖、等违规信息，给予封禁处罚。
								<br />
								<br />
								<a class="icon-trash icon-large" style="margin: 10px;float: right;"></a>
							</div>
						</div>
						<div>
							<div class="SysMess_div1">
								<span><a class="icon-bell-alt"></a>&nbsp;系统通知</span>
								<span><a href="#" class="icon-chevron-down" style="margin:5px 10px;float: right;"></a></span>
								<span class="SysMess_span1">2005-10-02 10:08:25</span>
							</div>
							<div class="SysMess_div2 wow">
								新处罚：您被吧务封禁，封禁理由为：发布广告帖、交易帖、等违规信息，给予封禁处罚。
								<br />
								<br />
								<a class="icon-trash icon-large" style="margin: 10px;float: right;"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
		<a id="toTop" style="margin-left: 6px;"><span class="glyphicon glyphicon-chevron-up"></span></a>
	</div>

</body>

</html>