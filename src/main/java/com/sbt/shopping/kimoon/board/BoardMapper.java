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
}
