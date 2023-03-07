package com.jafa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jafa.domain.Category;
import com.jafa.repository.BoardRepository;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class BoardAdminController {
	
	@Autowired
	BoardRepository boardRepository;
	
	@GetMapping("/home")
	public String home(Model model) {
		model.addAttribute("cateList", boardRepository.getCateList());
		return "admin/home";
	}
	
	@PostMapping("/addCate")
	public String addCategory(Category category) {
		boardRepository.saveCate(category);
		return "redirect:/admin/home";
	}

	@PostMapping("/delCate")
	public String delCate(String cid) {
		boardRepository.delCate(cid);
		return "redirect:/admin/home";
	}
}
