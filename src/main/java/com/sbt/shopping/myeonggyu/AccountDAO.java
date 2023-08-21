package com.sbt.shopping.myeonggyu;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AccountDAO {

	@Autowired
	private SqlSession ss;

	public boolean login(AccountDTO a, HttpServletRequest req) {
		AccountDTO dbAccount = ss.getMapper(AccountMapper.class).getAccountByID(a);
		if (dbAccount != null && a.getA_password().equals(dbAccount.getA_password())) {
			req.getSession().setAttribute("loginMember", dbAccount);
			req.getSession().setMaxInactiveInterval(60 * 10);
			System.out.println("로그인 성공!");
			return true; // 로그인 성공
		} else {
			req.setAttribute("result", "can't find user or password error");
			System.out.println("로그인 실패!");
			return false; // 로그인 실패
		}
	}

	public boolean loginCheck(HttpServletRequest req) {
		AccountDTO a = (AccountDTO) req.getSession().getAttribute("loginMember");
		if (a != null) {
			req.setAttribute("loginPage", "Account/loginSuccess.jsp");
			return true;
		}
		req.setAttribute("loginPage", "Account/login.jsp");
		return false;

	}

	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
	}

	public void bye(HttpServletRequest req) {
		try {
			AccountDTO a = (AccountDTO) req.getSession().getAttribute("loginMember");
			if (ss.getMapper(AccountMapper.class).bye(a) == 1) {
				req.setAttribute("result", "thanks, bye");

				logout(req);
				loginCheck(req);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void join(AccountDTO a, HttpServletRequest req) {
		String id = a.getA_id();
		String email = req.getParameter("a_email3");
		a.setA_id(id + "@" + email);
		a.setA_email(id + "@" + email);
		System.out.println(a.getA_id());
		System.out.println(a.getA_email());
		
		if (ss.getMapper(AccountMapper.class).join(a) == 1) {
			req.setAttribute("result", "가입성공");
		} else {
			req.setAttribute("result", "가입실패");
		}
	}

	public void update(AccountDTO a, HttpServletRequest req) {
		try {
			if (ss.getMapper(AccountMapper.class).update(a) == 1) {
				req.setAttribute("result", "수정성공");
				req.getSession().setAttribute("loginMember", a);

			}

			else {
				req.setAttribute("result", "수정실패");

			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "수정실패");
		}
	}

	public int checkId(AccountDTO a, HttpServletRequest req) {

		return ss.getMapper(AccountMapper.class).getAccountNum(a);
	}

	public int checkNickName(AccountDTO a, HttpServletRequest req) {

		return ss.getMapper(AccountMapper.class).getNicknameNum(a);
	}

	public void setLoginMember(HttpServletRequest req, AccountDTO account) {
		req.getSession().setAttribute("loginMember", account);
		req.getSession().setMaxInactiveInterval(60 * 10);
	}

	public AccountDTO getLoginMember(HttpServletRequest req) {
		return (AccountDTO) req.getSession().getAttribute("loginMember");
	}

	
	public void naverLogIn(HttpServletRequest req) {
	    String clientId = "UaEIf33g3s0PC0nCawKU";
	    try {
	        String redirectURI = URLEncoder.encode("http://localhost/shopping/naver_login_callback", "UTF-8");
	        SecureRandom random = new SecureRandom();
	        String naverState = new BigInteger(130, random).toString();
	        String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	        apiURL += "&client_id=" + clientId;
	        apiURL += "&redirect_uri=" + redirectURI;
	        apiURL += "&state=" + naverState;

	        HttpSession session = req.getSession();
	        session.setAttribute("LoginMemberNaver", naverState);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	 

	public void naverLoginCallBack(HttpServletRequest req) {
		String clientId = "UaEIf33g3s0PC0nCawKU";
		String clientSecret = "XJPThm8DJ2";
		String code = req.getParameter("code");
		String naverState = req.getParameter("state");
		String redirectURI;
		try {
			redirectURI = URLEncoder.encode("http://localhost/shopping/naver_login_callback", "UTF-8");
			String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
			apiURL += "client_id=" + clientId;
			apiURL += "&client_secret=" + clientSecret;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&code=" + code;
			apiURL += "&state=" + naverState;

			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				String inputLine;
				StringBuffer res = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					res.append(inputLine);
				}
				br.close();

				JSONObject jsonResponse = new JSONObject(res.toString());
				String accessToken = jsonResponse.getString("access_token");

				// 사용자 정보 가져오기
				String userProfileAPI = "https://openapi.naver.com/v1/nid/me";
				String userProfileURL = userProfileAPI;
				HttpURLConnection profileCon = (HttpURLConnection) new URL(userProfileURL).openConnection();
				profileCon.setRequestProperty("Authorization", "Bearer " + accessToken);
				int profileResponseCode = profileCon.getResponseCode();
				BufferedReader profileBr;
				if (profileResponseCode == 200) { // 정상 호출
					profileBr = new BufferedReader(new InputStreamReader(profileCon.getInputStream()));
					String profileInputLine;
					StringBuffer profileResponse = new StringBuffer();
					while ((profileInputLine = profileBr.readLine()) != null) {
						profileResponse.append(profileInputLine);
					}
					profileBr.close();

					JSONObject userInfo = new JSONObject(profileResponse.toString());
					String userNickname = userInfo.getJSONObject("response").getString("nickname");
					String naverUserId = userInfo.getJSONObject("response").getString("id");

					// 사용자 정보 저장 메서드 호출
					AccountDTO dbAccount = new AccountDTO();
					dbAccount.setA_nickname(userNickname);
					req.getSession().setAttribute("LoginMemberNaver", dbAccount);
					saveUserNaverInfo(req, userNickname, naverUserId, naverUserId, naverUserId); // 수정된 부분
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void saveUserNaverInfo(HttpServletRequest req, String a_nickname, String a_id, String a_email,
			String a_password) {
		AccountDTO a = (AccountDTO) req.getSession().getAttribute("LoginMemberNaver");
		System.out.println("loginMember 세션 정보: " + a);

		if (a != null) {
			// 사용자의 닉네임을 계정 객체에 저장합니다.
			a.setA_nickname(a_nickname);
			a.setA_id(a_id);
			// 닉네임 값을 a_name 필드에도 설정합니다.
			a.setA_name(a_nickname); // 추가된 부분
			a.setA_email(a_email);
			// 암호를 암호화하여 설정합니다.
			String encryptedPassword = encryptPassword(a_password);
			a.setA_password(encryptedPassword);
			// 해당 ID를 기반으로 사용자 계정이 있는지 확인합니다.
			int accountNum = checkId(a, req);
			String originalPassword = a.getA_password();
			if (originalPassword.length() > 20) {
				a.setA_password(originalPassword.substring(0, 20));
			}
			if (accountNum == 0) { // 계정이 존재하지 않으면 새로운 계정을 생성합니다.
				join(a, req);
			} else { // 계정이 존재하면 닉네임을 업데이트합니다.
				// 데이터베이스에서 닉네임을 업데이트합니다.
				ss.getMapper(AccountMapper.class).saveNaverNickname(a);

				// 세션 내의 계정 객체를 업데이트합니다.
				setLoginMember(req, a);
			}
		}

		// 네이버 로그인 세션 정보를 초기화합니다.
		req.getSession().setAttribute("naverLoginState", null);
		req.getSession().setAttribute("accessToken", null);

	}

	private String encryptPassword(String plainPassword) {
		// BCryptPasswordEncoder를 사용하여 암호화된 비밀번호를 생성합니다.
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		return passwordEncoder.encode(plainPassword);
	}

	

	public void saveKakaoUserInfo(HttpServletRequest req, String userEmail, String kakaoUserId) {
		AccountDTO aa = (AccountDTO) req.getSession().getAttribute("loginMember");
		System.out.println("loginMember 세션 정보: " + aa);

		AccountDTO a = new AccountDTO();
		if (aa == null) {
			a.setA_nickname(kakaoUserId);
			a.setA_id(userEmail);
			a.setA_email(userEmail);
			a.setA_name(kakaoUserId);
			String encryptedPassword = encryptPassword("asd");
			a.setA_password(encryptedPassword);
			// 해당 ID를 기반으로 사용자 계정이 있는지 확인합니다.
			req.getSession().setAttribute("kakaoInfo", a);
			int accountNum = checkId(a, req);
			String originalPassword = a.getA_password();
			if (originalPassword.length() > 20) {
				a.setA_password(originalPassword.substring(0, 20));
			}
			if (accountNum == 0) { // 계정이 존재하지 않으면 새로운 계정을 생성합니다.
				join(a, req);
			} 
		}else { // 계정이 존재하면 닉네임을 업데이트합니다.
			// 데이터베이스에서 카카오 사용자 정보 업데이트
			ss.getMapper(AccountMapper.class).saveKakaoUserInfo(a);
		}

		// 카카오 로그인 세션 정보 초기화
	}

	public void socialLogOut(HttpServletRequest req) {
		req.getSession().removeAttribute("LoginMemberNaver");
		    
	
	}

}
