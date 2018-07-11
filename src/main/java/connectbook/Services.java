/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectbook;

import connectbook.Entity.Posts;
import connectbook.Entity.Users;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Pranav
 */

@Service
public class Services  {
	@Autowired
	private DAO userDao;

	@Transactional
	public void addUser(Users PK) {
		userDao.createUser(PK);
	}
	@Transactional
	public void updateUser(Users user) {
		userDao.updateUser(user);
	}
	@Transactional
	public void removeUser(int id) {
		userDao.removeUser(id);
	}
	@Transactional
	public List<Users> listUsers() {
		return userDao.listUsers();
	}
	@Transactional
	public Users getUser(String username) {
		return userDao.getUserByUsername(username);
	}
	@Transactional
	public List getUsers(String username) {
		return userDao.getUsersByUsername(username);
	}
	@Transactional
	public void addPost(Posts post) {
		userDao.createPost(post);
	}
	@Transactional
	public void updatePost(Posts post) {
		userDao.updatePost(post);
	}
	@Transactional
	public void removePost(int id) {
		userDao.removePost(id);
	}
	@Transactional
	public List<Posts> listPosts() {
		return userDao.listPosts();
	}
	@Transactional
	public List<Posts> getPostbyPostedBy(int postedBy) {
		return userDao.getPostByPostedBy(postedBy);
	}
	@Transactional
	public List getPostbyPostedTo(int postedTo) {
		return userDao.getPostByPostedTo(postedTo);
	}

	@Transactional
	public List getConnectionsById(int id) {
		return userDao.getConnectionsById(id);
	}

}
