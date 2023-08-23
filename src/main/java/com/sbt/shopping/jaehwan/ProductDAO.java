package com.sbt.shopping.jaehwan;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ProductDAO {
	
    @Autowired
    private SqlSession ss;
    
    @Autowired
    private ServletContext sc;

    public void getAllProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
        model.addAttribute("products", ss.getMapper(Jh_productMapper.class).getAllProduct(pDTO));
    }
	public List<ProductDTO> getSearchProduct(ProductDTO pDTO) {
		pDTO.setColors(pDTO.getP_color().split("!"));
		return ss.getMapper(Jh_productMapper.class).getSearchProduct(pDTO);
	}
	
	
	public void getAdminProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
		model.addAttribute("products", ss.getMapper(Jh_productMapper.class).getAdminProduct(pDTO));
	}
	
	
	public void deleteProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
		if (ss.getMapper(Jh_productMapper.class).deleteProduct(pDTO) == 1);
	}
	public void regProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
		try {
			System.out.println(pDTO);
			String imgOrgName = pDTO.getImg().getOriginalFilename();
			long imgSize = pDTO.getImg().getSize();
			
			if (imgSize == 0) {
				pDTO.setP_img1(pDTO.getImg().getOriginalFilename());
			} else {
				String extension = imgOrgName.substring(imgOrgName.lastIndexOf("."), imgOrgName.length());
				String newName = UUID.randomUUID().toString().split("-")[0]; //새로운 이름 만들기

				String path = sc.getRealPath("resources/img"); // 이미지 저장할 루트
				System.out.println(path);
				File saveImg = new File(path + "//" + newName + extension); //그래서 java에서 file 인식시키게 하기 (루트 + 새 이름 + 기존에 따온 확장자)
				
				pDTO.getImg().transferTo(saveImg);
				pDTO.setP_img1(newName + extension);
				
				
				if (ss.getMapper(Jh_productMapper.class).regProduct(pDTO)==1) {
					model.addAttribute("products", ss.getMapper(Jh_productMapper.class).getAdminProduct(pDTO));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
		
	}
	public List<ProductDTO> searchDetailForAdmin(ProductDTO pDTO) {
		return ss.getMapper(Jh_productMapper.class).getSearchProductForAdmin(pDTO);
	}
}
