package com.jafa.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.Category;
import com.jafa.domain.MemberType;
import com.jafa.domain.ProductCategory;
import com.jafa.domain.ProductCriteria;
import com.jafa.domain.ProductPagination;
import com.jafa.domain.ProductVO;
import com.jafa.domain.ProductVO.FileType;
import com.jafa.repository.BoardRepository;
import com.jafa.repository.ProductRepository;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/product")
@Log4j

public class ProductController {

	@Autowired
	BoardRepository boardRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	@ModelAttribute("cateList")
	public List<Category> cateList(){
		return boardRepository.getCateList();
	}
	
	@ModelAttribute(value = "productCateList")
	public List<ProductCategory> productCateList(){
		return productRepository.getProductCateList();
	}
	
	// 목록
	@GetMapping(value = {"/list/{cateId}", "/list"})
	public String list(@ModelAttribute("cri") ProductCriteria productCriteria, // ProductCriteria 객체를 생성후 요청받은 파라미터를 cri로 자동으로 바인딩(페이지정보받아옴)
			Model model,
			@PathVariable(required = false) String cateId, // required = false로 설정하여 cateId가 요청에 포함되지 않아도 괜찮음 
			ProductCategory productCategory) {
		productCriteria.setProductCategory(productCategory); 
		model.addAttribute("list", productRepository.list(productCriteria)) 
			.addAttribute("p", new  ProductPagination(productCriteria, productRepository.getTotalCount(productCriteria)));
		//  getTotalCount로 페이지네이션 정보를 초기화. "p"로 Model에 추가 후 list이름으로 상품목록과 페이지네이션정보(p)가 전달
		return "product/list";
	}
	
	// 상세
	@GetMapping("/detail")
	public String detail(Model model, Long product_Bno) {		
		model.addAttribute("b", productRepository.detail(product_Bno));
		ProductVO attachList = productRepository.detail(product_Bno);
		model.addAttribute("attachList", attachList);
		model.addAttribute("mType", MemberType.values());
		return "product/detail";
	}

	// 글쓰기폼
	@GetMapping("/write")
	public void writeForm() {
	}

	// 글쓰기처리
	@PostMapping("/write")
	public String write(ProductVO vo,
			@RequestParam("attachFile") MultipartFile multipartFile, // "attachFile"이라는 이름으로 전달된 Multipart 파일 데이터를 받아옴
			RedirectAttributes rttr) {
		
		if(!multipartFile.isEmpty()) { // 첨부파일이 있을때
			String fileName = multipartFile.getOriginalFilename(); // 첨부파일의 원본 파일 이름을 가져옴
			vo.setFileName_Product(fileName);  // VO 객체에 첨부파일의 파일 이름을 설정
			// 파일타입 결정 : IMAGE, OTHER (첨부파일의 컨텐츠 타입이 "image"로 시작하는지를 체크하여 이미지 파일인지를 판단)
			if (multipartFile.getContentType().startsWith("image")) { // 이미지 파일일 때
				vo.setFileType_Product(FileType.IMAGE); // VO 객체에 파일 타입을 "IMAGE"로 설정
			} else { // 이미지파일이 아닐때
				vo.setFileType_Product(FileType.OTHER);
			}
			productRepository.write(vo); // 데이터 베이스에 저장
			//업로드
			uploadPath(vo, multipartFile); // 실제 첨부파일을 서버에 업로드하는 메서드호출하여 서버에 파일을 저장
		} else { // 첨부파일이 없을때
			productRepository.write(vo);
		}
		return "redirect:/product/list";
	}
	
	// 삭제
	@PostMapping("/remove")
	public String remove(Long product_Bno) {
		ProductVO vo =  productRepository.detail(product_Bno);
		if (vo.getFileName_Product() != null) { // 파일이 있으면
			File file = new File("c:/file_product/" + product_Bno, vo.getFileName_Product());
			File folder = new File("c:/file_product/" + product_Bno);
			file.delete();
			folder.delete();
		} 
		productRepository.remove(product_Bno);
		return "redirect:/product/list";
	}

	// 수정폼
	@GetMapping("/modify")
	public void modifyForm(Long product_Bno, Model model) {
		ProductVO vo = productRepository.detail(product_Bno);
		model.addAttribute("b", vo);
	}

	// 수정처리
	@PostMapping("/modify")
	public String modify(ProductVO vo, RedirectAttributes rttr,
			@RequestParam(defaultValue = "false") Boolean delChk,
	 		@RequestParam("attachFile") MultipartFile multipartFile) {
		if (delChk) {
			// 파일 삭제 및 내용 변경
			// 파일삭제
			ProductVO detail = productRepository.detail(vo.getProduct_Bno());
			File file = new File("c:/file_product/"+detail.getProduct_Bno()+"/"+detail.getFileName_Product());
			File folder = new File("c:/file_product/"+detail.getProduct_Bno());
			file.delete();
			folder.delete();
			//  modify호출
			productRepository.modify(vo);
		} else {
			if (!multipartFile.isEmpty()) { // 이미지 및 내용변경
				// 기존파일삭제
				ProductVO detail = productRepository.detail(vo.getProduct_Bno());
				File file = new File("c:/file_product/"+detail.getProduct_Bno()+"/"+detail.getFileName_Product());
				file.delete();
				// 새로운 파일 업로드
				String fileName = multipartFile.getOriginalFilename(); // 첨부파일 이름
				vo.setFileName_Product(fileName); 
				// 파일타입 결정 : IMAGE, OTHER
				if (multipartFile.getContentType().startsWith("image")) { // 이미지 파일일 때
					vo.setFileType_Product(FileType.IMAGE);
				} else { // 이미지파일이 아닐때
					vo.setFileType_Product(FileType.OTHER);
				}
				uploadPath(vo, multipartFile);
				// modify호출
				productRepository.modify(vo);
			} else { // 내용만 변경
				// modifyOnlyContent호출
				productRepository.modifyOnlyContent(vo);
			}
		}
		return "redirect:/product/list";
	}
	
	// 실제로 서버에 첨부파일을 업로드하는 로직, 클라이언트에서 전달된 파일을 서버의 지정된 경로에 저장하는 과정을 수행
	public void uploadPath(ProductVO vo, MultipartFile multipartFile) { // 글쓰기처리메서드에서 uploadPath(vo, multipartFile);호출
		String fileName = multipartFile.getOriginalFilename(); // 업로드할 파일의 원본 파일 이름가져옴
		
		File uploadPath = new File("c:/file_product/"+vo.getProduct_Bno()); // 업로드할 파일의 저장 경로를 지정, vo에서 가져온 상품 번호를 디렉토리로 생성
		if (!uploadPath.exists()) { // 업로드 경로가 존재하지 않을 경우, 새로운 디렉토리를 생성
			uploadPath.mkdirs(); // 디렉토리 모두 생성
		}
		// 업로드 파일경로 지정
		File uploadFile = new File(uploadPath,fileName); // 업로드할 파일의 실제 경로를 uploadPath와 파일 이름을 조합하여 생성
		try {
			multipartFile.transferTo(uploadFile); //  업로드된 파일을 지정한경로에 저장, 실제로 파일을 서버에 저장하는 로직을 수행
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
	}

	public void fileFolderDel(ProductVO vo) {
		ProductVO detail = productRepository.detail(vo.getProduct_Bno());
		File file = new File("c:/file_product/"+detail.getProduct_Bno()+"/"+detail.getFileName_Product());
		File folder = new File("c:/file_product/"+detail.getProduct_Bno());
		file.delete();
		folder.delete();
	}
	
}
