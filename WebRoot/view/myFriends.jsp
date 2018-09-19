<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
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
					<span><marquee scrollamount="3" onmouseover=this.stop() onmouseout=this.start()><s:property value="#session.user.signature"/></marquee></span>
				</div>
				<div style="margin-top: 0;margin-bottom: 10px;">
					<a href="#" style="margin-left: 10px;margin-right: 40px;">经验:<b id="js-user-credit"><s:property value="#session.user.experience"/></b></a>
					<a href="${pageContext.request.contextPath }/user_getMyCollections.do" title="我的收藏"><span class="icon-heart icon-large"></span></a>
					<%-- <a href="${pageContext.request.contextPath }/view/myMessages.jsp" title="我的消息"><span class="icon-envelope-alt icon-large"></span></a> --%>
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
						<a href="${pageContext.request.contextPath }/view/myGroups.jsp"><span class="icon-bookmark">&nbsp;我的吧台</span></a>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/userDynamtic_seeMyDynamtic.do"><span class="icon-tags">&nbsp;我的帖子</span></a>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/view/myMessages.jsp"><span class="icon-envelope">&nbsp;我的消息</span></a>
					</p>
				</div>
				<div class="bottom_div" style="background-color: #337AB7;">
					<p style="color: white;">
						<a href="#" style="color: white;"><span class="icon-comments">&nbsp;我的好友</span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="icon-chevron-right"></span>
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
			<div class="row col-md-12">
				<ul id="mytab" class="nav nav-tabs">
					<li class="active">
						<a href='#xw1' data-toggle='tab'>我的好友</a>
					</li>
					<li>
						<a href='#xw2' data-toggle='tab'>寻找好友</a>
					</li>
					<li>
						<a href='#xw3' data-toggle='tab'>好友申请</a>
					</li>
				</ul>
				<div class="tab-content">

					<!--我的好友列表-->
					<div class="tab-pane fade in active middleDiv" id="xw1">
						<div class="middle_right_div5 myme_div1">
							<div style="float: left;">
								<a href="#"><img src="${pageContext.request.contextPath }/img/e.jpg" class="middle_right_img"/></a>
							</div>
							<div class="middle_right_div6">
								<a href="#"><span class="middle_right_span6">一个人的世界</span></a>
								<br />
								<br />
								<span class="middle_right_span" title="个性签名：就算是最痛苦的时刻也不能放弃学习.">就算是最痛苦的时刻也不能放弃学习！</span>
							</div>
							<div  class="middle_right_di8">
								<a href="#" title="解除关系"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="聊天"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">
						<div class="middle_right_div5 myme_div1">
							<div style="float: left;">
								<a href="#"><img src="${pageContext.request.contextPath }/img/a.jpg" class="middle_right_img" /></a>
							</div>
							<div class="middle_right_div6">
								<a href="#"><span class="middle_right_span6">流年、不夏半伤</span></a>
								<br />
								<br />
								<span class="middle_right_span" title="个性签名：有技巧是好事，卖弄技巧就是轻浮、心术不正。">有技巧是好事，卖弄技巧就是轻浮、心术不正。</span>
							</div>
							<div  class="middle_right_di8">
								<a href="#" title="解除关系"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="聊天"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">
						<div class="middle_right_div5 myme_div1">
							<div style="float: left;">
								<a href="#"><img src="${pageContext.request.contextPath }/img/b.jpg" class="middle_right_img" /></a>
							</div>
							<div class="middle_right_div6">
								<a href="#"><span class="middle_right_span6">Vincent、</span></a>
								<br />
								<br />
								<span class="middle_right_span" title="个性签名：爱是给予，所以永远不会失去。——泰戈尔.">爱是给予，所以永远不会失去。——泰戈尔.</span>
							</div>
							<div  class="middle_right_di8">
								<a href="#" title="解除关系"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="聊天"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">
						<div class="middle_right_div5 myme_div1">
							<div style="float: left;">
								<a href="#"><img src="${pageContext.request.contextPath }/img/c.jpg" class="middle_right_img" /></a>
							</div>
							<div class="middle_right_div6">
								<a href="#"><span class="middle_right_span6">花样年华</span></a>
								<br />
								<br />
								<span class="middle_right_span" title="个性签名：戒不掉的是习惯，不是戒不掉尼古丁。">戒不掉的是习惯，不是戒不掉尼古丁。.</span>
							</div>
							<div  class="middle_right_di8">
								<a href="#" title="解除关系"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="聊天"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">
						<div class="middle_right_div5 myme_div1">
							<div style="float: left;">
								<a href="#"><img src="${pageContext.request.contextPath }/img/d.jpg" class="middle_right_img" /></a>
							</div>
							<div class="middle_right_div6">
								<a href="#"><span class="middle_right_span6">初夏</span></a>
								<br />
								<br />
								<span class="middle_right_span" title="个性签名：糟糕的诗歌都源于真情实感。">糟糕的诗歌都源于真情实感。</span>
							</div>
							<div  class="middle_right_di8">
								<a href="#" title="解除关系"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="聊天"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">
						<div class="middle_right_div5 myme_div1">
							<div style="float: left;">
								<a href="#"><img src="${pageContext.request.contextPath }/img/e.jpg" class="middle_right_img" /></a>
							</div>
							<div class="middle_right_div6">
								<a href="#"><span class="middle_right_span6">家有萌小子</span></a>
								<br />
								<br />
								<span class="middle_right_span" title="个性签名：戴上面具承受这个世界，只将内心的纯真幼稚留给你。">戴上面具承受这个世界，只将内心的纯真幼稚留给你。</span>
							</div>
							<div  class="middle_right_di8">
								<a href="#" title="解除关系"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="聊天"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">
						<div class="middle_right_div5 myme_div1">
							<div style="float: left;">
								<a href="#"><img src="${pageContext.request.contextPath }/img/f.jpg" class="middle_right_img" /></a>
							</div>
							<div class="middle_right_div6">
								<a href="#"><span class="middle_right_span6">不酷、不酷</span></a>
								<br />
								<br />
								<span class="middle_right_span" title="个性签名：Io ti penso amore Quando il bagliore del sole Risplende sul mare">
									Io ti penso amore Quando il bagliore del sole Risplende sul mare
								</span>
							</div>
							<div  class="middle_right_di8">
								<a href="#" title="解除关系"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="聊天"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">
						<div class="middle_right_div5 myme_div1">
							<div style="float: left;">
								<a href="#"><img src="${pageContext.request.contextPath }/<s:property value="#session.user.head_pic"/>" class="middle_right_img" /></a>
							</div>
							<div class="middle_right_div6">
								<a href="#"><span class="middle_right_span6">永远、太遥远</span></a>
								<br />
								<br />
								<span class="middle_right_span" title="个性签名：我轻轻的看着你，你柔柔的注视着我……">我轻轻的看着你，你柔柔的注视着我……</span>
							</div>
							<div  class="middle_right_di8">
								<a href="#" title="解除关系"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="聊天"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">
						<div class="middle_right_div5 myme_div1">
							<div style="float: left;">
								<a href="#"><img src="${pageContext.request.contextPath }/img/h.jpg" class="middle_right_img" /></a>
							</div>
							<div class="middle_right_div6">
								<a href="#"><span class="middle_right_span6">见、城凉</span></a>
								<br />
								<br />
								<span class="middle_right_span" title="个性签名：为什么都喜欢得不到的人，因为人人都入戏。">为什么都喜欢得不到的人，因为人人都入戏。</span>
							</div>
							<div  class="middle_right_di8">
								<a href="#" title="解除关系"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="聊天"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">
						<div class="middle_right_div5 myme_div1">
							<div style="float: left;">
								<a href="#"><img src="${pageContext.request.contextPath }/img/i.jpg" class="middle_right_img" /></a>
							</div>
							<div class="middle_right_div6">
								<a href="#"><span class="middle_right_span6">————————冷寂</span></a>
								<br />
								<br />
								<span class="middle_right_span" title="个性签名：“单纯”和“简单”是完全不同的两码事.">“单纯”和“简单”是完全不同的两码事</span>
							</div>
							<div  class="middle_right_di8">
								<a href="#" title="解除关系"><span class=" icon-remove-sign icon-large"></span></a>
								<br />
								<br />
								<a href="#" title="聊天"><span class="icon-comment icon-large"></span></a>
							</div>
						</div>
						<hr class="middle_right_hr2">

					</div>
					<div class="tab-pane fade middleDiv" id="xw2">
						<!--好友搜索div-->
						<div style="width: 700px;height: 100px;">
							<form class="form-group" action="#" method="post">
								<div class="col-md-9">
									<div class="form-group-lg col-md-12" align="center">
										<input type="text" class="form-control" placeholder="请输入账号/昵称/关键字" maxlength="20" />
									</div>
									<div class="form-inline col-md-12" align="center" style="margin-top:5px;">
										<select id="s_province" class="form-control" name="s_province" style="margin-right: 3px;"></select>
										<select id="s_city" class="form-control" name="s_city" style="margin-right: 3px;"></select>
										<select id="s_sex" class="form-control" name="s_sex" value="sss" style="margin-right: 3px;">
											<option value="">性别</option>
											<option value="男">男</option>
											<option value="女">女</option>
										</select>
										<select id="s_age" class="form-control" name="s_age" style="margin-right: 3px;">
											<option value="">年龄</option>
											<option value="">18以下</option>
											<option value="">18~22</option>
											<option value="">23~27</option>
											<option value="">28~32</option>
											<option value="">33~38</option>
											<option value="">38以上</option>
										</select>
									</div>
									<script class="resources library" src="${pageContext.request.contextPath }/js/area.js" type="text/javascript"></script>
									<script type="text/javascript">
										_init_area();
									</script>
								</div>
								<div class="col-md-3" style="padding: 0;margin-top: 25px;">
									<div class="form-group">
										<button type="submit" class="button button-raised button-glow button-primary button-rounded"><i class="icon-search">查找</i></button>
									</div>
								</div>
							</form>
						</div>

						<!--添加好友搜索结果-->
						<div class="container" style="width: 720px;height: auto;margin-top: 10px;">
							<div style="height: 25px;">
								<p>搜索结果</p>
								<hr class="middle_right_hr3" />
							</div>
							<!--
                            	作者：756048962@qq.com
                            	时间：2016-01-25
                            	描述：Ajax动态添加部分
                            -->
							<div class="container" style="width: 720px;">
								<div class="middle_right_div1">
									<div style="float: left;">
										<a href="#"><img src="${pageContext.request.contextPath }/img/h.jpg" class="middle_right_img" /></a>
									</div>
									<div class="middle_right_div3">
										<a href="#"><span class="middle_right_span2" title="见、城凉">见、城凉</span></a>
										<br />
										<span class="middle_right_span3">河南&nbsp;周口&nbsp;|&nbsp;22岁</span>
										<br />
										<button class="button button-primary button-rounded button-tiny"><i class="icon-plus">&nbsp;好友</i></button>
									</div>
								</div>
								<div class="middle_right_div1">
									<div style="float: left;">
										<a href="#"><img src="${pageContext.request.contextPath }/img/a.jpg" class="middle_right_img" /></a>
									</div>
									<div class="middle_right_div3">
										<a href="#"><span class="middle_right_span2" title="〆少年゜Lonely ▍">〆少年゜Lonely ▍</span></a>
										<br />
										<span class="middle_right_span3">河南&nbsp;漯河&nbsp;|&nbsp;33岁</span>
										<br />
										<button class="button button-primary button-rounded button-tiny"><i class="icon-plus">&nbsp;好友</i></button>
									</div>
								</div>
								<div class="middle_right_div1">
									<div style="float: left;">
										<a href="#"><img src="${pageContext.request.contextPath }/img/b.jpg" class="middle_right_img" /></a>
									</div>
									<div class="middle_right_div3">
										<a href="#"><span class="middle_right_span2" title="旋律只为你而演绎">旋律只为你而演绎</span></a>
										<br />
										<span class="middle_right_span3">河南&nbsp;平顶山&nbsp;|&nbsp;12岁</span>
										<br />
										<button class="button button-primary button-rounded button-tiny"><i class="icon-plus">&nbsp;好友</i></button>
									</div>
								</div>
								<div class="middle_right_div1">
									<div style="float: left;">
										<a href="#"><img src="${pageContext.request.contextPath }/img/c.jpg" class="middle_right_img" /></a>
									</div>
									<div class="middle_right_div3">
										<a href="#"><span class="middle_right_span2" title="ε 溴尒ふ з">ε 溴尒ふ з</span></a>
										<br />
										<span class="middle_right_span3">河南&nbsp;许昌&nbsp;|&nbsp;25岁</span>
										<br />
										<button class="button button-primary button-rounded button-tiny"><i class="icon-plus">&nbsp;好友</i></button>
									</div>
								</div>
								<div class="middle_right_div1">
									<div style="float: left;">
										<a href="#"><img src="${pageContext.request.contextPath }/img/d.jpg" class="middle_right_img" /></a>
									</div>
									<div class="middle_right_div3">
										<a href="#"><span class="middle_right_span2" title="我把心喂了狗~">我把心喂了狗~</span></a>
										<br />
										<span class="middle_right_span3">河南&nbsp;商丘&nbsp;|&nbsp;24岁</span>
										<br />
										<button class="button button-primary button-rounded button-tiny"><i class="icon-plus">&nbsp;好友</i></button>
									</div>
								</div>
								<div class="middle_right_div1">
									<div style="float: left;">
										<a href="#"><img src="${pageContext.request.contextPath }/img/e.jpg" class="middle_right_img" /></a>
									</div>
									<div class="middle_right_div3">
										<a href="#"><span class="middle_right_span2" title="漫步、人生路">漫步、人生路</span></a>
										<br />
										<span class="middle_right_span3">河南&nbsp;洛阳&nbsp;|&nbsp;28岁</span>
										<br />
										<button class="button button-primary button-rounded button-tiny"><i class="icon-plus">&nbsp;好友</i></button>
									</div>
								</div>
								<div class="middle_right_div1">
									<div style="float: left;">
										<a href="#"><img src="${pageContext.request.contextPath }/img/i.jpg" class="middle_right_img" /></a>
									</div>
									<div class="middle_right_div3">
										<a href="#"><span class="middle_right_span2" title="左耳近心°">左耳近心°</span></a>
										<br />
										<span class="middle_right_span3">河南&nbsp;开封&nbsp;|&nbsp;18岁</span>
										<br />
										<button class="button button-primary button-rounded button-tiny"><i class="icon-plus">&nbsp;好友</i></button>
									</div>
								</div>
							</div>
						</div>

						<!--添加好友，可能认识的好友推荐-->
						<div class="container" style="width: 720px;margin-top: 40px;">
							<div style="height: 25px;">
								<p>可能认识的人</p>
								<hr class="middle_right_hr3" style="left: 50px;" />
							</div>
							<!--
                            	作者：756048962@qq.com
                            	时间：2016-01-25
                            	描述：Ajax动态添加部分
                            -->
							<div class="container" style="width: 720px;">
								<div class="middle_right_div1">
									<div style="float: left;">
										<a href="#"><img src="${pageContext.request.contextPath }/img/j.jpg" class="middle_right_img" /></a>
									</div>
									<div class="middle_right_div3">
										<a href="#"><span class="middle_right_span2" title="丨丶恨^y™">丨丶恨^y™</span></a>
										<br />
										<span class="middle_right_span3">河北&nbsp;石家庄&nbsp;|&nbsp;27岁</span>
										<br />
										<button class="button button-primary button-rounded button-tiny"><i class="icon-plus">&nbsp;好友</i></button>
									</div>
								</div>
								<div class="middle_right_div1">
									<div style="float: left;">
										<a href="#"><img src="${pageContext.request.contextPath }/img/k.jpg" class="middle_right_img" /></a>
									</div>
									<div class="middle_right_div3">
										<a href="#"><span class="middle_right_span2" title="〆少年゜Lonely ▍">〆少年゜Lonely ▍</span></a>
										<br />
										<span class="middle_right_span3">河南&nbsp;漯河&nbsp;|&nbsp;37岁</span>
										<br />
										<button class="button button-primary button-rounded button-tiny"><i class="icon-plus">&nbsp;好友</i></button>
									</div>
								</div>
								<div class="middle_right_div1">
									<div style="float: left;">
										<a href="#"><img src="${pageContext.request.contextPath }/img/b.jpg" class="middle_right_img" /></a>
									</div>
									<div class="middle_right_div3">
										<a href="#"><span class="middle_right_span2" title="雪*夜*飞">雪*夜*飞</span></a>
										<br />
										<span class="middle_right_span3">河北&nbsp;保定&nbsp;|&nbsp;12岁</span>
										<br />
										<button class="button button-primary button-rounded button-tiny"><i class="icon-plus">&nbsp;好友</i></button>
									</div>
								</div>
								<div class="middle_right_div1">
									<div style="float: left;">
										<a href="#"><img src="${pageContext.request.contextPath }/img/i.jpg" class="middle_right_img" /></a>
									</div>
									<div class="middle_right_div3">
										<a href="#"><span class="middle_right_span2" title="嘴角、呐抹倔强的微笑っ">嘴角、呐抹倔强的微笑っ</span></a>
										<br />
										<span class="middle_right_span3">河南&nbsp;许昌&nbsp;|&nbsp;25岁</span>
										<br />
										<button class="button button-primary button-rounded button-tiny"><i class="icon-plus">&nbsp;好友</i></button>
									</div>
								</div>
								<div class="middle_right_div1">
									<div style="float: left;">
										<a href="#"><img src="${pageContext.request.contextPath }/img/c.jpg" class="middle_right_img" /></a>
									</div>
									<div class="middle_right_div3">
										<a href="#"><span class="middle_right_span2" title="╭゜我的高傲，尔等岂懂~">╭゜我的高傲，尔等岂懂~</span></a>
										<br />
										<span class="middle_right_span3">河北&nbsp;张家口&nbsp;|&nbsp;24岁</span>
										<br />
										<button class="button button-primary button-rounded button-tiny"><i class="icon-plus">&nbsp;好友</i></button>
									</div>
								</div>
								<div class="middle_right_div1">
									<div style="float: left;">
										<a href="#"><img src="${pageContext.request.contextPath }/img/d.jpg" class="middle_right_img" /></a>
									</div>
									<div class="middle_right_div3">
										<a href="#"><span class="middle_right_span2" title="丶南木离风">丶南木离风</span></a>
										<br />
										<span class="middle_right_span3">河南&nbsp;洛阳&nbsp;|&nbsp;28岁</span>
										<br />
										<button class="button button-primary button-rounded button-tiny"><i class="icon-plus">&nbsp;好友</i></button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade middleDiv" id="xw3">
						<!--
                        	作者：756048962@qq.com
                        	时间：2016-01-25
                        	描述：ajax动态添加好友申请
                        -->
						<div class="container" style="width:90%;">
							<div class="middle_right_div2">
								<div style="float: left;">
									<a href="#"><img src="${pageContext.request.contextPath }/img/b.jpg" class="middle_right_img" /></a>
								</div>
								<div class="middle_right_div3">
									<a href="#"><span class="middle_right_span4" title="丶南木离风">丶南木离风南木离风</span></a>
									<br />
									<span class="middle_right_span5">河南&nbsp;洛阳&nbsp;|&nbsp;28岁</span>
								</div>
								<div class="middle_right_div4">
									<button class="button button-border button-rounded button-primary button-tiny">忽略</button>
									<br /><br />
									<button class="button button-primary button-rounded button-tiny">同意</button>
								</div>
							</div>
							<hr class="middle_right_hr2">
							<div class="middle_right_div2">
								<div style="float: left;">
									<a href="#"><img src="${pageContext.request.contextPath }/img/k.jpg" class="middle_right_img" /></a>
								</div>
								<div class="middle_right_div3">
									<a href="#"><span class="middle_right_span4" title="不寂寞的‘燕">不寂寞的‘燕</span></a>
									<br />
									<span class="middle_right_span5">河南&nbsp;郑州&nbsp;|&nbsp;21岁</span>
								</div>
								<div class="middle_right_div4">
									<button class="button button-border button-rounded button-primary button-tiny">忽略</button>
									<br /><br />
									<button class="button button-primary button-rounded button-tiny">同意</button>
								</div>
							</div>
							<hr class="middle_right_hr2">
								<div class="middle_right_div2">
								<div style="float: left;">
									<a href="#"><img src="${pageContext.request.contextPath }/img/e.jpg" class="middle_right_img" /></a>
								</div>
								<div class="middle_right_div3">
									<a href="#"><span class="middle_right_span4" title="不寂寞的‘燕">不寂寞的‘燕</span></a>
									<br />
									<span class="middle_right_span5">河南&nbsp;周口&nbsp;|&nbsp;32岁</span>
								</div>
								<div class="middle_right_div4">
									<button class="button button-border button-rounded button-primary button-tiny">忽略</button>
									<br /><br />
									<button class="button button-primary button-rounded button-tiny">同意</button>
								</div>
							</div>
							<hr class="middle_right_hr2">
								<div class="middle_right_div2">
								<div style="float: left;">
									<a href="#"><img src="${pageContext.request.contextPath }/img/c.jpg" class="middle_right_img" /></a>
								</div>
								<div class="middle_right_div3">
									<a href="#"><span class="middle_right_span4" title="风把我吹向你">风把我吹向你</span></a>
									<br />
									<span class="middle_right_span5">河南&nbsp;开封&nbsp;|&nbsp;20岁</span>
								</div>
								<div class="middle_right_div4">
									<button class="button button-border button-rounded button-primary button-tiny">忽略</button>
									<br /><br />
									<button class="button button-primary button-rounded button-tiny">同意</button>
								</div>
							</div>
							<hr class="middle_right_hr2">
								<div class="middle_right_div2">
								<div style="float: left;">
									<a href="#"><img src="${pageContext.request.contextPath }/img/d.jpg" class="middle_right_img" /></a>
								</div>
								<div class="middle_right_div3">
									<a href="#"><span class="middle_right_span4" title="斯人独憔悴!">斯人独憔悴!</span></a>
									<br />
									<span class="middle_right_span5">河南&nbsp;洛阳&nbsp;|&nbsp;18岁</span>
								</div>
								<div class="middle_right_div4">
									<button class="button button-border button-rounded button-primary button-tiny">忽略</button>
									<br /><br />
									<button class="button button-primary button-rounded button-tiny">同意</button>
								</div>
							</div>
							<hr class="middle_right_hr2">
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