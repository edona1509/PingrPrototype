package pingr.model;


import pingr.model.PingrBean;
import pingr.util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class main {

	public static void main(String[] args) {

		SessionFactory sf = HibernateUtil.getSessionAnnotationFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		
		PingrBean pingr = new PingrBean();
		
		//pingr.setPingrID(1);
		pingr.setContent("Ciao ragazzi!");
		pingr.setCategory("Gossip");
		pingr.setUp_vote(2);
		pingr.setDown_vote(4);
		pingr.setLatitude(34.6);
		pingr.setLongitude(34.88);
		
		CommentBean comment = new CommentBean();
		
		//comment.setCommentID(2);
		comment.setCommentContent("Lustig");
			
		comment.setPingr(pingr);
		
		CommentBean comment1 = new CommentBean();
		
		comment1.setCommentContent("Hai ragione");
		comment1.setPingr(pingr);
		
		
		
		session.save(pingr);
		session.save(comment);
		
		session.save(comment1);
		
		
		session.getTransaction().commit();
		session.close();


	}

}
