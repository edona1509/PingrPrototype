package pingr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Comment")
public class CommentBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="CommentID")
	private int commentID;
	
	
	@Column(name="Content")	
	private String commentContent;
	
	@ManyToOne
	@JoinColumn(name="pingr_id")
	private PingrBean PingrBean;
	
	private int theKey;
	
	public int getTheKey(){
		return theKey;
	}
		
	public void setTheKey(int theKey){
		this.theKey = theKey;
	}
	
	public int getCommentID() {
		return commentID;
	}

	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public PingrBean getPingr() {
		return PingrBean;
	}

	public void setPingr(PingrBean PingrBean) {
		this.PingrBean = PingrBean;
	}
	
	
}
