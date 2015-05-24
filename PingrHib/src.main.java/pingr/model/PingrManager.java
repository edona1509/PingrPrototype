package pingr.model;


import java.util.List;

import pingr.model.PingrBean;
import pingr.util.HibernateUtil;

import org.hibernate.Query;
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
	
	public static void savePingrElements(int id, int up_vote, int down_vote){
		// Get Session
				SessionFactory sessionFactory = HibernateUtil.getSessionAnnotationFactory();
				Session session = sessionFactory.getCurrentSession();
				// start transaction
				session.beginTransaction();
				
				PingrBean pingr = (PingrBean)session.get(PingrBean.class,id);
				pingr.setUp_vote(up_vote);
				pingr.setDown_vote(down_vote);
				session.update(pingr);
				
				
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
		PingrBean entry =  (PingrBean)session.get(PingrBean.class,id);
		// Commit transaction
		session.getTransaction().commit();
		
		return entry;
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

	public static List<PingrBean> getAllInfo(){
		
				// Get Session
				SessionFactory sessionFactory = HibernateUtil.getSessionAnnotationFactory();
				Session session = sessionFactory.getCurrentSession();
				// start transaction
				session.beginTransaction();
				
				
//				// Save the Model object
//				PingrBean user =  (PingrBean)session.get(PingrBean.class,id);
				
				String hql = "FROM PingrBean";
				Query query = session.createQuery(hql);
				
				List<PingrBean> results = query.list();
				// session.createCriteria(PingrBean.class).list();

				for(int i=0;i<results.size();i++){
				   
					//System.out.println(results.get(i));
					PingrBean pingr = (PingrBean) results.get(i);
					
					
				}
				
				// Commit transaction
				session.getTransaction().commit();
				
				return results;
	}
	
}
