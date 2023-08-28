package com.sbt.shopping.inhoo;

import java.io.File;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.sbt.shopping.jaehwan.ProductDTO;
import com.sbt.shopping.myeonggyu.AccountDTO;

@Service
public class DetailDAO {

	@Autowired
	private ServletContext servlet;

	@Autowired
	private SqlSession ss;

	public void regReviewDo(DetailDTO dDTO, Model model, ProductDTO pDTO, HttpServletRequest req) {
	    MultipartFile file = dDTO.getFile();

	    String fileRealName = null;
	    String fileExtension = null;
	    String uniqueName = null;

	    if (file != null && !file.isEmpty()) {
	        fileRealName = file.getOriginalFilename();
	        long size = file.getSize();
	        String savePath = servlet.getRealPath("resources/img");

	        fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

	        UUID uuid = UUID.randomUUID();
	        String[] uuids = uuid.toString().split("-");
	        uniqueName = uuids[0];
	    }

	    try {
	        if (uniqueName != null && fileExtension != null) {
	            String savePath = servlet.getRealPath("resources/img");
	            File saveFile = new File(savePath + "/" + uniqueName + fileExtension);

	            if (file != null && !file.isEmpty()) {
	                file.transferTo(saveFile);
	                dDTO.setR_img(uniqueName + fileExtension);
	            }
	        } else {
	            dDTO.setR_img(null); // 파일이 업로드되지 않은 경우 r_img를 null로 설정
	        }

	        // r_product 값을 설정
	        dDTO.setR_product(dDTO.getP_no());

	        // 로그인된 사용자의 아이디를 r_id 필드에 설정
	        AccountDTO account = (AccountDTO) req.getSession().getAttribute("loginMember");
	        AccountDTO account2 = (AccountDTO) req.getSession().getAttribute("LoginMemberNaver");
	        AccountDTO account3 = (AccountDTO) req.getSession().getAttribute("kakaoInfo");

	        if (account != null) {
	            dDTO.setR_id(account.getA_id());
	        } else if (account2 != null) {
	            dDTO.setR_id(account2.getA_id());
	        } else if (account3 != null) {
	        	dDTO.setR_id(account3.getA_id());				
			} 
	      

	        ss.getMapper(DetailMapper.class).regReview(dDTO);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}




	public void getProduct(int pageNo, Model model, ProductDTO pDTO) {
		ProductDTO product = ss.getMapper(DetailMapper.class).getProduct(pDTO);
		
		if (product == null) {
	        return;
	    }
		pDTO.setP_no(product.getP_no());
		int reviewCount = ss.getMapper(DetailMapper.class).getReviewCount(pDTO);
//	    System.out.println(pageNo);
//	    System.out.println(pDTO);
//	    System.out.println(reviewCount);
//	    System.out.println("====>>");
		// 1. start= 1 end= 10
		int count = 10;
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);

		ReviewSelector rs = new ReviewSelector(product.getP_no(), new BigDecimal(start), new BigDecimal(end));
//        System.out.println(rs);

		List<DetailDTO> reviews = ss.getMapper(DetailMapper.class).getReviews(rs);

		int pageCount = (int) Math.ceil(reviewCount / (double) count);
//        System.out.println(pageCount);
		model.addAttribute("reviewPageCount", pageCount);
		model.addAttribute("reviews", reviews);
		model.addAttribute("reviewCurPage", pageNo);
		model.addAttribute("product", product);
	}

	// 도전중
	public void getQnAPage(int pageNo, Model model, ProductDTO pDTO) {
		int qnaCount = ss.getMapper(DetailMapper.class).getQnACount(pDTO);
		int count = 10; // 한 페이지에 표시할 게시글 수

		// 현재 페이지에 해당하는 게시글의 범위 계산
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);


		// QnA 게시글 조회를 위한 셀렉터 객체 생성
		QnASelector qnaSelector = new QnASelector(pDTO.getP_no(), new BigDecimal(start), new BigDecimal(end));

		// QnA 게시글 목록 가져오기
		List<QnaDTO> qnas = ss.getMapper(DetailMapper.class).getQnAs(qnaSelector);

		// 전체 페이지 수 계산
		int pageCount = (int) Math.ceil(qnaCount / (double) count);

		ReviewPageInfo pageInfo = new ReviewPageInfo(pageNo, pageCount);

		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("qnas", qnas); // QnA 게시글 목록
		model.addAttribute("qnaPageCount", pageCount); // 전체 페이지 수

	}

	public String regQnaDo(QnaDTO qDTO, Model model, ProductDTO pDTO, HttpServletRequest req) {
		qDTO.setQ_product(pDTO.getP_no());  // QnA에 대한 product 번호를 설정합니다.
		
		
		
		AccountDTO account = (AccountDTO) req.getSession().getAttribute("loginMember");
        AccountDTO account2 = (AccountDTO) req.getSession().getAttribute("LoginMemberNaver");
        AccountDTO account3 = (AccountDTO) req.getSession().getAttribute("kakaoInfo");
        
        if (account != null) {
            qDTO.setQ_id(account.getA_id());
        } else if (account2 != null) {
            qDTO.setQ_id(account2.getA_id());
        } else {
            qDTO.setQ_id(account3.getA_id());
        }
		
		
		
		if (ss.getMapper(DetailMapper.class).regQna(qDTO) == 1) {
			System.out.println("Q&A등록 성공");
		}
		return "redirect:/detail.product?p_no=" + pDTO.getP_no();
	}




	public void qnaDelete(QnaDTO qDTO, Model model, ProductDTO pDTO, HttpServletRequest req) {
		if(ss.getMapper(DetailMapper.class).deleteQna(qDTO)==1) {
			System.out.println("삭제 성공!");
		}
	}




	public void reviewDelete(DetailDTO dDTO, Model model, ProductDTO pDTO, HttpServletRequest req) {
		if(ss.getMapper(DetailMapper.class).deleteReview(dDTO)==1) {
			System.out.println("삭제 성공!");
		}
		
	}


}
