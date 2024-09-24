package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.DesignDAO;
import com.example.SWPKoiContructor.entities.Design;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class DesignService {

    private DesignDAO designDao;

    public DesignService(DesignDAO designDao) {
        this.designDao = designDao;
    }

    public List<Object[]> getListDesignWithCustomerName() {
        return designDao.getListDesignWithCustomerName();
    }

    public Design getDesignById(int id) {
        return designDao.getDesignById(id);
    }

    // Hàm lấy danh sách các thiết kế đã phân trang
    public List<Design> getSortedAndPaginatedByDesigner(int staffId, int page, int size) {
        return designDao.getSortedAndPaginatedByDesigner(staffId, page, size);
    }

    // Hàm đếm tổng số thiết kế để tính tổng số trang
    public int getTotalPagesByDesigner(int staffId, int size) {
        long totalDesigns = designDao.countDesignsByStaff(staffId);
        return (int) Math.ceil((double) totalDesigns / size); // Tính tổng số trang
    }

}
