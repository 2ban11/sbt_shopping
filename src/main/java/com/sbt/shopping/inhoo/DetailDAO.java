package com.sbt.shopping.inhoo;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;





@Service
public class DetailDAO {
	
	
	
	@Autowired 
	private ServletContext servlet;
	
	@Autowired
	private SqlSession ss;

	
	
	
	
	
	public void regReviewDo(DetailDTO dDTO) {
		if(ss.getMapper(DetailMapper.class).regReview(dDTO)==1) {
			System.out.println("등록 성공!");
		}
	}



	public Reviews getAllReview() {
	return new Reviews( ss.getMapper(DetailMapper.class).getAllReview());
		
	}



	public Reviews searchReview() {
		
		return new Reviews( ss.getMapper(DetailMapper.class).searchReview());
		
	}



	public void getProduct(int pageNo, Model model, ProductDTO pDTO) {
	    ProductDTO product = ss.getMapper(DetailMapper.class).getProduct(pDTO);
	    
	    pDTO.setP_no(product.getP_no());
	    int reviewCount = ss.getMapper(DetailMapper.class).getReviewCount(pDTO);
	    System.out.println(pageNo);
	    System.out.println(pDTO);
	    System.out.println(reviewCount);
	    System.out.println("====>>");
	    // 1.  start= 1   end= 10
	    int count = 10;
        int start = (pageNo - 1) * count + 1;
        int end = start + (count - 1);

        ReviewSelector rs = new ReviewSelector(product.getP_no(), new BigDecimal(start), new BigDecimal(end));
        System.out.println(rs);
        
        List<DetailDTO> reviews = ss.getMapper(DetailMapper.class).getReviews(rs);

        int pageCount = (int) Math.ceil(reviewCount / (double) count);
        System.out.println(pageCount);
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("reviews", reviews);
        model.addAttribute("curPage", pageNo);
        model.addAttribute("product", product);
	}
	/*
	 * public Reviews pagingList(int startIndex, int endIndex) { List<DetailDTO>
	 * reviews = ss.getMapper(DetailMapper.class).getReviewsInRange(startIndex,
	 * endIndex); return new Reviews(reviews); // Reviews 객체로 감싸서 반환 }
	 */


}
