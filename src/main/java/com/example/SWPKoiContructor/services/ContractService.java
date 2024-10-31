/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ContractDAO;
import com.example.SWPKoiContructor.entities.Contract;
import java.time.LocalDate;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class ContractService {

    private ContractDAO contractDAO;

    public ContractService(ContractDAO contractDAO) {
        this.contractDAO = contractDAO;
    }

//    public List<Contract> getContractList(){
//        return contractDAO.getListContract();
//    }
    public List<Contract> getContractListBaseOnSortAndPaging(int page, int size, String sortBy, String sortDirection) {
        return contractDAO.getSortedAndPaginated(page, size, sortBy, sortDirection);
    }

    public int countContracts() {
        return contractDAO.getTotalContracts();
    }

    public int countContracts(boolean isCustomer, int id) {
        return contractDAO.getTotalContracts(isCustomer, id);
    }

    public List<Contract> getContractListOfCustomer(int id, int page, int size, String sortBy, String sortDirection) {
        List<Contract> list = contractDAO.getSortedAndPaginatedByCustomer(id, page, size, sortBy, sortDirection);
        return list;
    }

    // Fetch sorted and paginated contracts for consultant
    public List<Contract> getContractListOfConsultant(int consultantId, int page, int size, String sortBy,
            String sortDirection, Integer statusFilter, String searchName,
            LocalDate fromDate, LocalDate toDate) {
        return contractDAO.getContractListOfConsultant(consultantId, page, size, sortBy, sortDirection, statusFilter,
                searchName, fromDate, toDate);
    }

    // Count total filtered contracts for consultant
    public long countFilteredContractsForConsultant(int consultantId, Integer statusFilter, String searchName,
            LocalDate fromDate, LocalDate toDate) {
        return contractDAO.countFilteredContractsForConsultant(consultantId, statusFilter, searchName, fromDate, toDate);
    }



    public Contract getContractById(int id) {
        return contractDAO.getContractById(id);
    }

    @Transactional
    public Contract createContract(Contract contract) {
        return contractDAO.createNewContract(contract);
    }

    @Transactional
    public Contract changeStatusContract(int status, int id) {
        return contractDAO.updateContractStatus(status, id);
    }

    public List<Contract> getFilteredContracts(int page, int size, String sortBy, String sortDirection,
            Integer statusFilter, String searchName, LocalDate fromDate, LocalDate toDate) {
        return contractDAO.getFilteredContracts(page, size, sortBy, sortDirection, statusFilter, searchName, fromDate, toDate);
    }

    public long countFilteredContracts(Integer statusFilter, String searchName, LocalDate fromDate, LocalDate toDate) {
        return contractDAO.countFilteredContracts(statusFilter, searchName, fromDate, toDate);
    }

}
