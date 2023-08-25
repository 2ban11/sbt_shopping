package com.sbt.shopping.kimoon.kakaopay;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.sbt.shopping.cart.Cart;
import com.sbt.shopping.jaepil.CartDTO;
import com.sbt.shopping.jaepil.CartMapper;
import com.sbt.shopping.jaepil.OrderDTO;
import com.sbt.shopping.kimoon.board.BoardMapper;
import com.sbt.shopping.myeonggyu.AccountDTO;
import com.sbt.shopping.myeonggyu.AccountMapper;

@Service
public class KakaoPayDAO {

	@Autowired
	private SqlSession ss;

	private static final String HOST = "https://kapi.kakao.com";

	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;

	public String kakaoPayReady(HttpServletRequest request, CartDTO cartList) {
		String totalAmount = request.getParameter("total");
		request.getSession().setAttribute("totalAmount", totalAmount);
		List<CartDTO> cart = ss.getMapper(CartMapper.class).getOrderCart(cartList);
		System.out.println("cartList"+cart);
		
//		String cNo[] = request.getParameterValues("c_no");
//		String cCnt[] = request.getParameterValues("c_cnt");
//		String cProduct[] = request.getParameterValues("c_product");
//		String cSale[] = request.getParameterValues("p_sale");
//		request.getSession().setAttribute("cartNoList", cNo);
//		request.getSession().setAttribute("cartCntList", cCnt);
//		request.getSession().setAttribute("cartProductList", cProduct);
		request.getSession().setAttribute("cartList", cart);
		System.out.println("cartList 세션"+request.getSession().getAttribute("cartList"));
		AccountDTO account = (AccountDTO) request.getSession().getAttribute("loginMember");

		RestTemplate restTemplate = new RestTemplate();
		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "f61653f1ad30198116c46a43b4bbf71d");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME"); // 가맹점 코드
		params.add("partner_order_id", "partner_order_id"); // 가맹점 주문번호
		params.add("partner_user_id", account.getA_nickname()); // 가맹점 회원 id
		params.add("item_name", cartList.getP_name()); // 상품명
		params.add("quantity", "1"); // 상품 수량
		params.add("total_amount", totalAmount); // 상품 총액
		params.add("tax_free_amount", "0"); // 상품 비과세 금액
		params.add("approval_url", "http://localhost/shopping/kakaoPaySuccess"); // 결제 성공 시 redirect url
		params.add("cancel_url", "http://localhost/shopping/mypage.order"); // 결제 취소 시 redirect url
		params.add("fail_url", "http://localhost/shopping/mypage.order"); // 결제 실패 시 redirect url

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		try {
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyVO.class);

			System.out.println(kakaoPayReadyVO);

			return kakaoPayReadyVO.getNext_redirect_pc_url();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/pay";

	}

	public KakaoPayApprovalVO kakaoPayInfo(HttpServletRequest request, String pg_token) {
		AccountDTO account = (AccountDTO) request.getSession().getAttribute("loginMember");
		request.getSession().getAttribute("cartList");
		String totalAmount = (String) request.getSession().getAttribute("totalAmount");
		System.out.println("KakaoPayInfoVO............................................");

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "f61653f1ad30198116c46a43b4bbf71d");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoPayReadyVO.getTid());
		params.add("partner_order_id", "partner_order_id");
		params.add("partner_user_id", account.getA_nickname());
		params.add("pg_token", pg_token);
		params.add("total_amount", totalAmount);
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			System.out.println(kakaoPayApprovalVO);
			// ss.getMapper(KakaoPayMapper.class).addOrder(oDTO);
			String chk[] = (String[]) request.getSession().getAttribute("cartList");
			System.out.println("결제 성공 : " + chk);
			for (String s : chk) {
				if (ss.getMapper(CartMapper.class).deleteCart(s) == 1) {
					request.getSession().setAttribute("cartNo", null);
					System.out.println("장바구니 삭제성공!");
				}
			}

			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApprovalVO.class);

			return kakaoPayApprovalVO;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
