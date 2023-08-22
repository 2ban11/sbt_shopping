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

	// 게시글 목록 불러오기, 페이징
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
				for (BoardDTO b : posts) {
					b.setNotice_reply_count(getNoticeReplyCount(req, b.getN_no()));
				}
				break;
			case 2:
				postCount = allPostCount2;
				posts = ss.getMapper(BoardMapper.class).getFree(search);
				for (BoardDTO b : posts) {
					b.setFree_reply_count(getFreeReplyCount(req, b.getF_no()));
				}
				break;
			case 3:
				postCount = allPostCount3;
				posts = ss.getMapper(BoardMapper.class).getLesson(search);
				for (BoardDTO b : posts) {
					b.setLesson_reply_count(getLessonReplyCount(req, b.getL_no()));
				}
				break;
			case 4:
				postCount = allPostCount4;
				posts = ss.getMapper(BoardMapper.class).getJob(search);
				for (BoardDTO b : posts) {
					b.setJob_reply_count(getJobReplyCount(req, b.getJ_no()));
				}
				break;
			default:
				break;
			}
		} else {
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			System.out.println("search : " + search);
			if (type == 1) {
				postCount = ss.getMapper(BoardMapper.class).getNoticeCount(search);
				posts = ss.getMapper(BoardMapper.class).getNotice(search);
				for (BoardDTO b : posts) {
					b.setNotice_reply_count(getNoticeReplyCount(req, b.getN_no()));
				}
			} else if (type == 2) {
				postCount = ss.getMapper(BoardMapper.class).getFreeCount(search);
				posts = ss.getMapper(BoardMapper.class).getFree(search);
				for (BoardDTO b : posts) {
					b.setFree_reply_count(getFreeReplyCount(req, b.getF_no()));
				}
			} else if (type == 3) {
				postCount = ss.getMapper(BoardMapper.class).getLessonCount(search);
				posts = ss.getMapper(BoardMapper.class).getLesson(search);
				for (BoardDTO b : posts) {
					b.setLesson_reply_count(getLessonReplyCount(req, b.getL_no()));
				}
			} else if (type == 4) {
				postCount = ss.getMapper(BoardMapper.class).getJobCount(search);
				posts = ss.getMapper(BoardMapper.class).getJob(search);
				for (BoardDTO b : posts) {
					b.setJob_reply_count(getJobReplyCount(req, b.getJ_no()));
				}
			}
		}
		int pageCount = (int) Math.ceil(postCount / (double) count);
		
		int pagesToShow = 10; // 한 번에 표시할 페이지 수
		int currentPage = pageNo;
		int totalPages = pageCount;
		int startPage = Math.max(currentPage - (pagesToShow / 2), 1);
		int endPage = Math.min(startPage + pagesToShow - 1, totalPages);

		if (endPage - startPage + 1 < pagesToShow) {
		    startPage = Math.max(endPage - pagesToShow + 1, 1);
		}
		
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		
		
		req.setAttribute("type", type);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("posts", posts);
		req.setAttribute("curPage", pageNo);
		req.setAttribute("totalCnt", postCount);
		req.setAttribute("count", count);
	}

	// 모든 게시글의 갯수 계산
	public void calcAllPostCount() {
		BoardSelector bSelec = new BoardSelector("", null, null);
		allPostCount1 = ss.getMapper(BoardMapper.class).getNoticeCount(bSelec);
		allPostCount2 = ss.getMapper(BoardMapper.class).getFreeCount(bSelec);
		allPostCount3 = ss.getMapper(BoardMapper.class).getLessonCount(bSelec);
		allPostCount4 = ss.getMapper(BoardMapper.class).getJobCount(bSelec);
	}

	// 게시글에 이미지 첨부
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

	// 게시판 글 작성
	public void summernoteNoticeInsert(BoardDTO bDTO, String boardTitle, String editorarea) { // 공지 글 쓰기
		bDTO.setN_title(boardTitle);
		bDTO.setN_txt(editorarea);
		System.out.println(bDTO);
		if(ss.getMapper(BoardMapper.class).summernoteNoticeInsert(bDTO)==1) {
			allPostCount1++; // 글 하나 추가해서 전체 게시글 갯수 +1 증가
			System.out.println("등록 성공");
		}
	}
	public void summernoteFreeInsert(BoardDTO bDTO, String boardTitle, String editorarea) { // 자유 글 쓰기
		bDTO.setF_title(boardTitle);
		bDTO.setF_txt(editorarea);
		System.out.println(bDTO);
		if(ss.getMapper(BoardMapper.class).summernoteFreeInsert(bDTO)==1) {
			allPostCount2++;
			System.out.println("등록 성공");
		}
	}
	public void summernoteLessonInsert(BoardDTO bDTO, String boardTitle, String editorarea, String boardAddressZoneCode, String boardAddressRoadAddress, String boardAddressDetailAddress, String boardPhone, String boardLessonFee) {
		bDTO.setL_title(boardTitle);
		bDTO.setL_txt(editorarea);
		bDTO.setL_addr(boardAddressZoneCode + " / " + boardAddressRoadAddress + " / " + boardAddressDetailAddress);
		bDTO.setL_phone(boardPhone);
		bDTO.setL_pay(boardLessonFee);
		if(ss.getMapper(BoardMapper.class).summernoteLessonInsert(bDTO)==1) {
			allPostCount3++;
			System.out.println("등록 성공");
		}
	}
	public void summernoteJobInsert(BoardDTO bDTO, String boardTitle, String editorarea, String boardAddressZoneCode, String boardAddressRoadAddress, String boardAddressDetailAddress, String boardPhone, String boardJob) {
		bDTO.setJ_title(boardTitle);
		bDTO.setJ_txt(editorarea);
		bDTO.setJ_addr(boardAddressZoneCode + " / " + boardAddressRoadAddress + " / " + boardAddressDetailAddress);
		bDTO.setJ_phone(boardPhone);
		bDTO.setJ_category(boardJob);
		if(ss.getMapper(BoardMapper.class).summernoteJobInsert(bDTO)==1) {
			allPostCount4++;
			System.out.println("등록 성공");
		}
	}

	// 글 자세히 보기
	public void getNoticeDetail(HttpServletRequest req, BoardDTO bDTO) {
		int type = Integer.parseInt(req.getParameter("type"));
		int noticeReplyCount = getNoticeReplyCount(req, bDTO.getN_no());
		req.setAttribute("type", type);
		req.setAttribute("noticeReplyCount", noticeReplyCount);
		req.setAttribute("board", ss.getMapper(BoardMapper.class).getNoticeDetail(bDTO));
		ss.getMapper(BoardMapper.class).addNoticeView(bDTO);
	}
	public void getFreeDetail(HttpServletRequest req, BoardDTO bDTO) {
		int type = Integer.parseInt(req.getParameter("type"));
		int freeReplyCount = getFreeReplyCount(req, bDTO.getF_no());
		req.setAttribute("type", type);
		req.setAttribute("freeReplyCount", freeReplyCount);
		req.setAttribute("board", ss.getMapper(BoardMapper.class).getFreeDetail(bDTO));
		ss.getMapper(BoardMapper.class).addFreeView(bDTO);
	}
	public void getLessonDetail(HttpServletRequest req, BoardDTO bDTO) {
		int type = Integer.parseInt(req.getParameter("type"));
		int lessonReplyCount = getLessonReplyCount(req, bDTO.getL_no());
		req.setAttribute("type", type);
		req.setAttribute("lessonReplyCount", lessonReplyCount);
		req.setAttribute("board", ss.getMapper(BoardMapper.class).getLessonDetail(bDTO));
		ss.getMapper(BoardMapper.class).addLessonView(bDTO);
	}
	public void getJobDetail(HttpServletRequest req, BoardDTO bDTO) {
		int type = Integer.parseInt(req.getParameter("type"));
		int jobReplyCount = getJobReplyCount(req, bDTO.getJ_no());
		req.setAttribute("type", type);
		req.setAttribute("jobReplyCount", jobReplyCount);
		req.setAttribute("board", ss.getMapper(BoardMapper.class).getJobDetail(bDTO));
		ss.getMapper(BoardMapper.class).addJobView(bDTO);
	}

	// 게시글 수정
	public void updateNotice(HttpServletRequest req, BoardDTO bDTO) {
		ss.getMapper(BoardMapper.class).updateNotice(bDTO);
	}
	public void updateFree(HttpServletRequest req, BoardDTO bDTO) {
		ss.getMapper(BoardMapper.class).updateFree(bDTO);
	}
	public void updateLesson(HttpServletRequest req, BoardDTO bDTO) {
		ss.getMapper(BoardMapper.class).updateLesson(bDTO);
	}
	public void updateJob(HttpServletRequest req, BoardDTO bDTO) {
		ss.getMapper(BoardMapper.class).updateJob(bDTO);
	}

	
	// 게시글 삭제
	public void deleteNotice(BoardDTO bDTO) {
		if (ss.getMapper(BoardMapper.class).deleteNotice(bDTO)==1) {
			allPostCount1--;
		}
	}
	public void deleteFree(BoardDTO bDTO) {
		if (ss.getMapper(BoardMapper.class).deleteFree(bDTO)==1) {
			allPostCount2--;
		}
	}
	public void deleteLesson(BoardDTO bDTO) {
		if (ss.getMapper(BoardMapper.class).deleteLesson(bDTO)==1) {
			allPostCount3--;
		}
	}
	public void deleteJob(BoardDTO bDTO) {
		if (ss.getMapper(BoardMapper.class).deleteJob(bDTO)==1) {
			allPostCount4--;
		}
	}

	
	public void searchBoard(HttpServletRequest req, BoardSelector bSel) {
		req.getSession().setAttribute("search", bSel);
	}

	
	
	
	// 댓글 작성
	public void writeNoticeReply(HttpServletRequest req, BoardReplyDTO brDTO) {
		ss.getMapper(BoardMapper.class).writeNoticeReply(brDTO);
	}
	public void writeFreeReply(HttpServletRequest req, BoardReplyDTO brDTO) {
		ss.getMapper(BoardMapper.class).writeFreeReply(brDTO);
	}
	public void writeLessonReply(HttpServletRequest req, BoardReplyDTO brDTO) {
		ss.getMapper(BoardMapper.class).writeLessonReply(brDTO);
	}
	public void writeJobReply(HttpServletRequest req, BoardReplyDTO brDTO) {
		ss.getMapper(BoardMapper.class).writeJobReply(brDTO);
	}

	
	
	
	// 댓글 가져오기
	public void getNoticeReply(HttpServletRequest req, BoardReplyDTO brDTO) {
		req.setAttribute("reply", ss.getMapper(BoardMapper.class).getNoticeReply(brDTO));
	}
	public void getFreeReply(HttpServletRequest req, BoardReplyDTO brDTO) {
		req.setAttribute("reply", ss.getMapper(BoardMapper.class).getFreeReply(brDTO));
	}
	public void getLessonReply(HttpServletRequest req, BoardReplyDTO brDTO) {
		req.setAttribute("reply", ss.getMapper(BoardMapper.class).getLessonReply(brDTO));
	}
	public void getJobReply(HttpServletRequest req, BoardReplyDTO brDTO) {
		req.setAttribute("reply", ss.getMapper(BoardMapper.class).getJobReply(brDTO));
	}

	// 댓글 갯수 가져오기
	public int getNoticeReplyCount(HttpServletRequest req, int no) {
		return ss.getMapper(BoardMapper.class).getNoticeReplyCount(no);
	}
	public int getFreeReplyCount(HttpServletRequest req, int no) {
		return ss.getMapper(BoardMapper.class).getFreeReplyCount(no);
	}
	public int getLessonReplyCount(HttpServletRequest req, int no) {
		return ss.getMapper(BoardMapper.class).getLessonReplyCount(no);
	}
	public int getJobReplyCount(HttpServletRequest req, int no) {
		return ss.getMapper(BoardMapper.class).getJobReplyCount(no);
	}

	// 댓글 삭제하기
	public void deleteNoticeReply(HttpServletRequest req, BoardReplyDTO brDTO) {
		ss.getMapper(BoardMapper.class).deleteNoticeReply(brDTO);
	}
	public void deleteFreeReply(HttpServletRequest req, BoardReplyDTO brDTO) {
		ss.getMapper(BoardMapper.class).deleteFreeReply(brDTO);
	}
	public void deleteLessonReply(HttpServletRequest req, BoardReplyDTO brDTO) {
		ss.getMapper(BoardMapper.class).deleteLessonReply(brDTO);
	}
	public void deleteJobReply(HttpServletRequest req, BoardReplyDTO brDTO) {
		ss.getMapper(BoardMapper.class).deleteJobReply(brDTO);
	}
	
	
	
	
}
