package com.sbt.shopping.kimoon.board;

import java.util.List;


public interface BoardMapper {
	
	// 게시글 전체 갯수 가져오기
	int getNoticeCount(BoardSelector search);
	int getFreeCount(BoardSelector search);
	int getLessonCount(BoardSelector search);
	int getJobCount(BoardSelector search);

	// 게시판 리스트 가져오기
    List<BoardDTO> getNotice(BoardSelector search);
    List<BoardDTO> getFree(BoardSelector search);
    List<BoardDTO> getLesson(BoardSelector search);
    List<BoardDTO> getJob(BoardSelector search);
    
    // 댓글 갯수 가져오기
    int getNoticeReplyCount(int no);
    int getFreeReplyCount(int no);
    int getLessonReplyCount(int no);
    int getJobReplyCount(int no);
    
    // 댓글 가져오기
    List<BoardReplyDTO> getNoticeReply(BoardReplyDTO brDTO);
    List<BoardReplyDTO> getFreeReply(BoardReplyDTO brDTO);
    List<BoardReplyDTO> getLessonReply(BoardReplyDTO brDTO);
    List<BoardReplyDTO> getJobReply(BoardReplyDTO brDTO);
    
    // 댓글 작성
    int writeNoticeReply(BoardReplyDTO brDTO);
    int writeFreeReply(BoardReplyDTO brDTO);
    int writeLessonReply(BoardReplyDTO brDTO);
    int writeJobReply(BoardReplyDTO brDTO);
    
    // 댓글 삭제
 	int deleteNoticeReply(BoardReplyDTO brDTO);
 	int deleteFreeReply(BoardReplyDTO brDTO);
 	int deleteLessonReply(BoardReplyDTO brDTO);
 	int deleteJobReply(BoardReplyDTO brDTO);
    
    // 게시글 작성
	int summernoteNoticeInsert(BoardDTO bDTO);
	int summernoteFreeInsert(BoardDTO bDTO);
	int summernoteLessonInsert(BoardDTO bDTO);
	int summernoteJobInsert(BoardDTO bDTO);
	
	// 게시글 상세보기
	BoardDTO getNoticeDetail(BoardDTO bDTO);
	BoardDTO getFreeDetail(BoardDTO bDTO);
	BoardDTO getLessonDetail(BoardDTO bDTO);
	BoardDTO getJobDetail(BoardDTO bDTO);
	
	// 조회수 증가
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
