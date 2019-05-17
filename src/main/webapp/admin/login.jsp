<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>登录-医院预约挂号后台管理系统</title>
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
</head>

<body>
	<form id="login-form" method="post" action="${ctx}/admin/login">
		<div class="head">
			<img id="imgHead" src="${ctx}/images/head0.jpg">
		</div>
		<div class="content">
			<div class="enter">
				<div class="title">
					<h3>登录</h3>
				</div>
				<div id="message" class="message"></div>
				<div class="enterMessage">
					<div class="passworld"></div>
					<input type="text" placeholder="请输入用户名" class="userText"
						name="loginname" value="admin">
				</div>
				<div class="enterMessage">
					<div class="passworld"></div>
					<input type="password" placeholder="请输入密码" class="passworldText"
						name="password" value="123">
				</div>
				<div class="enterMessage">
					<div class="code"></div>
					<input type="text" placeholder="请输入验证码" class="codeText"
						name="identifyingcode">
					<div class="codeImg">
						<img name="jcaptcha" id="jcaptcha"
							onclick="refresh_jcaptcha(this)" src="${ctx}/admin/yzm" alt="点击刷新验证码"
							title="点击刷新验证码" style="cursor: pointer;" width="109" height="40">
						<script>
							function refresh_jcaptcha(obj) {
								obj.src = "${ctx}/admin/yzm?"+Math.random();
							}
						</script>
					</div>
				</div>
				<div class="opinion">
					<img style="display: none;" name="jcaptcha_success"
						src="${ctx}/images/ok.png"> <img style="display: none;"
						name="jcaptcha_fail" src="${ctx}/images/error.png">
				</div>
				<div class="enterButton">
					<input name="button1" type="submit" class="button"
						 value="登录">
				</div>
			</div>
		</div>
		<div class="foot">Copyright2018哈尔滨理工大学荣成校区QI剑客</div>
	</form>
</body>

</html>