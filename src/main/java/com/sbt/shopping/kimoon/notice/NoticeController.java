package com.sbt.shopping.kimoon.notice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeDAO nDAO;
	@RequestMapping(value = "go.notice", method = RequestMethod.GET)
	public String goNotice(HttpServletRequest request) {
		NoticePaging.clearSearch(request);
        nDAO.getNotice(1, request);
        request.setAttribute("contentPage", "kimoon/notice.jsp");
        return "index";
	}
	
	
	@RequestMapping(value = "/notice.page.change", method = RequestMethod.GET)
    public String paging(HttpServletRequest req, @RequestParam int p) {
		NoticePaging.clearSearch(req);
		nDAO.calcAllPostCount();
        nDAO.getNotice(p, req);
        req.setAttribute("contentPage", "kimoon/notice.jsp");
        return "index";
    }
}
