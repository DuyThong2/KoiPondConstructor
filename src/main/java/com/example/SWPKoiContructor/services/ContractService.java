/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ContractDAO;
import com.example.SWPKoiContructor.entities.Contract;
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
    
    
    public List<Contract> getContractList(){
        return contractDAO.getListContract();
    }
    
    public Contract getContractById(int id){
        return contractDAO.getContractById(id);
    }
    
    @Transactional
    public void createContract(Contract contract){
        contractDAO.createNewContract(contract);
    }
    
    @Transactional
    public Contract changeStatusContract(int status, int id){
        return contractDAO.updateContractStatus(status, id);
    }
}
