package com.sbt.shopping.jaehwan;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailDAO {
	
	@Autowired
	private SqlSession ss;

	  public void getChartData(HttpServletRequest req, MarginDTO maDTO) {
		  List<Integer> mDTO = ss.getMapper(Jh_productMapper.class).getChartData();
		  int[] ods = new int[7];
		
			int i = 0;
			for (int oo : mDTO) {
				ods[i] = oo;
				i++;
				if (i == 7) {
					break;
				}
				System.out.println(Arrays.toString(ods));
	        req.setAttribute("margins", ods);
			}

	        List<Date> dateLabels = LastDays();
	        List<String> formatLabels = new ArrayList<String>();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        for (Date date : dateLabels) {
	        	formatLabels.add(sdf.format(date));
	        }
	        System.out.println(formatLabels);
	        req.setAttribute("formatLabels", formatLabels);
	    }

	private List<Date> LastDays() {
	      List<Date> dates = new ArrayList<Date>();
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(new Date());

	        for (int i = 0; i < 7; i++) {
	            dates.add(calendar.getTime());
	            calendar.add(Calendar.DATE, -1);
	        }
	        System.out.println(dates);
	        return dates;
	}


	public void insertMargin(HttpServletRequest req, MarginDTO mDTO) {
		ss.getMapper(Jh_productMapper.class).insertMargin(mDTO);
	}

	public void updateMargin(HttpServletRequest req, MarginDTO mDTO) {
		ss.getMapper(Jh_productMapper.class).updateMargin(mDTO);
	}

	public List<MarginDTO> getMarginByDate(String dateString) {
		return ss.getMapper(Jh_productMapper.class).getMarginByDate(dateString);
	}



		
		
	}



