package com.sbt.shopping.kimoon.notice;

import java.util.List;


public interface NoticeMapper {
	int getNoticeCount(NoticeSelector search);

    List<NoticePost> getNotice(NoticeSelector search);
    
    List<NoticeReply> getReply(NoticePost nPost);
}
