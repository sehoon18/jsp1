package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.dao.PageDTO;
import com.itwillbs.domain.BoardDTO;

public class BoardService {
	BoardDAO bDAO = null;
	
	public void insertBoard(HttpServletRequest request) {
		System.out.println("BoardService insertBoard()");

		try {
			
			bDAO = new BoardDAO();
			BoardDTO bDTO = new BoardDTO();
			
			request.setCharacterEncoding("utf-8");
			String name = request.getParameter("name");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			int num = bDAO.getBoardNum() + 1;
			int readcount = 0;
			Timestamp date = new Timestamp(System.currentTimeMillis());

			bDTO.setNum(num);
			bDTO.setName(name);
			bDTO.setSubject(subject);
			bDTO.setContent(content);
			bDTO.setReadcount(readcount);
			bDTO.setDate(date);
			
			bDAO.insertBoard(bDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<BoardDTO> getBoardList(PageDTO pDTO) {
		System.out.println("BoardService getBoardList()");
		ArrayList<BoardDTO> bList = null;
		
		try {
			
			int pageSize = pDTO.getPageSize();
			int currentPage = pDTO.getCurrentPage();
			
			int startRow = (currentPage-1)*pageSize + 1;
			
			int endPage = startRow + pageSize - 1;
			
			pDTO.setEndRow(endPage);
			pDTO.setStartRow(startRow);
			
			bDAO = new BoardDAO();
			bList = bDAO.getBoardList(pDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		} return bList;
	}

	public void updateReadcount(int num) {
		try {
			bDAO = new BoardDAO();
			bDAO.updateReadcount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public BoardDTO getBoardContent(int num) {
		BoardDTO bDTO = null;
		try {
			
			bDAO = new BoardDAO();
			bDTO = bDAO.getBoardContent(num);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} return bDTO;
		
	}

	public void updateBoard(HttpServletRequest request) {
		BoardDTO bDTO = new BoardDTO();
		bDAO = new BoardDAO();
		try {
			request.setCharacterEncoding("utf-8");
			int num = Integer.parseInt(request.getParameter("num"));
			String name = request.getParameter("name");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");

			bDTO.setNum(num);
			bDTO.setName(name);
			bDTO.setSubject(subject);
			bDTO.setContent(content);
			
			bDAO.updateBoard(bDTO);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteBoard(int num) {
		try {
			bDAO = new BoardDAO();
			bDAO.deleteBoard(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getBoardcount() {
		int count = 0;
		try {
			bDAO = new BoardDAO();
			count = bDAO.getBoardcount();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	
	
	

}
