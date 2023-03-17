package com.jafa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jafa.domain.ProductCategory;
import com.jafa.domain.ProductCriteria;
import com.jafa.domain.ProductPagination;
import com.jafa.repository.BoardRepository;
import com.jafa.repository.ProductRepository;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	BoardRepository boardRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("welcome", "Laduree");
		model.addAttribute("productCateList",productRepository.getProductCateList());
		model.addAttribute("cateList",boardRepository.getCateList());
		return "index";
	}
	
}
