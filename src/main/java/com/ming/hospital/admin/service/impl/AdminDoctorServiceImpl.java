package com.ming.hospital.admin.service.impl;

import com.ming.hospital.admin.service.AdminDoctorService;
import com.ming.hospital.dao.DoctorMapper;
import com.ming.hospital.pojo.Doctor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2019/5/16.
 */
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service
public class AdminDoctorServiceImpl implements AdminDoctorService{

    @Autowired
    private DoctorMapper doctorMapper;


    @Override
    public List<Doctor> getDoctorList() {
        return doctorMapper.selectDoctorList();
    }
}
