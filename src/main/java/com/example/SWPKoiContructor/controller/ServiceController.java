package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.dao.ServiceDAO;
import com.example.SWPKoiContructor.entities.Content;
import com.example.SWPKoiContructor.entities.Service;
import com.example.SWPKoiContructor.entities.ServicePrice;
import com.example.SWPKoiContructor.services.ServicePriceService;
import com.example.SWPKoiContructor.services.ServiceService;
import com.example.SWPKoiContructor.utils.FileUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

@Controller
public class ServiceController {

    @Autowired
    private ServiceService serviceService;
    @Autowired
    private FileUtility fileUtility;
    @Autowired
    private ServicePriceService servicePriceService;
    @GetMapping("/manager/services")
    public String serviceList(
            Model model,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "serviceId") String sortBy,
            @RequestParam(defaultValue = "desc") String sortType,
            @RequestParam(required = false) Boolean statusFilter) {

        List<Service> list;
        long serviceNum;

        if (statusFilter != null) {
            list = serviceService.getPaginationServiceListByStatus(page, size, sortBy, sortType, statusFilter);
            serviceNum = serviceService.countServiceFilter(statusFilter);
        } else {
            list = serviceService.getPaginationServiceList(page, size, sortBy, sortType);
            serviceNum = serviceService.countServices();
        }

        long totalPage = (long) Math.ceil(serviceNum / (double) size);
        page = Math.max(page, 1);

        model.addAttribute("currentPage", page);
        model.addAttribute("size", size);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortType", sortType);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("serviceList", list);
        model.addAttribute("statusFilter", statusFilter);

        return "manager/service/serviceManage"; // Path to your JSP page for services list
    }



    @PostMapping("/manager/services/create")
    public String createNewService(RedirectAttributes redirectAttributes,
                                   @RequestParam String serviceName,
                                   @RequestParam String serviceDescription,
                                   @RequestParam double servicePriceValue
    ,@RequestParam("file") MultipartFile file) {
        try {
            Date currentTimestamp = new Date();

// Create new Service object
            Service newService = new Service();
            newService.setServiceName(serviceName);
            newService.setServiceDescription(serviceDescription);
            newService.setServiceStatus(true);
            String imgUrl = fileUtility.handleFileUpload(file,FileUtility.SERVICE_DIR);
            if(imgUrl!=null){
                newService.setServiceImgUrl(imgUrl);
            }


// Set Content for Service
            Content newContent = new Content();
            newContent.setCreateDate(currentTimestamp);
            newContent.setLastUpdatedDate(currentTimestamp);
            newContent.setService(newService); // Link Content to Service
            newService.setContent(newContent); // Link Service to Content
// Create new ServicePrice object
            ServicePrice newServicePrice = new ServicePrice();
            newServicePrice.setValue(servicePriceValue);
            newServicePrice.setDateApply(currentTimestamp);
            newServicePrice.setServicePriceStatus(true);
            newServicePrice.setService(newService); // Link ServicePrice to Service
            List<ServicePrice> servicePriceList = new ArrayList<>();
            servicePriceList.add(newServicePrice);
            newService.setServicePrice(servicePriceList); // Link Service to ServicePrice

// Save service using your service layer or repository
//            serviceService.createService(newService);
                serviceService.createService(newService);

            // Add success message to redirect attributes
            redirectAttributes.addFlashAttribute("message", "Service successfully created.");
        } catch (Exception e) {
            // Add error message to redirect attributes if an error occurs
            redirectAttributes.addFlashAttribute("error", "An error occurred while creating the service: " + e.getMessage());
        }

        // Redirect back to the service list page after creation
        return "redirect:/manager/services";
    }

    @PostMapping("manager/services/changeStatusAjax")
    public ResponseEntity<String> changeServiceStatusAjax(@RequestParam int serviceId) {
        try{
            // Get the current service
            Service service = serviceService.getServiceById(serviceId);

            if (service == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Service not found.");
            }

            // Toggle the status
            boolean newStatus = !service.isServiceStatus();
            serviceService.updateServiceStatus(serviceId, newStatus);

            return ResponseEntity.ok("Service status successfully updated to " + (newStatus ? "Active" : "Inactive"));
        }catch(Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred while changing the status: " + e.getMessage());
        }
    }

    @PostMapping("/manager/services/update")
    public String updateService(@RequestParam int serviceId,
                                @RequestParam String serviceName,
                                @RequestParam String serviceDescription,
                                @RequestParam double servicePriceValue,
                                RedirectAttributes redirectAttributes) {
        try {
            // Retrieve the current service by its ID
            Service existingService = serviceService.getServiceById(serviceId);
            if (existingService == null) {
                // If the service does not exist, return an error
                redirectAttributes.addFlashAttribute("error", "Service not found.");
                return "redirect:/manager/services";
            }

            Date currentTimestamp = new Date();

            // Update service fields
            existingService.setServiceName(serviceName);
            existingService.setServiceDescription(serviceDescription);

            // Update content information
            Content existingContent = existingService.getContent();
            if (existingContent == null) {
                existingContent = new Content();
                existingContent.setService(existingService);
                existingService.setContent(existingContent);
            }
//            String base64encodedContent = Base64.getEncoder().encodeToString(contentText.getBytes());
//            existingContent.setContent(base64encodedContent);
            existingContent.setLastUpdatedDate(currentTimestamp);

            // Update service price information
            List<ServicePrice> existingServicePrices = existingService.getServicePrice();

            if (existingServicePrices != null && !existingServicePrices.isEmpty()) {
                // Set the status of all previous prices to inactive
                for (ServicePrice existingPrice : existingServicePrices) {
                    existingPrice.setServicePriceStatus(false);
                }
            }

            // Create a new ServicePrice with the updated value
            ServicePrice newServicePrice = new ServicePrice();
            newServicePrice.setValue(servicePriceValue);
            newServicePrice.setDateApply(currentTimestamp);
            newServicePrice.setServicePriceStatus(true);
            newServicePrice.setService(existingService);

            // Add the new price to the list
            existingServicePrices.add(newServicePrice);

            // Sort the prices with the active status at the top
            existingServicePrices.sort((price1, price2) -> {
                // Prioritize active status (true at the top)
                if (price1.isServicePriceStatus() && !price2.isServicePriceStatus()) {
                    return -1; // Active price comes first
                } else if (!price1.isServicePriceStatus() && price2.isServicePriceStatus()) {
                    return 1; // Inactive price comes later
                }
                // If both have the same status, sort by date in descending order
                return price2.getDateApply().compareTo(price1.getDateApply());
            });

            // Save updated service
            serviceService.updateService(existingService);

            // Add success message
            redirectAttributes.addFlashAttribute("message", "Service successfully updated.");
        } catch (Exception e) {
            // Add error message if an error occurs
            redirectAttributes.addFlashAttribute("error", "An error occurred while updating the service: " + e.getMessage());
        }

        // Redirect back to the service list page after updating
        return "redirect:/manager/services";
    }

    @PostMapping("/manager/services/changePriceStatusAjax")
    public ResponseEntity<String> changePriceStatusAjax(@RequestParam int servicePriceId) {
        try {
            ServicePrice servicePrice = servicePriceService.findById(servicePriceId);
            if (servicePrice == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Service Price not found");
            }

            boolean newStatus = !servicePrice.isServicePriceStatus();
            servicePrice.setServicePriceStatus(newStatus);
            servicePriceService.updateServicePrice(servicePrice);

            return ResponseEntity.ok("Service Price status successfully updated to " + (newStatus ? "Active" : "Inactive"));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred while updating the service price status: " + e.getMessage());
        }
    }
//    @GetMapping("/manager/serviceContent/updateDetail/${id}")
//    public String updateContentPage(Model model, @PathVariable(name = "id")int serviceId){
//        Service service = serviceService.getServiceWithContentById(serviceId);
//        return "/manager/service/updateServiceContent";
//    }
}
