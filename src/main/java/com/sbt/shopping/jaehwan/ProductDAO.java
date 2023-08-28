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
			String uploadURL = "resources/img/";
			String bigCate = pDTO.getP_big_category();
			if(bigCate.equals("기타")) {
				uploadURL+="Guitar";
			}else if(bigCate.equals("앰프")) {
				uploadURL+="Amp";
			}else if(bigCate.equals("이펙터")) {
				uploadURL+="Effector";
			}else if(bigCate.equals("주변용품")) {
				uploadURL+="Accessory";
			}
			if (imgSize == 0) {
				pDTO.setP_img1(pDTO.getImg().getOriginalFilename());
			} else {
				String extension = imgOrgName.substring(imgOrgName.lastIndexOf("."), imgOrgName.length());
				String newName = UUID.randomUUID().toString().split("-")[0]; //새로운 이름 만들기

				String path = sc.getRealPath(uploadURL); // 이미지 저장할 루트
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
		   try {
		        
		        String imgOrgName = pDTO.getImg().getOriginalFilename();
		        long imgSize = pDTO.getImg().getSize();
		        String uploadURL = "resources/img/";
		        String bigCate = pDTO.getP_big_category();
		        
		        if (bigCate.equals("기타")) {
		            uploadURL += "Guitar";
		        } else if (bigCate.equals("앰프")) {
		            uploadURL += "Amp";
		        } else if (bigCate.equals("이펙터")) {
		            uploadURL += "Effector";
		        } else if (bigCate.equals("주변용품")) {
		            uploadURL += "Accessory";
		        }
		        
		        if (imgSize > 0) {
		            String extension = imgOrgName.substring(imgOrgName.lastIndexOf("."), imgOrgName.length());
		            String newName = UUID.randomUUID().toString().split("-")[0]; // 새로운 이름 생성

		            String path = sc.getRealPath(uploadURL); // 이미지 저장 루트 경로
		            System.out.println(path);
		            File saveImg = new File(path + "//" + newName + extension); // 파일 저장 경로 생성
		            pDTO.getImg().transferTo(saveImg); // 이미지 저장

		            pDTO.setP_img1(newName + extension); // 저장된 이미지 파일명을 pDTO에 설정
		        }

		        	ss.getMapper(Jh_productMapper.class).updateProduct(pDTO);

		        	model.addAttribute("products", ss.getMapper(Jh_productMapper.class).getAdminProduct(pDTO));

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		
	}
	public List<ProductDTO> searchDetailForAdmin(ProductDTO pDTO) {
		return ss.getMapper(Jh_productMapper.class).getSearchProductForAdmin(pDTO);
	}
	public void getAllOrder(HttpServletRequest req, ProductDTO pDTO, OrderDetailDTO oDTO) {
		req.setAttribute("orders", ss.getMapper(Jh_productMapper.class).getAllOrder(pDTO));
		
	}
	public List<OrderDetailDTO> getMargin(HttpServletRequest req, OrderDetailDTO odDTO) {
		
		
		List<OrderDetailDTO> a = ss.getMapper(Jh_productMapper.class).getMargin(odDTO);
		System.out.println(a);
		return ss.getMapper(Jh_productMapper.class).getMargin(odDTO);
	}
}
