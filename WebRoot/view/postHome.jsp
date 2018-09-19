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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style2.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style4.css">
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
        	描述：动态回复模态框
       -->
    <s:if test="#session.user!=null">
	    <form id="commentForm" action="${pageContext.request.contextPath }/comment_saveComment.action?userDynamticId=<s:property value="#request.userDynamic.id" />" method="post">
			<div class="modal fade" id="respone-modal">
				<div class="modal-dialog modal-content" style="width: 890px;padding-bottom: 20px;">
					<div class="modal-header" style="background-color: #eee;border-radius: 5px;padding: 7px 10px;">
						<span style="font-size: 16px;font-weight: 800;">动态回复</span>
						<span data-dismiss="modal" class="icon-remove" style="float: right;"></span>
					</div>
					<div style="width:860px; margin: 30px auto;font-family: Arial, Verdana;">
						<textarea id=putDiscuss name="editor"  placeholder="编辑回复内容"></textarea>
						<a id="publishComment" href="#" class="button button-rounded button-raised button-primary button-small" data-dismiss="modal" style="float: right;margin-left: 20px;">发表</a>
						<a  href="#" class="button button-rounded button-raised  button-small" data-dismiss="modal" style="float: right;">取消</a>
						<!--上传操作查看myjs-bar.js-->
					</div>
				</div>
			</div>
	    </form>
    </s:if>
	
	
	
	<!--
    	作者：756048962@qq.com
    	时间：2016-03-03
    	描述：帖子头部
    -->
	<div class="container bar-headdiv">
		<div>
			<p style="float:right;margin-top:20px;margin-right:20px;font-size: 35px;font-weight: 600;color: white;font-family: '楷体';"><s:property value="#request.userDynamic.interestGroup.groupName" /></p>
		</div>
		<div class="home_imgs wow bounceIn">
			<img src="${pageContext.request.contextPath }/<s:property value="#request.userDynamic.user.head_pic" />" />
		</div>
		<div style="width: 900px;height: 150px;margin-left:140px;margin-top: 130px;">
			<p style="font-size: 25px;font-weight: 600;color: white;font-family: '新宋体';"><s:property value="#request.userDynamic.user.nickName"/></p>
			<div class="post_div1">
				<span class="glyphicon glyphicon-eye-open" title="浏览量"><s:property value="#request.userDynamic.watchCount" /></span>&nbsp;&nbsp;
				<span class="glyphicon glyphicon-comment" title="回复数量"><s:property value="#request.userDynamic.comments.size()" /></span>&nbsp;&nbsp;
			</div>
		</div>
	</div>

	<!--
    	作者：756048962@qq.com
    	时间：2016-03-07
    	描述：帖子内容
    -->
	<div class="container wow fadeInUp post_div">
		<div class="post_head">
			<span class="post_span2"><s:property value="#request.userDynamic.title" /></span>
			<span class="post_span1"><s:property value="#request.userDynamic.getPublishTime()" /></span>
		</div>
		<div class="post_div2">
		  <s:property value="#request.userDynamic.content" escape="false" />
		</div>
		<%-- <div class="post_div2">
			没过多久，玉无心和五鬼天王便准备成亲了，但，令五鬼天王没想到的是，玉无心怀上了丁隐的孩子，这件事尽被丁隐所知， 就在
			玉无心和五鬼天王成亲的前一天晚上，丁隐来到了阴风谷，他强行进入了玉无心的房间，尽看见玉无心和五鬼天王在一
			 起，丁隐不感相信：“玉儿…”五鬼天王看见丁隐就十分脑火，于是便打了起来，玉无心看见丁隐便想起了什么，急忙
			 跑过去 帮丁隐挡了一掌，不想，那一掌一下打中了玉无心的肚子，玉无心一下道在地上，丁隐一把抱住她，玉无心笑
			 了笑，说：“丁 隐，我……我想起来了，我都想起来了，我…是我错了，我不应该…和五鬼好…是我对不起我们的…的孩子……对不……”
		</div>
		<div style="padding: 0px 40px;">
			<img src="${pageContext.request.contextPath }/img/200.jpg" class="post_img" />
			<img src="${pageContext.request.contextPath }/img/203.jpg" class="post_img" />
			<img src="${pageContext.request.contextPath }/img/202.jpg" class="post_img" />
			<img src="${pageContext.request.contextPath }/img/153s.jpg" class="post_img" />
			<img src="${pageContext.request.contextPath }/img/1.jpg" class="post_img" />
			<img src="${pageContext.request.contextPath }/img/205.jpg" class="post_img" />
		</div> --%>
		<div class="button-group" style="width: 900px;margin: 30px 0px 20px 295px;">
			<a id="approveBtn" href="<s:property value="#request.userDynamic.id" />" class="button button-pill button-primary button-raised"><b class="icon-thumbs-up icon-large"><s:property value="#request.userDynamic.approveCount" /></b></a>
			<a id="notApproveBtn" href="<s:property value="#request.userDynamic.id" />" class="button button-pill button-primary button-raised"><b class=" icon-thumbs-down icon-large"><s:property value="#request.userDynamic.notApproveCount" /></b></a>
		</div>
	</div>

	<!--
    	作者：756048962@qq.com
    	时间：2016-03-07
    	描述：回复内容
    -->
	<s:if test="#session.user!=null">
		<div class="container post_div">
			<div style="margin:10px 0 10px 50px;">
				<a href="#" data-toggle="modal" data-target="#respone-modal" class="button button-rounded button-raised button-primary">
					<span title="发表" class="icon-edit">&nbsp;回复</span>
				</a>
				<!-- <a href="#" class="glyphicon glyphicon-sort post_a">倒叙查看</a> -->
			</div>
		
	       <s:iterator id="comment" status="s" value="#request.userDynamic.comments">
			<hr class="post_hr"/>
			<div class="row col-lg-12 post_div7">
				<!--左部-->
				<div class="col-lg-3" align="center">
					<img src="${pageContext.request.contextPath }/<s:property value="#comment.user.head_pic"/>" class="post_img1" />
					<p class="post_p1"><s:property value="#comment.user.nickName"/></p>
				</div>
				<!--右部-->
				<div class="col-lg-8 post_div8">
					<s:property value="#comment.comment" escape="false"/>
				</div>
				<!--下部-->
				<div class="col-lg-12">
					<div class="post_div3">
						<span><s:property value="#s.count"/>楼</span>&nbsp;&nbsp;
						<span><s:property value="#comment.getPublishTime()"/></span>&nbsp;&nbsp;
						<span>
							<a class="post_spana">回复(<span><s:property value="#comment.replyComments.size()"/></span>)&nbsp;<span class="icon-chevron-down"></span></a>
						</span>
					</div>
					<!--隐藏部分-->
					<div class="post_div4">
				        <s:iterator id="replyComment" value="#comment.replyComments">
							<div>
								<div class="col-lg-2 post_div9">
									<img src="${pageContext.request.contextPath }/<s:property value="#replyComment.user.head_pic" />" class="post_img2"/>
								</div>
								<div class="col-lg-10 post_div10">
									<span class="post_span5">
										<a><s:property value="#replyComment.user.nickName" /></a>
										回复
										<a><s:property value="#replyComment.replyUser.nickName" />:</a>
										<s:property value="#replyComment.replyComment" />
									</span>
									<span class="post_span4">
										<s:property value="#replyComment.getPublishTime()" />
										<input style="display: none;" id="reply_user_id" type="text" value="<s:property value="#replyComment.user.id" />" />
										<input style="display: none;" id="reply_user_name" type="text" value="<s:property value="#replyComment.user.nickName" />" />
										<a id="replylink" >回复</a>
									</span>
								</div>
							</div>
							<hr class="post_hr1"/>
				        </s:iterator>
						<form action="${pageContext.request.contextPath }/replyComment_saveReplyComment.action?userDynamticId=<s:property value="#request.userDynamic.id" />&commentId=<s:property value="#comment.id" />" method="post" class="form-horizontal">
						    <input style="display:none;" type="text" id="replyUserId" name="replyUserId" value="<s:property value="#comment.user.id" />" />
						    <span>回复:<span id="replyContent" style="font-weight: bold;">&nbsp;<s:property value="#comment.user.nickName" /></span></span>
							<textarea name="editor" class="form-control" style="resize: none;" placeholder="说点什么"></textarea>
							<button class="btn btn-sm btn-primary post_btn">发表</button>
						</form>
					</div>
				</div>
			</div>
	       </s:iterator>
			
		</div>
	</s:if>
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
		var ue = UE.getEditor("putDiscuss");
	</script>
</body>

</html>