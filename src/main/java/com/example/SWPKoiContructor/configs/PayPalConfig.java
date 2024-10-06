package com.example.SWPKoiContructor.configs;

import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.OAuthTokenCredential;
import com.paypal.base.rest.PayPalRESTException;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class PayPalConfig {

    @Value("${paypal.client.id}")
    private String clientId;

    @Value("${paypal.client.secret}")
    private String clientSecret;

    @Value("${paypal.mode}")
    private String mode;

    @Bean
    public APIContext apiContext() throws PayPalRESTException {
        System.out.println("Client ID: " + clientId);  // Logging for debug purposes
        System.out.println("Client Secret: " + clientSecret);
        System.out.println("PayPal Mode: " + mode);

        // Ensure mode is 'sandbox' or 'live' explicitly
        if (!"sandbox".equalsIgnoreCase(mode) && !"live".equalsIgnoreCase(mode)) {
            System.out.println("say hi");
            throw new IllegalArgumentException("Mode needs to be either `sandbox` or `live`.");
        }

        APIContext context = new APIContext(clientId, clientSecret, mode);
        context.setConfigurationMap(paypalSdkConfig());
        return context;
    }

    public Map<String, String> paypalSdkConfig() {
        Map<String, String> configMap = new HashMap<>();
        configMap.put("mode", mode);
        return configMap;
    }

    @Bean
    public OAuthTokenCredential authTokenCredential() {
        System.out.println("Client ID: " + clientId); // Add logs to verify
        System.out.println("Client Secret: " + clientSecret);
        return new OAuthTokenCredential(clientId, clientSecret, paypalSdkConfig());
    }

}
