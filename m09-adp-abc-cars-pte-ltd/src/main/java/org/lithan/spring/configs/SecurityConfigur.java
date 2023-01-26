package org.lithan.spring.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.method.configuration.GlobalMethodSecurityConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfigur extends GlobalMethodSecurityConfiguration {

   @Bean
   public static PasswordEncoder passwordEncoder() {
      return new BCryptPasswordEncoder();
   }

   @Bean
   public SecurityFilterChain filterChain(HttpSecurity http, SuccessHandler successHandler,
         WebAccessDeniedHandler accessDeniedHandler) throws Exception {
      http.httpBasic().and()

            .authorizeRequests().anyRequest().permitAll()
            .and()
            .formLogin()
            .loginPage("/login")
            .loginProcessingUrl("/loginUser")
            .successHandler(successHandler)
            .permitAll()
            .and()
            .logout()
            .logoutSuccessUrl("/login?logout")
            .invalidateHttpSession(true)
            .clearAuthentication(true)
            .and()
            .exceptionHandling()
            .accessDeniedHandler(accessDeniedHandler);

      return http.build();
   }
}
