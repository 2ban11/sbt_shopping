package com.sbt.shopping.inhoo;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

@Service
public class DetailDAO {
	
	@Autowired 
	private ServletContext servlet;
	
	@Autowired
	private SqlSession ss;

	
	public void regReviewDo(DetailDTO dDTO, Model model) {
	    MultipartFile file = dDTO.getFile();

	    String fileRealName = null;
	    String fileExtension = null;
	    String uniqueName = null;

	    if (file != null && !file.isEmpty()) {
	        fileRealName = file.getOriginalFilename();
	        long size = file.getSize();
	        String savePath = servlet.getRealPath("resources/img");

	        System.out.println("파일명 : "  + fileRealName);
	        System.out.println("용량크기(byte) : " + size);

	        fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());

	        UUID uuid = UUID.randomUUID();
	        System.out.println(uuid.toString());
	        String[] uuids = uuid.toString().split("-");
	        uniqueName = uuids[0];
	        System.out.println("생성된 고유문자열" + uniqueName);
	        System.out.println("확장자명" + fileExtension);
	    }

	    try {
	        if (uniqueName != null && fileExtension != null) {
	            String savePath = servlet.getRealPath("resources/img");
	            File saveFile = new File(savePath+"/"+uniqueName + fileExtension);

	            if (file != null && !file.isEmpty()) {
	                file.transferTo(saveFile);
	                dDTO.setR_img(uniqueName + fileExtension);
	            }
	        } else {
	            dDTO.setR_img(null); // 파일이 업로드되지 않은 경우 r_img를 null로 설정
	        }

	        ss.getMapper(DetailMapper.class).regReview(dDTO);
	    } catch (IllegalStateException | IOException e) {
	        e.printStackTrace();
	    }
	}



	public void getProduct(int pageNo, Model model, ProductDTO pDTO) {
	    ProductDTO product = ss.getMapper(DetailMapper.class).getProduct(pDTO);
	    
	    pDTO.setP_no(product.getP_no());
	    int reviewCount = ss.getMapper(DetailMapper.class).getReviewCount(pDTO);
//	    System.out.println(pageNo);
//	    System.out.println(pDTO);
//	    System.out.println(reviewCount);
//	    System.out.println("====>>");
	    // 1.  start= 1   end= 10
	    int count = 10;
        int start = (pageNo - 1) * count + 1;
        int end = start + (count - 1);

        ReviewSelector rs = new ReviewSelector(product.getP_no(), new BigDecimal(start), new BigDecimal(end));
//        System.out.println(rs);
        
        List<DetailDTO> reviews = ss.getMapper(DetailMapper.class).getReviews(rs);

        int pageCount = (int) Math.ceil(reviewCount / (double) count);
//        System.out.println(pageCount);
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("reviews", reviews);
        model.addAttribute("curPage", pageNo);
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

	    model.addAttribute("qnas", qnas); // QnA 게시글 목록
	    model.addAttribute("qnaPageCount", pageCount); // 전체 페이지 수
	    System.out.println("여긴 DetailDAO" + qnas);
	}

	
	
	
	
	
	
	public void regQnaDo(QnaDTO qDTO, Model model) {
		if(ss.getMapper(DetailMapper.class).regQna(qDTO)==1) {
			System.out.println("Q&A등록 성공");
		}
	}


	

	
	


}
