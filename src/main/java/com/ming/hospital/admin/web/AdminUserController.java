package com.ming.hospital.admin.web;

import com.ming.hospital.admin.pojo.AdminUser;
import com.ming.hospital.admin.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;
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
    public String addAdminUserFrom(String id, Model model){
        if (id !=null && !id.isEmpty()){
            AdminUser adminUser = adminUserService.findUserById(Integer.parseInt(id));
            model.addAttribute("adminUser", adminUser);
        }
        return "admin/jsp/user/showAddUser";
    }

    /**
     * 添加修改操作
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String addAdminUser(AdminUser user, String id){
        if (id !=null && !id.isEmpty()){
            adminUserService.modifyUser(user);
        }else {
            user.setStatus(1);
            user.setCreateDate(new Date());
            adminUserService.addUser(user);
        }
        return "redirect:/adminUser/list";
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @RequestMapping("removeAdmin")
    public String removeAdmin(String ids){
        String[] identifiers= ids.split(",");
        for (String id:identifiers) {
            adminUserService.removeUserById(Integer.parseInt(id));
        }
        return "redirect:/adminUser/list";
    }
}
