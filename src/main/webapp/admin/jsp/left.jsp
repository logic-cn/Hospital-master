<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>人事管理系统 ——后台管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${ctx}/css/css.css" type="text/css" rel="stylesheet" />
	<!-- 导入layui -->
	<link rel="stylesheet" type="text/css" href="${ctx}/css/layui/css/layui.css">
	<script type="text/javascript" src="${ctx}/css/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
	<script language="javascript" type="text/javascript">
        $(function(){
            /** 给左侧功能菜单绑定点击事件  */
            $("td[id^='navbg']").click(function(){
                /** 获取一级菜单的id */
                var navbgId = this.id;
                /** 获取对应的二级菜单id */
                var submenuId = navbgId.replace('navbg','submenu');
                /** 控制二级菜单显示或隐藏  */
                $("#"+submenuId).toggle();
                /** 控制关闭或者开启的图标*/
                $("#"+navbgId).toggleClass("left_nav_expand");

                /** 控制其他的一级菜单的二级菜单隐藏按钮都关闭  */
                $("tr[id^='submenu']").not("#"+submenuId).hide();
                /** 控制其他一级菜单的图片显示关闭  */
                $("td[id^='navbg']").not(this).removeClass().addClass("left_nav_closed");


            })
        })
	</script>
</head>
<body>
<div style="margin: 10px; background-color: #FFFFFF; text-align: left;">
	<table width="200" height="100%" border="0" cellpadding="0"
		   cellspacing="0" class="left_nav_bg">
		<tr>
			<td class="manage left_nav_expand"><div class="font1">
				<div class="left_margin"><i class="layui-icon layui-icon-username">超级管理员</i></div></td>
		</tr>
		<tr valign="top">
			<td height="50">
				<p class="left_nav_link">
					<a href="${ctx}/adminUser/list" target="main">
						<i class="layui-icon layui-icon-triangle-r">管理员查询</i></a>
				</p>
				<p class="left_nav_link">
					<a href="${ctx}/adminUser/add?flag=1" target="main">
						<i class="layui-icon layui-icon-add-1">管理员添加</i></a>
				</p>
			</td>
		</tr>
		<tr>
			<td height="2"></td>
		</tr>

		<tr>
			<td id="navbg1" class="manage"><div class="font1">
				<div class="left_margin"><i class="layui-icon layui-icon-app">医院管理</i></div></td>
		</tr>
		<tr valign="top" id="submenu1" style="display: none">
			<td class="left_nav_bgshw" height="50">
				<p class="left_nav_link">
					<a href="${ctx}/hospital/list" target="main">
						<i class="layui-icon layui-icon-triangle-r">医院查询</i></a>
				</p>
				<p class="left_nav_link">
					<a href="${ctx}/hospital/add?flag=1" target="main">
						<i class="layui-icon layui-icon-add-1">医院添加</i></a>
				</p>
			</td>
		</tr>
		<tr>
			<td height="2"></td>
		</tr>

		<%--<tr>
            <td id="navbg2" class="manage"><div class="font1">
            <div class="left_margin"><i class="layui-icon layui-icon-rmb">职位管理</i></div></td>
        </tr>
        <tr valign="top" id="submenu2" style="display: none">
            <td class="left_nav_bgshw" height="50">
                <p class="left_nav_link">
                <a href="job/selectJob" target="main">
                <i class="layui-icon layui-icon-triangle-r">职位查询</i></a>
                </p>
                <p class="left_nav_link">
                    <a href="job/addJob?flag=1" target="main">
                    <i class="layui-icon layui-icon-add-1">添加职位</i></a>
                </p>
            </td>
        </tr>
        <tr>
            <td height="2"></td>
        </tr>
--%>
		<tr>
			<td id="navbg3" class="manage"><div class="font1">
				<div class="left_margin"><i class="layui-icon layui-icon-group">医生管理</i></div></td>
		</tr>
		<tr valign="top" id="submenu3" style="display: none">
			<td class="left_nav_bgshw" height="50">
				<p class="left_nav_link">
					<a href="${ctx}/doctor/list" target="main">
						<i class="layui-icon layui-icon-triangle-r">医生查询</i></a>
				</p>
				<p class="left_nav_link">
					<a href="${ctx}/doctor/add?flag=1" target="main">
						<i class="layui-icon layui-icon-add-1">添加医生</i></a>
				</p>
			</td>
		</tr>
		<tr>
			<td height="2"></td>
		</tr>

		<tr>
			<td id="navbg4" class="manage"><div class="font1">
				<div class="left_margin"><i class="layui-icon layui-icon-speaker">新闻管理</i></div></td>
		</tr>
		<tr valign="top" id="submenu4" style="display: none">
			<td class="left_nav_bgshw tdbtmline" height="50">
				<p class="left_nav_link">
					<a href="${ctx}/notice/selectNotice" target="main">
						<i class="layui-icon layui-icon-triangle-r">新闻查询</i></a>
				</p>
				<p class="left_nav_link">
					<a href="${ctx}/notice/addNotice?flag=1" target="main">
						<i class="layui-icon layui-icon-add-1">添加新闻</i></a>
				</p>
			</td>
		</tr>

		<tr>
			<td height="2"></td>
		</tr>

		<tr>
			<td id="navbg5" class="manage"><div class="font1">
				<div class="left_margin"><i class="layui-icon layui-icon-group">预约管理</i></div></td>
		</tr>
		<tr valign="top" id="submenu5" style="display: none">
			<td class="left_nav_bgshw" height="50">
				<p class="left_nav_link">
					<a href="${ctx}/appointment/list" target="main">
						<i class="layui-icon layui-icon-triangle-r">预约查询</i></a>
				</p>
			</td>
		</tr>
		<tr>
			<td height="10" bgcolor="#e5f0ff">&nbsp;</td>
		</tr>
	</table>
</div>
</body>
</html>