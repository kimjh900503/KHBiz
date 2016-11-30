package com.khbiz.erp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		request.getSession().setAttribute("member", null);
		
		return "index";

	}
	@RequestMapping(value="/home")
	public void index(HttpServletRequest request){
	}
	@RequestMapping(value="/dash")
	public String dashboard(HttpServletRequest request){
		String path ="dashboard/dashboard";
		if(request.getSession().getAttribute("member") ==null){
			path ="redirect:/";
		}
		return path;
	}
	
}
