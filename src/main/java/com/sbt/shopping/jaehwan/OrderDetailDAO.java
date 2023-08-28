package com.sbt.shopping.jaehwan;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLContext;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class OrderDetailDAO {
	
	@Autowired
	private SqlSession ss;

	public void getChartData(HttpServletRequest req) {
		
		int bc[] = new int[7];
		List<OrderDetailDTO> odDTO = ss.getMapper(Jh_productMapper.class).getChartData();
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


	public void insertMargin(HttpServletRequest req, MarginDTO mDTO) {
		ss.getMapper(Jh_productMapper.class).insertMargin(mDTO);
	}
		
		
	}



