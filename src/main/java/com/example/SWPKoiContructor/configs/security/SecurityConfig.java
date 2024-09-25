package com.example.SWPKoiContructor.configs.security;


import javax.sql.DataSource;
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

    public SecurityConfig(CustomAuthenticationSuccessHandler successHandler) {
        this.successHandler = successHandler;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/customer/**").hasRole("CUSTOMER") // Only customers can access /customer/*
                .antMatchers("/manager/**").hasRole("MANAGER") // Only staff can access /staff/*
                .antMatchers("/consultant/**").hasRole("CONSULTANT")
                .antMatchers("/design/**").hasRole("DESIGNER")
                .antMatchers("/constructor/**").hasRole("CONSTRUCTOR")
                .antMatchers("/login", "/resources/**","/","/register").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/authenticateTheUser")
                .successHandler(successHandler)
                .permitAll()
                .and()
                .logout()
                .permitAll()
                .and().exceptionHandling().accessDeniedPage("/error/error-403");
    }

    @Bean
    public JdbcUserDetailsManager jdbcUserDetailsManager(DataSource dataSource) {
        JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager();
        jdbcUserDetailsManager.setDataSource(dataSource);

        // Updated to join by user_id (id) from 'users' table and return 'email'
        jdbcUserDetailsManager.setUsersByUsernameQuery(
                "SELECT email, password, enabled FROM [Users] WHERE email = ? "
        );

        // Updated to join by user_id
        jdbcUserDetailsManager.setAuthoritiesByUsernameQuery(
                "SELECT u.email, a.authority FROM [Users] u JOIN authorities a ON u.id = a.user_id WHERE u.email = ? "
        );

        return jdbcUserDetailsManager;
    }

    @Bean
    public static NoOpPasswordEncoder passwordEncoder() {
        return (NoOpPasswordEncoder) NoOpPasswordEncoder.getInstance();  // No password encoding for now
    }
}
