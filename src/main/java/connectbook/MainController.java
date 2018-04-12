package connectbook;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Pranav
 */
import connectbook.Entity.Posts;
import connectbook.Entity.Users;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
//@Scope("session")
public class MainController {
    private Services Service;
    private final HashMap cache;
    private String otherUser = null;
	@Autowired
	public void setContactServices(Services services){
		this.Service = services;
	}

    public MainController() {
       cache = new HashMap();
    }
 
    @RequestMapping(value="/",method = RequestMethod.GET)
     public ModelAndView login() {
        return new ModelAndView("login");
     }
    
    @RequestMapping(value="/myTimeLine",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
     public List<Posts> myTimeline(HttpSession session) {
        String userId = cache.get(session.getAttribute("username")).toString();
        return Service.getPostbyPostedTo(Integer.parseInt(userId));
     }
     
      @RequestMapping(value="/oTimeLine",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
     public List<Posts> oTimeline() {
        String userId = cache.get(otherUser).toString();
        return Service.getPostbyPostedTo(Integer.parseInt(userId));
     }
       @RequestMapping(value="/logout",method = RequestMethod.GET)
     public ModelAndView logout(HttpSession session) {
         session.invalidate();
        return new ModelAndView("login");
     }
   
     
     @RequestMapping(value="/enter", method = RequestMethod.POST)
     public String enter(HttpSession session, @RequestParam(value="username")String uname,@RequestParam(value = "password")String password) {
        String fallback = "login";
         if(Service.getUser(uname)!=null){
            Users user = Service.getUser(uname);
            if(user.getPassword().equals(password)){
                session.setAttribute("username", uname);
                cache.put(uname, user.getId());
                fallback = "redirect:/home";
            }
        }
         return fallback;
     }
     @RequestMapping(value="/home")
     public ModelAndView myPage(HttpSession session ) {
         if(session.getAttribute("username")!=null){
            String username = session.getAttribute("username").toString();
            Users user = Service.getUser(username);
            ModelMap model = new ModelMap();
            model.addAttribute("name",user.getName());
            model.addAttribute("dp",user.getDp());
            model.addAttribute("cover",user.getCover());
           return new ModelAndView("me",model);
         }else{
             return new ModelAndView("login");
         }
         
     }
     
     @RequestMapping(value="/{uname}")
     public ModelAndView otherPage(HttpSession session,@PathVariable("uname")String uname ) {
         if(session.getAttribute("username")!=null){
            otherUser = uname;
            Users user = Service.getUser(uname);
            ModelMap model = new ModelMap();
            model.addAttribute("name",user.getName());
            model.addAttribute("dp",user.getDp());
            model.addAttribute("cover",user.getCover());
           return new ModelAndView("other",model);
         }else{
             return new ModelAndView("login");
         }
         
     }
     
     @RequestMapping(value="/findUser", method = RequestMethod.POST)
     @ResponseBody
     public List showUsersbyUsername(@RequestParam(value="uname")String uname) {
        return Service.getUsers(uname);
     }
     
   /* @RequestMapping(value="/statusMessage", produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    public String statusMessageFunction() {
             return "statusMessage"+"\n\n";
        
    }
    @RequestMapping(value="/receipt", produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    public String receiptFunction() {
          return "receiptMessage"+"\n\n";
    }
    
    @RequestMapping(value="/payment", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    public String payment(@RequestParam(value="terminalIp")String terminalIp,@RequestParam(value = "terminalPort")String terminalPort,
            @RequestParam(value="amount")String amount, @RequestParam(value="printFlag")String printFlag, @RequestParam(value="GTbit")String GTbit,@RequestParam(value="GTmessage",defaultValue = "none")String GTmessage) throws InterruptedException, JsonProcessingException{
      
     
        return "Payment";
    }*/

}
