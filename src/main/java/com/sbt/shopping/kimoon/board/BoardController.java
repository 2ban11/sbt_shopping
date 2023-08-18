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
	
	// 게시글 작성 페이지로
	@RequestMapping(value = "/go.board.write", method = RequestMethod.GET)
	public String goNoticeWrite(HttpServletRequest req) {
		int type = Integer.parseInt(req.getParameter("type"));
		req.setAttribute("type", type);
		req.setAttribute("contentPage", "kimoon/boardWrite.jsp");
		return "index";
	}
	
	// 게시글 작성
	@RequestMapping(value = "/do.notice.write", method = RequestMethod.GET)
	public String noticeInsert(HttpServletRequest req, BoardDTO bDTO, @RequestParam String boardTitle,
			@RequestParam String editorarea) {
		bDAO.summernoteNoticeInsert(bDTO, boardTitle, editorarea);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "redirect:go.board?type=1";
	}
	@RequestMapping(value = "/do.free.write", method = RequestMethod.GET)
	public String freeInsert(HttpServletRequest req, BoardDTO bDTO, @RequestParam String boardTitle,
			@RequestParam String editorarea) {
		bDAO.summernoteFreeInsert(bDTO, boardTitle, editorarea);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "redirect:go.board?type=2";
	}
	@RequestMapping(value = "/do.lesson.write", method = RequestMethod.GET)
	public String lessonInsert(HttpServletRequest req, BoardDTO bDTO, @RequestParam String boardTitle,
			@RequestParam String editorarea, @RequestParam String boardAdress, @RequestParam String boardPhone,
			@RequestParam String boardLessonFee) {
		bDAO.summernoteLessonInsert(bDTO, boardTitle, editorarea, boardAdress, boardPhone, boardLessonFee);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "redirect:go.board?type=3";
	}
	@RequestMapping(value = "/do.job.write", method = RequestMethod.GET)
	public String jobInsert(HttpServletRequest req, BoardDTO bDTO, @RequestParam String boardTitle,
			@RequestParam String editorarea, @RequestParam String boardAdress, @RequestParam String boardPhone,
			@RequestParam String boardJob) {
		bDAO.summernoteJobInsert(bDTO, boardTitle, editorarea, boardAdress, boardPhone, boardJob);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "redirect:go.board?type=4";
	}

	@ResponseBody
	@RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		return bDAO.summernoteMultipart(multipartFile, request);
	}
	
	// 게시글 상세보기
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
	
	
	// 게시글 수정페이지 이동
	@RequestMapping(value = "/go.notice.update", method = RequestMethod.GET)
	public String goNoticeUpdate(HttpServletRequest req, BoardDTO bDTO) {
		bDAO.getNoticeDetail(req, bDTO);
		req.setAttribute("contentPage", "kimoon/noticeUpdate.jsp");
		return "index";
	}
	@RequestMapping(value = "/go.free.update", method = RequestMethod.GET)
	public String goFreeUpdate(HttpServletRequest req, BoardDTO bDTO) {
		bDAO.getFreeDetail(req, bDTO);
		req.setAttribute("contentPage", "kimoon/freeUpdate.jsp");
		return "index";
	}
	@RequestMapping(value = "/go.lesson.update", method = RequestMethod.GET)
	public String goLesssonUpdate(HttpServletRequest req, BoardDTO bDTO) {
		bDAO.getLessonDetail(req, bDTO);
		req.setAttribute("contentPage", "kimoon/lessonUpdate.jsp");
		return "index";
	}
	@RequestMapping(value = "/go.job.update", method = RequestMethod.GET)
	public String goJobUpdate(HttpServletRequest req, BoardDTO bDTO) {
		bDAO.getJobDetail(req, bDTO);
		req.setAttribute("contentPage", "kimoon/jobUpdate.jsp");
		return "index";
	}
	
	// 게시글 수정하기
	@RequestMapping(value = "/do.notice.update", method = RequestMethod.GET)
	public String doNoticeUpdate(HttpServletRequest req, BoardDTO bDTO) {
		bDAO.updateNotice(req, bDTO);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}
	@RequestMapping(value = "/do.free.update", method = RequestMethod.GET)
	public String doFreeUpdate(HttpServletRequest req, BoardDTO bDTO) {
		bDAO.updateFree(req, bDTO);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}
	@RequestMapping(value = "/do.lesson.update", method = RequestMethod.GET)
	public String doLessonUpdate(HttpServletRequest req, BoardDTO bDTO) {
		bDAO.updateLesson(req, bDTO);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}
	@RequestMapping(value = "/do.job.update", method = RequestMethod.GET)
	public String doJobUpdate(HttpServletRequest req, BoardDTO bDTO) {
		bDAO.updateJob(req, bDTO);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
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
	@RequestMapping(value = "/do.free.delete", method = RequestMethod.GET)
	public String doFreeDetail(HttpServletRequest req, BoardDTO bDTO) { 
		bDAO.deleteFree(bDTO);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}
	@RequestMapping(value = "/do.lesson.delete", method = RequestMethod.GET)
	public String doLessonDetail(HttpServletRequest req, BoardDTO bDTO) { 
		bDAO.deleteLesson(bDTO);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}
	@RequestMapping(value = "/do.job.delete", method = RequestMethod.GET)
	public String doJobDetail(HttpServletRequest req, BoardDTO bDTO) { 
		bDAO.deleteJob(bDTO);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}
	
	
	// 게시글 검색
	@RequestMapping(value = "/notice.search", method = RequestMethod.GET)
	public String noticeSearch(HttpServletRequest req, BoardSelector bSel) {
		bDAO.searchBoard(req, bSel);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}
	@RequestMapping(value = "/free.search", method = RequestMethod.GET)
	public String freeSearch(HttpServletRequest req, BoardSelector bSel) {
		bDAO.searchBoard(req, bSel);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}
	@RequestMapping(value = "/lesson.search", method = RequestMethod.GET)
	public String lessonSearch(HttpServletRequest req, BoardSelector bSel) {
		bDAO.searchBoard(req, bSel);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}
	@RequestMapping(value = "/job.search", method = RequestMethod.GET)
	public String jobSearch(HttpServletRequest req, BoardSelector bSel) {
		bDAO.searchBoard(req, bSel);
		bDAO.getBoard(1, req);
		req.setAttribute("contentPage", "kimoon/board.jsp");
		return "index";
	}
}
