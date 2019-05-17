package com.ming.hospital.admin.web;



import com.ming.hospital.admin.service.AdminNoticeService;
import com.ming.hospital.pojo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("notice")
public class AdminNoticeController {
    @Autowired
    private AdminNoticeService adminNoticeService;
    /**
     * 查询医新闻列表
     * @return
     */
    @RequestMapping("selectNotice")
    public String getDoctorList(Model model){
        List<Notice> noticeList = adminNoticeService.selectNoticeList();
        model.addAttribute("noticeList", noticeList);
        return "/admin/jsp/notice/notice";
    }

    @RequestMapping(value = "updateNotice")
    public String updateUser(String flag, @ModelAttribute Notice notice, Model mv) {
        if (flag.equals("1")) {
            // 根据id查询用户
            Notice target = adminNoticeService.findNoticeById(notice.getId());
            // 设置Model数据
            //System.out.println(notice.getId());
            mv.addAttribute("notice", target);
            // 返回修改员工页面
            return "/admin/jsp/notice/showUpdateNotice";
        } else {
            // 执行修改操作
            adminNoticeService.modifyNotice(notice);
            // 设置客户端跳转到查询请求
           // return ("redirect:/notice/selectNotice");
            return ("redirect:/notice//selectNotice");
        }
        // 返回
    }
//增加
    @RequestMapping(value = "addNotice")
    public String addUser(String flag, @ModelAttribute Notice notice, Model mv) {
        if (flag.equals("1")) {
            // 设置跳转到添加页面
            return "/admin/jsp/notice/showAddNotice";
        } else {
            // 执行添加操作
            adminNoticeService.addNotice(notice);;
            // 设置客户端跳转到查询请求
            return "redirect:/notice/selectNotice";
        }
        // 返回
    }

    //预览
    @RequestMapping(value="/previewNotice")
    public String previewNotice( Integer id,Model model){

        Notice notice = adminNoticeService.findNoticeById(id);

        model.addAttribute("notice", notice);
        // 返回
        return "/admin/jsp/notice/previewNotice";
    }

    //删除公告
    @RequestMapping(value = "removeNotice")
    public String removeUser(String ids, Model mv) {
        // 分解id字符串
        String[] idArray = ids.split(",");
        for (String id : idArray) {
            // 根据id删除员工
            adminNoticeService.removeNoticeById(Integer.parseInt(id));;
        }
        // 设置客户端跳转到查询请求
        return "redirect:/notice/selectNotice";
        // 返回ModelAndView
    }
}
