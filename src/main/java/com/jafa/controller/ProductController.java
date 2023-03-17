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
	ProductRepository repository;
	
	@ModelAttribute("cateList")
	public List<Category> cateList(){
		return boardRepository.getCateList();
	}
	
	@ModelAttribute(value = "productCateList")
	public List<ProductCategory> productCateList(){
		return repository.getProductCateList();
	}
	
	// 목록
	@GetMapping(value = {"/list/{cateId}", "/list"})
	public String list(@ModelAttribute("cri") ProductCriteria productCriteria,
			Model model,
			@PathVariable(required = false) String cateId, ProductCategory productCategory) {
		productCriteria.setProductCategory(productCategory);
		model.addAttribute("list", repository.list(productCriteria))
			.addAttribute("p", new  ProductPagination(productCriteria, repository.getTotalCount(productCriteria)));
		return "product/list";
	}
	
	// 상세
	@GetMapping("/detail")
	public String detail(Model model, Long product_Bno) {
		model.addAttribute("b", repository.detail(product_Bno));
		ProductVO attachList = repository.detail(product_Bno);
		model.addAttribute("attachList", attachList);
		return "product/detail";
	}

	// 글쓰기폼
	@GetMapping("/write")
	public void writeForm() {
	}

	// 글쓰기처리
	@PostMapping("/write")
	public String write(ProductVO vo,
			@RequestParam("attachFile") MultipartFile multipartFile,
			RedirectAttributes rttr) {
		
		if(!multipartFile.isEmpty()) { // 첨부파일이 있을때
			String fileName = multipartFile.getOriginalFilename(); // 첨부파일 이름
			vo.setFileName_Product(fileName); 
			// 파일타입 결정 : IMAGE, OTHER
			if (multipartFile.getContentType().startsWith("image")) { // 이미지 파일일 때
				vo.setFileType_Product(FileType.IMAGE);
			} else { // 이미지파일이 아닐때
				vo.setFileType_Product(FileType.OTHER);
			}
			repository.write(vo); // 데이터 베이스에 저장
			
			//업로드
			uploadPath(vo, multipartFile);
			
		} else { // 첨부파일이 없을때
			repository.write(vo);
		}
		return "redirect:/product/list";
	}
	
	// 삭제
	@PostMapping("/remove")
	public String remove(Long product_Bno) {
		ProductVO vo =  repository.detail(product_Bno);
		if (vo.getFileName_Product() != null) { // 파일이 있으면
			File file = new File("c:/file_product/" + product_Bno, vo.getFileName_Product());
			File folder = new File("c:/file_product/" + product_Bno);
			file.delete();
			folder.delete();
		} 
		repository.remove(product_Bno);
		return "redirect:/product/list";
	}

	// 수정폼
	@GetMapping("/modify")
	public void modifyForm(Long product_Bno, Model model) {
		ProductVO vo = repository.detail(product_Bno);
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
			ProductVO detail = repository.detail(vo.getProduct_Bno());
			File file = new File("c:/file_product/"+detail.getProduct_Bno()+"/"+detail.getFileName_Product());
			File folder = new File("c:/file_product/"+detail.getProduct_Bno());
			file.delete();
			folder.delete();
			//  modify호출
			repository.modify(vo);
		} else {
			if (!multipartFile.isEmpty()) { // 이미지 및 내용변경
				// 기존파일삭제
				ProductVO detail = repository.detail(vo.getProduct_Bno());
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
				repository.modify(vo);
			} else { // 내용만 변경
				// modifyOnlyContent호출
				repository.modifyOnlyContent(vo);
			}
		}
		return "redirect:/product/list";
	}

	public void uploadPath(ProductVO vo, MultipartFile multipartFile) {
		String fileName = multipartFile.getOriginalFilename(); 
		
		File uploadPath = new File("c:/file_product/"+vo.getProduct_Bno());
		if (!uploadPath.exists()) { // 업로드 패스 생성
			uploadPath.mkdirs(); 
		}
		// 업로드 파일경로 지정
		File uploadFile = new File(uploadPath,fileName);
		try {
			multipartFile.transferTo(uploadFile); // 파일 업로드
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
	}

	public void fileFolderDel(ProductVO vo) {
		ProductVO detail = repository.detail(vo.getProduct_Bno());
		File file = new File("c:/file_product/"+detail.getProduct_Bno()+"/"+detail.getFileName_Product());
		File folder = new File("c:/file_product/"+detail.getProduct_Bno());
		file.delete();
		folder.delete();
	}
	
}
