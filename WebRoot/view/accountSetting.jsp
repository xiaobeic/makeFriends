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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrapValidator.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/fileinput.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style2.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/wow.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrapValidator.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/fileinput.min.js"></script>
	<!--描述：上传头像-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/cropbox.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myjs-person.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myValidator.js"></script>
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
					<li><a href="${pageContext.request.contextPath }/view/index.jsp">首页</a></li>
					<li><a href="${pageContext.request.contextPath }/interest_getAllInfos.action">社区</a></li>
					<li  class="active"><a href="${pageContext.request.contextPath }/user_getMyCollections.do">个人中心</a></li>
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
    	描述：个人中心账户设置內容
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
					<a href="#" title="账户设置"><span class="icon-cog icon-large"></span></a>
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
				<div class="bottom_div" style="background-color: #337AB7;">
					<p style="color: white;">
						<a href="${pageContext.request.contextPath }/user_seeMyAccountSetting.do" style="color: white;"><span class="icon-cog">&nbsp;账号设置</span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="icon-chevron-right"></span>
					</p>
				</div>
			</div>
		</div>

		<div class="middle_right">
			<div class="row col-md-10">
				<ul id="mytab" class="nav nav-tabs">
					<li class="active">
						<a href='#xw1' data-toggle='tab'>基本信息</a>
					</li>
					<li>
						<a href='#xw2' data-toggle='tab'>个人资料</a>
					</li>
					<li>
						<a href='#xw3' data-toggle='tab'>修改密码</a>
					</li>
					<li>
						<a href='#xw4' data-toggle='tab'>头像设置</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade in active middleDiv" id="xw1">
						<form id="baseInfo" action="${pageContext.request.contextPath }/user_saveUserBasicInfos.do" class="form-horizontal" method="post">
							<div class="form-group">
								<label class="col-md-3 control-label formLabel">昵 称</label>
								<div class="col-md-7">
									<input type="text" name="nickName" class="form-control input-lg" value="<s:property value="#session.user.nickName"/>" placeholder="请输入昵称" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label formLabel">邮 箱</label>
								<div class="col-md-7">
									<input type="text" name="email" class="form-control input-lg" value="<s:property value="#session.user.email"/>" placeholder="请输入邮箱" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label formLabel">手机号</label>
								<div class="col-md-7">
									<input type="text" name="phoneNum" class="form-control input-lg" value="<s:property value="#session.user.phoneNum"/>" placeholder="请输入手机号" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12 col-lg-offset-4">
									<button type="submit" class="button button-raised button-glow button-primary button-rounded">保 存</button>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane fade middleDiv" id="xw2">
						<form id="personInfo" action="#" class="form-horizontal" method="post">
							<div class="form-group">
								<label class="col-md-3 control-label formLabel">真实姓名</label>
								<div class="col-md-7">
									<input type="text" name="realName" class="form-control input-lg" value="<s:property value="#session.user.userRealName"/>" placeholder="请输入真实姓名" />
								</div>
							</div>
							<%-- <div class="form-group">
								<label class="col-md-3 control-label formLabel">职 位</label>
								<div class="col-md-7">
									<select class="form-control input-lg">
										<option>其他</option>
										<option>学生</option>
										<option>教师</option>
										<option>白领</option>
										<option>蓝领</option>
										<option>艺人</option>
										<option>创业者</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label formLabel">地 址</label>
								<div class="col-md-7">
									<select id="s_province" class="input-lg" name="s_province"></select>
									<select id="s_city" class="input-lg" name="s_city"></select>
								</div>
								<script class="resources library" src="${pageContext.request.contextPath }/js/area.js" type="text/javascript"></script>
								<script type="text/javascript">
									_init_area();
								</script>
							</div> --%>
							<div class="form-group">
								<label class="col-md-3 control-label formLabel">生 日</label>
								<div class="col-md-7">
									<input type="date" name="birth" class="form-control input-lg" value="<s:property value="#session.user.getBirthTime()"/>"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label formLabel">性 别</label>
								<div class="col-lg-7">
									<div class="radio">
										<label>
										    <s:if test="#session.user.sex=='unknow'">
										        <input type="radio" checked="checked" name="sex" value="unknow" /> 保 密
										    </s:if>
										    <s:else>
												<input type="radio" name="sex" value="unknow" /> 保 密
										    </s:else>
										</label>
									</div>
									<div class="radio">
										<label>
										    <s:if test="#session.user.sex=='male'">
										        <input type="radio" checked="checked" name="sex" value="male" /> 帅 哥
										    </s:if>
										    <s:else>
												<input type="radio" name="sex" value="male" /> 帅 哥
										    </s:else>
										</label>
									</div>
									<div class="radio">
										<label>
										    <s:if test="#session.user.sex=='female'">
                                                <input type="radio" checked="checked" name="sex" value="female" /> 美 女
                                            </s:if>
                                            <s:else>
                                                <input type="radio" name="sex" value="female" /> 美 女
                                            </s:else>
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label formLabel">个性签名</label>
								<div class="col-md-7">
									<textarea name="signature" rows="4" style="resize: none;" class="form-control" value="" placeholder="<s:property value="#session.user.signature"/>"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12 col-lg-offset-4">
									<button id="personalInforsSubmit" type="submit" class="button button-raised button-glow button-primary button-rounded">保 存</button>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane fade middleDiv" id="xw3">
						<form id="passwordInfo" action="${pageContext.request.contextPath }/user_changeUserPassword.do" class="form-horizontal" method="post">
							<div class="form-group">
								<label class="col-md-3 control-label formLabel">当前密码</label>
								<div class="col-md-7">
									<input type="password" name="oldPassword" class="form-control input-lg" placeholder="请输入当前密码" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label formLabel">新密码</label>
								<div class="col-md-7">
									<input type="password" name="newPassword" class="form-control input-lg" placeholder="请输入新密码" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label formLabel">确认密码</label>
								<div class="col-md-7">
									<input type="password" name="confirmPassword" class="form-control input-lg" placeholder="请再次输入密码" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12 col-lg-offset-4">
									<button id="changePasswordSubmit" type="submit" class="button button-raised button-glow button-primary button-rounded">保 存</button>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane fade middleDiv" id="xw4">
						<div style="width: 550px;margin-bottom: 20px;">
							<input id="file" type="file" class="file" data-show-upload="false" data-show-remove="false" data-show-preview="false">
						</div>
						<div>
							<div style="float: left;">
								<div class="imageBox">
									<div class="thumbBox"></div>
									<div class="spinner" style="display: none">Loading...</div>
								</div>
								<div style="margin-left: 130px;">
									<button class="button button-small button-circle button-glow  button-primary" id="btnZoomOut">
										<i class="icon-zoom-out icon-large" title="缩小"></i>
									</button>
									<button class="button button-small button-circle button-glow  button-primary" id="btnZoomIn">
										<i class="icon-zoom-in icon-large" title="放大"></i>
									</button>
									<button class="button button-primary button-pill button-small" id="btnCrop">
										<i class="icon-cut icon-large" title="预览">预览</i>
									</button>
								</div>
							</div>
						</div>
						<div>
							<!--上传操作在myjs.js里-->
							<div class="cropped" style="width:200px;height:200px;margin-left: 350px;">

							</div>
							<div style="margin-left: 400px;margin-top: 40px;">
								<button id="uploadHeadImg" class="button button-raised button-glow button-primary button-rounded" title="上传"><i class=" icon-upload-alt icon-large"></i></button>
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