package users;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class userDAO {
	
	@PersistenceContext
	private EntityManager manager;

	protected EntityManager getEntityManager(){
    return this.manager;
	}
	public void createUser(user USER){           
        manager.persist(USER);  
    }  
	public user getUserById(int id) {
		return manager.find(user.class, id);
	}
	public void removeUser(int id){           
      user USER = getUserById(id);  
	  manager.remove(USER);  
    }  
	public user getUserByUsername(String username) {
		return  (user) manager.createQuery("from user where username=?").setParameter(0, username).getSingleResult();
	}
	public String validateLogin(String username, String password){
		user User=getUserByUsername(username);
		if(User.getPassword().equals(password)){
			return "welcome";
		}else{
			return "403";
		}
	}
	public List<user> listUsers(){             
		 List<user> USERS =(List<user>)manager.createQuery("From user",user.class).getResultList();
		 return USERS;
	    }  
  public void updateUser(user USER){    
	  if(getUserById(USER.getId())!=null){
	 user USER1=getUserById(USER.getId());
	 USER1.setName(USER.getName());
	 USER1.setGender(USER.getGender());
	 USER1.setDob(USER.getDob());
	 USER1.setDp(USER.getDp());
	 USER1.setEmail(USER.getEmail());
	 USER1.setId(USER.getId());
	 USER1.setUsername(USER.getUsername());
	 USER1.setPassword(USER.getPassword());
	 manager.flush();  }
	  else{System.out.println("No such user exists");}
    }  

}
