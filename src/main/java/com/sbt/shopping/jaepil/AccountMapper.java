package com.sbt.shopping.jaepil;

public interface AccountMapper {

	AccountDTO getAccount(AccountDTO aDTO);

	int editAccount(AccountDTO aDTO);

	int signOut(AccountDTO aDTO);

}
