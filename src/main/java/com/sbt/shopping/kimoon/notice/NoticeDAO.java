package com.sbt.shopping.kimoon.notice;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeDAO {
	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private NoticePaging np; // 한 페이지에서 몇 개씩 보여줄지
	
	private int allPostCount; // 전체 개수
	
	public int getAllMsgCount() {
		return allPostCount;
	}

	public void setAllMsgCount(int allPostCount) {
		this.allPostCount = allPostCount;
	}

	
	public void getNotice(int pageNo, HttpServletRequest req) {
		int count = np.getNoticeCountPerPage();
        int start = (pageNo - 1) * count + 1;
        int end = start + (count - 1);

        NoticeSelector search = (NoticeSelector) req.getSession().getAttribute("search");
        int postCount = 0;

        if (search == null) {
            search = new NoticeSelector("", new BigDecimal(start), new BigDecimal(end));
            System.out.println("search는 null");
            postCount = allPostCount;
            System.out.println("search는 null이고 postCount는 " + postCount);
        } else {
            search.setStart(new BigDecimal(start));
            search.setEnd(new BigDecimal(end));
            postCount = ss.getMapper(NoticeMapper.class).getNoticeCount(search);
        }
        List<NoticePost> nPost = ss.getMapper(NoticeMapper.class).getNotice(search);
        System.out.println("postCount : " + postCount);
        System.out.println("count : " + count);
        int pageCount = (int) Math.ceil(postCount / (double) count);
        System.out.println("pageCount : " + pageCount);
        req.setAttribute("pageCount", pageCount);
        req.setAttribute("nPost", nPost);
        req.setAttribute("curPage", pageNo);	
	}

	public void calcAllPostCount() {
        NoticeSelector nSelec = new NoticeSelector("", null, null);
        allPostCount = ss.getMapper(NoticeMapper.class).getNoticeCount(nSelec);
    }
}
