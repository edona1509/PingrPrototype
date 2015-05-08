package pingr.model;


import pingr.model.PingrBean;
import pingr.util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class PingrManager {

	public static void savePingrDetails(PingrBean pingr) {

		// Get Session
		SessionFactory sessionFactory = HibernateUtil.getSessionAnnotationFactory();
		Session session = sessionFactory.getCurrentSession();
		// start transaction
		session.beginTransaction();
		
		// Save the Model object
		session.save(pingr);
		// Commit transaction
		session.getTransaction().commit();
				
	}
	
	public static void saveCommentDetails(CommentBean comment){
		
		// Get Session
				SessionFactory sessionFactory = HibernateUtil.getSessionAnnotationFactory();
				Session session = sessionFactory.getCurrentSession();
				// start transaction
				session.beginTransaction();
				// Save the Model object
				session.save(comment);
				// Commit transaction
				session.getTransaction().commit();
	}
	
	public static PingrBean getPingrDetails(int id) {

		// Get Session
		SessionFactory sessionFactory = HibernateUtil.getSessionAnnotationFactory();
		Session session = sessionFactory.getCurrentSession();
		// start transaction
		session.beginTransaction();
		// Save the Model object
		PingrBean user =  (PingrBean)session.get(PingrBean.class,id);
		// Commit transaction
		session.getTransaction().commit();
		
		return user;
	}
	
}
