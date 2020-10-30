package kr.liferecord.monument.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.liferecord.monument.domain.MarkDownTableDto;
import kr.liferecord.monument.service.MonumentService;
import kr.liferecord.monument.service.mapper.MonumentMapper;

@Controller
public class MonumentController {
	
	@Autowired private MonumentService monumentService;

	@GetMapping("/editor")
	public String editor(HttpServletRequest request) {
		/*
		 * request.setAttribute("content", "Test Content");
		 * request.setAttribute("testTableDto", new TestTableDto());
		 */
		request.setAttribute("markDownTableDto", new MarkDownTableDto());

		return "editor";
	}

	@PostMapping("/register")
	public String register(@ModelAttribute("markDownTableDto") MarkDownTableDto markDownTableDto) {
//		MarkDownTableDto markDownTableDto = new MarkDownTableDto(); 
//		markDownTableDto.setContent(content);
//		markDownTableDto.setTitle(title);
		System.out.println(markDownTableDto.toString());
		monumentService.createContent(markDownTableDto);
		return "redirect:/editor";
	}

	@GetMapping("/organization") 
	public String organization() {
		return "organization";
	}
	
	@GetMapping(value= {"/index", "/"})
	public String index() {
		return "index";
	}
	@GetMapping("/hpage")
	public String hpage() {
		
		return "hpage";
	}
	@GetMapping("/board")
	public String board(Model model) {
		List<MarkDownTableDto> list = monumentService.getContent();
		model.addAttribute("list", list);
		return "board";
	}
	
	@GetMapping("/board/{idx}")
	public ModelAndView details(@PathVariable int idx) {
		MarkDownTableDto list = monumentService.getDetails(idx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/details");
		mav.addObject("result", list);
		System.out.println(list);
		return mav;
	}
	
	@GetMapping("/temp")
	public String temp() {

		return "temp";
	}
}
