package com.ming.hospital.admin.service.impl;

import com.ming.hospital.admin.service.AdminNoticeService;
import com.ming.hospital.dao.NoticeDao;
import com.ming.hospital.pojo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {
    @Autowired
    private NoticeDao noticeMapper;

    @Override
   public List<Notice> selectNoticeList(){
        return noticeMapper.selectNoticeList();
    }

    @Override
    public Notice findNoticeById(Integer id) {
        // TODO Auto-generated method stub
        return noticeMapper.selectNoticeById(id);
    }

    @Override
    public void modifyNotice(Notice notice) {
        noticeMapper.saveNotice(notice);

    }
    @Override
    public void addNotice(Notice notice) {
        noticeMapper.AddNotice(notice);

    }

    @Override
    public void removeNoticeById(Integer id) {
        noticeMapper.deleteNoticeById(id);

    }

}
