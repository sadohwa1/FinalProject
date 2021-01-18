package com.kh.camp.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//import com.kh.camp.model.service.CampNoticeVO;
import com.kh.camp.model.vo.CampPictureVO;
import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;

@Repository
public class CampDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<CampVO> selectList(HashMap<String, Integer> map) {
		List<CampVO> list = sqlSession.selectList("camp.selectList",map);
		return (ArrayList<CampVO>)list;
	}

	public int totalCount() {
		return sqlSession.selectOne("camp.totalCount");
	}

	public CampVO campView(CampVO c) {
		return sqlSession.selectOne("camp.selectOne",c);
	}

	public ArrayList<CampPictureVO> selectPictureList(HashMap<String, Integer> map) {
		List<CampPictureVO> pictureList = sqlSession.selectList("camp.selectPictureList",map);
		return (ArrayList<CampPictureVO>)pictureList;
	}

	public ArrayList<SiteVO> selectSiteList(SiteVO site) {
		List<SiteVO> siteList = sqlSession.selectList("camp.selectSiteList",site);
		return (ArrayList<SiteVO>)siteList;
	}

	public int reserveTotalCount(SiteVO site) {	
		return sqlSession.selectOne("camp.reserveTotalCount",site);
	}

	//public ArrayList<CampNoticeVO> selectNoticeList(CampVO camp) {
	//	List<CampNoticeVO> noticeList = sqlSession.selectList("camp.selectNoticeList",camp);
	//	return (ArrayList<CampNoticeVO>)noticeList;
	//}	

	
}
