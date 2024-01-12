package com.itwillbs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

public class MemberController extends HttpServlet{
	RequestDispatcher dispatchar = null;
	MemberService memberService = null;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController doGet()");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController doPost()");
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController doProcess()");
		String sPath = request.getServletPath();
		System.out.println(sPath);
		
		if(sPath.equals("/insert.me")) {
			System.out.println("가상주소비교 /insert.me 일치");
			
			dispatchar = request.getRequestDispatcher("member/insert.jsp");
			dispatchar.forward(request, response);
		}
		
		if(sPath.equals("/insertPro.me")) {
			System.out.println("가상주소비교 /insertPro.me 일치");

			request.setCharacterEncoding("utf-8");
			memberService = new MemberService();
			memberService.insertMember(request);
			
			response.sendRedirect("login.me");
		}
		
		if(sPath.equals("/login.me")) {
			System.out.println("가상주소비교 /login.me 일치");

			dispatchar = request.getRequestDispatcher("member/login.jsp");
			dispatchar.forward(request, response);
		}
		
		if(sPath.equals("/loginPro.me")) {
			System.out.println("가상주소비교 /loginPro.me 일치");

			memberService = new MemberService();
			boolean rs = memberService.userCheck(request);
			String id = request.getParameter("id");

			if(rs == true) {
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				response.sendRedirect("main.me");

			} else {
				response.sendRedirect("login.me");				
			}
		}
			
		if(sPath.equals("/main.me")) {
			System.out.println("가상주소비교 /main.me 일치");

			dispatchar = request.getRequestDispatcher("member/main.jsp");
			dispatchar.forward(request, response);
		}

		if(sPath.equals("/logout.me")) {
			System.out.println("가상주소비교 /logout.me 일치");
			HttpSession session = request.getSession();
			session.invalidate();
			
			response.sendRedirect("main.me");
		}
		
		if(sPath.equals("/info.me")) {
			System.out.println("가상주소비교 /info.me 일치");
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			memberService = new MemberService();
			MemberDTO memberDTO = memberService.getInfo(id);
			
			request.setAttribute("memberDTO", memberDTO);
			
			dispatchar = request.getRequestDispatcher("member/info.jsp");
			dispatchar.forward(request, response);
		}
		
		if(sPath.equals("/update.me")) {
			System.out.println("가상주소비교 /update.me 일치");
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			
			memberService = new MemberService();
			MemberDTO memberDTO = memberService.getInfo(id);
			request.setAttribute("memberDTO", memberDTO);
			
			dispatchar = request.getRequestDispatcher("member/update.jsp");
			dispatchar.forward(request, response);
		}
		
		if(sPath.equals("/updatePro.me")) {
			System.out.println("가상주소비교 /updatePro.me 일치");
			
			memberService = new MemberService();
			
			boolean result = memberService.userCheck(request);
			
			if(result == true) {
				memberService.updateMember(request);
				response.sendRedirect("info.me");				
			} else {
				response.sendRedirect("update.me");								
			}
		}
		
		if(sPath.equals("/delete.me")) {
			System.out.println("가상주소비교 /delete.me 일치");
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			
			memberService = new MemberService();
			MemberDTO memberDTO = memberService.getInfo(id);
			request.setAttribute("memberDTO", memberDTO);
			
			dispatchar = request.getRequestDispatcher("member/delete.jsp");
			dispatchar.forward(request, response);
		}
		
		if(sPath.equals("/deletePro.me")) {
			System.out.println("가상주소비교 /deletePro.me 일치");
			
			memberService = new MemberService();
			
			boolean result = memberService.userCheck(request);
			
			if(result == true) {
				memberService.deleteMember(request);
				HttpSession session = request.getSession();
				session.invalidate();
				
				response.sendRedirect("main.me");				
			} else {
				response.sendRedirect("delete.me");								
			}
		}
	
		if(sPath.equals("/list.me")) {
			System.out.println("가상주소비교 /list.me 일치");
			
			memberService = new MemberService();
			ArrayList<MemberDTO> memberList = memberService.getMemberList();
			
			request.setAttribute("memberList", memberList);
			
			dispatchar = request.getRequestDispatcher("member/list.jsp");
			dispatchar.forward(request, response);
		}
	
	}
}
