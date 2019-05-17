package com.ming.hospital.admin.service;

import com.ming.hospital.pojo.Doctor;

import java.util.List;

/**
 * Created by Administrator on 2019/5/16.
 */
public interface AdminDoctorService {

    List<Doctor> getDoctorList();

    Doctor selectDoctorById(Long id);

    void addDoctor(Doctor doctor);

    void updateDoctor(Doctor doctor);

    void deleteDoctor(Long id);

}
