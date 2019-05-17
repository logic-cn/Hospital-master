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
<script type="text/javascript">
	$(function(){
		// 控制文档加载完成以后 选中性别 
		$("#sex").val("${employee.sex}");
		$("#job_id").val("${employee.job.id}");
		
    	/** 员工表单提交 */
		$("#employeeForm").submit(function(){
			alert("确认修改？");
			var name = $("#name");
//			var cardId = $("#cardId");
//			var education = $("#education");
//			var email = $("#email");
//			var phone = $("#phone");
//			var tel = $("#tel");
//			var party = $("#party");
//			var qqNum = $("#qqNum");
//			var address = $("#address");
//			var postCode = $("#postCode");
//			var birthday = $("#birthday");
//			var race = $("#race");
//			var speciality = $("#speciality");
//			var hobby = $("#hobby");
			var msg = "";
			if ($.trim(name.val()) == ""){
				msg = "姓名不能为空！";
				name.focus();
			}/*else if ($.trim(cardId.val()) == ""){
				msg = "身份证号码不能为空！";
				cardId.focus();
			}else if (!/^[1-9]\d{16}[0-9A-Za-z]$/.test($.trim(cardId.val()))){
				msg = "身份证号码格式不正确！";
				cardId.focus();
			}*/ /* else if ($.trim(education.val()) == ""){
				msg = "学历不能为空！";
				education.focus();
			} *//*else if ($.trim(email.val()) == ""){
				msg = "邮箱不能为空！";
				email.focus();
			}else if (!/^\w+@\w{2,3}\.\w{2,6}$/.test($.trim(email.val()))){
				msg = "邮箱格式不正确！";
				email.focus();
			} else if ($.trim(phone.val()) == ""){
				msg = "手机号码不能为空！";
				phone.focus();
			}else if (!/^1[3|5|8]\d{9}$/.test($.trim(phone.val()))){
				msg = "手机号码格式不正确！";
				phone.focus();
			}*//* else if ($.trim(tel.val()) == ""){
				msg = "电话号码不能为空！";
				tel.focus();
			}else if (!/^0\d{2,3}-?\d{7,8}$/.test($.trim(tel.val()))){
				msg = "电话号码格式不正确！";
				tel.focus();
			}else if ($.trim(party.val()) == ""){
				msg = "政治面貌不能为空！";
				party.focus();
			} *//*else if ($.trim(qqNum.val()) == ""){
				msg = "QQ号码不能为空！";
				qqNum.focus();
			}else if (!/^\d{6,}$/.test($.trim(qqNum.val()))){
				msg = "QQ号码格式不正确！";
				qqNum.focus();
			}else if ($.trim(address.val()) == ""){
				msg = "地址不能为空！";
				address.focus();
			}*//* else if ($.trim(postCode.val()) == ""){
				msg = "邮政编码不能为空！";
				postCode.focus();
			}else if (!/^[1-9]\d{5}$/.test($.trim(postCode.val()))){
				msg = "邮政编码格式不正确！";
				postCode.focus();
			} *//*else if ($.trim(birthday.val()) == ""){
				msg = "出生日期不能为空！";
				birthday.focus();
			}else if (!birthday.val()){
//					!/^\d{4}-\d{2}-\d{2}$/.test($.trim(birthday.val()))
				msg = "出生日期格式不正确！";
				birthday.focus();
			}*//* else if ($.trim(race.val()) == ""){
				msg = "民族不能为空！";
				race.focus();
			}else if ($.trim(speciality.val()) == ""){
				msg = "专业不能为空！";
				speciality.focus();
			}else if ($.trim(hobby.val()) == ""){
				msg = "爱好不能为空！";
				hobby.focus();
			} */
			if (msg != ""){
				$.ligerDialog.error(msg);
				return false;
			}else{
				return true;
			}
			$("#employeeForm").submit();
		});
    });
		

	</script>
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
				<form action="${ctx}/doctor/add" id="employeeForm"
					method="post">
					<!-- 隐藏表单，flag表示添加标记 -->
					<%--<input type="hidden" name="flag" value="2"> <input--%>
						<%--type="hidden" name="did" value="${doctor.did }">--%>
					<table width="100%" border="0" cellpadding="0" cellspacing="10"
						class="main_tab">
						<tr>
							<td class="font3 fftd">
								<table>
									<tr>
										<td class="font3 fftd">姓名：<input type="text" name="dname"
											id="name" size="20" value="${doctor.dname }" /></td>
										<td class="font3 fftd">性别： 
											<select id="gender" name="gender" style="width: 143px;">
												<option value="0" selected="selected">--请选择性别--</option>
												<option value="男">男</option>
												<option value="女">女</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="font3 fftd">所属医院：
											<select id="hid" name="hid" style="width: 143px;">
												<option value="0" selected="selected">--请选择医院--</option>
												<c:forEach items="${hospitalList }" var="hospital">
													<option value="${hospital.hid }">${hospital.hname }</option>
												</c:forEach>
											</select>
										</td>
										<td class="font3 fftd">分数：<input name="score"
											id="grade" size="20" value="${doctor.score }" /></td>
									</tr>
									<tr>
										<%--<td class="font3 fftd">等级：<input name="grade"--%>
											<%--id="education" size="20" value="${doctor.grade }" /></td>--%>
										<td class="font3 fftd">科室：
											<select id="deid" name="deid" style="width: 143px;">
												<option value="0" selected="selected">--请选择科室--</option>
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
											<textarea name="description" style="width: 200px;height: 150px;"></textarea>
										</td>
										<td>
											工作时间：
											<textarea name="surgeryweek" style="width: 200px;height: 150px;"></textarea>
										</td>
									</tr>

						<tr>
							<td class="main_tdbor"></td>
						</tr>

						<tr>
							<td align="left" class="fftd"><input type="submit"
								value="新增">&nbsp;&nbsp;<input type="reset" value="取消 " onclick="javascript:window.history.back();return false;"
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