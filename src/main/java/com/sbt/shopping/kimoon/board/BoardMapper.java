package com.sbt.shopping.kimoon.board;

import java.util.List;


public interface BoardMapper {
	int getNoticeCount(BoardSelector search);
	int getFreeCount(BoardSelector search);
	int getLessonCount(BoardSelector search);
	int getJobCount(BoardSelector search);

    List<BoardDTO> getNotice(BoardSelector search);
    List<BoardDTO> getFree(BoardSelector search);
    List<BoardDTO> getLesson(BoardSelector search);
    List<BoardDTO> getJob(BoardSelector search);
    
    List<BoardReply> getReply(BoardDTO nPost);
	int summernoteNoticeInsert(BoardDTO bDTO);
	int summernoteFreeInsert(BoardDTO bDTO);
	int summernoteLessonInsert(BoardDTO bDTO);
	int summernoteJobInsert(BoardDTO bDTO);
	
	BoardDTO getNoticeDetail(BoardDTO bDTO);
	BoardDTO getFreeDetail(BoardDTO bDTO);
	BoardDTO getLessonDetail(BoardDTO bDTO);
	BoardDTO getJobDetail(BoardDTO bDTO);
}
