package pingr.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity 

@Table(name="PINGR_BEAN")

public class PingrBean {
	
	@Id
	@GeneratedValue
	@Column(name="PINGR_ID")
	private int pingrID;
	
	@Column(name="Content")
	private String content;
	
	@Column(name="UpVote")
	private int up_vote;
	
	@Column(name="DownVote")
	private int down_vote;
	
	@Column(name="Category")
	private String category;
	
	@Column(name="Latidude")
	private double latitude;
	
	@Column(name="Longitude")
	private double longitude;
	

	@OneToMany(mappedBy="PingrBean")
	private Set<CommentBean> comments;

	// Getters and Setters
	
	public Set<CommentBean> getComments() {
		return comments;
	}

	public void setComments(Set<CommentBean> comments) {
		this.comments = comments;
	}
	
	
	public int getPingrID(){
		return pingrID;
	}
	
	public void setPingrID(int pingrID){
		this.pingrID = pingrID;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUp_vote() {
		return up_vote;
	}
	public void setUp_vote(int up_vote) {
		this.up_vote = up_vote;
	}
	public int getDown_vote() {
		return down_vote;
	}
	public void setDown_vote(int down_vote) {
		this.down_vote = down_vote;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double d) {
		this.latitude = d;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double d) {
		this.longitude = d;
	}
}
