package com.example.SWPKoiContructor.controller.functionalController;

import com.example.SWPKoiContructor.entities.ConstructionStageDetail;
import com.example.SWPKoiContructor.entities.Contract;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.DesignStageDetail;
import com.example.SWPKoiContructor.entities.PaymentHistory;
import com.example.SWPKoiContructor.entities.ServiceQuotes;
import com.example.SWPKoiContructor.services.*;
import com.example.SWPKoiContructor.services.functionalService.EmailService;
import com.example.SWPKoiContructor.services.functionalService.PayPalService;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/paypal")
public class PayPalController {

    private String contexPath = "";

    @Autowired
    private PayPalService payPalService;

    @Autowired
    private ConstructionStageDetailService constructionStageDetailService;

    @Autowired
    private DesignStageDetailService designStageDetailService;

    @Autowired
    private PaymentHistoryService paymentHistoryService;

    @Autowired
    private ServiceQuoteService serviceQuoteService;

    @Autowired
    private LoyaltyPointService loyaltyPointService;

    @Autowired
    private ContractService contractService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private EmailService emailService; // Inject the EmailService

    @PostMapping("/pay/construction")
    public RedirectView payForConstruction(HttpServletRequest request,
            @RequestParam("amount") double amount,
            @RequestParam("detailId") int detailId,
            @RequestParam("constructionId") int constructionId) {
        // Dynamically build the base URL
        ConstructionStageDetail detail = constructionStageDetailService.getConstructionStageDetail(detailId);

        // If the status condition is met, redirect to the payment details page
        if ("payment".equalsIgnoreCase(detail.getConstructionStageDetailName()) && detail.getConstructionStageDetailStatus() == 4) {
            return new RedirectView("/customer/construction/detail/" + constructionId);
        }
        String baseUrl = ServletUriComponentsBuilder.fromRequestUri(request)
                .replacePath(null)
                .build()
                .toUriString();

        String cancelUrl = baseUrl + contexPath + "/paypal/cancel/construction/" + constructionId;
        String successUrl = baseUrl + contexPath + "/paypal/success/construction?detailId=" + detailId + "&constructionId=" + constructionId;

        try {
            // Create PayPal payment for Construction
            Payment payment = payPalService.createPayment(
                    amount, "USD", "paypal", "sale", "Payment for Construction Stage", cancelUrl, successUrl);

            // Redirect to PayPal approval URL
            for (Links link : payment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    return new RedirectView(link.getHref());
                }
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
            return new RedirectView("/paypal/error?message=Payment failed. Please try again.");
        }

        return new RedirectView(cancelUrl);
    }

    @PostMapping("/pay/design")
    public RedirectView payForDesign(HttpServletRequest request,
            @RequestParam("amount") double amount,
            @RequestParam("detailId") int detailId,
            @RequestParam("designId") int designId) {
        // Dynamically build the base URL

        DesignStageDetail detail = designStageDetailService.getDesignStageDetailById(detailId);

        // If the status condition is met, redirect to the payment details page
        if ("payment".equalsIgnoreCase(detail.getName()) && detail.getStatus() == 4) {
            return new RedirectView("/customer/design/detail/" + designId);
        }
        String baseUrl = ServletUriComponentsBuilder.fromRequestUri(request)
                .replacePath(null)
                .build()
                .toUriString();

        String cancelUrl = baseUrl + contexPath + "/paypal/cancel/design/" + designId;
        String successUrl = baseUrl + contexPath + "/paypal/success/design?detailId=" + detailId + "&designId=" + designId;

        try {
            // Create PayPal payment for Design
            Payment payment = payPalService.createPayment(
                    amount, "USD", "paypal", "sale", "Payment for Design Stage", cancelUrl, successUrl);

            // Redirect to PayPal approval URL
            for (Links link : payment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    return new RedirectView(link.getHref());
                }
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
            return new RedirectView("/paypal/error?message=Payment failed. Please try again.");
        }

        return new RedirectView(cancelUrl);
    }

    @PostMapping("/pay/serviceQuote")
    public RedirectView payForServiceQuote(HttpServletRequest request,
            @RequestParam("amount") double amount,
            @RequestParam("point") double point,
            @RequestParam("serviceQuoteId") int serviceQuoteId) {
        // Dynamically build the base URL
        String baseUrl = ServletUriComponentsBuilder.fromRequestUri(request)
                .replacePath(null)
                .build()
                .toUriString();
        double afterPoint = amount;
        String cancelUrl = baseUrl + contexPath + "/paypal/cancel/serviceQuote";
        String successUrl = baseUrl + contexPath + "/paypal/success/serviceQuote?serviceQuoteId=" + serviceQuoteId + "&point=" + point;

        try {
            // Create PayPal payment for Construction
            Payment payment = payPalService.createPayment(
                    afterPoint, "USD", "paypal", "sale", "Payment for Service Quote", cancelUrl, successUrl);

            // Redirect to PayPal approval URL
            for (Links link : payment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    return new RedirectView(link.getHref());
                }
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
            return new RedirectView("/paypal/error?message=Payment failed. Please try again.");
        }

        return new RedirectView(cancelUrl);
    }

    @GetMapping("/success/construction")
    public String successForConstruction(@RequestParam("paymentId") String paymentId,
            @RequestParam("PayerID") String payerId,
            @RequestParam("detailId") int detailId,
            @RequestParam("constructionId") int constructionId,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        try {
            // Execute PayPal payment
            Payment payment = payPalService.executePayment(paymentId, payerId);

            if (payment.getState().equals("approved")) {
                // Update construction stage detail status to 'Completed' (status 4)
                constructionStageDetailService.updateConstructionStageDetailStatus(detailId, 4);

                // Retrieve the Customer from the session
                Customer customer = (Customer) session.getAttribute("user");

                // Create a new PaymentHistory record
                PaymentHistory paymentHistory = new PaymentHistory();
                paymentHistory.setCustomer(customer);
                BigDecimal amount = BigDecimal.valueOf(Double.parseDouble(payment.getTransactions().get(0).getAmount().getTotal()));
                paymentHistory.setAmount(amount);
                paymentHistory.setPaymentDate(LocalDateTime.now());
                paymentHistory.setPaymentMethod("PayPal");
                paymentHistory.setDescription("Payment of " + amount + " for construction stage by " + customer.getName());
                paymentHistoryService.createPayment(paymentHistory);
                emailService.sendThankYouEmail(customer.getEmail(), customer.getName());

                // Redirect to construction page
                redirectAttributes.addFlashAttribute("success", "Payment Successfully.");
                return "redirect:/customer/construction/detail/" + constructionId;
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }

        // Redirect to error page if payment fails
        return "redirect:/error/error-500";
    }

    @GetMapping("/success/design")
    public String successForDesign(@RequestParam("paymentId") String paymentId,
            @RequestParam("PayerID") String payerId,
            @RequestParam("detailId") int detailId,
            @RequestParam("designId") int designId,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        try {
            // Execute PayPal payment
            Payment payment = payPalService.executePayment(paymentId, payerId);

            if (payment.getState().equals("approved")) {
                // Update design stage detail status to 'Completed' (status 4)
                designStageDetailService.updateDesignStageDetailStatus(detailId, 4);

                // Retrieve the Customer from the session
                Customer customer = (Customer) session.getAttribute("user");

                // Create a new PaymentHistory record
                PaymentHistory paymentHistory = new PaymentHistory();
                paymentHistory.setCustomer(customer);
                BigDecimal amount = BigDecimal.valueOf(Double.parseDouble(payment.getTransactions().get(0).getAmount().getTotal()));
                paymentHistory.setAmount(amount);
                paymentHistory.setPaymentDate(LocalDateTime.now());
                paymentHistory.setPaymentMethod("PayPal");
                paymentHistory.setDescription("Payment of " + amount + " for design stage by " + customer.getName());
                paymentHistoryService.createPayment(paymentHistory);
                emailService.sendThankYouEmail(customer.getEmail(), customer.getName());

                // Redirect to design page
                redirectAttributes.addFlashAttribute("success", "Payment Successfully.");
                return "redirect:/customer/design/detail/" + designId;
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }

        // Redirect to error page if payment fails
        return "redirect:/error/error-500";
    }

    @GetMapping("/success/serviceQuote")
    public String successForServiceQuote(@RequestParam("paymentId") String paymentId,
            @RequestParam("PayerID") String payerId,
            @RequestParam("point") double point,
            @RequestParam("serviceQuoteId") int serviceQuoteId,
            RedirectAttributes redirectAttributes, HttpSession session) {
        try {
            // Execute PayPal payment
            Payment payment = payPalService.executePayment(paymentId, payerId);

            if (payment.getState().equals("approved")) {
                // Update design stage detail status to 'Completed' (status 4)
                ServiceQuotes sq = serviceQuoteService.getServiceQuotesById(serviceQuoteId);
                if (sq.getServiceQuotesStatus() == 9) {
                    sq = serviceQuoteService.saveStatusUpdateManager(serviceQuoteId, 10);
                } else {
                    sq = serviceQuoteService.saveStatusUpdateManager(serviceQuoteId, 8);
                }
                Double gg = loyaltyPointService.useLoyaltyPoints(sq.getCustomer(), point);
                redirectAttributes.addFlashAttribute("success", "Payment Successfully.");

                // Create a new PaymentHistory record
                PaymentHistory paymentHistory = new PaymentHistory();
                paymentHistory.setCustomer(sq.getCustomer());
                BigDecimal amount = BigDecimal.valueOf(Double.parseDouble(payment.getTransactions().get(0).getAmount().getTotal()));
                paymentHistory.setAmount(amount);
                paymentHistory.setPaymentDate(LocalDateTime.now());
                paymentHistory.setPaymentMethod("PayPal");
                paymentHistory.setDescription("Payment of " + amount + " for service quote" + sq.getServiceQuotesId() + " by " + sq.getCustomer().getName());
                paymentHistoryService.createPayment(paymentHistory);
                Customer customer = (Customer) session.getAttribute("user");
                emailService.sendThankYouEmail(customer.getEmail(), customer.getName());

                double pointGained = amount.doubleValue();
                loyaltyPointService.gainLoyaltyPoints(sq.getCustomer(), pointGained);
                // Redirect to design page
                return "redirect:/customer/serviceQuote";
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }

        // Redirect to error page if payment fails
        return "redirect:/error/error-500";
    }

    @GetMapping("/cancel/construction/{id}")
    public String cancelForConstruction(@PathVariable("id") int constructionId) {
        return "redirect:/customer/construction/detail/" + constructionId;
    }

    @GetMapping("/cancel/design/{id}")
    public String cancelForDesign(@PathVariable("id") int designId) {
        return "redirect:/customer/design/detail/" + designId;
    }

    @GetMapping("/cancel/serviceQuote")
    public String cancelForServiceQuote() {
        return "redirect:/customer/serviceQuote";
    }

    @PostMapping("/pay/contract")
    public RedirectView payForContract(HttpServletRequest request,
            @RequestParam("amount") double amount,
            @RequestParam("detailId") int contractId) {
        // Dynamically build the base URL
        Contract contract = contractService.getContractById(contractId);

        // If the contract status is 8, redirect to the payment details page
        if (contract.getContractStatus() == 8) {
            return new RedirectView("/customer/contract/detail/" + contractId);
        }

        String baseUrl = ServletUriComponentsBuilder.fromRequestUri(request)
                .replacePath(null)
                .build()
                .toUriString();

        String cancelUrl = baseUrl + contexPath + "/paypal/cancel/contract/" + contractId;
        String successUrl = baseUrl + contexPath + "/paypal/success/contract?detailId=" + contractId;

        try {
            // Create PayPal payment for Contract
            Payment payment = payPalService.createPayment(
                    amount, "USD", "paypal", "sale", "Payment for Contract Deposit", cancelUrl, successUrl);

            // Redirect to PayPal approval URL
            for (Links link : payment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    return new RedirectView(link.getHref());
                }
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
            return new RedirectView("/paypal/error?message=Payment failed. Please try again.");
        }

        return new RedirectView(cancelUrl);
    }

    @GetMapping("/success/contract")
    public String successForContract(@RequestParam("paymentId") String paymentId,
            @RequestParam("PayerID") String payerId,
            @RequestParam("detailId") int contractId,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        try {
            // Execute PayPal payment
            Payment payment = payPalService.executePayment(paymentId, payerId);

            if (payment.getState().equals("approved")) {
                // Update contract status to 'Accepted' (status 6) or as needed
                Contract contract = contractService.changeStatusContract(8, contractId);

                // Retrieve the Customer from the session
                Customer customer = (Customer) session.getAttribute("user");

                // Create a new PaymentHistory record
                PaymentHistory paymentHistory = new PaymentHistory();
                paymentHistory.setCustomer(customer);
                BigDecimal amount = BigDecimal.valueOf(Double.parseDouble(payment.getTransactions().get(0).getAmount().getTotal()));
                paymentHistory.setAmount(amount);
                paymentHistory.setPaymentDate(LocalDateTime.now());
                paymentHistory.setPaymentMethod("PayPal");
                paymentHistory.setDescription("Payment of " + amount + " for contract " + contractId + " by " + customer.getName());
                paymentHistoryService.createPayment(paymentHistory);

                // Redirect to contract detail page with success message
                redirectAttributes.addFlashAttribute("success", "Payment Successfully.");
                return "redirect:/customer/contract/detail/" + contractId;
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }

        // Redirect to error page if payment fails
        return "redirect:/error/error-500";
    }

    @GetMapping("/cancel/contract/{id}")
    public String cancelForContract(@PathVariable("id") int contractId) {
        return "redirect:/customer/contract/detail/" + contractId;
    }
}
