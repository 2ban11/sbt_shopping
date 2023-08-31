package com.sbt.shopping.jaehwan;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sbt.shopping.jaepil.OrderDTO;
import com.sbt.shopping.jaepil.OrderMapper;

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
		if (ss.getMapper(Jh_productMapper.class).deleteProduct(pDTO) == 1)
			;
	}

	public void regProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
	    try {
	        String imgOrgName = pDTO.getImg().getOriginalFilename();
	        String img2OrgName = pDTO.getImg2().getOriginalFilename(); // 새로운 파일 필드 추가
	        long imgSize = pDTO.getImg().getSize();
	        long img2Size = pDTO.getImg2().getSize(); // 새로운 파일 필드 추가
	        String uploadURL = "resources/img/";

	        // 파일 업로드 경로 조립
	        String bigCate = pDTO.getP_big_category();
	        if ("기타".equals(bigCate)) {
	            uploadURL += "Guitar";
	        } else if ("앰프".equals(bigCate)) {
	            uploadURL += "Amp";
	        } else if ("이펙터".equals(bigCate)) {
	            uploadURL += "Effector";
	        } else if ("주변용품".equals(bigCate)) {
	            uploadURL += "Accessory";
	        }

	        // 파일 확장자 확인
	        String extension = "";
	        String extension2 = ""; // 새로운 파일 확장자 변수 추가
	        if (imgOrgName != null && !imgOrgName.isEmpty()) {
	            int dotIndex = imgOrgName.lastIndexOf(".");
	            if (dotIndex > 0) {
	                extension = imgOrgName.substring(dotIndex);
	            }
	        }
	        
	        if (img2OrgName != null && !img2OrgName.isEmpty()) { // 새로운 파일 확장자 확인
	            int dotIndex2 = img2OrgName.lastIndexOf(".");
	            if (dotIndex2 > 0) {
	                extension2 = img2OrgName.substring(dotIndex2);
	            }
	        }

	        // 첫 번째 파일 업로드
	        if (imgSize > 0) {
	            String newName = UUID.randomUUID().toString().split("-")[0]; // 새로운 이름 만들기
	            String path = sc.getRealPath(uploadURL); // 이미지 저장할 루트
	            File saveImg = new File(path + File.separator + newName + extension); // 파일 저장 경로 생성

	            pDTO.getImg().transferTo(saveImg);
	            pDTO.setP_img1(newName + extension);
	        } else {
	            System.out.println("첫 번째 이미지가 없습니다");
	        }

	        System.out.println(pDTO.getP_cost());
	        // 두 번째 파일 업로드
	        if (img2Size > 0) {
	            String newName2 = UUID.randomUUID().toString().split("-")[0]; // 새로운 이름 만들기
	            String path2 = sc.getRealPath(uploadURL); // 이미지 저장할 루트
	            File saveImg2 = new File(path2 + File.separator + newName2 + extension2); // 파일 저장 경로 생성

	            pDTO.getImg2().transferTo(saveImg2);
	            pDTO.setP_img2(newName2 + extension2);
	        } else {
	            System.out.println("두 번째 이미지가 없습니다");
	        }
	        if (pDTO.getP_color()==null) {
				pDTO.setP_color("");
			}
            
	        if (ss.getMapper(Jh_productMapper.class).regProduct(pDTO) == 1) {
	            model.addAttribute("products", ss.getMapper(Jh_productMapper.class).getAdminProduct(pDTO));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	public void updateProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
		try {

			String imgOrgName = pDTO.getImg().getOriginalFilename();
			long imgSize = pDTO.getImg().getSize();
			
			System.out.println("sfsdsdf" + imgOrgName);
			System.out.println("sfsdsdf" + imgSize);

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
			}if (pDTO.getP_color()==null) {
				pDTO.setP_color("");
			}

				String extension = imgOrgName.substring(imgOrgName.lastIndexOf("."), imgOrgName.length());
				String uploadFolder = sc.getRealPath(uploadURL);
				
				System.out.println(uploadFolder);
				UUID uuid = UUID.randomUUID();
				String[] uuids = uuid.toString().split("-");
				String uniqueName = uuids[0];
				
				File saveImg = new File(uploadFolder + "//" + uniqueName + extension); // 파일 저장 경로 생성
				System.out.println(saveImg);
				pDTO.getImg().transferTo(saveImg); // 이미지 저장
				pDTO.setP_img1(uniqueName + extension); // 저장된 이미지 파일명을 pDTO에 설정
				System.out.println(pDTO);
				if(ss.getMapper(Jh_productMapper.class).updateProduct(pDTO) == 1) {
					System.out.println("수정 완료^^");
				};
		
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

	public void getRefundOrder(HttpServletRequest req, ProductDTO pDTO, OrderDetailDTO oDTO) {
		req.setAttribute("orders", ss.getMapper(Jh_productMapper.class).getRefundOrder(pDTO));

	}

	public void refundAccept(HttpServletRequest req, OrderDetailDTO oDTO) {
		if (ss.getMapper(Jh_productMapper.class).refundAccept(oDTO) == 1) {
			System.out.println("수정성공!");
		}
	}

	public void refundCancel2(HttpServletRequest req, OrderDetailDTO oDTO) {
		if (ss.getMapper(Jh_productMapper.class).refundCancel2(oDTO) == 1) {
			System.out.println("수정성공!");
		}
	}

	public List<OrderDetailDTO> getMargin(HttpServletRequest req, OrderDetailDTO odDTO) {

		List<OrderDetailDTO> a = ss.getMapper(Jh_productMapper.class).getMargin(odDTO);
		System.out.println(a);
		return ss.getMapper(Jh_productMapper.class).getMargin(odDTO);
	}

}
