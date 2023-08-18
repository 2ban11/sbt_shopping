package com.sbt.shopping.kimoon.board;

import java.util.List;


public interface BoardMapper {
	
	// 게시글 전체 갯수 가져오기
	int getNoticeCount(BoardSelector search);
	int getFreeCount(BoardSelector search);
	int getLessonCount(BoardSelector search);
	int getJobCount(BoardSelector search);

	// 게시글 내용 가져오기
    List<BoardDTO> getNotice(BoardSelector search);
    List<BoardDTO> getFree(BoardSelector search);
    List<BoardDTO> getLesson(BoardSelector search);
    List<BoardDTO> getJob(BoardSelector search);
    
    // 게시글 댓글 가져오기
    List<BoardReply> getReply(BoardDTO nPost);
    
    
	int summernoteNoticeInsert(BoardDTO bDTO);
	int summernoteFreeInsert(BoardDTO bDTO);
	int summernoteLessonInsert(BoardDTO bDTO);
	int summernoteJobInsert(BoardDTO bDTO);
	
	// 게시글 상세보기
	BoardDTO getNoticeDetail(BoardDTO bDTO);
	BoardDTO getFreeDetail(BoardDTO bDTO);
	BoardDTO getLessonDetail(BoardDTO bDTO);
	BoardDTO getJobDetail(BoardDTO bDTO);
	
	// 게시글 작성
	int addNoticeView(BoardDTO bDTO);
	int addFreeView(BoardDTO bDTO);
	int addLessonView(BoardDTO bDTO);
	int addJobView(BoardDTO bDTO);
	
	// 게시글 수정
	int updateNotice(BoardDTO bDTO);
	int updateFree(BoardDTO bDTO);
	int updateLesson(BoardDTO bDTO);
	int updateJob(BoardDTO bDTO);
	
	// 게시글 삭제
	int deleteNotice(BoardDTO bDTO);
	int deleteFree(BoardDTO bDTO);
	int deleteLesson(BoardDTO bDTO);
	int deleteJob(BoardDTO bDTO);
}
