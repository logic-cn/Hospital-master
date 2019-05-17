package com.ming.hospital.admin.web;

import com.ming.hospital.admin.service.AdminHospitalService;
import com.ming.hospital.pojo.Hospital;
import com.ming.hospital.service.HospitalService;
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

    @Autowired
    private HospitalService hospitalService;

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

    /**
     * 增加修改路由
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String addHospitalFrom(Long id,Model model){
        if (id != null){
            Hospital hospital = hospitalService.getHospitalById(id);
            model.addAttribute("hospital", hospital);
        }
        return "admin/jsp/hospital/showAddHospital";
    }

    /**
     * 新增修改操作
     * @param id
     * @param hospital
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String addHospital(Long id, Hospital hospital){
        if (id != null){
            adminHospitalService.updateHospital(hospital);
        }else {
            adminHospitalService.addHospital(hospital);
        }
        return "redirect:/adminUser/list";
    }
}
