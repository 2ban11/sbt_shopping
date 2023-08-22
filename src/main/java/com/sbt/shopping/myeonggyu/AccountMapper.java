package com.sbt.shopping.myeonggyu;

import javax.servlet.http.HttpServletRequest;

public interface AccountMapper {

	AccountDTO getAccountByID(AccountDTO a);
	
    int bye(AccountDTO a);

    int join(AccountDTO a);

    int update(AccountDTO a);

	int getAccountNum(AccountDTO a);

	int getNicknameNum(AccountDTO a);

	AccountDTO saveNaverNickname(String a_id, String a_nickname);

	AccountDTO saveNaverNickname(AccountDTO a);

	AccountDTO updateKNickname(AccountDTO a);

	AccountDTO updateKNickname(String a_id, String a_nickname);

	AccountDTO saveKakaoUserInfo(AccountDTO a);

	AccountDTO checkEmail(String email );

	int updatePw(AccountDTO a);

	
}
