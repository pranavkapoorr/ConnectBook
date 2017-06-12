package users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class userServices {
	
	@Autowired 
	private userDAO USERDao;
	 
	@Transactional
	   public String authenticate(String username,String password) {
		  return USERDao.validateLogin(username, password);
	   }
	@Transactional
	public user getUserByUsername(String username) {
		return USERDao.getUserByUsername(username);
	}
	@Transactional
	   public void addUser(user USER) {
		   USERDao.createUser(USER);
	   }
	@Transactional
	   public user getUserbyid(int id) {
		   return USERDao.getUserById(id);
	   }
	   @Transactional
	   public void updateUser(user USER) {
		   USERDao.updateUser(USER);
	   }
	   @Transactional
	   public void removeUser(int id) {
		   USERDao.removeUser(id);
	   }
	   @Transactional
	   public List<user> listUsers() {
		  return USERDao.listUsers();
	   }

}
