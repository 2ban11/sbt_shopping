package com.sbt.shopping.jaehwan;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class ProductDAO {

    @Autowired
    private SqlSession ss;

    public void getAllProduct(HttpServletRequest req, Model model) {
        model.addAttribute("products", ss.getMapper(Jh_productMapper.class).getAllProduct());
    }
	public List<ProductDTO> getSearchProduct(ProductDTO pDTO) {
		pDTO.setColors(pDTO.getPl_color().split("!"));
		return ss.getMapper(Jh_productMapper.class).getSearchProduct(pDTO);
	}
}
