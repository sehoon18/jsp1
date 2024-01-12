package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

public class MemberService {
	public void insertMember(HttpServletRequest request) {
		System.out.println("MemberService insertMember();");

		try {
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			Timestamp date = new Timestamp(System.currentTimeMillis());

			MemberDAO mDAO = new MemberDAO();
			MemberDTO mDTO = new MemberDTO();
			
			mDTO.setId(id);
			mDTO.setPass(pass);
			mDTO.setName(name);
			mDTO.setDate(date);
			
			mDAO.insertMember(mDTO);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean userCheck(HttpServletRequest request) {
		System.out.println("MemberService userCheck()");

		boolean rs = false;
		try {
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			
			MemberDAO mDAO = new MemberDAO();
			rs = mDAO.userCheck(id, pass);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} return rs;
	}
	
	public MemberDTO getInfo(String id) {
		MemberDTO mDTO = null;
		try {
			MemberDAO mDAO = new MemberDAO();
			mDTO = mDAO.getInfo(id);
		} catch (Exception e) {
			e.printStackTrace();
		} return mDTO;
	}
	
	public void updateMember(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");

			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(id);
			memberDTO.setName(name);
			
			MemberDAO memberDAO = new MemberDAO();
			
			
			memberDAO.updateMember(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteMember(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			
			String id = request.getParameter("id");
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(id);
			
			MemberDAO memberDAO = new MemberDAO();
			
			
			memberDAO.deleteMember(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDTO> getMemberList() {
		ArrayList<MemberDTO> mList = null;
		try {
			MemberDAO memberDAO = new MemberDAO();
			mList = memberDAO.getMemberList();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} return mList;
		
	}
	
}
