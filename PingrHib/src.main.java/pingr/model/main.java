package pingr.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pingr.util.HibernateUtil;

public class main {

	public static void main(String[] args) {
		
		SessionFactory sf = HibernateUtil.getSessionAnnotationFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		

		session.getTransaction().commit();
		session.close();
	
	}

}
