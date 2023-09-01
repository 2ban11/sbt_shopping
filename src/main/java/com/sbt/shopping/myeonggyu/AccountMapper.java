package com.sbt.shopping.myeonggyu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface AccountMapper {

	AccountDTO getAccountByID(AccountDTO a);
	
    int bye(AccountDTO a);

    int join(AccountDTO a);

    int update(AccountDTO a);

	int getAccountNum(AccountDTO a);

	int getNicknameNum(AccountDTO a);

	AccountDTO saveNaverNickname(String a_id, String a_nickname);

	void saveNaverNickname(AccountDTO a);

	AccountDTO updateKNickname(AccountDTO a);

	AccountDTO updateKNickname(String a_id, String a_nickname);

	void saveKakaoUserInfo(AccountDTO a);

	AccountDTO checkEmail(String email );

	int updatePw(AccountDTO a);

	String getIDbyPhoneNum(String a_phone);

	List<String> getAccountListByPhoneNum(String a_phone);

	int getPhoneCheck(AccountDTO a);

	int editAccount(AccountDTO aDTO);
	
}
