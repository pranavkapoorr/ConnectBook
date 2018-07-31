/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectbook;

import connectbook.Entity.Connections;
import connectbook.Entity.Message;

/**
 *
 * @author Pranav
 */

import connectbook.Entity.Posts;
import connectbook.Entity.Users;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

@Repository
public class DAO {

	@PersistenceContext
	private EntityManager manager ;

	protected EntityManager getEntityManager(){
		return this.manager;
	}
	public void createUser(Users user){           
		manager.persist(user);  
	}  
	public Users getUserById(int id) {
		return manager.find(Users.class, id);
	}
	public void removeUser(int id){           
		Users user = getUserById(id);  
		manager.remove(user);  
	}  
	public List<Users> listUsers(){             
		return (List<Users>)manager.createQuery("from Users",Users.class).getResultList();
	}  
	public void updateUser(Users user){    
		if(getUserById(user.getId())!=null){
			Users user_modified=getUserById(user.getId());
			user_modified.setName(user.getName());
			user_modified.setGender(user.getGender());
			user_modified.setDob(user.getDob());
			user_modified.setEmail(user.getEmail());
			user_modified.setDp(user.getDp());
			user_modified.setPassword(user.getPassword());
			user_modified.setUsername(user.getUsername());
			user_modified.setId(user.getId());
			manager.flush(); 
		}
		else{System.out.println("No such user exists");}
	}
	public Users getUserByUsername(String username) {
		Users user = null;
		Query query = manager.createQuery("from Users where username = :uname", Users.class);
		query.setParameter("uname", username);
		try{
			user = (Users) query.getSingleResult();
		}catch(NoResultException e){
			System.err.println(e.getMessage());
		}
		return user;
	}
	public List getUsersByUsername(String username) {
		Query query = manager.createQuery("from Users where username Like :uname", Users.class);
		query.setParameter("uname", username + "%");
		return  query.getResultList();
	}

	public void createPost(Posts post){           
		manager.persist(post);  
	}  
	public Posts getPostById(int id) {
		return manager.find(Posts.class, id);
	}
	public void removePost(int id){           
		Posts post = getPostById(id);  
		manager.remove(post);  
	}  
	public List<Posts> listPosts(){             
		List<Posts> list_Posts =(List<Posts>)manager.createQuery("From Posts",Posts.class).getResultList();
		return list_Posts;
	}  
	public void updatePost(Posts post){    
		if(getPostById(post.getId())!=null){
			Posts post_modified = getPostById(post.getId());
			post_modified.setPost(post.getPost());
			post_modified.setPostTime(post.getPostTime());
			post_modified.setPostPic(post.getPostPic());
			post_modified.setPostedBy(post.getPostedBy());
			post_modified.setPostedTo(post.getPostedTo());
			post_modified.setId(post.getId());
			manager.flush(); 
		}
		else{System.out.println("No such post exists");}
	}
	public List<Posts> getPostByPostedBy(int postedBy) {
		Query query = manager.createQuery("from Posts where postedBy = :postedBy", Posts.class);
		query.setParameter("postedBy", postedBy);
		return  query.getResultList();
	}
	public List<Object> getPostByPostedTo(int postedTo) {
		Query query = manager.createQuery("select u.name,u.dp,p.post,p.postTime,p.postPic,u.username from connectbook.Entity.Posts p , connectbook.Entity.Users u where p.postedBy = u.id and p.postedTo = :postedTo");
		query.setParameter("postedTo", postedTo);
		return  query.getResultList();
	}

	
	public void createConnection(Connections connection){           
		manager.persist(connection);  
	}  
	public Connections getConnectionById(int id) {
		return manager.find(Connections.class, id);
	}
	public void removeConnection(int id){           
		Connections post = getConnectionById(id);  
		manager.remove(post);  
	}  
	public List<Connections> listConnections(){             
		List<Connections> list_Connections =(List<Connections>)manager.createQuery("From Posts",Connections.class).getResultList();
		return list_Connections;
	}
	
	public List getConnectionsById(int id){
		List list_Connections;
		Query query = manager.createQuery("select u.name,u.dp,u.username,c.reqStatus from connectbook.Entity.Connections c , connectbook.Entity.Users u where u.id = c.reqFrom and c.reqTo = :id or u.id = c.reqTo and c.reqFrom = :id");
		query.setParameter("id", id);
		list_Connections = query.getResultList();
		return list_Connections;
	}
	public void createMessage(Message message){           
		manager.persist(message);  
	}  
	public Message getMessageById(int id) {
		return manager.find(Message.class, id);
	}
	public void removeMessage(int id){           
		Message msg = getMessageById(id);  
		manager.remove(msg);  
	}  
	public List<Message> listMessages(){             
		List<Message> list_Messages =(List<Message>)manager.createQuery("From Message",Message.class).getResultList();
		return list_Messages;
	}
	
	public List getChatHeadsById(int id){
		List list_Messages;
		Query query = manager.createQuery("select u.name,u.dp,u.username,m.msg, m.msgTo from connectbook.Entity.Message m , connectbook.Entity.Users u where u.id = m.msgBy and m.msgTo = :id or u.id = m.msgTo and m.msgBy = :id");
		query.setParameter("id", id);
		list_Messages = query.getResultList();
		return list_Messages;
	}
	public List getChatById(int senderId, int receiverId){
		List list_Messages;
		Query query = manager.createQuery("select u.name,u.dp,u.username,m.msg, m.msgTo from connectbook.Entity.Message m , "
				+ "connectbook.Entity.Users u where u.id = m.msgBy , m.msgBy = :sid and m.msgTo = :rid or u.id = m.msgTo , m.msgTo = :rid and m.msgBy = :sid");
		query.setParameter("sid", senderId);
		query.setParameter("rid", receiverId);
		list_Messages = query.getResultList();
		return list_Messages;
	}
}
