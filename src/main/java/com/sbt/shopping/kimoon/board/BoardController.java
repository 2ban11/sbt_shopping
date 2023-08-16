package com.sbt.shopping.kimoon.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;




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
        request.setAttribute("contentPage", "kimoon/board.jsp");
        return "index";
	}
	
	
	@RequestMapping(value = "/board.page.change", method = RequestMethod.GET)
    public String paging(HttpServletRequest req, @RequestParam int p) {
		BoardPaging.clearSearch(req);
		bDAO.getBoard(p, req);
        req.setAttribute("contentPage", "kimoon/board.jsp");
        return "index";
    }
	
	@RequestMapping(value = "/go.board.write", method = RequestMethod.GET)
	public String goNoticeWrite(HttpServletRequest req) {
		int type = Integer.parseInt(req.getParameter("type"));
		req.setAttribute("type", type);
		req.setAttribute("contentPage", "kimoon/boardWrite.jsp");
		return "index";
	}

	@RequestMapping(value = "/testInsert", method = RequestMethod.GET)
	public String testInsert(HttpServletRequest req,BoardDTO bDTO, @RequestParam String testTitle,@RequestParam String editorarea) {
		System.out.println(testTitle);
		System.out.println(editorarea);
		bDAO.summernoteInsert(bDTO, testTitle,editorarea);
		req.setAttribute("contentPage", "kimoon/boardWrite.jsp");
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		return bDAO.summernoteMultipart(multipartFile, request);
	}
}
