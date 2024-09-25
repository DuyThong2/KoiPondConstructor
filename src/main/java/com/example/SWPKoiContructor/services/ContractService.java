/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ContractDAO;
import com.example.SWPKoiContructor.entities.Contract;
import java.util.List;
import javax.persistence.TypedQuery;
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
    
    public List<Contract> getContractListBaseOnSortAndPaging(int page, int size, String sortBy, String sortDirection){
        return contractDAO.getSortedAndPaginated(page, size, sortBy, sortDirection);
    }
    
    public int countContracts(){
        return contractDAO.getTotalContracts();
    }
    
    public int countContracts(boolean isCustomer, int id){
        return contractDAO.getTotalContracts(isCustomer,id);
    }
    
    public List<Contract> getContractListOfCustomer(int id, int page, int size, String sortBy, String sortDirection){
        List<Contract> list = contractDAO.getSortedAndPaginatedByCustomer(id,page, size,  sortBy, sortDirection);
        return list;
    }
    
    public List<Contract> getContractListOfConsultant(int id, int page, int size, String sortBy, String sortDirection){
        return contractDAO.getSortedAndPaginatedByConsultant(id, page, size, sortBy, sortDirection);
    }
    
    public Contract getContractById(int id){
        return contractDAO.getContractById(id);
    }
    
    @Transactional
    public Contract createContract(Contract contract){
        return contractDAO.createNewContract(contract);
    }
    
    @Transactional
    public Contract changeStatusContract(int status, int id){
        return contractDAO.updateContractStatus(status, id);
    }
    
    
    
    
}
