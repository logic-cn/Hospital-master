<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>人事管理系统 ——用户管理</title>
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
<!-- 导入layui -->
<link rel="stylesheet" type="text/css"
	href="${ctx}/css/layui/css/layui.css">
<script type="text/javascript" src="${ctx}/css/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
<script src="${ctx}/js/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js"
	type="text/javascript"></script>
<script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js"
	type="text/javascript"></script>
<script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.js"
	type="text/javascript"></script>
<link href="${ctx}/css/pager.css" type="text/css" rel="stylesheet" />

<script type="text/javascript">
	$(function() {
		/** 获取上一次选中的部门数据 */
		var boxs = $("input[type='checkbox'][id^='box_']");

		/** 给数据行绑定鼠标覆盖以及鼠标移开事件  */
		$("tr[id^='data_']").hover(function() {
			$(this).css("backgroundColor", "#eeccff");
		}, function() {
			$(this).css("backgroundColor", "#ffffff");
		})

		/** 删除员工绑定点击事件 */
		$("#delete")
				.click(
						function() {
							/** 获取到用户选中的复选框  */
							var checkedBoxs = boxs.filter(":checked");
							if (checkedBoxs.length < 1) {
								$.ligerDialog.error("请选择一个需要删除的用户！");
							} else {
								/** 得到用户选中的所有的需要删除的ids */
								var ids = checkedBoxs.map(function() {
									return this.value;
								})

								$.ligerDialog
										.confirm(
												"确认要删除吗?",
												"删除用户",
												function(r) {
													if (r) {
														// alert("删除："+ids.get());
														// 发送请求
														window.location = "${ctx }/user/removeUser?ids="
																+ ids.get();
													}
												});
							}
						})
	})
</script>
<script>
	var sum = ${sum};
	function nextPage() {
		if (pageForm.pageSize.value == sum) {
			alert("已到达末页");
			return;
		}
		pageForm.pageSize.value = parseInt(pageForm.pageSize.value) + 1;
		document.getElementById("p_firstName").value = document
				.getElementById("firstName").value;
		document.getElementById("p_status").value = document
				.getElementById("userStatus").value;
		pageForm.submit();
	}
	function upPage() {
		if (pageForm.pageSize.value == 1) {
			alert("已到达首页");
			return;
		}
		pageForm.pageSize.value = parseInt(pageForm.pageSize.value) - 1;
		document.getElementById("p_firstName").value = document
				.getElementById("firstName").value;
		document.getElementById("p_status").value = document
				.getElementById("userStatus").value;
		pageForm.submit();
	}
	function firstPage() {
		pageForm.pageSize.value = 1;
		document.getElementById("p_firstName").value = document
				.getElementById("firstName").value;
		document.getElementById("p_status").value = document
				.getElementById("userStatus").value;
		pageForm.submit();
	}
	function lastPage() {
		pageForm.pageSize.value = sum;
		document.getElementById("p_firstName").value = document
				.getElementById("firstName").value;
		document.getElementById("p_status").value = document
				.getElementById("userStatus").value;
		pageForm.submit();
	}
</script>
</head>
<body>
	<!-- 导航 -->
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td width="15" height="32"><img
				src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
			<td class="main_locbg font2"><i
				class="layui-icon layui-icon-location" style="font-size: inherit;"></i>当前位置：用户管理
				&gt; 用户查询</td>
			<td width="15" height="32"><img
				src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
		</tr>
	</table>

	<table width="100%" height="90%" border="0" cellpadding="5"
		cellspacing="0" class="main_tabbor">
		<!-- 查询区  -->
		<tr valign="top">
			<td height="30">
				<table width="100%" border="0" cellpadding="0" cellspacing="10"
					class="main_tab">
					<tr>
						<td class="fftd">
							<form name="empform" method="post" id="empform"
								action="${ctx}/user/selectUser">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td class="font3"><input type="text" name="username"
											id="firstName" value="${e.username}"> 用户状态：<input
											type="text" name="status" id="userStatus" value="${e.status}">
											<input type="submit" value="搜索"
											class="layui-btn layui-btn-xs" /> <input id="delete"
											type="button" value="删除"
											class="layui-btn layui-btn-xs layui-btn-danger" /></td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>

		<!-- 数据展示区 -->
		<tr valign="top">
			<td height="20">
				<table width="100%" border="1" cellpadding="5" cellspacing="0"
					class="layui-table"
					style="border: #c2c6cc 1px solid; border-collapse: collapse;">
					<tr class="main_trbg_tit" align="center">
						<td><input type="checkbox" name="checkAll" id="checkAll"></td>
						<td>用户名</td>
						<td>密码</td>
						<td>别名</td>
						<td>状态</td>
						<td>创建时间</td>
						<td align="center">操作</td>
					</tr>
					<c:forEach items="${requestScope.users}" var="user"
						varStatus="stat">
						<tr id="data_${stat.index}" align="center" class="main_trbg"
							onMouseOver="move(this);" onMouseOut="out(this);">
							<td><input type="checkbox" id="box_${stat.index}"
								value="${user.id}"></td>
							<td>${user.username }</td>
							<td>${user.password }</td>
							<td>${user.loginname }</td>
							<td>${user.status }</td>
							<td><f:formatDate value="${user.createDate}" type="date"
									dateStyle="long" /></td>
							<td align="center" width="40px;"><a
								href="${ctx}/user/updateUser?flag=1&id=${user.id}"> <i
									class="layui-icon layui-icon-edit"
									style="font-size: inherit; color: #FF5722;">修改</i></a></td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<!-- 分页标签 -->
		<form name="pageForm"
			action="${pageContext.request.contextPath }/user/selectUser"
			method="post">
			<input type="hidden" name="username" id="p_firstName"> <input
				type="hidden" name="status" id="p_status">
			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="6"><img
						src="${pageContext.request.contextPath}/images/spacer.gif"
						width="1" height="1" /></td>
				</tr>
				<tr>
					<td height="33"><table width="100%" border="0" align="center"
							cellpadding="0" cellspacing="0" class="right-font08">
							<tr>
								<td width="50%">共 <span class="right-text09">${sum }</span>
									页 | 第 <span class="right-text09">${pageSize }</span> 页
								</td>
								<td width="49%" align="right">[<a href="#"
									class="right-font08" onclick="firstPage();">首页</a> | <a
									href="#" class="right-font08" onclick="upPage();">上一页</a> | <a
									href="#" class="right-font08" onclick="nextPage();">下一页</a> | <a
									href="#" class="right-font08" onclick="lastPage();">末页</a>]
								</td>
								<td width="1%">
									<table width="20" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="1%"><input name="pageSize" type="hidden"
												size="1" value="${pageSize }" /></td>
											<td width="87%"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table></td>
				</tr>
			</table>
		</form>
	</table>
	<div style="height: 10px;"></div>
</body>
</html>