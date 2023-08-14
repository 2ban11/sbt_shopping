package com.sbt.shopping.kimoon.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BoardController {
	@Autowired
	private BoardDAO bDAO;
	
	private boolean firstReq;
	public BoardController() {
		firstReq = true;
	}
	
	@RequestMapping(value = "go.board", method = RequestMethod.GET)
	public String goNotice(HttpServletRequest request) {
		BoardPaging.clearSearch(request);
		
		if (firstReq) {
			bDAO.calcAllPostCount();
			firstReq = false;
		}
		bDAO.getBoard(1, request);
        request.setAttribute("contentPage", "kimoon/notice.jsp");
        return "index";
	}
	
	
	@RequestMapping(value = "/board.page.change", method = RequestMethod.GET)
    public String paging(HttpServletRequest req, @RequestParam int p) {
		BoardPaging.clearSearch(req);
		bDAO.getBoard(p, req);
        req.setAttribute("contentPage", "kimoon/notice.jsp");
        return "index";
    }
	
	@RequestMapping(value = "/go.notice.write", method = RequestMethod.GET)
	public String goNoticeWrite(HttpServletRequest req) {
		req.setAttribute("contentPage", "kimoon/noticeWrite.jsp");
		return "index";
	}
}
