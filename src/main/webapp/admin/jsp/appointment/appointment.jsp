<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>人事管理系统 ——员工管理</title>
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

<script type="text/javascript">
	$(function() {
		/** 获取上一次选中的部门数据 */
		var boxs = $("input[type='checkbox'][id^='box_']");

		/** 给全选按钮绑定点击事件  */
		$("#checkAll").click(function() {
			// this是checkAll  this.checked是true
			// 所有数据行的选中状态与全选的状态一致
			boxs.attr("checked", this.checked);
		})

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
								$.ligerDialog.error("请选择一个需要删除的员工！");
							} else {
								/** 得到用户选中的所有的需要删除的ids */
								var ids = checkedBoxs.map(function() {
									return this.value;
								})

								$.ligerDialog
										.confirm(
												"确认要删除吗?",
												"删除员工",
												function(r) {
													if (r) {
														// alert("删除："+ids.get());
														// 发送请求
														window.location = "${ctx }/appointment/delete?ids="
																+ ids.get();
													}
												});
							}
						})
	})
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
			<td class="main_locbg font2"><img
				src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：员工管理
				&gt; 员工查询</td>
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
								action="${ctx}/employee/selectEmployee">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<%--<td class="font3">姓名： <input type="text" name="name">
											职位： <select name="job.id" style="width: 143px;">
												<option value="0">--请选择职位--</option>
												<c:forEach items="${requestScope.jobs }" var="job">
													<option value="${job.id }">${job.name }</option>
												</c:forEach>
										</select>
										</td>--%>

										 <input id="delete"
											type="button" value="删除" />
										</td>
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
					style="border: #c2c6cc 1px solid; border-collapse: collapse;">
					<tr class="main_trbg_tit" align="center">
						<td><input type="checkbox" name="checkAll" id="checkAll"></td>
						<td>预约编号</td>
						<td>预约时间</td>
						<td>姓名</td>
						<td>联系方式</td>
						<td>状态</td>
						<td align="center">操作</td>
					</tr>
					<c:forEach items="${appointments}" var="appointment"
						varStatus="stat">
						<tr id="data_${stat.index}" class="main_trbg" align="center">
							<td><input type="checkbox" id="box_${stat.index}"
								value="${appointment.aid}"></td>
							<td>${appointment.uid }</td>
							<td>${appointment.visittime }</td>
							<td>${appointment.name }</td>
							<td>${appointment.aphone }</td>
							<td>
								<c:choose>
									<c:when test="${appointment.status eq '1' }">
										已接受
									</c:when>
									<c:when test="${appointment.status eq '2' }">
										已拒绝
									</c:when>
									<c:otherwise>
										未处理
									</c:otherwise>
								</c:choose>
							</td>
							<td align="center" width="120px;">
								<a href="${ctx}/appointment/updateStatus?status=1&id=${appointment.aid}">接受预约</a>
								<a href="${ctx}/appointment/updateStatus?status=2&id=${appointment.aid}">拒绝预约</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<!-- 分页标签 -->
		<tr valign="top">
			<td align="center" class="font3"><fkjava:pager
					pageIndex="${requestScope.pageModel.pageIndex}"
					pageSize="${requestScope.pageModel.pageSize}"
					recordCount="${requestScope.pageModel.recordCount}" style="digg"
					submitUrl="${ctx}/employee/selectEmployee?pageIndex={0}" /></td>
		</tr>
	</table>
	<div style="height: 10px;"></div>
</body>
</html>