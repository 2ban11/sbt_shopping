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
    public String home(HttpServletRequest req, Model model) {
        productDAO.getAllProduct(req, model);
        req.setAttribute("contentPage", "jaehwan/elecPage.jsp");
        return "index";
    }

    @ResponseBody
    @RequestMapping(
    	value = "/searchDetail",
    	method = RequestMethod.POST
    )
    public List<ProductDTO> searchDetail(ProductDTO pDTO) {
    	System.out.println(pDTO.getPl_category());
    	System.out.println(pDTO.getPl_companyName());
    	System.out.println(pDTO.getSortOrder());
    	System.out.println(pDTO.getPl_color());
    	return productDAO.getSearchProduct(pDTO);
    }
}
