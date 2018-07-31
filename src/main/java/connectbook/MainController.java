package connectbook;

import connectbook.Entity.Message;

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

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
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
@Scope("session")
public class MainController {
    private Services Service;
    private Users otherUser = null;
    private Users currentUser = null;
	@Autowired
	public void setContactServices(Services services){
		this.Service = services;
	}

    public MainController() {
    }
 
    @RequestMapping(value="/",method = RequestMethod.GET)
     public ModelAndView login() {
        return new ModelAndView("login");
     }
    
    @RequestMapping(value="/myTimeLine",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
     public List myTimeline(HttpSession session) {
    	List list = null;
    	String username = session.getAttribute("username").toString();
        Users user = !username.equals(null)?currentUser:null;
        list = Service.getPostbyPostedTo(user.getId());
        return list;
     }
     
    @RequestMapping(value="/oTimeLine",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
     public List<Posts> oTimeline() {
        Users userO = otherUser;
        return Service.getPostbyPostedTo((userO.getId()));
     }
     @RequestMapping(value="/logout",method = RequestMethod.GET)
     public ModelAndView logout(HttpSession session) {
         session.invalidate();
        return new ModelAndView("login");
     }
     
     private String getCurrentTime(){
    	 String time = null;
    	 LocalDateTime lTime = LocalDateTime.now();
    	 time = lTime.getDayOfMonth()+"/"+lTime.getMonth()+"/"+lTime.getYear()+":"+lTime.getHour()+":"+lTime.getMinute()+lTime.getSecond();
    	 return time;
     }
     @RequestMapping(value="/postStatus",method = RequestMethod.POST)
     public String postStatus(HttpSession session,@RequestParam(value="status")String post) {
    	 Posts tempPost = new Posts();
    	 tempPost.setPost(post);
    	 tempPost.setPostedBy(currentUser.getId());
    	 tempPost.setPostedTo(currentUser.getId());
    	 tempPost.setPostPic("");
    	 tempPost.setPostTime(getCurrentTime());
    	 	Service.addPost(tempPost);
    	 	tempPost=null;
    	  return "redirect:/home";
     }
     @RequestMapping(value="/postother",method = RequestMethod.POST)
     public String postOnOthersWall(HttpSession session,@RequestParam(value="status")String post) {
    	 Posts tempPost = new Posts();
    	 tempPost.setPost(post);
    	 tempPost.setPostedBy(currentUser.getId());
    	 tempPost.setPostedTo(otherUser.getId());
    	 tempPost.setPostPic("");
    	 tempPost.setPostTime(getCurrentTime());
    	 	Service.addPost(tempPost);
    	 	tempPost=null;
    	  return "redirect:/"+otherUser.getUsername();
     }
     
     @RequestMapping(value="/messenger",method = RequestMethod.GET)
     public String messenger(HttpSession session) {
    	 if(session.getAttribute("username")!=null){
    		 return "messenger";
    	  }else{
    		  return "login";
    	  }
     }
     @RequestMapping(value="/myChatHeads",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
     @ResponseBody
     public List myChatHeads(HttpSession session) {
    	 if(session.getAttribute("username")!=null){
    		 List list = null;
             Users user = currentUser;
             list = Service.getChatHeadsById(user.getId());
             return list;
    	  }else{
    		  return null;
    	  }
     }
     @RequestMapping(value="/sendMessage",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
     @ResponseBody
     public String sendMessage(HttpSession session,@RequestParam("receiveruser")String receiverUser,@RequestParam("message")String message) {
    	 if(session.getAttribute("username")!=null){
             Users user = currentUser;
             Users rUser = Service.getUser(receiverUser);
             Message msg = new Message();
             msg.setMsg(message);
             msg.setMsgBy(user.getId());
             msg.setMsgMedia("");
             msg.setMsgTo(rUser.getId());
             msg.setMsgTime(getCurrentTime());
             Service.sendMessage(msg);
             return "sent";
    	  }else{
    		  return "session expired";
    	  }
     }
     @RequestMapping(value="/myMessages/{sendername}",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
     @ResponseBody
     public List myMessages(HttpSession session,@PathVariable(value="sendername")String senderName) {
    	 if(session.getAttribute("username")!=null){
    		 List list = null;
             Users myUser = currentUser;
             Users oUser = Service.getUser(senderName);
             list = Service.getChatById(oUser.getId(),myUser.getId());
             return list;
    	  }else{
    		  return null;
    	  }
     }
     
       @RequestMapping(value="/myFriendz",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
       @ResponseBody
        public List myFriendz() {
    	   List list = null;
           Users user = currentUser;
           list = Service.getConnectionsById(user.getId());
           return list;
        }
       @RequestMapping(value="/oFriendz",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
       @ResponseBody
        public List oFriendz() {
    	   List list = null;
           Users user = otherUser;
           list = Service.getConnectionsById(user.getId());
           return list;
        }
       
     
     @RequestMapping(value="/enter", method = RequestMethod.POST)
     public String enter(HttpSession session, @RequestParam(value="username")String uname,@RequestParam(value = "password")String password) {
        String fallback = "login";
        Users user = Service.getUser(uname);
         if(user!=null){
            if(user.getPassword().equals(password)){
            	currentUser = user;
                session.setAttribute("username", uname);
                fallback = "redirect:/home";
            }
        }
         return fallback;
     }
     @RequestMapping(value="/home")
     public ModelAndView myPage(HttpSession session ) {
         if(session.getAttribute("username")!=null){
            //String username = session.getAttribute("username").toString();
            Users user = currentUser;/*Service.getUser(username);*/
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
         if(session.getAttribute("username")!=null && uname != null &&
        		 (!uname.contains("{") && !uname.contains("}") && !uname.contains("]") && !uname.contains("["))){

            Users user = Service.getUser(uname);
            otherUser = user;
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
     public List<Users> showUsersbyUsername(@RequestParam(value="uname")String uname) {
    	 List<Users> tempList = Service.getUsers(uname);
        return tempList;
     }


}
