package com.ming.hospital.dao;


import com.ming.hospital.pojo.Notice;


import java.util.List;

public interface NoticeDao {
	// 查询所有的须知
	 List<Notice> findNoticeByType();

	// 查询所有通知的数量
     int findNoticeByTypeNum();

	// 通过id查询通知
	 Notice findNoticeById(int id);

	 List<Notice> selectNoticeList();

	//根据ID查询公告信息
	Notice selectNoticeById(Integer id);
	// 动态更新公告
	void saveNotice(Notice notice);

	//增加公告信息
	void AddNotice(Notice notice );


	//根据ID删除公告
	void deleteNoticeById(Integer id);
}
