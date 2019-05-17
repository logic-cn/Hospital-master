<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>人事管理系统——修改员工</title>
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
				src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：员工管理
				&gt; 修改员工</td>
			<td width="15" height="32"><img
				src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
		</tr>
	</table>
	<table width="100%" height="90%" border="0" cellpadding="5"
		cellspacing="0" class="main_tabbor">
		<tr valign="top">
			<td>
				<form action="${ctx}/doctor/update" id="employeeForm"
					method="post">
					<!-- 隐藏表单，flag表示添加标记 -->
					<input type="hidden" name="flag" value="2"> <input
						type="hidden" name="did" value="${doctor.did }">
					<table width="100%" border="0" cellpadding="0" cellspacing="10"
						class="main_tab">
						<tr>
							<td class="font3 fftd">
								<table>
									<tr>
										<td class="font3 fftd">姓名：<input type="text" name="dname"
											id="name" size="20" value="${doctor.dname }" /></td>
										<td class="font3 fftd">性别：
											<select id="sex" name="gender" style="width: 143px;">
												<c:choose>
													<c:when test="${doctor.gender eq '男'}">
														<option value="0">--请选择性别--</option>
														<option value="男" selected="selected">男</option>
														<option value="女">女</option>
													</c:when>
													<c:when test="${doctor.gender eq '女' }">
														<option value="0">--请选择性别--</option>
														<option value="男">男</option>
														<option value="女" selected="selected">女</option>
													</c:when>
												</c:choose>
											</select>
										</td>
									</tr>
									<tr>

										<td class="font3 fftd">所属医院：
											<select id="job_id" name="job_id" style="width: 143px;">
												<option value="${doctor.hid}" selected="selected">${doctor.hospital.hname}</option>
												<option value="0">--请选择医院--</option>
												<c:forEach items="${hospitalList }" var="hospital">
													<option value="${hospital.hid}">${hospital.hname}</option>
												</c:forEach>
										</select>
										</td>
										<td class="font3 fftd">分数：<input name="score"
											id="grade" size="20" value="${doctor.score }" /></td>
									</tr>
									<tr>
										<td class="font3 fftd">科室：
											<select id="deid" name="deid" style="width: 143px;">
												<option value="${doctor.deid}" selected="selected">${doctor.dept.dename}</option>
												<option value="0">--请选择科室--</option>
												<c:forEach items="${deptList }" var="dept">
													<option value="${dept.deid }">${dept.dename }</option>
												</c:forEach>
											</select>
										</td>
										<td class="font3 fftd">擅长治疗：<input name="skill" id="skill"
											size="20" value="${doctor.skill }" /></td>
									</tr>
									<tr>
										<td>
											简介：
											<textarea name="description" style="width: 200px;height: 150px;">${doctor.description }</textarea>
										</td>

											<td>
												工作时间：
												<textarea name="surgeryweek" style="width: 200px;height: 150px;">${doctor.surgeryweek }</textarea>
											</td>

									</tr>
						<tr>
							<td class="main_tdbor"></td>
						</tr>

						<tr>
							<td align="left" class="fftd"><input type="submit"
								value="修改">&nbsp;&nbsp;<input type="reset" value="取消 " onclick="javascript:window.history.back();return false;" 
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