package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jafa.domain.Category;
import com.jafa.repository.BoardRepository;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	BoardRepository repository;
	
	@ModelAttribute("cateList")
	public List<Category> cateList(){
		return repository.getCateList();
	}	
	
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("welcome", "Laduree");
		return "index";
	}
}
