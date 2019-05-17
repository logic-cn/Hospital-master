<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>医院预约挂号后台管理系统——修改医院</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />
<link href="${ctx}/css/css.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css" />
<link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
<script src="${ctx}/js/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js"
	type="text/javascript"></script>
<script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js"
	type="text/javascript"></script>
<script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.jss"
	type="text/javascript"></script>
<link href="${ctx}/css/pager.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript"
	src="${ctx }/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td width="15" height="32"><img
				src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
			<td class="main_locbg font2"><img
				src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：医院管理
				&gt; 添加医院</td>
			<td width="15" height="32"><img
				src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
		</tr>
	</table>
	<table width="100%" height="90%" border="0" cellpadding="5"
		cellspacing="0" class="main_tabbor">
		<tr valign="top">
			<td>
				<form action="${ctx}/hospital/add?id=${hospital.hid}"
					method="post">
					<!-- 隐藏表单，flag表示添加标记 -->
					<input
						type="hidden" name="hid" value="${hospital.hid }">
					<table width="100%" border="0" cellpadding="0" cellspacing="10"
						class="main_tab">
						<tr>
							<td class="font3 fftd">
								<table>
									<tr>
										<td class="font3 fftd">医院名称：<input type="text" name="hname"
											id="name" size="20" value="${hospital.hname }" /></td>
										<td class="font3 fftd">分数：<input type="text" name="score"
											id="grade" size="20" value="${hospital.score }" /></td>

									</tr>
									<tr>
										<td class="font3 fftd">等级：<input type="text" name="grade"
											id="education" size="20" value="${hospital.grade }" /></td>
										<td class="font3 fftd">医院电话：<input  type="text"
											name="hphone" id="hphone" size="20" value="${hospital.hphone }" /></td>
									</tr>
									<tr>
										<td class="font3 fftd">医院地址：<input  type="text" name="address" id="address"
											size="20" value="${hospital.address }" /></td>
										<td class="font3 fftd">简介：<input  type="text" name="description" id="description"
											size="20" value="${hospital.description }" /></td>
									</tr>
						<tr>
							<td class="main_tdbor"></td>
						</tr>

						<tr>
							<td align="left" class="fftd">
								<c:if test="${hospital != null}">
									<input type="submit" value="修改">
								</c:if>
								<c:if test="${hospital == null}">
									<input type="submit" value="新增">
								</c:if>
								&nbsp;&nbsp;<input type="reset" value="取消 " onclick="javascript:window.history.back();return false;"
								></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
	<div style="height: 10px;"></div>
</body>
</html>