package com.ming.hospital.web;


import com.ming.hospital.pojo.Notice;
import com.ming.hospital.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * 
 * @author sfturing
 *
 * @date 2017年6月2日
 */
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;


	/**
	 * 公告首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/noticeIndex")
	public String noticeIndex(Model model) {

		// 查询所有通知
		List<Notice> notice = noticeService.findNoticeByType();


		System.out.println("*******************************************");
		model.addAttribute("notice", notice);

		return "noticeIndex";
	}

	/**
	 * 通知详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "/noticeInfo/{id}", method = RequestMethod.GET)
	public String hosInfoShow(Model model, @PathVariable(value = "id") int id) {
		Notice notice = noticeService.findNoticeById(id);
		model.addAttribute("notice", notice);
		return "noticeInfo";
	}

}
