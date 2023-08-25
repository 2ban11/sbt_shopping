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
    public String controlOrder(HttpServletRequest req, Model model, ProductDTO pDTO) {
    	req.setAttribute("contentPage", "jaehwan/adminPage.jsp");
    	req.setAttribute("controlPage", "controlOrder.jsp");
    	return "index";
    }
    @RequestMapping(value = "/controlMargin", method = RequestMethod.GET)
    public String controlMargin(HttpServletRequest req, Model model, OrderDetailDTO odDTO) {
    	odDAO.getChartData(req);
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
    	return "index";
    }

}
