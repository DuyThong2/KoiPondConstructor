package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ServiceDAO;
import com.example.SWPKoiContructor.dao.ServicePriceDAO;
import com.example.SWPKoiContructor.entities.ServicePrice;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.TypedQuery;
import java.util.List;

@Service
public class ServicePriceService {
    private ServicePriceDAO servicePriceDAO;
    public ServicePrice findById(int ServicePriceId){
      return servicePriceDAO.findById(ServicePriceId);
    }
    public List<ServicePrice> findByServiceAndStatus(int serviceId, boolean status){
        return servicePriceDAO.findByServiceAndStatus(serviceId, status);
    }
    @Transactional
    public void deactiveAllPricesForService(int serviceId){
       servicePriceDAO.deactiveAllPricesForService(serviceId);
    }
    @Transactional
    public void updateServicePrice(ServicePrice servicePrice){
        servicePriceDAO.updateServicePrice(servicePrice);
    }
}
