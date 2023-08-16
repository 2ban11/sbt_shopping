package com.sbt.shopping.kimoon.board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

@Service
public class BoardDAO {

	@Autowired
	private ServletContext servletContext;
	
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
				System.out.println("type2 = " + postCount);
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

	public String summernoteMultipart(MultipartFile multipartFile, HttpServletRequest request) {
		/*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		JsonObject jsonObject = new JsonObject();
		// 내부경로로 저장
		String fileRoot = servletContext.getRealPath("resources/fileupload/");
		System.out.println(fileRoot);
									// a.jpg
		
		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
												// jpg
		File targetFile = new File(fileRoot + savedFileName);
		System.out.println(targetFile);
		
		try {							// UUID.jpg
			//InputStream fileStream = multipartFile.getInputStream();
			//FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			multipartFile.transferTo(targetFile);
			
			jsonObject.addProperty("url", "resources/fileupload/" + savedFileName); // contextroot +// resources + 저장할 내부
			jsonObject.addProperty("responseCode", "success");

		} catch (Exception e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}

	public void summernoteInsert(BoardDTO bDTO, String testTitle, String editorarea) {
		bDTO.setN_title(testTitle);
		bDTO.setN_txt(editorarea);
		System.out.println(bDTO);
		if(ss.getMapper(BoardMapper.class).summernoteInsert(bDTO)==1) {
			System.out.println("등록 성공");
		}
		
		
	}

}
