package com.sbt.shopping.kimoon.board;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardDAO {


	@Autowired
	private SqlSession ss;

	@Autowired
	private BoardPaging bp; // 한 페이지에서 몇 개씩 보여줄지

	private int allPostCount1; // 공지
	private int allPostCount2; // 자유
	private int allPostCount3; // 레슨
	private int allPostCount4; // 구인구직

	public void getBoard(int pageNo, HttpServletRequest req) {
		int type = Integer.parseInt(req.getParameter("type"));
		
		int count = bp.getBoardCountPerPage();

		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);

		BoardSelector search = (BoardSelector) req.getSession().getAttribute("search");
		int postCount = 0;
		List<BoardDTO> posts = null;
		if (search == null) {
			search = new BoardSelector("", new BigDecimal(start), new BigDecimal(end));
			switch (type) {
			case 1:
				postCount = allPostCount1;
				posts = ss.getMapper(BoardMapper.class).getNotice(search);
				break;
			case 2:
				postCount = allPostCount2;
				posts = ss.getMapper(BoardMapper.class).getFree(search);
				break;
			case 3:
				postCount = allPostCount3;
				posts = ss.getMapper(BoardMapper.class).getLesson(search);
				break;
			case 4:
				postCount = allPostCount4;
				posts = ss.getMapper(BoardMapper.class).getJob(search);
				break;

			default:
				break;
			}

		} else {
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			if (type == 1) {
				postCount = ss.getMapper(BoardMapper.class).getNoticeCount(search);
				posts = ss.getMapper(BoardMapper.class).getNotice(search);
			} else if (type == 2) {
				postCount = ss.getMapper(BoardMapper.class).getFreeCount(search);
				posts = ss.getMapper(BoardMapper.class).getFree(search);
			} else if (type == 3) {
				postCount = ss.getMapper(BoardMapper.class).getLessonCount(search);
				posts = ss.getMapper(BoardMapper.class).getLesson(search);
			} else if (type == 4) {
				postCount = ss.getMapper(BoardMapper.class).getJobCount(search);
				posts = ss.getMapper(BoardMapper.class).getJob(search);
			}
		}

		int pageCount = (int) Math.ceil(postCount / (double) count);
		req.setAttribute("type", type);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("posts", posts);
		req.setAttribute("curPage", pageNo);
	}

	public void calcAllPostCount() {
		BoardSelector bSelec = new BoardSelector("", null, null);
		allPostCount1 = ss.getMapper(BoardMapper.class).getNoticeCount(bSelec);
		allPostCount2 = ss.getMapper(BoardMapper.class).getFreeCount(bSelec);
		allPostCount3 = ss.getMapper(BoardMapper.class).getLessonCount(bSelec);
		allPostCount4 = ss.getMapper(BoardMapper.class).getJobCount(bSelec);
	}
}
