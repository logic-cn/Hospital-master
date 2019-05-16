package com.ming.hospital.dao;


import com.ming.hospital.pojo.Notice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeDao {
	// 查询所有的须知
	 List<Notice> findNoticeByType();

	// 查询所有通知的数量
     int findNoticeByTypeNum();

	// 通过id查询通知
	 Notice findNoticeById(int id);

}
