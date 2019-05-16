package com.ming.hospital.admin.web;

import com.ming.hospital.admin.service.AdminHospitalService;
import com.ming.hospital.pojo.Hospital;
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
@RequestMapping("hospital")
public class AdminHospitalController {

    @Autowired
    private AdminHospitalService adminHospitalService;

    @RequestMapping("list")
    public String getHospitalList(Model model){
        List<Hospital> hospitalList = adminHospitalService.findHospitalList();
        model.addAttribute("hospitalList", hospitalList);
        return "admin/jsp/hospital/hospital";
    }

    @RequestMapping("findName")
    public String findHospitalsName(){
        return null;

    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String addHospitalFrom(){
        return "admin/jsp/hospital/showAddHospital";
    }
}
