package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.service.MemberService;

public class BoardController extends HttpServlet{
	RequestDispatcher dispatchar = null;
	MemberService memberService = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sPath = request.getServletPath();
		System.out.println(sPath);
		
		if(sPath.equals("/write.bo")) {
			System.out.println("가상주소비교 /write.bo 일치");
			
			dispatchar = request.getRequestDispatcher("board/write.jsp");
			dispatchar.forward(request, response);
		}
	}
}
	
