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

		// 처음 한 번만 전체 게시글 갯수 세기
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

	@RequestMapping(value = "/do.notice.write", method = RequestMethod.GET)
	public String noticeInsert(HttpServletRequest req, BoardDTO bDTO, @RequestParam String boardTitle,
			@RequestParam String editorarea) {
		bDAO.summernoteNoticeInsert(bDTO, boardTitle, editorarea);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index"/* "redirect:go.board" */;
	}

	@RequestMapping(value = "/do.free.write", method = RequestMethod.GET)
	public String freeInsert(HttpServletRequest req, BoardDTO bDTO, @RequestParam String boardTitle,
			@RequestParam String editorarea) {
		bDAO.summernoteFreeInsert(bDTO, boardTitle, editorarea);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}

	@RequestMapping(value = "/do.lesson.write", method = RequestMethod.GET)
	public String lessonInsert(HttpServletRequest req, BoardDTO bDTO, @RequestParam String boardTitle,
			@RequestParam String editorarea, @RequestParam String boardAdress, @RequestParam String boardPhone,
			@RequestParam String boardLessonFee) {
		bDAO.summernoteLessonInsert(bDTO, boardTitle, editorarea, boardAdress, boardPhone, boardLessonFee);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}

	@RequestMapping(value = "/do.job.write", method = RequestMethod.GET)
	public String jobInsert(HttpServletRequest req, BoardDTO bDTO, @RequestParam String boardTitle,
			@RequestParam String editorarea, @RequestParam String boardAdress, @RequestParam String boardPhone,
			@RequestParam String boardJob) {
		bDAO.summernoteJobInsert(bDTO, boardTitle, editorarea, boardAdress, boardPhone, boardJob);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}

	@ResponseBody
	@RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		return bDAO.summernoteMultipart(multipartFile, request);
	}
	
	@RequestMapping(value = "/go.notice.detail", method = RequestMethod.GET)
	public String goNoticeDetail(HttpServletRequest req, BoardDTO bDTO) {
		bDAO.getNoticeDetail(req, bDTO);
		req.setAttribute("contentPage", "kimoon/noticeDetail.jsp");
		return "index";
	}
	@RequestMapping(value = "/go.free.detail", method = RequestMethod.GET)
	public String goFreeDetail(HttpServletRequest req, BoardDTO bDTO) {
		bDAO.getFreeDetail(req, bDTO);
		req.setAttribute("contentPage", "kimoon/freeDetail.jsp");
		return "index";
	}
	@RequestMapping(value = "/go.lesson.detail", method = RequestMethod.GET)
	public String goLessonDetail(HttpServletRequest req, BoardDTO bDTO) {
		bDAO.getLessonDetail(req, bDTO);
		req.setAttribute("contentPage", "kimoon/lessonDetail.jsp");
		return "index";
	}
	@RequestMapping(value = "/go.job.detail", method = RequestMethod.GET)
	public String goJobDetail(HttpServletRequest req, BoardDTO bDTO) {
		bDAO.getJobDetail(req, bDTO);
		req.setAttribute("contentPage", "kimoon/jobDetail.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/go.notice.update", method = RequestMethod.GET)
	public String doNoticeUpdate(HttpServletRequest req, BoardDTO bDTO) {
		bDAO.getNoticeDetail(req, bDTO);
		req.setAttribute("contentPage", "kimoon/noticeUpdate.jsp");
		return "index";
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/do.notice.delete", method = RequestMethod.GET)
	public String doNoticeDetail(HttpServletRequest req, BoardDTO bDTO) { 
		bDAO.deleteNotice(bDTO);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}
	
}
