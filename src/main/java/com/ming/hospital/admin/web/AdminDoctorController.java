package com.ming.hospital.admin.web;

import com.ming.hospital.admin.service.AdminDoctorService;
import com.ming.hospital.admin.service.AdminHospitalService;
import com.ming.hospital.pojo.Dept;
import com.ming.hospital.pojo.Doctor;
import com.ming.hospital.pojo.Hospital;
import com.ming.hospital.service.DeptService;
import com.ming.hospital.service.DoctorService;
import org.springframework.beans.Mergeable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2019/5/16.
 */
@Controller
@RequestMapping("doctor")
public class AdminDoctorController {

    @Autowired
    private AdminDoctorService adminDoctorService;

    @Autowired
    private AdminHospitalService adminHospitalService;

    @Autowired
    private DeptService deptService;

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
    public String addDoctorFrom(Model model){
        List<Hospital> hospitalList = adminHospitalService.findHospitalList();
        List<Dept> deptList = deptService.getList();
        model.addAttribute("hospitalList", hospitalList);
        model.addAttribute("deptList", deptList);
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
        List<Hospital> hospitalList = adminHospitalService.findHospitalList();
        List<Dept> deptList = deptService.getList();
        model.addAttribute("hospitalList", hospitalList);
        model.addAttribute("deptList", deptList);
        return "/admin/jsp/doctor/showUpdateDoctor";
    }


    /**
     * 添加操作
     * @param doctor
     * @param model
     * @return
     */
    @RequestMapping(value = "add",  method = RequestMethod.POST)
    public String addDoctor(Doctor doctor, Model model){
        doctor.setImage("images/yisheng1.png");
        adminDoctorService.addDoctor(doctor);
        return "redirect:/doctor/list";
    }

    /**
     * 修改操作
     * @param doctor
     * @param model
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String updateDoctor(Doctor doctor, Model model){
        //System.out.println(doctor.toString());
        adminDoctorService.updateDoctor(doctor);
        return "redirect:/doctor/list";
    }

    /**
     * 删除操作
     * @param ids
     * @return
     */
    @RequestMapping("delete")
    public String deleteDoctor(String ids){
        String[] split = ids.split(",");
        for (String id : split) {
            adminDoctorService.deleteDoctor(Long.parseLong(id));
        }
        return "redirect:/doctor/list";
    }

}
