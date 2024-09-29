/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Contract;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
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

//    public List<Contract> getListContract() {
//        TypedQuery<Contract> tq = entityManager.createQuery("SELECT c FROM Contract c ORDER BY c.dateCreate DESC  ", Contract.class);
//        return tq.getResultList();
//    }
    public Contract getContractById(int id) {
        try {
            TypedQuery<Contract> tq = entityManager.createQuery("SELECT c FROM Contract c WHERE c.contractId = :id", Contract.class);
            tq.setParameter("id", id);
            return tq.getSingleResult();
        } catch (NoResultException e) {
            // Handle no result case, perhaps return null or throw a custom exception
            return null; // or throw new EntityNotFoundException("Contract not found for ID: " + id);
        }
    }

//    public List<Contract> getContractListOfCustomer(int customerId,int page, int size, String sortBy, String sortDirection) {
//        // Correct the JPQL query to filter contracts by customer ID
//        String jpql = "SELECT p FROM Contract p ORDER BY p." + sortBy + " " + sortDirection;
//
//        // Tạo TypedQuery
//        TypedQuery<Contract> query = entityManager.createQuery(jpql, Contract.class);
//
//        // Thiết lập phân trang
//        query.setFirstResult(page * size);
//        query.setMaxResults(size);
//
//        // Trả về danh sách sản phẩm
//        return query.getResultList();
//    }
//
//    public List<Contract> getContractListOfConsultant(int consultantId) {
//        TypedQuery<Contract> tq = entityManager.createQuery(
//                "SELECT c FROM Contract c WHERE c.quote.staff.staffId = :id",
//                Contract.class
//        );
//
//        // Set the customerId parameter
//        tq.setParameter("id", consultantId);
//
//        // Return the result list
//        return tq.getResultList();
//    }
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

    public List<Contract> getSortedAndPaginated(int page, int size, String sortBy, String sortDirection) {
        // Tạo truy vấn động cho việc sắp xếp
        String jpql = "SELECT p FROM Contract p ORDER BY p." + sortBy + " " + sortDirection;

        // Tạo TypedQuery
        TypedQuery<Contract> query = entityManager.createQuery(jpql, Contract.class);

        // Thiết lập phân trang
        query.setFirstResult(page * size);
        query.setMaxResults(size);

        // Trả về danh sách sản phẩm
        return query.getResultList();
    }

    public List<Contract> getSortedAndPaginatedByCustomer(int id, int page, int size, String sortBy, String sortDirection) {
        // Create the JPQL query with the correct alias
        String jpql = "SELECT p FROM Contract p WHERE p.customer.id = :id AND (p.contractStatus != 1 OR p.contractStatus != 4) ORDER BY p." + sortBy + " " + sortDirection;

        // Create TypedQuery
        TypedQuery<Contract> query = entityManager.createQuery(jpql, Contract.class);

        // Set the parameter
        query.setParameter("id", id);

        // Set pagination
        query.setFirstResult(page * size);
        query.setMaxResults(size);

        // Return the list of contracts
        return query.getResultList();
    }

    public List<Contract> getSortedAndPaginatedByConsultant(int id, int page, int size, String sortBy, String sortDirection) {
        // Tạo truy vấn động cho việc sắp xếp
        String jpql = "SELECT p FROM Contract p WHERE p.quote.staff.id = :id ORDER BY p." + sortBy + " " + sortDirection;

        // Tạo TypedQuery
        TypedQuery<Contract> query = entityManager.createQuery(jpql, Contract.class);
        query.setParameter("id", id);

        // Thiết lập phân trang
        query.setFirstResult(page * size);
        query.setMaxResults(size);

        // Trả về danh sách sản phẩm
        return query.getResultList();
    }

    public int getTotalContracts() {
        String jpql = "SELECT COUNT(c) FROM Contract c ";
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
        Long countResult = query.getSingleResult();  // Get the result as Long
        return countResult.intValue();  // Convert Long to int
    }

    public int getTotalContracts(boolean isCustomer, int id) {
        // Construct the appropriate condition based on the isCustomer flag
        String append = isCustomer
                ? "c.quote.staff.id = :id"
                : "c.customer.id = :id AND (c.contractStatus != 1 OR c.contractStatus != 4)";

        // Construct the JPQL query
        String jpql = "SELECT COUNT(c) FROM Contract c WHERE " + append;

        // Create TypedQuery
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);

        // Set the parameter
        query.setParameter("id", id);

        // Get the result as Long and convert to int
        Long countResult = query.getSingleResult();
        return countResult.intValue();
    }

    public List<Contract> getContractListByStatusAndPaging(int page, int size, String sortBy, String sortDirection, int status) {
        String jpql = "SELECT p FROM Contract p WHERE p.contractStatus = :status ORDER BY p." + sortBy + " " + sortDirection;

        TypedQuery<Contract> query = entityManager.createQuery(jpql, Contract.class);
        query.setParameter("status", status);
        query.setFirstResult(page * size);
        query.setMaxResults(size);

        return query.getResultList();
    }

    public long countContractsByStatus(int status) {
        String jpql = "SELECT COUNT(c) FROM Contract c WHERE c.contractStatus = :status";
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
        query.setParameter("status", status);
        return query.getSingleResult();
    }

}
