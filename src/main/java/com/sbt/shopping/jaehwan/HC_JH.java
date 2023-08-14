package com.sbt.shopping.jaehwan;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HC_JH {

    @Autowired
    private ProductDAO productDAO;

    @RequestMapping(value = "/elecPage", method = RequestMethod.GET)
    public String elecPage(HttpServletRequest req, Model model, ProductDTO pDTO) {
    	
    	pDTO.setP_big_category(req.getParameter("BC"));
    	System.out.println(req.getParameter("BC"));
    	pDTO.setP_middle_category(req.getParameter("MC"));
    	
    	productDAO.getAllProduct(req, model, pDTO);
    	req.setAttribute("contentPage", "jaehwan/elecPage.jsp");
        return "index";
    }
    @RequestMapping(value = "/ampForElec", method = RequestMethod.GET)
    public String ampForElec(HttpServletRequest req, Model model, ProductDTO pDTO) {
    	pDTO.setP_big_category(req.getParameter("BC"));
    	pDTO.setP_middle_category(req.getParameter("MC"));
    	
    	productDAO.getAllProduct(req, model, pDTO);
    	req.setAttribute("contentPage", "jaehwan/ampForElec.jsp");
    	return "index";
    }

    @ResponseBody
    @RequestMapping(
    	value = "/searchDetail",
    	method = RequestMethod.POST
    )
    public List<ProductDTO> searchDetail(ProductDTO pDTO) {
    	System.out.println(pDTO.getP_maker());
    	System.out.println(pDTO.getP_small_category());
    	System.out.println(pDTO.getP_color());
    	System.out.println(pDTO.getSortOrder());
    	return productDAO.getSearchProduct(pDTO);
    }
}
