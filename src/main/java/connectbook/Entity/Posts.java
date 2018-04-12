/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectbook.Entity;

/**
 *
 * @author Pranav
 */
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="posts")
public class Posts implements Serializable {
@Id
@Column(name="pid")
private int id;
@Column(name="time")
private String postTime;
@Column(name="pby")
private int postedBy;
@Column(name="pto")
private int postedTo;
@Column(name="post")
private String post;
@Column(name="postpic")
private String postPic;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPostTime() {
        return postTime;
    }

    public void setPostTime(String postTime) {
        this.postTime = postTime;
    }

    public int getPostedBy() {
        return postedBy;
    }

    public void setPostedBy(int postedBy) {
        this.postedBy = postedBy;
    }

    public int getPostedTo() {
        return postedTo;
    }

    public void setPostedTo(int postedTo) {
        this.postedTo = postedTo;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getPostPic() {
        return postPic;
    }

    public void setPostPic(String postPic) {
        this.postPic = postPic;
    }

   
    
}