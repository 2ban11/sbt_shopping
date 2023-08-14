package com.sbt.shopping.jaehwan;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ProductDAO {

    @Autowired
    private SqlSession ss;

    public void getAllProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
        model.addAttribute("products", ss.getMapper(Jh_productMapper.class).getAllProduct(pDTO));
    }
	public List<ProductDTO> getSearchProduct(ProductDTO pDTO) {
		pDTO.setColors(pDTO.getP_color().split("!"));
		return ss.getMapper(Jh_productMapper.class).getSearchProduct(pDTO);
	}
}
