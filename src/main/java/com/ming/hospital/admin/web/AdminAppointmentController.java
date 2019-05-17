package com.ming.hospital.admin.web;

import com.ming.hospital.pojo.Appointment;
import com.ming.hospital.service.AppointmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Administrator on 2019/5/17.
 */
@Controller
@RequestMapping("appointment")
public class AdminAppointmentController {


    @Autowired
    private AppointmentService appointmentService;

    @RequestMapping("list")
    public String getAppointmentList(Model model){
        List<Appointment> appointments = appointmentService.listAll();
        model.addAttribute("appointments", appointments);
        return "/admin/jsp/appointment/appointment";
    }

    @RequestMapping("delete")
    public String deleteAppointment(String ids){
        String[] split = ids.split(",");
        for (String id : split) {
            appointmentService.deleteAppointment(Long.parseLong(id));
        }
        return "redirect:/appointment/list";
    }
}
