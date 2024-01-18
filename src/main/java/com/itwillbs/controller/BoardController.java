package com.itwillbs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.dao.PageDTO;
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
			
			// 한 페이지에 보여줄 글 개수 설정 10
			int pageSize = 3;
			String pageNum = request.getParameter("pageNum");

			// 현 페이지 번호가 없으면(null 이면) "1"페이지로 설정
			if(pageNum == null) {
				pageNum = "1";
			}
			
			// 페이지 번호를 정수형으로 변경
			int currentPage = Integer.parseInt(pageNum);
			
			// 페이징 작업
			// 전체 글 개수 구하기
			boardService = new BoardService();
			int count = boardService.getBoardcount();
			
			// 한 화면에 보여줄 페이지 개수 설정
			int pageBlock = 3;
			
			// 시작하는 페이지번호 구하기
			int startPage = (currentPage -1) /pageBlock * pageBlock + 1;
			
			// 끝나는 페이지번호 구하기
			int endPage = pageBlock + startPage - 1;
			
			// 전체 페이지 개수
			int pageCount = count / pageBlock + (count % pageBlock == 0 ? 0 : 1);
			
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			PageDTO pDTO = new PageDTO();
			pDTO.setPageCount(pageCount);
			pDTO.setPageBlock(pageBlock);
			pDTO.setStartPage(startPage);
			pDTO.setEndPage(endPage);
			pDTO.setCount(count);
			pDTO.setPageSize(pageSize);
			pDTO.setCurrentPage(currentPage);
			
			request.setAttribute("pageDTO", pDTO);

			boardService = new BoardService();
			ArrayList<BoardDTO> boardList = boardService.getBoardList(pDTO);
			request.setAttribute("boardList", boardList);

			dispatchar = request.getRequestDispatcher("board/list.jsp");
			dispatchar.forward(request, response);
		}
		
		if(sPath.equals("/content.bo")) {
			System.out.println("가상주소비교 /content.bo 일치");
			int num = Integer.parseInt(request.getParameter("num"));
			
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
	
