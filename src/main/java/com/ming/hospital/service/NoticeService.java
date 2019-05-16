package com.ming.hospital.service;


import com.ming.hospital.pojo.Notice;

import java.util.List;

public interface NoticeService {

	// 查询所有的须知
	public List<Notice> findNoticeByType();

	// 查询所有的须知的数量
	public int findNoticeByTypeNum();

	// 通过id查询通知
	public Notice findNoticeById(int id);
	

}
