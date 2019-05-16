package com.ming.hospital.admin.web;

import com.ming.hospital.admin.pojo.AdminUser;
import com.ming.hospital.pojo.Login;

import com.ming.hospital.admin.service.AdminUserService;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.OutputStream;
import java.util.Random;

/**
 * 处理用户请求控制器
 */
@Controller
@RequestMapping(value = "/admin")
public class LoginController {

	/**
	 * 自动注入UserService
	 */
	@Autowired
	//@Qualifier("AdminUserService")
	private AdminUserService AdminUserService;

	/**
	 * 处理登录请求
	 * 
	 * @param String
	 *            loginname 登录名
	 * @param String
	 *            password 密码
	 * @return 跳转的视图
	 */

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		// 清除Session
		session.invalidate();
		// 重定向到登录页面的跳转方法
		return "redirect:login.jsp";
	}

	@RequestMapping(value = "/login")
	public String login(Login login, HttpSession session, Model model) {
		// 调用业务逻辑组件判断用户是否可以登录
		// System.out.println("*******start********");
		// System.out.println(login);
		// System.out.println(login.getIdentifyingcode());
		// System.out.println(randomString);
		// System.out.println("********end*********");
		if (null != login) {
			if (login.getIdentifyingcode().equalsIgnoreCase(randomString)) {
				System.out.println("登录信息====" + login.getLoginname().trim() + login.getPassword().trim());
				AdminUser user = AdminUserService.login(login.getLoginname().trim(), login.getPassword().trim());
				 //System.out.println(user);
				session.setAttribute("USERS_SESSION", user);
				return "redirect:/admin/jsp/main.jsp";
			} else if (randomString == null || randomString.equals("")) {
				model.addAttribute("msg", "验证码已过期，请刷新页面重新获取验证码");
			} else {
				model.addAttribute("msg", "验证码不正确请重新输入！");
				return "forward:/admin/login.jsp";
			}
		}
		return null;

		// }
		// User user = AdminUserService.login(loginname, password);
		// if (user != null) {
		// // 将用户保存到HttpSession当中
		// System.out.println(user);
		// session.setAttribute("user", user);
		// // 客户端跳转到main页面
		// mv.setViewName("redirect:/main");
		// } else {
		// // 设置登录失败提示信息
		// mv.addObject("message", "登录名或密码错误!请重新输入");
		// // 服务器内部跳转到登录页面
		// mv.setViewName("forward:/loginForm");
		// }

	}
	/**
	 * 验证码实现
	 */
	private static final char[] CHARS = { '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
			'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

	private static Random random = new Random();

	private static String randomString = null;

	private static String getRandomString() {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			sb.append(CHARS[random.nextInt(CHARS.length)]);
		}
		randomString = sb.toString();
		return sb.toString();
	}

	private static Color getRandomColor() {
		return new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
	}

	private static Color getReverseColor(Color c) {
		return new Color(255 - c.getRed(), 255 - c.getGreen(), 255 - c.getBlue());
	}


	// 得到BufferedImage格式的验证码,需要转换JPG
	@RequestMapping(value = "/yzm")
	public static void getyzm(HttpServletResponse rep, HttpServletRequest req) {
		System.out.println("--------");
		rep.setContentType("image/jpeg");
		String randomString = getRandomString();
		req.getSession(true).setAttribute("randomString", randomString);
		Color color = getRandomColor();
		Color reverse = getReverseColor(color);
		BufferedImage bi = new BufferedImage(109, 40, BufferedImage.TYPE_INT_BGR);
		Graphics2D g = bi.createGraphics();

		g.setFont(new Font(Font.SANS_SERIF, Font.ITALIC, 25));
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, 109, 40);
		g.setColor(reverse);
		g.drawString(randomString, 0, 30);
		for (int i = 0, n = random.nextInt(1000); i < n; i++) {
			g.drawRect(random.nextInt(300), random.nextInt(100), 1, 1);
		}
		// 转JPEG格式
		OutputStream out;
		try {
			// out = new FileOutputStream(new File("C://Users/asus_pc/Desktop/1.jpg"));
			out = rep.getOutputStream();
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			encoder.encode(bi);
			out.flush();
		} catch (Exception e) {
			System.out.println("验证码未转换图片成功");
			e.printStackTrace();
		}
	}
}
