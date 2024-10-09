package com.example.SWPKoiContructor.controller.functionalController;

import com.example.SWPKoiContructor.services.ConstructionStageDetailService;
import com.example.SWPKoiContructor.services.DesignStageDetailService;
import com.example.SWPKoiContructor.services.functionalService.PayPalService;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/paypal")
public class PayPalController {

    @Autowired
    private PayPalService payPalService;

    @Autowired
    private ConstructionStageDetailService constructionStageDetailService;

    @Autowired
    private DesignStageDetailService designStageDetailService;

    @PostMapping("/pay/construction")
    public RedirectView payForConstruction(@RequestParam("amount") double amount,
            @RequestParam("detailId") int detailId,
            @RequestParam("constructionId") int constructionId) {
        String cancelUrl = "http://localhost:8081/paypal/cancel/construction";
        String successUrl = "http://localhost:8081/paypal/success/construction?detailId=" + detailId + "&constructionId=" + constructionId;

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

    // Initiates PayPal payment for DesignStageDetail
    @PostMapping("/pay/design")
    public RedirectView payForDesign(@RequestParam("amount") double amount,
            @RequestParam("detailId") int detailId,
            @RequestParam("designId") int designId) {
        String cancelUrl = "http://localhost:8081/paypal/cancel/design";
        String successUrl = "http://localhost:8081/paypal/success/design?detailId=" + detailId + "&designId=" + designId;

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

    // Handles successful PayPal payment for ConstructionStageDetail
    @GetMapping("/success/construction")
    public String successForConstruction(@RequestParam("paymentId") String paymentId,
            @RequestParam("PayerID") String payerId,
            @RequestParam("detailId") int detailId,
            @RequestParam("constructionId") int constructionId) {
        try {
            // Execute PayPal payment
            Payment payment = payPalService.executePayment(paymentId, payerId);

            if (payment.getState().equals("approved")) {
                // Update construction stage detail status to 'Completed' (status 4)
                constructionStageDetailService.updateConstructionStageDetailStatus(detailId, 4);

                // Redirect to construction page
                return "redirect:/customer/project/construction/" + constructionId;
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }

        // Redirect to error page if payment fails
        return "redirect:/error/error-500";
    }

    // Handles successful PayPal payment for DesignStageDetail
    @GetMapping("/success/design")
    public String successForDesign(@RequestParam("paymentId") String paymentId,
            @RequestParam("PayerID") String payerId,
            @RequestParam("detailId") int detailId,
            @RequestParam("designId") int designId) {
        try {
            // Execute PayPal payment
            Payment payment = payPalService.executePayment(paymentId, payerId);

            if (payment.getState().equals("approved")) {
                // Update design stage detail status to 'Completed' (status 4)
                designStageDetailService.updateDesignStageDetailStatus(detailId, 4);

                // Redirect to design page
                return "redirect:/customer/project/design/" + designId;
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }

        // Redirect to error page if payment fails
        return "redirect:/error/error-500";
    }

    // Handles payment cancellation for construction
    @GetMapping("/cancel/construction")
    public String cancelForConstruction() {
        return "payment/cancelConstruction"; // View for construction payment cancellation
    }

    // Handles payment cancellation for design
    @GetMapping("/cancel/design")
    public String cancelForDesign() {
        return "payment/cancelDesign"; // View for design payment cancellation
    }
}
