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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/photoes.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!--<加载bootstrap.min.js之前先加载jquery.min.js-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/cropbox.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myjs-person.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myAjax.js"></script>
	
	
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
    	描述：个人中心相册內容
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
						<a href="${pageContext.request.contextPath }/user_seeMyGroups.do"><span class="icon-bookmark">&nbsp;&nbsp;我的吧台</span></a>
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
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/view/myFriends.jsp"><span class="icon-comments">&nbsp;我的好友</span></a>
					</p>
				</div>
				<div class="bottom_div" style="background-color: #337AB7;">
					<p style="color: white;">
						<a href="#" style="color: white;"><span class="icon-camera-retro">&nbsp;我的相册</span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="icon-chevron-right"></span>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/user_seeMyAccountSetting.do"><span class="icon-cog">&nbsp;账号设置</span></a>
					</p>
				</div>
			</div>
		</div>
		<!--
			作者：1120551142@qq.com
			时间：2016-02-20
			描述：右部设置
		-->
		<div class="middle_right row col-md-10">
			<ul id="mytab" class="nav nav-tabs">
				<li class="active">
					<a href='#xw1' data-toggle='tab'>我的相册</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade in active middleDiv" id="xw1">
					<!--创建相册-->
					<a href="#" data-toggle="modal" style="margin-bottom: 30px;" data-target="#chuangjian-modal" class="button button-small button-rounded button-raised button-primary">
						<i class="icon-plus"></i> 创建相册
					</a>
					<!--
							作者：1120551142@qq.com
							时间：2016-03-03
							描述：我的相册布局
							样式:xiangce.css
						-->
					<div class="con">
						<ul>
							<li>
								<div class="imga">
									<a href="personaCenter6-1.html">
										<img src="${pageContext.request.contextPath }/img/f.jpg" />
									</a>
									<div class="imgb" id="imgb">
										<i class="icon-chevron-down" style="color: #AAA;font-size: 10px;line-height: 20px;" title="编辑或删除"></i>
										<div class="imgc">
											<p><a href='#' data-toggle="modal" data-target="#bianji-modal"><i class="icon-pencil" style="padding-right: 10px;"></i>编辑</a></p>
											<p><a href="#" data-toggle="modal" data-target="#quanxian-modal"><i class="icon-lock" style="padding-right: 10px;"></i>权限设置</a></p>
											<p><a href="#"><i class="icon-trash" style="padding-right: 10px;"></i>删除</a></p>
										</div>
									</div>
									<p>亲人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;29
									</p>
								</div>
							</li>
							<li>
								<div class="imga">
									<a href="personaCenter6-1.html">
										<img src="${pageContext.request.contextPath }/img/f.jpg" />
									</a>
									<div class="imgb" id="imgb">
										<i class="icon-chevron-down" style="color: #AAA;font-size: 10px;line-height: 20px;" title="编辑或删除"></i>
										<div class="imgc">
											<p><a href='#' data-toggle="modal" data-target="#bianji-modal"><i class="icon-pencil" style="padding-right: 10px;"></i>编辑</a></p>
											<p><a href="#" data-toggle="modal" data-target="#quanxian-modal"><i class="icon-lock" style="padding-right: 10px;"></i>权限设置</a></p>
											<p><a href="#"><i class="icon-trash" style="padding-right: 10px;"></i>删除</a></p>
										</div>
									</div>
									<p>亲人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;29
									</p>
								</div>
							</li>
							<li>
								<div class="imga">
									<a href="personaCenter6-1.html">
										<img src="${pageContext.request.contextPath }/img/f.jpg" />
									</a>
									<div class="imgb" id="imgb">
										<i class="icon-chevron-down" style="color: #AAA;font-size: 10px;line-height: 20px;" title="编辑或删除"></i>
										<div class="imgc">
											<p><a href='#' data-toggle="modal" data-target="#bianji-modal"><i class="icon-pencil" style="padding-right: 10px;"></i>编辑</a></p>
											<p><a href="#" data-toggle="modal" data-target="#quanxian-modal"><i class="icon-lock" style="padding-right: 10px;"></i>权限设置</a></p>
											<p><a href="#"><i class="icon-trash" style="padding-right: 10px;"></i>删除</a></p>
										</div>
									</div>
									<p>亲人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;29
									</p>
								</div>
							</li>
							<li>
								<div class="imga">
									<a href="personaCenter6-1.html">
										<img src="${pageContext.request.contextPath }/img/f.jpg" />
									</a>
									<div class="imgb" id="imgb">
										<i class="icon-chevron-down" style="color: #AAA;font-size: 10px;line-height: 20px;" title="编辑或删除"></i>
										<div class="imgc">
											<p><a href='#' data-toggle="modal" data-target="#bianji-modal"><i class="icon-pencil" style="padding-right: 10px;"></i>编辑</a></p>
											<p><a href="#" data-toggle="modal" data-target="#quanxian-modal"><i class="icon-lock" style="padding-right: 10px;"></i>权限设置</a></p>
											<p><a href="#"><i class="icon-trash" style="padding-right: 10px;"></i>删除</a></p>
										</div>
									</div>
									<p>亲人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;29
									</p>
								</div>
							</li>
							<li>
								<div class="imga">
									<a href="personaCenter6-1.html">
										<img src="${pageContext.request.contextPath }/img/f.jpg" />
									</a>
									<div class="imgb" id="imgb">
										<i class="icon-chevron-down" style="color: #AAA;font-size: 10px;line-height: 20px;" title="编辑或删除"></i>
										<div class="imgc">
											<p><a href='#' data-toggle="modal" data-target="#bianji-modal"><i class="icon-pencil" style="padding-right: 10px;"></i>编辑</a></p>
											<p><a href="#" data-toggle="modal" data-target="#quanxian-modal"><i class="icon-lock" style="padding-right: 10px;"></i>权限设置</a></p>
											<p><a href="#"><i class="icon-trash" style="padding-right: 10px;"></i>删除</a></p>
										</div>
									</div>
									<p>亲人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;29
									</p>
								</div>
							</li>
							<li>
								<div class="imga">
									<a href="personaCenter6-1.html">
										<img src="${pageContext.request.contextPath }/img/f.jpg" />
									</a>
									<div class="imgb" id="imgb">
										<i class="icon-chevron-down" style="color: #AAA;font-size: 10px;line-height: 20px;" title="编辑或删除"></i>
										<div class="imgc">
											<p><a href='#' data-toggle="modal" data-target="#bianji-modal"><i class="icon-pencil" style="padding-right: 10px;"></i>编辑</a></p>
											<p><a href="#" data-toggle="modal" data-target="#quanxian-modal"><i class="icon-lock" style="padding-right: 10px;"></i>权限设置</a></p>
											<p><a href="#"><i class="icon-trash" style="padding-right: 10px;"></i>删除</a></p>
										</div>
									</div>
									<p>亲人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;29
									</p>
								</div>
							</li>
							<li>

								<div class="imga">
									<a href="personaCenter6-1.html">
										<img src="${pageContext.request.contextPath }/img/f.jpg" />
									</a>
									<div class="imgb">
										<i class="icon-chevron-down" style="color: #AAA;font-size: 10px;line-height: 20px;" title="编辑或删除"></i>
										<div class="imgc">
											<p><a href='#' data-toggle="modal" data-target="#bianji-modal"><i class="icon-pencil" style="padding-right: 10px;"></i>编辑</a></p>
											<p><a href="#" data-toggle="modal" data-target="#quanxian-modal"><i class="icon-lock" style="padding-right: 10px;"></i>权限设置</a></p>
											<p><a href="#"><i class="icon-trash" style="padding-right: 10px;"></i>删除</a></p>
										</div>
									</div>
									<p>亲人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;29
									</p>
								</div>
							</li>
						</ul>
						<!-- 编辑  -->
						<div class="modal  fade" id="bianji-modal">
							<div class="modal-dialog" style="width:330px;">
								<div class="modal-content">
									<div class="modal-body">
										<button type="button" class="close" data-dismiss="modal">

											<span aria-hidden="true" style="font-size:large;" class="glyphicon glyphicon-remove"></span>

										</button>
										<!--tab标签-->
										<br>
										<div class="tab-content">
											<form action="" id="photoInfo">
												<span class="bj">编辑相册信息</span>
												<p class="mc">
													<span>名称</span>
													<input type="text" name="mingcheng" />
													<span>						
						0
						<span>/5</span>
													</span>
												</p>
												<p class="mc">
													<span>描述</span>
													<textarea name="miaoshu" style="resize: none;" class="wb"></textarea>
													<span>						
						0
						<span>/20</span>
													</span>
												</p>
												<p>
													<span class="mc">主题</span>
													<span>
						<input type="radio" name="zhuti" />
						<label>普通</label>
						</span>
													<span>
						<input type="radio" name="zhuti" />
						<label>亲子</label>
						</span>
													<span>
						<input type="radio" name="zhuti" />
						<label>旅游</label>
						</span>
													<span>
						<input type="radio" name="zhuti" />
						<label>家庭</label>
						</span>
												</p>
												<p class="tijiao">

													<input type="submit" value="确定" />
													<input type="reset" value="取消" data-dismiss="modal" />

												</p>

											</form>

										</div>

									</div>
								</div>
							</div>
						</div>
						<!--权限设置-->
						<div class="modal  fade" id="quanxian-modal">
							<div class="modal-dialog" style="width:350px;margin-top: 150px;">
								<div class="modal-content">
									<div class="modal-body">
										<button type="button" class="close" data-dismiss="modal">

											<span aria-hidden="true" style="font-size:large;" class="glyphicon glyphicon-remove"></span>

										</button>
										<!--tab标签-->
										<br>
										<div class="tab-content">
											<form action="">
												<span class="bj">权限设置</span>
												<p class="mc">
													<span>寻友照片权限</span>
													<select name="select1">
														<option value="回答问题的人可见">回答问题的人可见</option>
														<option value="所有人可见">所有人可见</option>
														<option value="仅自己可见">仅自己可见</option>
													</select>
													<a href="#" data-toggle="modal" data-target="#shezhi-modal">设置问题</a>
												</p>
												<p class="mc">
													<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其他权限</span>
													<span>
								<input type="checkbox" name="quanxian" />
								<label>允许
								<a href="#" title="查看详情">转载</a>
								</label>
							</span>
												</p>
												<p class="tijiao">

													<input type="submit" value="确定" />
													<input type="reset" value="取消" data-dismiss="modal" />

												</p>
											</form>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--
						作者：1120551142@qq.com
						时间：2016-03-10
						描述：创建相册模态框
					-->
				<div class="modal  fade" id="chuangjian-modal">
					<div class="modal-dialog" style="width:400px;">
						<div class="modal-content">
							<div class="modal-body">
								<button type="button" class="close" data-dismiss="modal">

									<span aria-hidden="true" style="font-size:large;" class="glyphicon glyphicon-remove"></span>

								</button>
								<!--tab标签-->
								<br>
								<div class="tab-content">
									<form action="">
										<span class="bj">创建相册</span>
										<p class="mc">
											<span>相册名称</span>
											<input type="text" name="mingcheng" value="" />
											<span>						
						0
						<span>/5</span>
											</span>
										</p>
										<p class="mc">
											<span>相册描述</span>
											<textarea name="miaoshu" style="resize: none;" class="wb"></textarea>
											<span>						
						0
						<span>/20</span>
											</span>
										</p>
										<p class="tijiao">
											<input type="submit" value="保存"/>
											<input type="reset" value="取消" data-dismiss="modal"/>
										</p>

									</form>

								</div>

							</div>
						</div>
					</div>
				</div>

				<!--
						作者：1120551142@qq.com
						时间：2016-03-03
						描述：设置问题模态框
						样式:photoes.css
					-->
				<div class="modal  fade" id="shezhi-modal">
					<div class="modal-dialog" style="width:700px;margin-top: 200px;">
						<div class="modal-content">
							<div class="modal-body">
								<button type="button" class="close" data-dismiss="modal">

									<span aria-hidden="true" style="font-size:large;" class="glyphicon glyphicon-remove"></span>

								</button>
								<!--tab标签-->
								<br>
								<div class="tab-content">
									<form action="">

										<span class="bj">设置问题和答案</span>
										<p class="szwt">
											<span>
												问题:
												<input type="text" name="wenti" value="如：我的手机号是？" />
											</span>
											<span>
												答案:
												<input type="text" name="wenti" />
											</span>
										</p>
										<p class="tijiao" style="margin-left: 500px;">

											<input type="submit" value="保存" />
											<input type="reset" value="取消" />

										</p>

									</form>

								</div>

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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrapValidator.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/photoes.js"></script>
</body>

</html>