package com.itwillbs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.service.BoardService;

public class BoardController extends HttpServlet{
	RequestDispatcher dispatchar = null;
	BoardService boardService = null;
	
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
		
		if(sPath.equals("/writePro.bo")) {
			System.out.println("가상주소비교 /writePro.bo 일치");
			
			boardService = new BoardService();
			boardService.insertBoard(request);
			response.sendRedirect("main.me");
		}
		
		if(sPath.equals("/list.bo")) {
			System.out.println("가상주소비교 /list.bo 일치");
			
			boardService = new BoardService();
			ArrayList<BoardDTO> boardList = boardService.getBoardList();
			request.setAttribute("boardList", boardList);

			dispatchar = request.getRequestDispatcher("board/list.jsp");
			dispatchar.forward(request, response);
		}
		
		if(sPath.equals("/content.bo")) {
			System.out.println("가상주소비교 /content.bo 일치");
			int num = Integer.parseInt(request.getParameter("num"));
			boardService = new BoardService();
			
			boardService.updateReadcount(num);
			
			BoardDTO boardDTO = boardService.getBoardContent(num);
			request.setAttribute("boardDTO", boardDTO);

			dispatchar = request.getRequestDispatcher("board/content.jsp?num=" + num);
			dispatchar.forward(request, response);
		}
		
		if(sPath.equals("/update.bo")) {
			System.out.println("가상주소비교 /update.bo 일치");
			int num = Integer.parseInt(request.getParameter("num"));
			boardService = new BoardService();
			
			BoardDTO boardDTO = boardService.getBoardContent(num);
			request.setAttribute("boardDTO", boardDTO);

			dispatchar = request.getRequestDispatcher("board/update.jsp");
			dispatchar.forward(request, response);
		}
		
		if(sPath.equals("/updatePro.bo")) {
			System.out.println("가상주소비교 /updatePro.bo 일치");
			boardService = new BoardService();
			
			boardService.updateBoard(request);
			
			int num = Integer.parseInt(request.getParameter("num"));
			response.sendRedirect("content.bo?num=" + num);
		}
		
		if(sPath.equals("/delete.bo")) {
			System.out.println("가상주소비교 /delete.bo 일치");
			int num = Integer.parseInt(request.getParameter("num"));

			boardService = new BoardService();
			
			boardService.deleteBoard(num);
			response.sendRedirect("list.bo");

		}
		
	}
}
	
