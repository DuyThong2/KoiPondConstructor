package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Service;
import com.example.SWPKoiContructor.entities.ServicePrice;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

@Repository
public class ServicePriceDAO {
    private EntityManager entityManager;

    public ServicePrice findById(int ServicePriceId){
        return entityManager.find(ServicePrice.class,ServicePriceId);
    }
    public List<ServicePrice> findByServiceAndStatus(int serviceId, boolean status){
        String jpal = "Select p from ServicePrice p where p.service.id = :serviceId And p.servicePriceStatus = : status";
        TypedQuery<ServicePrice> query = entityManager.createQuery(jpal,ServicePrice.class);
        query.setParameter("serviceId",serviceId);
        query.setParameter("status",status);
        return query.getResultList();
    }
    public void updateServicePrice(ServicePrice servicePrice){
        entityManager.merge(servicePrice);
    }
    public void deactiveAllPricesForService(int serviceId){
        String jpal = "Update ServicePrice p Set p.servicePriceStatus = false where sp.service.id = :serviceId" ;
        TypedQuery<ServicePrice> query = entityManager.createQuery(jpal,ServicePrice.class);
        query.setParameter("serviceId",serviceId);
        query.executeUpdate();
    }
}
