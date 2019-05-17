package com.ming.hospital.admin.service.impl;

import com.ming.hospital.admin.service.AdminHospitalService;
import com.ming.hospital.dao.HospitalMapper;
import com.ming.hospital.pojo.Hospital;
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
public class AdminHospitalServiceImpl implements AdminHospitalService {

    @Autowired
    private HospitalMapper hospitalMapper;

    @Override
    public List<Hospital> findHospitalList() {
        return hospitalMapper.findHospitalList();
    }

    @Override
    public void updateHospital(Hospital hospital) {
        hospitalMapper.updateByPrimaryKey(hospital);
    }

    @Override
    public void addHospital(Hospital hospital) {
        hospitalMapper.insert(hospital);
    }
}
