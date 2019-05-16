package com.ming.hospital.admin.web;

import com.ming.hospital.admin.service.AdminDoctorService;
import com.ming.hospital.pojo.Doctor;
import org.springframework.beans.Mergeable;
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
@RequestMapping("doctor")
public class AdminDoctorController {

    @Autowired
    private AdminDoctorService adminDoctorService;

    /**
     * 查询医生列表
     * @return
     */
    @RequestMapping("list")
    public String getDoctorList(Model model){
        List<Doctor> doctorList = adminDoctorService.getDoctorList();
        model.addAttribute("doctorList", doctorList);
        return "/admin/jsp/doctor/doctor";
    }

    /**
     * 添加路由
     * @return
     */
    @RequestMapping(value = "add",  method = RequestMethod.GET)
    public String addDoctorFrom(){
        return "/admin/jsp/doctor/showAddDoctor";
    }

    /**
     * 修改路由
     * @return
     */
    @RequestMapping(value = "update",  method = RequestMethod.GET)
    public String updateDoctorFrom(Long id, Model model){
        Doctor doctor = adminDoctorService.selectDoctorById(id);
        model.addAttribute("doctor", doctor);
        return "/admin/jsp/doctor/showUpdateDoctor";
    }


    /**
     * 添加修改操作
     * @param doctor
     * @param model
     * @return
     */
    @RequestMapping(value = "add",  method = RequestMethod.POST)
    public String addDoctor(Doctor doctor, Model model){
        System.out.println(doctor.toString());
        return "/admin/jsp/doctor/doctor";
    }

    /**
     * 删除操作
     * @param doctor
     * @param model
     * @return
     */
    @RequestMapping("delete")
    public String deleteDoctor(Doctor doctor, Model model){


        return null;
    }

}
