package com.ming.hospital.service.impl;


import com.ming.hospital.dao.NoticeDao;
import com.ming.hospital.pojo.Notice;
import com.ming.hospital.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	@Override
	public List<Notice> findNoticeByType() {
		// TODO Auto-generated method stub
		return noticeDao.findNoticeByType();
	}
	@Override
	public int findNoticeByTypeNum() {
		// TODO Auto-generated method stub
		return noticeDao.findNoticeByTypeNum();
	}
	@Override
	public Notice findNoticeById(int id) {
		// TODO Auto-generated method stub
		return noticeDao.findNoticeById(id);
	}

}
