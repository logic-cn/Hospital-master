package com.ming.hospital.admin.web;

import com.ming.hospital.admin.pojo.AdminUser;
import com.ming.hospital.admin.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by Administrator on 2019/5/16.
 */
@Controller
@RequestMapping("adminUser")
public class AdminUserController {

    @Autowired
    private AdminUserService adminUserService;

    /**
     * 管理员列表
     * @param model
     * @return
     */
    @RequestMapping("list")
    public String getAdminUserList(Model model){
        List<AdminUser> adminUserList = adminUserService.findAdminUserList();
        model.addAttribute("adminUserList", adminUserList);
        return "admin/jsp/user/user";
    }

    /**
     * 添加路由
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String addAdminUserFrom(){
        return "admin/jsp/user/showAddUser";
    }
}
