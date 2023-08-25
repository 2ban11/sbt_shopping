package com.sbt.shopping.jaehwan;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailDAO {
	
	@Autowired
	private SqlSession ss;
	@Autowired
	private ServletContext sc;

	public void getChartData(HttpServletRequest req) {
		
		int bc[] = new int[7];
		
		List<OrderDetailDTO> odDTO = ss.getMapper(Jh_productMapper.class).getAllodDTO();
		OrderDetailDTO ooo = null;
		for (int i = 0; i < bc.length; i++) {
			if(odDTO.size()-1 == i) {
				break;
			}
			ooo = odDTO.get(i);
			if(ooo != null) {
				bc[i] = bc[i] + ooo.getP_sale() - ooo.getP_cost();
			}
		}
		
		req.setAttribute("arr", bc);
		
	}

}
