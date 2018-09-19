<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html lang="zh">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>创建兴趣小组</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/formValidation.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/buttons.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/batai.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style2.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/formValidation.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/myjs-createbar.js"></script>
		
	</head>

	<body style="background-color:#eee;">
		<!--
        	作者：1120551142@qq.com
        	时间：2016-03-18
        	描述：导航条
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
						<s:if test="#session.user!=null">
							<li><a href="${pageContext.request.contextPath }/user_getMyCollections.do">个人中心</a></li>
							<li class="active"><a href="${pageContext.request.contextPath }/view/interestGroup_createInterestGroup.action">创建兴趣小组</a></li>
						</s:if>
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
    	作者：1120551142@qq.com
    	时间：2016-03-18
    	描述：创建兴趣小组页面
    -->
		<div class="container" style="margin-top: 100px;min-height: 510px;width: 1245px;">
			<div class="row">
				<section>
					<div class="col-xs-8 col-xs-offset-3">

						<ul class="nav nav-tabs" style="font-size: 20px;">
							<li class="active"><a href="#triba-tab" id="create-a0" data-toggle="tab">吧台信息</a></li>
							<li><a href="#info-tab" id="create-a1" data-toggle="tab">个人信息</a></li>
							<li><a href="#sumbit-tab" id="create-a2" data-toggle="tab">提交审核</a></li>
						</ul>
						<form id="bataiForm" method="post" class="form-horizontal" action="${pageContext.request.contextPath }/interestGroup_saveCreatedInterestGroup.action" enctype="multipart/form-data" style="margin-top: 20px;">
							<div class="tab-content">
								<div class="tab-pane active" id="triba-tab">
									<div class="form-group" style="margin-bottom: 20px;">
										<label class="col-lg-2 control-label">吧台名称</label>
										<div class="col-lg-6">
											<input class="form-control" type="text" name="interestGroupName" />
										</div>
									</div>
									<div class="form-group" style="margin-bottom: 20px;">
										<label class="col-lg-2 control-label">吧台背景</label>
										<div class="col-lg-6">
											<input type="file" name="interestGroupBg" class="form-control" id="firstFile">
										</div>
									</div>
									<div class="form-group" style="margin-bottom: 20px;">
										<label class="col-lg-2 control-label">兴趣类型</label>
										<div class="col-lg-6">
											<select class="form-control" name="interestId">
												<option value="">-- 请选择兴趣类型 --</option>
												<s:iterator id="interest" value="#request.interests">
												    <option value="<s:property value="#interest.id"/>"><s:property value="#interest.interestName"/></option>
												</s:iterator>
											</select>
										</div>
									</div>
									<div class="form-group" style="margin-bottom: 20px;">
										<label class="col-lg-2 control-label">吧台简介</label>
										<div class="col-lg-6">
											<textarea name="interestGroupDesc" rows="4" style="resize: none;" class="form-control"></textarea>
										</div>
									</div>
									<div class="form-group" style="margin-bottom: 20px;">
										<label class="col-lg-2 control-label">申请理由</label>
										<div class="col-lg-6">
											<textarea name="applyReason" rows="3" style="resize: none;" class="form-control"></textarea>
										</div>
									</div>
									<div class="form-group" style="margin-top: 50px;margin-left: 20px;">
										<div class="col-xs-7 col-xs-offset-3">
											<a id="create-a4" class="button button-rounded button-raised button-primary">下一步</a>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="info-tab">
									<div class="form-group" style="margin-bottom: 20px;">
										<label class="col-lg-2 control-label">真实姓名</label>
										<div class="col-lg-6">
											<input class="form-control" type="text" name="userRealName" placeholder="请填写真实姓名" />
										</div>
									</div>
									<div class="form-group" style="margin-bottom: 20px;">
										<label class="col-lg-2 control-label">生日</label>
										<div class="col-lg-6">
											<input type="date" class="form-control" name="userBirthday" />
										</div>
									</div>
									<div class="form-group" style="margin-bottom: 20px;">
										<label class="col-sm-2 control-label">身份证号码</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" name="userIdCard" />
										</div>
									</div>
									<div class="form-group" style="margin-bottom: 20px;">
										<label class="col-lg-2 control-label">个人邮箱</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="userEmail" />
										</div>
									</div>
									<div class="form-group" style="margin-bottom: 20px;">
										<label class="col-lg-2 control-label">手机号码</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="userPhoneNumber" />
										</div>
									</div>
									<div class="form-group" style="margin-top: 50px;">
										<div class="col-xs-7 col-xs-offset-2">
											<a id="create-a5" class="button button-rounded button-raised button-primary">上一步</a>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a id="create-a6" class="button button-rounded button-raised button-primary">下一步</a>
										</div>
									</div>
									
								</div>
								<div class="tab-pane" id="sumbit-tab">
									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-1">
											<span style="display: block;background-color: white;border: 2px #262626;padding: 20px;line-height: 25px;">
													<b style="font-size: 17px;">1. </b>在相关法规、政府部门要求或其他必要的条件下，寻友团队有权要求您提交您的真
													实信息以及相应的证明材料。寻友团队会依法对您提交的信息予以保密。<br />
													<b style="font-size: 17px;">2. </b>因您违反国家法规、本规则以及相关协议、规则等，被终止吧台部长资格<br />
													<b style="font-size: 17px;">3. </b>申请吧台部长是您完全自愿的行为，成为部长后，您应按照相关规则履行相应责任和义务，否则寻友团队有权终止你的部长资格<br /><br />
													<b>【特别提示】 </b>当您按照创建兴趣小组页面提示填写信息、阅读并同意协议且完成全部程序后，即表示您已充分阅读、理解并接受协议的全部内容。如后期发生争执将按照本协议处理。<br />
													<b><i>如果您不同意相关协议或其中任何条款，您应立即停止创建兴趣小组程序。</i></b>
											</span>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-7" style="padding-left: 270px;">
											<label>
												<input type="checkbox" name="agree" value="agree" />我同意协议
											</label>
										</div>
									</div>
									<div class="form-group" style="padding-left:20px ;">
										<div class="col-sm-8">
											<p class="ps">
												提交后，经过审核，我们将以邮件形式返回审核结果
											</p>
										</div>
									</div>
									<div class="form-group" style="padding-left: 30px;">
										<div class="col-xs-8 col-xs-offset-2">
											<a id="create-a7" class="button button-rounded button-raised button-primary">返回</a>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="submit" class="button button-rounded button-raised button-primary">提交</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</section>
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
