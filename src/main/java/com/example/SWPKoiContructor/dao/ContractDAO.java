/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Contract;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.FlushModeType;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public class ContractDAO {

    private EntityManager entityManager;

    public ContractDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Contract> getListContract() {
        TypedQuery<Contract> tq = entityManager.createQuery("SELECT c FROM Contract c ORDER BY c.dateCreate DESC ", Contract.class);
        return tq.getResultList();
    }

    public Contract getContractById(int id) {
        TypedQuery<Contract> tq = entityManager.createQuery("select c from Contract c where c.contractId = :id ", Contract.class);
        tq.setParameter("id", id);
        return tq.getSingleResult();
    }

    public List<Contract> getContractListOfCustomer(int customerId) {
        // Correct the JPQL query to filter contracts by customer ID
        TypedQuery<Contract> tq = entityManager.createQuery(
                "SELECT c FROM Contract c WHERE c.customer.id = :customerId and c.contractStatus != 1 or c.contractStatus != 4",
                Contract.class
        );
        

        // Set the customerId parameter
        tq.setParameter("customerId", customerId);

        // Return the result list
        return tq.getResultList();
    }
    
    
    public List<Contract> getContractListOfConsultant(int consultantId){
        TypedQuery<Contract> tq = entityManager.createQuery(
                "SELECT c FROM Contract c WHERE c.quote.staff.staffId = :id",
                Contract.class
        );
        

        // Set the customerId parameter
        tq.setParameter("id", consultantId);

        // Return the result list
        return tq.getResultList();
    }

    public Contract createNewContract(Contract contract) {

        Contract contractCreated = entityManager.merge(contract);

        return contractCreated;
    }

    public Contract updateContract(Contract contract) {
        return entityManager.merge(contract);
    }

    public void removeContractById(int id) {
        Contract contract = getContractById(id);
        entityManager.remove(contract);

    }

    public Contract updateContractStatus(int status, int id) {
        Contract contract = getContractById(id);
        contract.setContractStatus(status);
        return contract;
    }

}
