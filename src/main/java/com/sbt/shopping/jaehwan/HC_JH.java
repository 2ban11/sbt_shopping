package com.sbt.shopping.jaehwan;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbt.shopping.jaepil.MypageDAO;
import com.sbt.shopping.jaepil.OrderDTO;
import com.sbt.shopping.myeonggyu.AccountDAO;
import com.sbt.shopping.myeonggyu.AccountDTO;

@Controller
public class HC_JH {

    @Autowired
    private ProductDAO pDAO;
    @Autowired
    private OrderDetailDAO odDAO;
    
    
    @RequestMapping(value = "/guitarPage", method = RequestMethod.GET)
    public String guitar(HttpServletRequest req, Model model, ProductDTO pDTO) {
    	
    	pDTO.setP_big_category(req.getParameter("BC"));
    	pDTO.setP_middle_category(req.getParameter("MC"));
    	pDAO.getAllProduct(req, model, pDTO);
    	req.setAttribute("contentPage", "jaehwan/guitarPage.jsp");
        return "index";
    }
    @RequestMapping(value = "/ampPage", method = RequestMethod.GET)
    public String amp(HttpServletRequest req, Model model, ProductDTO pDTO) {
    	pDTO.setP_big_category(req.getParameter("BC"));
    	pDTO.setP_middle_category(req.getParameter("MC"));
    	pDAO.getAllProduct(req, model, pDTO);
    	req.setAttribute("contentPage", "jaehwan/ampPage.jsp");
    	return "index";
    }
    @RequestMapping(value = "/effectorPage", method = RequestMethod.GET)
    public String effector(HttpServletRequest req, Model model, ProductDTO pDTO) {
    	pDTO.setP_big_category(req.getParameter("BC"));
    	pDTO.setP_middle_category(req.getParameter("MC"));
    	pDAO.getAllProduct(req, model, pDTO);
    	req.setAttribute("contentPage", "jaehwan/effectorPage.jsp");
    	return "index";
    }
    @RequestMapping(value = "/accessoryPage", method = RequestMethod.GET)
    public String accessory(HttpServletRequest req, Model model, ProductDTO pDTO) {
    	pDTO.setP_big_category(req.getParameter("BC"));
    	pDTO.setP_middle_category(req.getParameter("MC"));
    	pDAO.getAllProduct(req, model, pDTO);
    	req.setAttribute("contentPage", "jaehwan/accessoryPage.jsp");
    	return "index";
    }
    @ResponseBody
    @RequestMapping(value = "/searchDetail", method = RequestMethod.POST)
    public List<ProductDTO> searchDetail(ProductDTO pDTO) {
    	return pDAO.getSearchProduct(pDTO);
    }
    @ResponseBody
    @RequestMapping(value = "/searchDetailForAdmin", method = RequestMethod.POST)
    public List<ProductDTO> searchDetailForAdmin(ProductDTO pDTO, HttpServletRequest req, Model model) {
    	return pDAO.searchDetailForAdmin(pDTO);
    	
    }
    
    // 관리자페이지 
    @RequestMapping(value = "/adminPage", method = RequestMethod.GET)
    public String admin(HttpServletRequest req, Model model, ProductDTO pDTO) {
    	pDAO.getAdminProduct(req, model, pDTO);
    	req.setAttribute("contentPage", "jaehwan/adminPage.jsp");
    	return "index";
    }
    @RequestMapping(value = "/controlProduct", method = RequestMethod.GET)
    public String controlProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
    	pDAO.getAdminProduct(req, model, pDTO);
    	req.setAttribute("contentPage", "jaehwan/adminPage.jsp");
    	req.setAttribute("controlPage", "controlProduct.jsp");
    	return "index";
    }
    @RequestMapping(value = "/controlOrder", method = RequestMethod.GET)
    public String controlOrder(HttpServletRequest req, Model model, ProductDTO pDTO, OrderDetailDTO oDTO) {
    	pDAO.getAllOrder(req,pDTO,oDTO);
    	req.setAttribute("contentPage", "jaehwan/adminPage.jsp");
    	req.setAttribute("controlPage", "controlOrder.jsp");
    	return "index";
    }
    @RequestMapping(value = "/controlRefund", method = RequestMethod.GET)
    public String controlRefund(HttpServletRequest req, Model model, ProductDTO pDTO, OrderDetailDTO oDTO) {
    	pDAO.getRefundOrder(req,pDTO,oDTO);
    	req.setAttribute("contentPage", "jaehwan/adminPage.jsp");
    	req.setAttribute("controlPage", "controlRefund.jsp");
    	return "index";
    }
    @RequestMapping(value = "/refundaccept", method = RequestMethod.GET)
	public String refundAccept(HttpServletRequest req, OrderDetailDTO oDTO) {
    	pDAO.refundAccept(req, oDTO);
		return "redirect:/controlRefund";
	}
    
    @RequestMapping(value = "/refundcancel2", method = RequestMethod.GET)
	public String refundCancel2(HttpServletRequest req, OrderDetailDTO oDTO) {
		pDAO.refundCancel2(req, oDTO);
		return "redirect:/controlRefund";
	}
    
    @RequestMapping(value = "/controlMargin", method = RequestMethod.GET)
    public String controlMargin(HttpServletRequest req, MarginDTO maDTO) {
    	odDAO.getChartData(req,maDTO);
    	req.setAttribute("contentPage", "jaehwan/adminPage.jsp");
    	req.setAttribute("controlPage", "controlMargin.jsp");
    	return "index";
    }
    @RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
    public String deleteProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
    	pDAO.deleteProduct(req, model, pDTO);
    	pDAO.getAdminProduct(req, model, pDTO);
    	req.setAttribute("contentPage", "jaehwan/adminPage.jsp");
    	return "index";
    }
    @RequestMapping(value = "/regProduct", method = RequestMethod.POST)
    public String regProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
    	pDAO.regProduct(req,model,pDTO);
    	pDAO.getAdminProduct(req, model, pDTO);
    	return "redirect:adminPage";
    }
    @RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
    public String updateProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
    	pDAO.updateProduct(req,model,pDTO);
    	pDAO.getAdminProduct(req, model, pDTO);
    	req.setAttribute("contentPage", "jaehwan/adminPage.jsp");
    	return "redirect:adminPage";
    }
    @RequestMapping(value = "/getMargin", method = RequestMethod.POST)
    public @ResponseBody List<OrderDetailDTO> getMargin(HttpServletRequest req, Model model, ProductDTO pDTO, OrderDetailDTO odDTO) {
    	System.out.println(odDTO);
    	return pDAO.getMargin(req,odDTO);
    }
	
	 @RequestMapping(value = "/insertMargin", method = RequestMethod.POST)
	 public String insertMargin(HttpServletRequest req, MarginDTO mDTO) {
		    String dateString = mDTO.getDate();
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    try {
		        Date date = dateFormat.parse(dateString);
		        mDTO.setMa_date(date);
		    } catch (ParseException e) {
		        e.printStackTrace();
		    }
		    
		    List<MarginDTO> existingData = odDAO.getMarginByDate(dateString);
		    
		    if (existingData != null) {
		        odDAO.updateMargin(req, mDTO);
		    } else {
		        odDAO.insertMargin(req, mDTO);
		    }
		    
		    return "redirect:controlMargin"; 
		}
    
    }
    
    
