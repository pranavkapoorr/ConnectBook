package users;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class controller {
	
@Autowired
private userServices Service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginpage(HttpSession session,Model model){
		if(session.getAttribute("username")!=null){
			return "redirect:/welcome";
		}
	model.addAttribute("login",new user()); 
	return "login";
	
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginsubmission(HttpSession session,@ModelAttribute("login")user User,Model model){
		String auth= this.Service.authenticate(User.getUsername(), User.getPassword());
		if(auth.equals("welcome")){
			user USER=this.Service.getUserByUsername(User.getUsername());			
			model.addAttribute("name", USER.getName());
			model.addAttribute("gender", USER.getGender());
			model.addAttribute("dp", USER.getDp());
			model.addAttribute("username", USER.getUsername());
			session.setAttribute("username", User.getUsername());
			return "welcome";
		}else if(auth.equals("403")){
			return "403";
		}else{
			return "403";
		}	
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	 public String logout(HttpSession session){
		session.invalidate();
		 return "redirect:/login";
	 }
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	 public String showall(Model model){
		model.addAttribute("listContacts", this.Service.listUsers());
		 return "all";
	 }
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	 public String showUserHome(HttpSession session, Model model){
		if(session.getAttribute("username")!=null){
		String username=session.getAttribute("username").toString();
		user USER=this.Service.getUserByUsername(username);
		model.addAttribute("name", USER.getName());
		model.addAttribute("gender", USER.getGender());
		model.addAttribute("dp", USER.getDp());
		model.addAttribute("username", USER.getUsername());
    	return "welcome";
		}
		return "redirect:/login";
	   
	}
	
}
