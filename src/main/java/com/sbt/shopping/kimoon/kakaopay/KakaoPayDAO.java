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

	public String kakaoPayReady(HttpServletRequest request, CartDTO cartList, AccountDTO aDTO) {
		String totalAmount = request.getParameter("total");
		String cNo[] = request.getParameterValues("c_no");
		//String cProduct[] = request.getParameterValues("c_product");
		String cProductArray[] = request.getParameterValues("c_product");
		String pSaleArray[] = request.getParameterValues("p_sale");
		String cCntArray[] = request.getParameterValues("c_cnt");
		List<Integer> cProduct = new ArrayList<Integer>();
		List<Integer> pSale = new ArrayList<Integer>();
		List<Integer> cCnt = new ArrayList<Integer>();
		for (int i = 0; i < cProductArray.length; i++) {
		    cProduct.add(Integer.parseInt(cProductArray[i]));
		    pSale.add(Integer.parseInt(pSaleArray[i]));
		    cCnt.add(Integer.parseInt(cCntArray[i]));
		}
		
		
		
		request.getSession().setAttribute("totalAmount", totalAmount);
		request.getSession().setAttribute("cartNoList", cNo);
		request.getSession().setAttribute("cartProductList", cProduct);
		request.getSession().setAttribute("cartSaleList", pSale);
		request.getSession().setAttribute("cartCntList", cCnt);
		
		List<CartDTO> cartArrayList = new ArrayList<CartDTO>();

		for (String c : cNo) {
		    List<CartDTO> cart = ss.getMapper(CartMapper.class).getOrderCart(c);
		    cartArrayList.addAll(cart);
		}
		request.getSession().setAttribute("cartList", cartArrayList);
		AccountDTO account = (AccountDTO) request.getSession().getAttribute("loginMember");
//		String cCnt[] = request.getParameterValues("c_cnt");
//		String cProduct[] = request.getParameterValues("c_product");
//		String cSale[] = request.getParameterValues("p_sale");
//		request.getSession().setAttribute("cartCntList", cCnt);
//		request.getSession().setAttribute("cartProductList", cProduct);
		int str = cartArrayList.size() - 1;
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
		if(cartArrayList.size() == 1) {
			params.add("item_name", cartArrayList.get(0).getP_name()); // 상품명
		}else if(cartArrayList.size() > 1){
			params.add("item_name", cartArrayList.get(0).getP_name() + "외 " + str + "건"); // 상품명
		}
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
		request.getSession().getAttribute("cartNoList");
		
		List<Integer> cartProductList = (List<Integer>) request.getSession().getAttribute("cartProductList");
		List<Integer> cartSaleList = (List<Integer>) request.getSession().getAttribute("cartSaleList");
		List<Integer> cartCntList = (List<Integer>) request.getSession().getAttribute("cartCntList");
		
		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "f61653f1ad30198116c46a43b4bbf71d");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
//		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoPayReadyVO.getTid());
		params.add("partner_order_id", "partner_order_id");
		params.add("partner_user_id", account.getA_nickname());
		params.add("pg_token", pg_token);
		params.add("total_amount", totalAmount);
		try {
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
			
		kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApprovalVO.class);
			
			// 장바구니 삭제
		List<CartDTO> cartList = (List<CartDTO>)request.getSession().getAttribute("cartList");
		List<OrderDTO> orderList = new ArrayList<OrderDTO>();
		for (CartDTO cart : cartList) {
			if (ss.getMapper(CartMapper.class).deleteCart(cart.getC_no()) == 1) {
				System.out.println("장바구니 삭제 성공!");
			}
		}
		
		for (int i = 0; i < cartProductList.size(); i++) {
		    int c_product = cartProductList.get(i);
		    int p_sale = cartSaleList.get(i);
		    int c_cnt = cartCntList.get(i);
		    
		    OrderDTO orderDTO = new OrderDTO();
		    orderDTO.setOd_id(account.getA_id());
		    System.out.println(orderDTO.getOd_id());
		    orderDTO.setOd_product(c_product);
		    System.out.println(orderDTO.getOd_product());
		    orderDTO.setOd_price(p_sale);
		    System.out.println(orderDTO.getOd_price());
		    orderDTO.setOd_cnt(c_cnt);
		    System.out.println(orderDTO.getOd_cnt());
		    
		    orderList.add(orderDTO);
		}
		
		for (OrderDTO orderDTO : orderList) {
			if (ss.getMapper(KakaoPayMapper.class).addOrder(orderDTO) == 1) {
				System.out.println("주문내역 추가 성공!");
			} else {
				System.out.println("주문내역 추가 실패...");
			}
		}
		
		
			
		return kakaoPayApprovalVO;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
