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
	private DAO dao;

	@Transactional
	public void addUser(Users PK) {
		dao.createUser(PK);
	}
	@Transactional
	public void updateUser(Users user) {
		dao.updateUser(user);
	}
	@Transactional
	public void removeUser(int id) {
		dao.removeUser(id);
	}
	@Transactional
	public List<Users> listUsers() {
		return dao.listUsers();
	}
	@Transactional
	public Users getUser(String username) {
		return dao.getUserByUsername(username);
	}
	@Transactional
	public List getUsers(String username) {
		return dao.getUsersByUsername(username);
	}
	@Transactional
	public void addPost(Posts post) {
		dao.createPost(post);
	}
	@Transactional
	public void updatePost(Posts post) {
		dao.updatePost(post);
	}
	@Transactional
	public void removePost(int id) {
		dao.removePost(id);
	}
	@Transactional
	public List<Posts> listPosts() {
		return dao.listPosts();
	}
	@Transactional
	public List<Posts> getPostbyPostedBy(int postedBy) {
		return dao.getPostByPostedBy(postedBy);
	}
	@Transactional
	public List getPostbyPostedTo(int postedTo) {
		return dao.getPostByPostedTo(postedTo);
	}

	@Transactional
	public List getConnectionsById(int id) {
		return dao.getConnectionsById(id);
	}
	@Transactional
	public List getMessagesById(int id) {
		return dao.getMessagesById(id);
	}

}
