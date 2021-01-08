package com.kh.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao dao;

	public MemberVO selectOneMember(MemberVO m) {
		return dao.selectOneMember(m);
	}

	public MemberVO selectOneMemberId(MemberVO m) {
		return dao.selectOneMemberId(m);
	}

	public MemberVO selectOneMemberPw(MemberVO m) {
		return dao.selectOneMemberPw(m);
	}
	
	public int insertMember(MemberVO m) {
		return dao.insertMember(m);
	}

	public MemberVO mypageMember(int memberNo) {
		return dao.mypageMember(memberNo);
	}
	
	public int updateMember(MemberVO m) {
		return dao.updateMember(m);
	}

	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}



}