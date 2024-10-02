package com.example.SWPKoiContructor.configs.security;

import com.example.SWPKoiContructor.configs.security.CustomAuthenticationSuccessHandler;
import com.example.SWPKoiContructor.configs.security.CustomOAuth2UserService;
import com.example.SWPKoiContructor.configs.security.OAuth2SuccessHandler;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final CustomAuthenticationSuccessHandler successHandler;
//    private final CustomOAuth2UserService customOAuth2UserService;
    private final OAuth2SuccessHandler auth2SuccessHandler;

    @Autowired
    public SecurityConfig(CustomAuthenticationSuccessHandler successHandler, OAuth2SuccessHandler auth2SuccessHandler) {
        this.successHandler = successHandler;
//        this.customOAuth2UserService = customOAuth2UserService;
        this.auth2SuccessHandler = auth2SuccessHandler;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/customer/**").hasRole("CUSTOMER") // Only customers can access /customer/*
                .antMatchers("/manager/**").hasRole("MANAGER") // Only managers can access /manager/*
                .antMatchers("/consultant/**").hasRole("CONSULTANT")
                .antMatchers("/designer/**").hasRole("DESIGNER")
                .antMatchers("/constructor/**").hasRole("CONSTRUCTOR")
                .antMatchers("/staff/**").hasAnyRole("MANAGER","CONSULTANT","DESIGNER","CONSTRUCTOR")
                .antMatchers("/resources/**", "/assets/**", "/", "/register","/forgot-password", "/reset-password","/home/**","/css/**","/js/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin() // Enable form login
                .loginPage("/login") // Set custom login page
                .loginProcessingUrl("/authenticateTheUser")
                .failureUrl("/")
                .successHandler(successHandler)// Form action to handle authentication
                .permitAll()
                .and()
                .logout()
                .logoutSuccessUrl("/login?logout=true") // Redirect after logout
                .invalidateHttpSession(true) // Invalidate the session
                .clearAuthentication(true) // Clear the authentication
                .permitAll()
                .and()
                .oauth2Login() // Enable OAuth2 login
                .loginPage("/login") // Use the same login page for both form and OAuth login
                .userInfoEndpoint()
                //                .userService(customOAuth2UserService) // Custom OAuth2 user service
                .and()
                .successHandler(auth2SuccessHandler) // Handle OAuth2 success
                .and()
                .exceptionHandling()
                .accessDeniedPage("/error/error-403");
    }

    @Bean
    public JdbcUserDetailsManager jdbcUserDetailsManager(DataSource dataSource) {
        JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager();
        jdbcUserDetailsManager.setDataSource(dataSource);

        // Query for user details (using email as the username)
        jdbcUserDetailsManager.setUsersByUsernameQuery(
                "SELECT email, password, enabled FROM [Users] WHERE email = ? "
        );

        // Query for authorities (roles) associated with the user
        jdbcUserDetailsManager.setAuthoritiesByUsernameQuery(
                "SELECT u.email, a.authority FROM [Users] u JOIN authorities a ON u.id = a.user_id WHERE u.email = ? "
        );

        return jdbcUserDetailsManager;
    }

    @Bean
    public static NoOpPasswordEncoder passwordEncoder() {
        return (NoOpPasswordEncoder) NoOpPasswordEncoder.getInstance();  // For simplicity, no password encoding
    }
}
