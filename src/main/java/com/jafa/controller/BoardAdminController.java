package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jafa.domain.Category;
import com.jafa.domain.ProductCategory;
import com.jafa.repository.BoardRepository;
import com.jafa.repository.ProductRepository;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class BoardAdminController {
	
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
	
	// 게시판 카테고리 목록, 추가, 삭제
	@GetMapping("/cateBoard")
	public String home(Model model) {
		model.addAttribute("cateList", boardRepository.getCateList());
		return "admin/cateBoard";
	}
	@PostMapping("/addCate")
	public String addCategory(Category category) {
		boardRepository.saveCate(category);
		return "redirect:/admin/cateBoard";
	}
	@PostMapping("/delCate")
	public String delCate(String cid) {
		boardRepository.delCate(cid);
		return "redirect:/admin/cateBoard";
	}
	
	// 상품 카테고리 목록, 추가, 삭제
	@GetMapping("/cateProduct")
	public String productList(Model model) {
		model.addAttribute("cateProductList", productRepository.getProductCateList());
		return "admin/cateProduct";
	}
	@PostMapping("/addProductCate")
	public String addProductCategory(ProductCategory category) {
		productRepository.saveProductCate(category);
		return "redirect:/admin/cateProduct";
	}
	@PostMapping("/delProductCate")
	public String delProductCate(String cateid) {
		productRepository.delProductCate(cateid);
		return "redirect:/admin/cateProduct";
	}
	
}
