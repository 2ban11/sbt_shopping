package com.sbt.shopping.jaepil;

import java.util.List;

import com.sbt.shopping.inhoo.AnswerDTO;
import com.sbt.shopping.inhoo.QnaDTO;
import com.sbt.shopping.myeonggyu.AccountDTO;

public interface QnaMapper {

	List<QnaDTO> getQna(AccountDTO aDTO);
}
